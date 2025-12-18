# Função para calcular o IPCA acumulado anual
calcular_ipca_acumulado_anual <- function(ipca_mensal) {
  # Verifica se há valores para o ano, caso contrário, retorna NA
  if(length(ipca_mensal) == 0) {
    return(NA)
  }
  
  # Calcula o IPCA acumulado (multiplicativo)
  ipca_acumulado <- prod(1 + ipca_mensal / 100, na.rm = TRUE) - 1
  return(ipca_acumulado * 100)  # Converter de volta para percentual
}

# Função para calcular o IPCA médio por janelas temporais
calcular_media_janelas <- function(janelas, ipca_data) {
  # Itera sobre cada janela e calcula a média
  ipca_medio_janelas <- sapply(janelas, function(anos) {
    ipca_acumulados <- sapply(anos, function(ano) {
      # Obter os dados mensais do ano correspondente
      ipca_mensal <- ipca_data$IPCA[ipca_data$Ano == ano]
      
      # Calcular o IPCA acumulado anual
      calcular_ipca_acumulado_anual(ipca_mensal)
    })
    
    # Calcula a média do IPCA acumulado para a janela
    mean(ipca_acumulados, na.rm = TRUE)
  })
  
  return(ipca_medio_janelas)
}

# Função principal para calcular as médias por janelas temporais
calcular_ipca_por_janelas <- function(ipca_data) {
  # Definir as janelas temporais separadas por mandato presidencial
  janelas <- list(
    FHC1 = 1995:1998,
    FHC2 = 1999:2002,
    Lula1 = 2003:2006,
    Lula2 = 2007:2010,
    Dilma1 = 2011:2014,
    Dilma2 = 2015:2016,
    Temer = 2017:2018,
    Bolsonaro = 2019:2022
  )
  
  # Definir as janelas agregadas (janelas2)
  janelas2 <- list(
    FHC = 1995:2002,
    Lula = 2003:2010,
    Dilma = 2011:2016,
    TemerBolsonaro = 2017:2022
  )
  
  # Calcular o IPCA médio para as duas listas de janelas temporais
  ipca_medio_janelas <- calcular_media_janelas(janelas, ipca_data)
  ipca_medio_janelas2 <- calcular_media_janelas(janelas2, ipca_data)
  
  # Retornar os resultados das duas listas de janelas
  return(list(ipca_medio_janelas = ipca_medio_janelas, ipca_medio_janelas2 = ipca_medio_janelas2))
}

# Exemplo de uso da função:
# resultado_ipca_janelas <- calcular_ipca_por_janelas(ipca_data)
# print(resultado_ipca_janelas$ipca_medio_janelas)
# print(resultado_ipca_janelas$ipca_medio_janelas2)


