# Função para consultar um CNPJ via API da Receita Federal

# Supondo que o df_cnpj_unicos esteja carregado
# df_cnpj_unicos contém a coluna CNPJ

library(httr)
library(jsonlite)
library(dplyr)
library(stringi)
library(gridExtra)  # Para organizar os gráficos em uma tabela 2x2
library(ggrepel)  # Para rótulos que não se sobrepõem

# Função para preencher CNPJ com zeros à esquerda até 8 dígitos
preencher_cnpj_com_zeros <- function(cnpj_raiz) {
  # Adiciona zeros à esquerda para garantir que o CNPJ tenha 8 dígitos
  cnpj_raiz_completo <- sprintf("%08d", as.numeric(cnpj_raiz))
  return(cnpj_raiz_completo)
}

# Função para calcular os dígitos verificadores de um CNPJ
calcular_dv_cnpj <- function(cnpj_incompleto) {
  cnpj_digitos <- as.numeric(strsplit(cnpj_incompleto, "")[[1]])
  
  calcular_dv <- function(digitos, pesos) {
    soma <- sum(digitos * pesos)
    resto <- soma %% 11
    if (resto < 2) {
      return(0)
    } else {
      return(11 - resto)
    }
  }
  
  pesos_1 <- c(5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2)
  dv1 <- calcular_dv(cnpj_digitos, pesos_1)
  
  cnpj_digitos <- c(cnpj_digitos, dv1)
  
  pesos_2 <- c(6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2)
  dv2 <- calcular_dv(cnpj_digitos, pesos_2)
  
  return(paste0(dv1, dv2))
}

# Função para completar o CNPJ a partir dos 8 primeiros dígitos (inclui preenchimento de zeros)
completar_cnpj <- function(cnpj_raiz) {
  cnpj_raiz <- preencher_cnpj_com_zeros(cnpj_raiz)
  cnpj_incompleto <- paste0(cnpj_raiz, "0001")
  dv <- calcular_dv_cnpj(cnpj_incompleto)
  cnpj_completo <- paste0(cnpj_incompleto, dv)
  return(cnpj_completo)
}

# Função para consultar dados de um CNPJ via API da Receita Federal
consultar_cnpj <- function(cnpj) {
  url <- paste0("https://www.receitaws.com.br/v1/cnpj/", cnpj)
  print(paste("Consultando CNPJ:", cnpj))
  result <- tryCatch({
    response <- GET(url)
    
    if (status_code(response) == 200) {
      content(response, as = "text", encoding = "UTF-8") %>%
        fromJSON(flatten = TRUE)
    } else {
      warning(paste("Erro ao consultar CNPJ:", cnpj, "- Código de status:", status_code(response)))
      return(NULL)
    }
  }, error = function(e) {
    warning(paste("Erro na requisição para CNPJ:", cnpj, "-", conditionMessage(e)))
    return(NULL)
  })
  
  return(result)
}

# Função para extrair as informações do CNPJ
extrair_informacoes_cnpj <- function(cnpj_data) {
  if (!is.null(cnpj_data)) {
    return(data.frame(
      razao_social = cnpj_data$nome,
      municipio = cnpj_data$municipio,
      uf = cnpj_data$uf,
      cep = cnpj_data$cep,
      stringsAsFactors = FALSE
    ))
  } else {
    return(data.frame(razao_social = NA, municipio = NA, uf = NA, cep = NA))
  }
}

