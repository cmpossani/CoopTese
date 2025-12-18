gerar_mapa_roa <- function(df, nome_janela) {
  library(sf)
  library(geobr)
  library(ggplot2)
  library(ggrepel)
  
  # Resumir os dados do DataFrame, calculando a mediana e o desvio padrão
  df_resumo <- df %>%
    group_by(UF) %>%
    summarise(
      ROA_mediana = median(SOBRAS_POR_ATIVO, na.rm = TRUE) * 100,  # Mediana
      ROA_dp = sd(SOBRAS_POR_ATIVO, na.rm = TRUE) * 100  # Desvio Padrão
    ) %>%
    filter(!is.na(ROA_mediana))  # Remover valores NA da mediana
  
  # Criar colunas formatadas com símbolo de porcentagem para exibição
  df_resumo <- df_resumo %>%
    mutate(
      ROA_mediana_fmt = sprintf("%.2f%%", ROA_mediana),  # Mediana formatada
      ROA_dp_fmt = sprintf("%.2f%%", ROA_dp)  # Desvio padrão formatado
    )
  
  # Unir o shapefile com os dados de ROA
  brasil_roa <- brasil_estados %>%
    left_join(df_resumo, by = c("abbrev_state" = "UF"))
  
  # Calcular os centroides para obter as coordenadas de cada estado
  brasil_roa <- brasil_roa %>%
    mutate(centroid = st_centroid(geom)) %>%
    mutate(lon = st_coordinates(centroid)[,1],  # longitude
           lat = st_coordinates(centroid)[,2])  # latitude
  
  # Definir os limites da escala de cores com base nos valores mínimos e máximos da mediana
  mediana_min <- min(brasil_roa$ROA_mediana, na.rm = TRUE)
  mediana_max <- max(brasil_roa$ROA_mediana, na.rm = TRUE)
  
  # Criar o mapa base com a mediana e desvio padrão
  mapa_roa <- ggplot(data = brasil_roa) +
    geom_sf(aes(fill = ROA_mediana), color = "black") +  # Mapa com cor da mediana
    geom_text_repel(aes(x = lon, y = lat, label = paste0(ROA_mediana_fmt, "\n", ROA_dp_fmt)),
                    color = "black", size = 3, max.overlaps = 20, nudge_x = 0.5, nudge_y = 0.5, 
                    box.padding = 0.5, segment.color = "grey", segment.size = 0.5) +  # Adicionar valores com linhas de conexão
    scale_fill_gradient2(low = "red", mid = "white", high = "blue", 
                         midpoint = 0, name = "Mediana ROA", 
                         limits = c(mediana_min, mediana_max), na.value = "white") +  # Ajuste da paleta para negativos em vermelho e positivos em azul
    labs(title = paste("Mediana e DP do ROA (Jan:", nome_janela, ")", sep = ""),
         subtitle = "Incluindo o desvio padrão por estado") +
    theme_minimal() +
    theme(axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          plot.title = element_text(size = 14, hjust = 0.5),
          plot.subtitle = element_text(size = 10, hjust = 0.5))
  
  # Exibir o gráfico
  return(mapa_roa)
}




gerar_mapa_cooperativas <- function(df, nome_janela) {
  library(sf)
  library(geobr)
  library(ggplot2)
  library(ggrepel)
  
  # Resumir os dados do DataFrame, calculando a mediana e a quantidade de cooperativas por estado
  df_resumo <- df %>%
    group_by(UF) %>%
    summarise(
      ROA_mediana = median(SOBRAS_POR_ATIVO, na.rm = TRUE) * 100,  # Mediana
      Quantidade_Cooperativas = n()  # Contagem de cooperativas
    )
  
  # Calcular o total geral de cooperativas
  total_cooperativas <- sum(df_resumo$Quantidade_Cooperativas, na.rm = TRUE)
  
  # Criar colunas formatadas para exibição
  df_resumo <- df_resumo %>%
    mutate(
      ROA_mediana_fmt = ifelse(is.na(ROA_mediana), "", sprintf("%.2f%%", ROA_mediana)),  # Mediana formatada (sem NA)
      Quantidade_fmt = ifelse(is.na(Quantidade_Cooperativas), "", paste0("Qtd: ", Quantidade_Cooperativas))  # Quantidade formatada (sem NA)
    )
  

  
  # Unir o shapefile com os dados de ROA
  brasil_roa <- brasil_estados %>%
    left_join(df_resumo, by = c("abbrev_state" = "UF"))
  
  # Calcular os centroides para obter as coordenadas de cada estado
  brasil_roa <- brasil_roa %>%
    mutate(centroid = st_centroid(geom)) %>%
    mutate(lon = st_coordinates(centroid)[,1],  # longitude
           lat = st_coordinates(centroid)[,2])  # latitude
  
  # Filtrar estados que têm dados para evitar NA na exibição de rótulos
  brasil_roa_com_dados <- brasil_roa %>%
    filter(!is.na(ROA_mediana))
  
  # Criar o mapa base com a mediana e a quantidade de cooperativas
  mapa_roa <- ggplot(data = brasil_roa) +
    geom_sf(aes(fill = ROA_mediana), color = "black") +  # Mapa com cor da mediana
    geom_text_repel(data = brasil_roa_com_dados, aes(x = lon, y = lat, 
                                                     label = paste0(ROA_mediana_fmt, "\n", Quantidade_fmt)),
                    color = "black", size = 3, max.overlaps = 20, nudge_x = 0.5, nudge_y = 0.5, 
                    box.padding = 0.5, segment.color = "grey", segment.size = 0.5) +  # Adicionar valores com linhas de conexão
    scale_fill_distiller(palette = "RdYlBu", name = "Mediana ROA", na.value = "white", limits = c(-150, 100)) +  # Paleta de cores divergente
    labs(title = paste("Mediana e Qtd de Cooperativas por Estado (Jan:", nome_janela, ")", sep = ""),
         subtitle = "Incluindo a quantidade de cooperativas por estado") +
    theme_minimal() +
    theme(axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          plot.title = element_text(size = 14, hjust = 0.5),
          plot.subtitle = element_text(size = 10, hjust = 0.5),
          legend.position = "none") +  # Remover a legenda
    annotate("text", x = Inf, y = -Inf, label = paste("Total: ", total_cooperativas, " registros"), 
             hjust = 1.1, vjust = -1, size = 5, color = "black")  # Adicionar o total no canto inferior direito
  
  # Exibir o gráfico
  return(mapa_roa)
}