# Função para realizar consultas com intervalo e associar com o CNPJ original
consultar_lista_cnpjs <- function(cnpj_list_original, intervalo = 1) {
  # DataFrame final para armazenar resultados
  resultados <- data.frame()
  
  for (i in seq_along(cnpj_list_original)) {
    cnpj_original <- cnpj_list_original[i]
    
    # Completar o CNPJ para 14 dígitos
    cnpj_completo <- completar_cnpj(cnpj_original)
    
    # Realizar a consulta
    cnpj_data <- consultar_cnpj(cnpj_completo)
    
    # Pausa entre consultas
    Sys.sleep(intervalo)
    
    # Extrair as informações e adicionar o CNPJ original e completo
    info <- extrair_informacoes_cnpj(cnpj_data)
    info$CNPJ_ORIGINAL <- cnpj_original
    info$CNPJ_COMPLETO <- cnpj_completo
    
    # Adicionar ao DataFrame final
    resultados <- rbind(resultados, info)
  }
  
  return(resultados)
}

padronizar_municipios <- function(df, coluna) {
  df[[coluna]] <- stri_trans_general(df[[coluna]], "Latin-ASCII") # Remover acentos
  df[[coluna]] <- toupper(df[[coluna]]) # Converter para letras maiúsculas
  df[[coluna]] <- trimws(df[[coluna]])  # Remover espaços em branco extras
  return(df)
}

# Função para remover outliers usando Z-score
remover_outliers_zscore <- function(df, coluna, threshold = 3) {
  # Calcular a média e o desvio padrão da coluna
  media_coluna <- mean(df[[coluna]], na.rm = TRUE)
  desvio_padrao_coluna <- sd(df[[coluna]], na.rm = TRUE)
  
  # Calcular o Z-score para cada valor
  z_scores <- (df[[coluna]] - media_coluna) / desvio_padrao_coluna
  
  # Identificar as linhas que estão dentro do threshold
  linhas_sem_outliers <- abs(z_scores) <= threshold
  
  # Criar dois DataFrames: um sem outliers e outro com outliers
  df_sem_outliers <- df[linhas_sem_outliers, ]
  df_com_outliers <- df[!linhas_sem_outliers, ]
  
  # Retornar os dois DataFrames
  return(list(df_sem_outliers = df_sem_outliers, df_com_outliers = df_com_outliers))
}

# Função para gerar gráficos de pizza com os componentes de variância e percentuais
plot_pizza <- function(model) {
  # Extraindo os componentes de variância dos efeitos aleatórios
  variances <- as.data.frame(VarCorr(model))
  
  # Pegando apenas as variâncias
  var_values <- variances$vcov
  var_names <- variances$grp
  
  # Somando o total de variância
  total_var <- sum(var_values)
  
  # Calculando as proporções e formatando os percentuais
  proportions <- var_values / total_var * 100
  labels <- paste0(var_names, ": ", round(proportions, 1), "%")
  
  # Criando um dataframe para o gráfico
  df_pizza <- data.frame(
    group = var_names,
    value = proportions,
    label = labels
  )
  
  # Plotando o gráfico de pizza com percentuais
  ggplot(df_pizza, aes(x = "", y = value, fill = group)) +
    geom_bar(width = 1, stat = "identity") +
    coord_polar("y", start = 0) +
    geom_text(aes(label = label), position = position_stack(vjust = 0.5)) +  # Adiciona os percentuais
    labs(title = "Componentes de Variância do Modelo", x = NULL, y = NULL) +
    theme_void() +
    theme(legend.title = element_blank())
}
# Função para gerar gráficos de pizza 2D com ggplot2
# Função para gerar gráficos de pizza 2D com ggplot2
# Função para gerar gráficos de pizza 2D com rótulos fora e conectores
# Função para gerar gráficos de pizza 2D com rótulos fora e sem legenda
# Função para gerar gráficos de pizza 2D com rótulos fora e ajustados para não sobrepor
# Função para gerar gráficos de pizza 2D com rótulos ajustados para evitar sobreposição
plot_pizza_2D <- function(model) {
  # Extraindo os componentes de variância dos efeitos aleatórios
  variances <- as.data.frame(VarCorr(model))
  
  # Pegando apenas as variâncias
  var_values <- variances$vcov
  var_names <- variances$grp
  
  # Somando o total de variância
  total_var <- sum(var_values)
  
  # Calculando as proporções e formatando os percentuais
  proportions <- var_values / total_var * 100
  labels <- paste0(var_names, ": ", round(proportions, 1), "%")
  
  # Criando um dataframe para o gráfico
  df_pizza <- data.frame(
    group = var_names,
    value = proportions,
    label = labels
  )
  
  # Plotando o gráfico de pizza com ggplot2 e rótulos fora
  ggplot(df_pizza, aes(x = "", y = value, fill = group)) +
    geom_bar(width = 1, stat = "identity") +
    coord_polar("y", start = 0) +
    geom_label_repel(aes(label = label, y = value/2 + c(0, cumsum(value)[-length(value)])),
                     box.padding = 0.8,  # Aumenta o espaço entre o gráfico e o rótulo
                     nudge_x = 1.5,  # Aumentar a distância dos rótulos
                     nudge_y = 0.5,  # Aumentar o espaçamento vertical entre rótulos
                     size = 3,       # Reduzir um pouco mais o tamanho da fonte
                     direction = "y", # Rótulos na direção vertical
                     segment.size = 0.8) +  # Linhas de conexão mais finas
    labs(title = NULL, x = NULL, y = NULL) +  # Remover títulos e labels desnecessários
    theme_void() +
    theme(legend.position = "none")  # Remover a legenda
}
#Tabela Resumida de Componentes de Variância
compare_variances <- function(models, model_names) {
  variances_list <- lapply(seq_along(models), function(i) {
    variances <- as.data.frame(VarCorr(models[[i]])) %>%
      select(grp, vcov) %>%
      rename_with(~paste0("vcov_", model_names[i]), vcov)
    return(variances)
  })
  
  # Fazendo o merge dos resultados dos diferentes modelos com base nos componentes
  comparison <- Reduce(function(x, y) full_join(x, y, by = "grp"), variances_list)
  comparison
}

# Função para comparar as variâncias
compare_variances <- function(models, model_names) {
  variances_list <- lapply(seq_along(models), function(i) {
    variances <- as.data.frame(VarCorr(models[[i]])) %>%
      select(grp, vcov) %>%
      rename_with(~paste0("vcov_", model_names[i]), vcov)
    return(variances)
  })
  # Fazendo o merge dos resultados dos diferentes modelos com base nos componentes
  comparison <- Reduce(function(x, y) full_join(x, y, by = "grp"), variances_list)
  
  # Renomear a coluna de componentes para "Component" para usar na visualização
  comparison <- rename(comparison, Component = grp)
  return(comparison)
}

# Função para calcular as estatísticas descritivas de cada janela temporal
calcular_estatisticas <- function(df, nome_janela) {
  df %>%
    summarise(
      Janela = nome_janela,
      Minimo = min(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Maximo = max(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Media = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Mediana = median(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Desvio_Padrao = sd(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Contagem = n()
    )
}
# Função para calcular estatísticas descritivas por ano
calcular_estatisticas_por_ano <- function(df, nome_janela) {
  df %>%
    group_by(ANO) %>%
    summarise(
      Janela = nome_janela,
      Minimo = min(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Maximo = max(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Media = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Mediana = median(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Desvio_Padrao = sd(SOBRAS_POR_ATIVO, na.rm = TRUE),
      Contagem = n()
    )
}


# Função para filtrar o DataFrame com base nas premissas passadas por parâmetro
filtrar_cooperativas <- function(df, min_coop_munic = NULL, min_coop_reg_imediata = NULL, min_coop_reg_intermediaria = NULL, min_coop_estado = NULL) {
  
  # Descobrir a quantidade de anos distintos no DataFrame
  total_anos <- n_distinct(df$Ano)
  
  # Filtrar CNPJs que estão presentes em todos os anos do DataFrame
  df_filtered <- df %>%
    group_by(CNPJ) %>%
    filter(n_distinct(Ano) == total_anos) %>%
    ungroup()
  
  # Aplicar filtro por cidade se min_coop_munic não for NULL
  if (!is.null(min_coop_munic)) {
    df_filtered <- df_filtered %>%
      group_by(Cod_Munic) %>%
      filter(n_distinct(CNPJ) >= min_coop_munic) %>%
      ungroup()
  }
  
  # Aplicar filtro por Região Imediata se min_coop_reg_imediata não for NULL
  if (!is.null(min_coop_reg_imediata)) {
    df_filtered <- df_filtered %>%
      group_by(Cod_Reg_Imediata) %>%
      filter(n_distinct(CNPJ) >= min_coop_reg_imediata) %>%
      ungroup()
  }
  
  # Aplicar filtro por Região Intermediária se min_coop_reg_intermediaria não for NULL
  if (!is.null(min_coop_reg_intermediaria)) {
    df_filtered <- df_filtered %>%
      group_by(Cod_Reg_Intermed) %>%
      filter(n_distinct(CNPJ) >= min_coop_reg_intermediaria) %>%
      ungroup()
  }
  
  # Aplicar filtro por Estado se min_coop_estado não for NULL
  if (!is.null(min_coop_estado)) {
    df_filtered <- df_filtered %>%
      group_by(UF) %>%
      filter(n_distinct(CNPJ) >= min_coop_estado) %>%
      ungroup()
  }
  
  return(df_filtered)
}



# Função para criar o gráfico de metas de inflação com valores da inflação real e meta de inflação
criar_grafico_inflacao <- function(df) {
  ggplot(df, aes(x = Ano)) +
    # Linha da Meta de Inflação
    geom_line(aes(y = Meta_Inflacao_., color = "Meta de Inflação"), size = 1.2) +
    
    # Linha da Inflação Real
    geom_line(aes(y = Inflação_Real_., color = "Inflação Real"), size = 1.2) +
    
    # Adiciona os valores na linha da Inflação Real
    geom_text(aes(y = Inflação_Real_., label = round(Inflação_Real_., 2)), 
              vjust = -0.5, size = 3, color = "red") +
    
    # Adiciona os valores na linha da Meta de Inflação
    geom_text(aes(y = Meta_Inflacao_., label = round(Meta_Inflacao_., 2)), 
              vjust = 1.5, size = 3, color = "blue") +
    
    # Faixa das margens de tolerância
    geom_ribbon(aes(ymin = Margem_Inferior_., ymax = Margem_Superior_.), 
                fill = "lightblue", alpha = 0.4) +
    
    # Título e rótulos dos eixos
    labs(title = "Metas de Inflação e Inflação Real no Brasil",
         y = "Inflação (%)",
         x = "Ano") +
    
    # Ajusta as cores das linhas
    scale_color_manual(values = c("Meta de Inflação" = "blue", "Inflação Real" = "red")) +
    
    # Definir o estilo minimalista
    theme_minimal() +
    
    # Ajustar a legenda dos anos no eixo X para que fiquem verticais
    theme(axis.text.x = element_text(angle = 90, hjust = 1), 
          legend.title = element_blank()) +
    
    # Exibe todos os anos no eixo X
    scale_x_continuous(breaks = seq(min(df$Ano), max(df$Ano), by = 1))
}


calcular_intervalo_sd <- function(sdcor, n, conf_level = 0.95) {
  # n é o número de observações usadas para ajustar o modelo (aproximado)
  alpha <- 1 - conf_level
  error <- qnorm(1 - alpha / 2) * sdcor / sqrt(n)
  lower <- sdcor - error
  upper <- sdcor + error
  return(c(lower, upper))
}

bootstrap_effects <- function(model) {
  boot_result <- bootMer(model, FUN = function(x) VarCorr(x)$Unidade_de_Negocio[1, 1], nsim = 200)
  boot_ci <- quantile(boot_result$t, probs = c(0.025, 0.975))
  return(boot_ci)
}



