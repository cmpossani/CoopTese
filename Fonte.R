library(readxl)
library(tidyverse)
library(magrittr)
library(dplyr)
library(ggplot2)

##PROBLEMA COM ARQ HISTORICO
#unlink(".RData")
##########################################
######CONECTANDO AO DB NEON.TECH##########


# 1. Carregar as bibliotecas
library(DBI)
library(RPostgres)

# 2. Preencha os detalhes da sua conexão Neon aqui
#    (Pegue cada parte da sua URL de conexão)
db_name <- "neondb"    # <-- O nome do seu banco (a última parte da URL)
db_host <- "ep-small-darkness-adhn7gsb-pooler.c-2.us-east-1.aws.neon.tech" # <-- O endereço do servidor (depois do @)
db_port <- 5432                  # <-- Geralmente é 5432
db_user <- "neondb_owner"             # <-- Seu usuário (depois de postgres://)
db_password <- "npg_OaC2ZwG5nQIp" # <-- Sua senha (entre o usuário e o @)


# 3. Conectar usando os parâmetros separados
message("Tentando conectar ao banco de dados Neon...")
con <- dbConnect(RPostgres::Postgres(),
                 dbname = db_name,
                 host = db_host,
                 port = db_port,
                 user = db_user,
                 password = db_password,
                 sslmode = 'require')


# O resto do seu código
message("Conexão bem-sucedida!")
print(con)


message("Enviando dados...")
dbWriteTable(con, "cooperativas_credito", total_dados_limpos, overwrite = TRUE)
dbWriteTable(con, "coop_Art3_Saude", df_ComSaude, overwrite = TRUE)
dbWriteTable(con, "total_dados_limpos", total_dados_limpos, overwrite = TRUE)
dbWriteTable(con, "total_dados_limpos2", total_dados_limpos2, overwrite = TRUE)


message("Dados enviados com sucesso!")
df_2 <- dbGetQuery(con, 'SELECT * FROM "cooperativas_credito"')
df_3 <- dbGetQuery(con, 'SELECT * FROM "coop_Art3_Saude"')




dbDisconnect(con)
message("Conexão fechada.")




# Supondo que 'con' seja sua conexão aberta
dados_do_banco <- dbGetQuery(con, "SELECT * FROM cooperativas_credito WHERE \"PATRIMONIOLIQUIDO\" > 1000000")
df_Art3 <- dbGetQuery(con, 'SELECT * FROM "cooperativas_Art3"')

dados_do_banco <- dbGetQuery(con, "SELECT * FROM cooperativas_credito")







# Isso trará para o R apenas as cooperativas com patrimônio líquido maior que 1 milhão.
print(head(dados_do_banco))



################################################################



#install.packages("openai")

# if (!require(remotes)) {
#   install.packages("remotes")
# }
#remotes::install_github("MichelNivard/gptstudio")

# For use needs API key
api_key <- Sys.getenv("OPENAI_API_KEY")

library(gptstudio)
library(openai)
library(rstudioapi)
library(lintr)
# rstudioapi::executeCommand("updateAddins")
# remotes::install_github("r-lib/styler")
# install.packages("lintr")
# lintr::use_lintr(type = "tidyverse")




X199412COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/1994/199412COOPERATIVAS.xls")
X199512COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/1995/199512COOPERATIVAS.xls")
X199612COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/1996/199612COOPERATIVAS.xls")
X199712COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/1997/199712COOPERATIVAS.xls")
X199812COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/1998/199812COOPERATIVAS.xls")
X199912COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/1999/199912COOPERATIVAS.xls")
X200012COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2000/200012COOPERATIVAS.xls")
X200112COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2001/200112COOPERATIVAS.xls")
X200212COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2002/200212COOPERATIVAS.xls")
X200312COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2003/200312COOPERATIVAS.xls")
X200412COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2004/200412COOPERATIVAS.xls")
X200512COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2005/200512COOPERATIVAS.xls")
X200612COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2006/200612COOPERATIVAS.xls")
X200712COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2007/200712COOPERATIVAS.xls")
X200812COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2008/200812COOPERATIVAS.xls")
X200912COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2009/200912COOPERATIVAS.xls")
X201012COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2010/201012COOPERATIVAS.xls")
X201112COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2011/201112COOPERATIVAS.xls")
X201212COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2012/201212COOPERATIVAS.xls")
X201312COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2013/201312COOPERATIVAS.xls")
X201412COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2014/201412COOPERATIVAS.xls")
X201512COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2015/201512COOPERATIVAS.xls")
X201612COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2016/201612COOPERATIVAS.xls")
X201712COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2017/201712COOPERATIVAS.xlsx")
X201812COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2018/201812COOPERATIVAS.xlsx")
X201912COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2019/201912COOPERATIVAS.xlsx")
X202012COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2020/202012COOPERATIVAS.xlsx")
X202112COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2021/202112COOPERATIVAS.xls")
X202212COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2022/202212COOPERATIVAS.xlsx")
##PARA O ARTIGO 1
X202312COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2023/202312COOPERATIVAS.xlsx")
X202412COOPERATIVAS <- read_excel("C:/Aula3/DadosCoopBrasil/2024/202412COOPERATIVAS.xlsx")


# escreva um código com laço de 1 a 1.0000

### DE 1994 a 2009 as colunas estão em posição diferente das de a partir de 2010
##### col: 2 = CNPJ 3=NOME_COOP; 5=DOC ; 6=CONTA; 7=NOME_CONTA; 8=SALDO

Dados1994 <- X199412COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados1995 <- X199512COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados1996 <- X199612COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados1997 <- X199712COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados1998 <- X199812COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados1999 <- X199912COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2000 <- X200012COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2001 <- X200112COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2002 <- X200212COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2003 <- X200312COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2004 <- X200412COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2005 <- X200512COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2006 <- X200612COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2007 <- X200712COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2008 <- X200812COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
Dados2009 <- X200912COOPERATIVAS[, c(3, 2, 5, 6, 7, 8)]
##### col 2=DOC; 3 = CNPJ 5=NOME_COOP ; 9=CONTA; 10=NOME_CONTA; 11=SALDO
Dados2010 <- X201012COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2011 <- X201112COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2012 <- X201212COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2013 <- X201312COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2014 <- X201412COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2015 <- X201512COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2016 <- X201612COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2017 <- X201712COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2018 <- X201812COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2019 <- X201912COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2020 <- X202012COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2021 <- X202112COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2022 <- X202212COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2023 <- X202312COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
Dados2024 <- X202412COOPERATIVAS[, c(5, 3, 2, 9, 10, 11)]
### indices <- read_excel("C:/Aula3/DadosCoopBrasil/indices/indices.xls")

# Indices_Financeiro = indices[,c(1,2,3)]

# show(Indices_Financeiro)

### Eliminando a conta 4010 para ficar com os dados do balanço######
Dados_com_conta4010_1994 <- subset(Dados1994, DOCUMENTO == "4010")
Dados_com_conta4010_1995 <- subset(Dados1995, DOCUMENTO == "4010")
Dados_com_conta4010_1996 <- subset(Dados1996, DOCUMENTO == "4010")
Dados_com_conta4010_1997 <- subset(Dados1997, DOCUMENTO == "4010")
Dados_com_conta4010_1998 <- subset(Dados1998, DOCUMENTO == "4010")
Dados_com_conta4010_1999 <- subset(Dados1999, DOCUMENTO == "4010")
Dados_com_conta4010_2000 <- subset(Dados2000, DOCUMENTO == "4010")
Dados_com_conta4010_2001 <- subset(Dados2001, DOCUMENTO == "4010")
Dados_com_conta4010_2002 <- subset(Dados2002, DOCUMENTO == "4010")
Dados_com_conta4010_2003 <- subset(Dados2003, DOCUMENTO == "4010")
Dados_com_conta4010_2004 <- subset(Dados2004, DOCUMENTO == "4010")
Dados_com_conta4010_2005 <- subset(Dados2005, DOCUMENTO == "4010")
Dados_com_conta4010_2006 <- subset(Dados2006, DOCUMENTO == "4010")
Dados_com_conta4010_2007 <- subset(Dados2007, DOCUMENTO == "4010")
Dados_com_conta4010_2008 <- subset(Dados2008, DOCUMENTO == "4010")
Dados_com_conta4010_2009 <- subset(Dados2009, DOCUMENTO == "4010")
Dados_com_conta4010_2010 <- subset(Dados2010, DOCUMENTO == "4010")
Dados_com_conta4010_2011 <- subset(Dados2011, DOCUMENTO == "4010")
Dados_com_conta4010_2012 <- subset(Dados2012, DOCUMENTO == "4010")
Dados_com_conta4010_2013 <- subset(Dados2013, DOCUMENTO == "4010")
Dados_com_conta4010_2014 <- subset(Dados2014, DOCUMENTO == "4010")
Dados_com_conta4010_2015 <- subset(Dados2015, DOCUMENTO == "4010")
Dados_com_conta4010_2016 <- subset(Dados2016, DOCUMENTO == "4010")
Dados_com_conta4010_2017 <- subset(Dados2017, DOCUMENTO == "4010")
Dados_com_conta4010_2018 <- subset(Dados2018, DOCUMENTO == "4010")
Dados_com_conta4010_2019 <- subset(Dados2019, DOCUMENTO == "4010")
Dados_com_conta4010_2020 <- subset(Dados2020, DOCUMENTO == "4010")
Dados_com_conta4010_2021 <- subset(Dados2021, DOCUMENTO == "4010")
Dados_com_conta4010_2022 <- subset(Dados2022, DOCUMENTO == "4010")
Dados_com_conta4010_2023 <- subset(Dados2023, DOCUMENTO == "4010")
Dados_com_conta4010_2024 <- subset(Dados2024, DOCUMENTO == "4010")


#### Retirando os espaços
## str_replace(Dados_com_conta4010$NOME_CONTA, ' ', '_')
colnames(Dados_com_conta4010_1994)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_1994)[5] <- "NOME_CONTA"
Dados_com_conta4010_1994$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1994$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_1994$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1994$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_1995)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_1995)[5] <- "NOME_CONTA"
Dados_com_conta4010_1995$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1995$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_1995$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1995$NOME_CONTA, fixed("-"), "")
# rename(Dados_com_conta4010_1995, c(`NOME CONTA`="NOME_CONTA"))

colnames(Dados_com_conta4010_1996)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_1996)[5] <- "NOME_CONTA"
Dados_com_conta4010_1996$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1996$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_1996$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1996$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_1997)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_1997)[5] <- "NOME_CONTA"
Dados_com_conta4010_1997$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1997$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_1997$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1997$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_1998)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_1998)[5] <- "NOME_CONTA"
Dados_com_conta4010_1998$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1998$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_1998$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1998$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_1999)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_1999)[5] <- "NOME_CONTA"
Dados_com_conta4010_1999$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1999$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_1999$NOME_CONTA <- str_replace_all(Dados_com_conta4010_1999$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2000)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2000)[5] <- "NOME_CONTA"
Dados_com_conta4010_2000$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2000$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2000$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2000$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2001)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2001)[5] <- "NOME_CONTA"
Dados_com_conta4010_2001$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2001$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2001$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2001$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2002)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2002)[5] <- "NOME_CONTA"
Dados_com_conta4010_2002$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2002$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2002$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2002$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2003)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2003)[5] <- "NOME_CONTA"
Dados_com_conta4010_2003$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2003$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2003$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2003$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2004)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2004)[5] <- "NOME_CONTA"
Dados_com_conta4010_2004$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2004$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2004$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2004$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2005)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2005)[5] <- "NOME_CONTA"
Dados_com_conta4010_2005$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2005$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2005$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2005$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2006)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2006)[5] <- "NOME_CONTA"
Dados_com_conta4010_2006$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2006$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2006$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2006$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2007)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2007)[5] <- "NOME_CONTA"
Dados_com_conta4010_2007$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2007$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2007$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2007$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2008)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2008)[5] <- "NOME_CONTA"
Dados_com_conta4010_2008$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2008$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2008$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2008$NOME_CONTA, fixed("-"), "")

colnames(Dados_com_conta4010_2009)[1] <- "NOME_INSTITUICAO"
colnames(Dados_com_conta4010_2009)[5] <- "NOME_CONTA"
Dados_com_conta4010_2009$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2009$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2009$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2009$NOME_CONTA, fixed("-"), "")


Dados_com_conta4010_2010$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2010$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2010$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2010$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2011$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2011$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2011$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2011$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2012$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2012$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2012$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2012$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2013$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2013$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2013$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2013$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2014$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2014$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2014$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2014$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2015$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2015$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2015$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2015$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2016$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2016$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2016$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2016$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2017$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2017$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2017$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2017$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2018$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2018$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2018$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2018$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2019$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2019$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2019$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2019$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2020$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2020$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2020$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2020$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2021$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2021$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2021$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2021$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2022$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2022$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2022$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2022$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2023$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2023$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2023$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2023$NOME_CONTA, fixed("-"), "")

Dados_com_conta4010_2024$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2024$NOME_CONTA, fixed(" "), "")
Dados_com_conta4010_2024$NOME_CONTA <- str_replace_all(Dados_com_conta4010_2024$NOME_CONTA, fixed("-"), "")



# Converte para maiusculo
Dados_com_conta4010_1994 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_1995 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_1996 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_1997 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_1998 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_1999 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2000 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2001 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2002 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2003 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2004 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2005 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2006 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2007 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2008 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2009 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2010 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2011 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2012 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2013 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2014 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2015 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2016 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2017 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2018 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2019 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2020 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2021 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2022 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2023 %<>%
  mutate_if(is.character, toupper)
Dados_com_conta4010_2024 %<>%
  mutate_if(is.character, toupper)


## resolvendo o problema para o pivotamento dos dados
Dados_sem_duplicidades_1994 <- subset(Dados_com_conta4010_1994, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_1995 <- subset(Dados_com_conta4010_1995, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_1996 <- subset(Dados_com_conta4010_1996, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_1997 <- subset(Dados_com_conta4010_1997, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_1998 <- subset(Dados_com_conta4010_1998, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_1999 <- subset(Dados_com_conta4010_1999, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2000 <- subset(Dados_com_conta4010_2000, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2001 <- subset(Dados_com_conta4010_2001, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2002 <- subset(Dados_com_conta4010_2002, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2003 <- subset(Dados_com_conta4010_2003, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2004 <- subset(Dados_com_conta4010_2004, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2005 <- subset(Dados_com_conta4010_2005, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2006 <- subset(Dados_com_conta4010_2006, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2007 <- subset(Dados_com_conta4010_2007, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2008 <- subset(Dados_com_conta4010_2008, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2009 <- subset(Dados_com_conta4010_2009, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2010 <- subset(Dados_com_conta4010_2010, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2011 <- subset(Dados_com_conta4010_2011, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2012 <- subset(Dados_com_conta4010_2012, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2013 <- subset(Dados_com_conta4010_2013, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2014 <- subset(Dados_com_conta4010_2014, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2015 <- subset(Dados_com_conta4010_2015, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2016 <- subset(Dados_com_conta4010_2016, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")
Dados_sem_duplicidades_2017 <- subset(Dados_com_conta4010_2017, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")

Dados_sem_duplicidades_2018 <- subset(Dados_com_conta4010_2018, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")

Dados_sem_duplicidades_2019 <- subset(Dados_com_conta4010_2019, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")

Dados_sem_duplicidades_2020 <- subset(Dados_com_conta4010_2020, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")

Dados_sem_duplicidades_2021 <- subset(Dados_com_conta4010_2021, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")

Dados_sem_duplicidades_2022 <- subset(Dados_com_conta4010_2022, CONTA == "81800009" | CONTA == "89000007" |
  CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
  CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
  CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
| CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
  CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
  CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
  CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
  CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
  CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
  CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
  CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
  CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
  CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
  CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")


Dados_sem_duplicidades_2023 <- subset(Dados_com_conta4010_2023, CONTA == "81800009" | CONTA == "89000007" |
                                        CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
                                        CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
                                        CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
                                      | CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
                                        CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
                                        CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
                                        CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
                                        CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
                                        CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
                                        CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
                                        CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
                                        CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
                                        CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
                                        CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")

Dados_sem_duplicidades_2024 <- subset(Dados_com_conta4010_2024, CONTA == "81800009" | CONTA == "89000007" |
                                        CONTA == "80000006" | CONTA == "81700006" | CONTA == "81100008" | CONTA == "83000003" | CONTA == "81000005" |
                                        CONTA == "89400009" | CONTA == "83900000" | CONTA == "81900002" | CONTA == "16900008" | CONTA == "18900006" |
                                        CONTA == "21500008" | CONTA == "25100002" | CONTA == "18100002" #  | CONTA == "11100009"  | CONTA == "61100004"    | CONTA == "14500008"
                                      | CONTA == "40000008" | CONTA == "10000007" | CONTA == "31000000" | CONTA == "91000002" | CONTA == "30500006" | CONTA == "49100002" |
                                        CONTA == "30000001" | CONTA == "70000009" | CONTA == "30800005" | CONTA == "30900008" | CONTA == "30100004" | CONTA == "30400003" |
                                        CONTA == "41000007" | CONTA == "41500002" | CONTA == "41100000" | CONTA == "11200002" | CONTA == "19900005" | CONTA == "11000006" |
                                        CONTA == "49900006" | CONTA == "18800003" | CONTA == "16100004" | CONTA == "16200007" | CONTA == "49400001" | CONTA == "22000002" |
                                        CONTA == "22400004" | CONTA == "25000009" | CONTA == "21000003" | CONTA == "13100007" | CONTA == "16000001" | CONTA == "91100005" |
                                        CONTA == "31200006" | CONTA == "31100003" | CONTA == "31300009" | CONTA == "31500005" | CONTA == "31600008" | CONTA == "31700001" |
                                        CONTA == "31900007" | CONTA == "31400002" | CONTA == "49000009" | CONTA == "73900003" | CONTA == "71900005" | CONTA == "22900009" |
                                        CONTA == "18000009" | CONTA == "19000008" | CONTA == "19800002" | CONTA == "60000002" | CONTA == "16900008" | CONTA == "73000006" |
                                        CONTA == "71000008" | CONTA == "45100006" | CONTA == "45000003" | CONTA == "14000003" | CONTA == "18300008" | CONTA == "71500003" |
                                        CONTA == "71100001" | CONTA == "71700009" | CONTA == "61500006" | CONTA == "61700002" | CONTA == "49300008" | CONTA == "13000004" |
                                        CONTA == "39999993" | CONTA == "99999995" | CONTA == "70000009" | CONTA == "20000004")


DadosN_1994 <- Dados_sem_duplicidades_1994[, c(1, 2, 5, 6)]
DadosN_1995 <- Dados_sem_duplicidades_1995[, c(1, 2, 5, 6)]
DadosN_1996 <- Dados_sem_duplicidades_1996[, c(1, 2, 5, 6)]
DadosN_1997 <- Dados_sem_duplicidades_1997[, c(1, 2, 5, 6)]
DadosN_1998 <- Dados_sem_duplicidades_1998[, c(1, 2, 5, 6)]
DadosN_1999 <- Dados_sem_duplicidades_1999[, c(1, 2, 5, 6)]
DadosN_2000 <- Dados_sem_duplicidades_2000[, c(1, 2, 5, 6)]
DadosN_2001 <- Dados_sem_duplicidades_2001[, c(1, 2, 5, 6)]
DadosN_2002 <- Dados_sem_duplicidades_2002[, c(1, 2, 5, 6)]
DadosN_2003 <- Dados_sem_duplicidades_2003[, c(1, 2, 5, 6)]
DadosN_2004 <- Dados_sem_duplicidades_2004[, c(1, 2, 5, 6)]
DadosN_2005 <- Dados_sem_duplicidades_2005[, c(1, 2, 5, 6)]
DadosN_2006 <- Dados_sem_duplicidades_2006[, c(1, 2, 5, 6)]
DadosN_2007 <- Dados_sem_duplicidades_2007[, c(1, 2, 5, 6)]
DadosN_2008 <- Dados_sem_duplicidades_2008[, c(1, 2, 5, 6)]
DadosN_2009 <- Dados_sem_duplicidades_2009[, c(1, 2, 5, 6)]
DadosN_2010 <- Dados_sem_duplicidades_2010[, c(1, 2, 5, 6)]
DadosN_2011 <- Dados_sem_duplicidades_2011[, c(1, 2, 5, 6)]
DadosN_2012 <- Dados_sem_duplicidades_2012[, c(1, 2, 5, 6)]
DadosN_2013 <- Dados_sem_duplicidades_2013[, c(1, 2, 5, 6)]
DadosN_2014 <- Dados_sem_duplicidades_2014[, c(1, 2, 5, 6)]
DadosN_2015 <- Dados_sem_duplicidades_2015[, c(1, 2, 5, 6)]
DadosN_2016 <- Dados_sem_duplicidades_2016[, c(1, 2, 5, 6)]
DadosN_2017 <- Dados_sem_duplicidades_2017[, c(1, 2, 5, 6)]
DadosN_2018 <- Dados_sem_duplicidades_2018[, c(1, 2, 5, 6)]
DadosN_2019 <- Dados_sem_duplicidades_2019[, c(1, 2, 5, 6)]
DadosN_2020 <- Dados_sem_duplicidades_2020[, c(1, 2, 5, 6)]
DadosN_2021 <- Dados_sem_duplicidades_2021[, c(1, 2, 5, 6)]
DadosN_2022 <- Dados_sem_duplicidades_2022[, c(1, 2, 5, 6)]
DadosN_2023 <- Dados_sem_duplicidades_2023[, c(1, 2, 5, 6)]
DadosN_2024 <- Dados_sem_duplicidades_2024[, c(1, 2, 5, 6)]

class(DadosN_2022$SALDO)
class(DadosN_1994$CNPJ)
# DadosN_2022$SALDO <- as.numeric(DadosN_2022$SALDO)
DadosN_1994$CNPJ <- as.numeric(DadosN_1994$CNPJ)
DadosN_1995$CNPJ <- as.numeric(DadosN_1995$CNPJ)
DadosN_1996$CNPJ <- as.numeric(DadosN_1996$CNPJ)
DadosN_1997$CNPJ <- as.numeric(DadosN_1997$CNPJ)
DadosN_1998$CNPJ <- as.numeric(DadosN_1998$CNPJ)
DadosN_1999$CNPJ <- as.numeric(DadosN_1999$CNPJ)
DadosN_2000$CNPJ <- as.numeric(DadosN_2000$CNPJ)
DadosN_2001$CNPJ <- as.numeric(DadosN_2001$CNPJ)
DadosN_2002$CNPJ <- as.numeric(DadosN_2002$CNPJ)
DadosN_2003$CNPJ <- as.numeric(DadosN_2003$CNPJ)
DadosN_2004$CNPJ <- as.numeric(DadosN_2004$CNPJ)
DadosN_2005$CNPJ <- as.numeric(DadosN_2005$CNPJ)
DadosN_2006$CNPJ <- as.numeric(DadosN_2006$CNPJ)
DadosN_2007$CNPJ <- as.numeric(DadosN_2007$CNPJ)
DadosN_2008$CNPJ <- as.numeric(DadosN_2008$CNPJ)
DadosN_2009$CNPJ <- as.numeric(DadosN_2009$CNPJ)
DadosN_2010$CNPJ <- as.numeric(DadosN_2010$CNPJ)
DadosN_2011$CNPJ <- as.numeric(DadosN_2011$CNPJ)
DadosN_2012$CNPJ <- as.numeric(DadosN_2012$CNPJ)
DadosN_2013$CNPJ <- as.numeric(DadosN_2013$CNPJ)
DadosN_2014$CNPJ <- as.numeric(DadosN_2014$CNPJ)
DadosN_2015$CNPJ <- as.numeric(DadosN_2015$CNPJ)
DadosN_2016$CNPJ <- as.numeric(DadosN_2016$CNPJ)
DadosN_2017$CNPJ <- as.numeric(DadosN_2017$CNPJ)
DadosN_2018$CNPJ <- as.numeric(DadosN_2018$CNPJ)
DadosN_2019$CNPJ <- as.numeric(DadosN_2019$CNPJ)
DadosN_2020$CNPJ <- as.numeric(DadosN_2020$CNPJ)
DadosN_2021$CNPJ <- as.numeric(DadosN_2021$CNPJ)
DadosN_2022$CNPJ <- as.numeric(DadosN_2022$CNPJ)
DadosN_2023$CNPJ <- as.numeric(DadosN_2023$CNPJ)
DadosN_2024$CNPJ <- as.numeric(DadosN_2024$CNPJ)


### curso R
# sapply(DadosN_2021, function(x) sum(is.nan(x)))


##### pivotando linhas de dados em colunas
Dados_pivotados_1994 <- DadosN_1994 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_1995 <- DadosN_1995 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_1996 <- DadosN_1996 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_1997 <- DadosN_1997 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_1998 <- DadosN_1998 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_1999 <- DadosN_1999 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2000 <- DadosN_2000 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2001 <- DadosN_2001 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2002 <- DadosN_2002 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2003 <- DadosN_2003 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2004 <- DadosN_2004 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2005 <- DadosN_2005 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2006 <- DadosN_2006 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2007 <- DadosN_2007 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2008 <- DadosN_2008 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2009 <- DadosN_2009 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2010 <- DadosN_2010 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2011 <- DadosN_2011 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2012 <- DadosN_2012 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2013 <- DadosN_2013 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2014 <- DadosN_2014 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2015 <- DadosN_2015 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2016 <- DadosN_2016 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2017 <- DadosN_2017 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2018 <- DadosN_2018 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2019 <- DadosN_2019 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2020 <- DadosN_2020 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2021 <- DadosN_2021 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2022 <- DadosN_2022 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))

Dados_pivotados_2023 <- DadosN_2023 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))
Dados_pivotados_2024 <- DadosN_2024 %>%
  pivot_wider(names_from = NOME_CONTA, values_from = SALDO, values_fn = list(SALDO = mean))


summary(Dados_pivotados_2024)

Dados_pivotados_1994 <- within(Dados_pivotados_1994, ANO <- 1994)
Dados_pivotados_1995 <- within(Dados_pivotados_1995, ANO <- 1995)
Dados_pivotados_1996 <- within(Dados_pivotados_1996, ANO <- 1996)
Dados_pivotados_1997 <- within(Dados_pivotados_1997, ANO <- 1997)
Dados_pivotados_1998 <- within(Dados_pivotados_1998, ANO <- 1998)
Dados_pivotados_1999 <- within(Dados_pivotados_1999, ANO <- 1999)
Dados_pivotados_2000 <- within(Dados_pivotados_2000, ANO <- 2000)
Dados_pivotados_2001 <- within(Dados_pivotados_2001, ANO <- 2001)
Dados_pivotados_2002 <- within(Dados_pivotados_2002, ANO <- 2002)
Dados_pivotados_2003 <- within(Dados_pivotados_2003, ANO <- 2003)
Dados_pivotados_2004 <- within(Dados_pivotados_2004, ANO <- 2004)
Dados_pivotados_2005 <- within(Dados_pivotados_2005, ANO <- 2005)
Dados_pivotados_2006 <- within(Dados_pivotados_2006, ANO <- 2006)
Dados_pivotados_2007 <- within(Dados_pivotados_2007, ANO <- 2007)
Dados_pivotados_2008 <- within(Dados_pivotados_2008, ANO <- 2008)
Dados_pivotados_2009 <- within(Dados_pivotados_2009, ANO <- 2009)
Dados_pivotados_2010 <- within(Dados_pivotados_2010, ANO <- 2010)
Dados_pivotados_2011 <- within(Dados_pivotados_2011, ANO <- 2011)
Dados_pivotados_2012 <- within(Dados_pivotados_2012, ANO <- 2012)
Dados_pivotados_2013 <- within(Dados_pivotados_2013, ANO <- 2013)
Dados_pivotados_2014 <- within(Dados_pivotados_2014, ANO <- 2014)
Dados_pivotados_2015 <- within(Dados_pivotados_2015, ANO <- 2015)
Dados_pivotados_2016 <- within(Dados_pivotados_2016, ANO <- 2016)
Dados_pivotados_2017 <- within(Dados_pivotados_2017, ANO <- 2017)
Dados_pivotados_2018 <- within(Dados_pivotados_2018, ANO <- 2018)
Dados_pivotados_2019 <- within(Dados_pivotados_2019, ANO <- 2019)
Dados_pivotados_2020 <- within(Dados_pivotados_2020, ANO <- 2020)
Dados_pivotados_2021 <- within(Dados_pivotados_2021, ANO <- 2021)
Dados_pivotados_2022 <- within(Dados_pivotados_2022, ANO <- 2022)
Dados_pivotados_2023 <- within(Dados_pivotados_2023, ANO <- 2023)
Dados_pivotados_2024 <- within(Dados_pivotados_2024, ANO <- 2024)

Dados_pivotados_1994$SOBRASOUPERDASACUMULADAS + Dados_pivotados_1994$CONTASDERESULTADOCREDORAS + Dados_pivotados_1994$`()CONTASDERESULTADODEVEDORAS`


# 1. Verifique se o DataFrame existe e sua estrutura
if (exists("Dados_pivotados_2020")) {
  print("DataFrame encontrado:")
  str(Dados_pivotados_2022)
} else {
  print("DataFrame Dados_pivotados_2022 não encontrado. Verifique se foi carregado.")
}

# 2. Assuma que há uma coluna chamada 'CNPJ' (ajuste o nome da coluna se for diferente)
cnpj_procurado <- "26526166"
resultado <- Dados_pivotados_2022[Dados_pivotados_2022$CNPJ == cnpj_procurado, "SOBRAS_BRUTAS"]

# 3. Exiba o resultado
if (length(resultado) > 0) {
  print(paste("Valor de SOBRAS_BRUTAS para CNPJ", cnpj_procurado, "em 2022:", resultado))
} else {
  print(paste("Nenhum registro encontrado para o CNPJ", cnpj_procurado, "em Dados_pivotados_2022."))
}



Dados_pivotados_1994["SOBRAS_BRUTAS"] <- Dados_pivotados_1994$SOBRASOUPERDASACUMULADAS + Dados_pivotados_1994$CONTASDERESULTADOCREDORAS + Dados_pivotados_1994$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_1994["ATIVOS_VERDADEIROS"] <- Dados_pivotados_1994$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_1994$PERMANENTE
Dados_pivotados_1995["SOBRAS_BRUTAS"] <- Dados_pivotados_1995$SOBRASOUPERDASACUMULADAS + Dados_pivotados_1995$CONTASDERESULTADOCREDORAS + Dados_pivotados_1995$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_1995["ATIVOS_VERDADEIROS"] <- Dados_pivotados_1995$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_1995$PERMANENTE
Dados_pivotados_1996["SOBRAS_BRUTAS"] <- Dados_pivotados_1996$SOBRASOUPERDASACUMULADAS + Dados_pivotados_1996$CONTASDERESULTADOCREDORAS + Dados_pivotados_1996$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_1996["ATIVOS_VERDADEIROS"] <- Dados_pivotados_1996$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_1996$PERMANENTE
Dados_pivotados_1997["SOBRAS_BRUTAS"] <- Dados_pivotados_1997$SOBRASOUPERDASACUMULADAS + Dados_pivotados_1997$CONTASDERESULTADOCREDORAS + Dados_pivotados_1997$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_1997["ATIVOS_VERDADEIROS"] <- Dados_pivotados_1997$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_1997$PERMANENTE
Dados_pivotados_1998["SOBRAS_BRUTAS"] <- Dados_pivotados_1998$SOBRASOUPERDASACUMULADAS + Dados_pivotados_1998$CONTASDERESULTADOCREDORAS + Dados_pivotados_1998$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_1998["ATIVOS_VERDADEIROS"] <- Dados_pivotados_1998$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_1998$PERMANENTE
Dados_pivotados_1999["SOBRAS_BRUTAS"] <- Dados_pivotados_1999$SOBRASOUPERDASACUMULADAS + Dados_pivotados_1999$CONTASDERESULTADOCREDORAS + Dados_pivotados_1999$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_1999["ATIVOS_VERDADEIROS"] <- Dados_pivotados_1999$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_1999$PERMANENTE
Dados_pivotados_2000["SOBRAS_BRUTAS"] <- Dados_pivotados_2000$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2000$CONTASDERESULTADOCREDORAS + Dados_pivotados_2000$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2000["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2000$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2000$PERMANENTE
Dados_pivotados_2001["SOBRAS_BRUTAS"] <- Dados_pivotados_2001$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2001$CONTASDERESULTADOCREDORAS + Dados_pivotados_2001$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2001["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2001$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2001$PERMANENTE
Dados_pivotados_2002["SOBRAS_BRUTAS"] <- Dados_pivotados_2002$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2002$CONTASDERESULTADOCREDORAS + Dados_pivotados_2002$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2002["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2002$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2002$PERMANENTE
Dados_pivotados_2003["SOBRAS_BRUTAS"] <- Dados_pivotados_2003$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2003$CONTASDERESULTADOCREDORAS + Dados_pivotados_2003$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2003["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2003$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2003$PERMANENTE
Dados_pivotados_2004["SOBRAS_BRUTAS"] <- Dados_pivotados_2004$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2004$CONTASDERESULTADOCREDORAS + Dados_pivotados_2004$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2004["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2004$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2004$PERMANENTE
Dados_pivotados_2005["SOBRAS_BRUTAS"] <- Dados_pivotados_2005$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2005$CONTASDERESULTADOCREDORAS + Dados_pivotados_2005$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2005["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2005$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2005$PERMANENTE
Dados_pivotados_2006["SOBRAS_BRUTAS"] <- Dados_pivotados_2006$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2006$CONTASDERESULTADOCREDORAS + Dados_pivotados_2006$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2006["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2006$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2006$PERMANENTE
Dados_pivotados_2007["SOBRAS_BRUTAS"] <- Dados_pivotados_2007$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2007$CONTASDERESULTADOCREDORAS + Dados_pivotados_2007$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2007["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2007$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2007$PERMANENTE
Dados_pivotados_2008["SOBRAS_BRUTAS"] <- Dados_pivotados_2008$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2008$CONTASDERESULTADOCREDORAS + Dados_pivotados_2008$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2008["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2008$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2008$PERMANENTE
Dados_pivotados_2009["SOBRAS_BRUTAS"] <- Dados_pivotados_2009$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2009$CONTASDERESULTADOCREDORAS + Dados_pivotados_2009$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2009["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2009$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2009$PERMANENTE
Dados_pivotados_2010["SOBRAS_BRUTAS"] <- Dados_pivotados_2010$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2010$CONTASDERESULTADOCREDORAS + Dados_pivotados_2010$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2010["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2010$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2010$PERMANENTE
Dados_pivotados_2011["SOBRAS_BRUTAS"] <- Dados_pivotados_2011$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2011$CONTASDERESULTADOCREDORAS + Dados_pivotados_2011$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2011["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2011$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2011$PERMANENTE
Dados_pivotados_2012["SOBRAS_BRUTAS"] <- Dados_pivotados_2012$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2012$CONTASDERESULTADOCREDORAS + Dados_pivotados_2012$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2012["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2012$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2012$PERMANENTE
Dados_pivotados_2013["SOBRAS_BRUTAS"] <- Dados_pivotados_2013$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2013$CONTASDERESULTADOCREDORAS + Dados_pivotados_2013$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2013["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2013$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2013$PERMANENTE
Dados_pivotados_2014["SOBRAS_BRUTAS"] <- Dados_pivotados_2014$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2014$CONTASDERESULTADOCREDORAS + Dados_pivotados_2014$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2014["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2014$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2014$PERMANENTE
Dados_pivotados_2015["SOBRAS_BRUTAS"] <- Dados_pivotados_2015$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2015$CONTASDERESULTADOCREDORAS + Dados_pivotados_2015$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2015["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2015$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2015$PERMANENTE
Dados_pivotados_2016["SOBRAS_BRUTAS"] <- Dados_pivotados_2016$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2016$CONTASDERESULTADOCREDORAS + Dados_pivotados_2016$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2016["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2016$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2016$PERMANENTE
Dados_pivotados_2017["SOBRAS_BRUTAS"] <- Dados_pivotados_2017$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2017$CONTASDERESULTADOCREDORAS + Dados_pivotados_2017$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2017["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2017$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2017$PERMANENTE
Dados_pivotados_2018["SOBRAS_BRUTAS"] <- Dados_pivotados_2018$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2018$CONTASDERESULTADOCREDORAS + Dados_pivotados_2018$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2018["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2018$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2018$PERMANENTE
Dados_pivotados_2019["SOBRAS_BRUTAS"] <- Dados_pivotados_2019$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2019$CONTASDERESULTADOCREDORAS + Dados_pivotados_2019$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2019["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2019$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2019$PERMANENTE
Dados_pivotados_2020["SOBRAS_BRUTAS"] <- Dados_pivotados_2020$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2020$CONTASDERESULTADOCREDORAS + Dados_pivotados_2020$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2020["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2020$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2020$PERMANENTE
Dados_pivotados_2021["SOBRAS_BRUTAS"] <- Dados_pivotados_2021$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2021$CONTASDERESULTADOCREDORAS + Dados_pivotados_2021$`()CONTASDERESULTADODEVEDORAS`
Dados_pivotados_2021["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2021$CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2021$PERMANENTE
# Dados_pivotados_2022["SOBRAS_BRUTAS"] <- Dados_pivotados_2022$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2022$RESULTADOCREDOR
# Dados_pivotados_2022["SOBRAS_BRUTAS"] <- Dados_pivotados_2022$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2022$RESULTADOCREDOR
Dados_pivotados_2022["SOBRAS_BRUTAS"] <- Dados_pivotados_2022$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2022$RESULTADOCREDOR + Dados_pivotados_2022$`()RESULTADODEVEDOR`
Dados_pivotados_2022["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2022$ATIVOREALIZÁVEL + Dados_pivotados_2022$ATIVOPERMANENTE

Dados_pivotados_2023["SOBRAS_BRUTAS"] <- Dados_pivotados_2023$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2023$RESULTADOCREDOR + Dados_pivotados_2023$`()RESULTADODEVEDOR`
Dados_pivotados_2023["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2023$ATIVOREALIZÁVEL + Dados_pivotados_2023$ATIVOPERMANENTE

Dados_pivotados_2024["SOBRAS_BRUTAS"] <- Dados_pivotados_2024$SOBRASOUPERDASACUMULADAS + Dados_pivotados_2024$RESULTADOCREDOR + Dados_pivotados_2024$`()RESULTADODEVEDOR`
Dados_pivotados_2024["ATIVOS_VERDADEIROS"] <- Dados_pivotados_2024$ATIVOREALIZÁVEL + Dados_pivotados_2024$ATIVOPERMANENTE



# plot(Dados_pivotados_1994$SOBRAS_BRUTAS, type = "b")

Dados_pivotados_1994["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_1994$SOBRAS_BRUTAS / Dados_pivotados_1994$PATRIMONIOLIQUIDO
Dados_pivotados_1995["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_1995$SOBRAS_BRUTAS / Dados_pivotados_1995$PATRIMONIOLIQUIDO
Dados_pivotados_1996["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_1996$SOBRAS_BRUTAS / Dados_pivotados_1996$PATRIMONIOLIQUIDO
Dados_pivotados_1997["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_1997$SOBRAS_BRUTAS / Dados_pivotados_1997$PATRIMONIOLIQUIDO
Dados_pivotados_1998["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_1998$SOBRAS_BRUTAS / Dados_pivotados_1998$PATRIMONIOLIQUIDO
Dados_pivotados_1999["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_1999$SOBRAS_BRUTAS / Dados_pivotados_1999$PATRIMONIOLIQUIDO
Dados_pivotados_2000["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2000$SOBRAS_BRUTAS / Dados_pivotados_2000$PATRIMONIOLIQUIDO
Dados_pivotados_2001["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2001$SOBRAS_BRUTAS / Dados_pivotados_2001$PATRIMONIOLIQUIDO
Dados_pivotados_2002["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2002$SOBRAS_BRUTAS / Dados_pivotados_2002$PATRIMONIOLIQUIDO
Dados_pivotados_2003["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2003$SOBRAS_BRUTAS / Dados_pivotados_2003$PATRIMONIOLIQUIDO
Dados_pivotados_2004["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2004$SOBRAS_BRUTAS / Dados_pivotados_2004$PATRIMONIOLIQUIDO
Dados_pivotados_2005["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2005$SOBRAS_BRUTAS / Dados_pivotados_2005$PATRIMONIOLIQUIDO
Dados_pivotados_2006["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2006$SOBRAS_BRUTAS / Dados_pivotados_2006$PATRIMONIOLIQUIDO
Dados_pivotados_2007["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2007$SOBRAS_BRUTAS / Dados_pivotados_2007$PATRIMONIOLIQUIDO
Dados_pivotados_2008["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2008$SOBRAS_BRUTAS / Dados_pivotados_2008$PATRIMONIOLIQUIDO
Dados_pivotados_2009["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2009$SOBRAS_BRUTAS / Dados_pivotados_2009$PATRIMONIOLIQUIDO
Dados_pivotados_2010["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2010$SOBRAS_BRUTAS / Dados_pivotados_2010$PATRIMONIOLIQUIDO
Dados_pivotados_2011["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2011$SOBRAS_BRUTAS / Dados_pivotados_2011$PATRIMONIOLIQUIDO
Dados_pivotados_2012["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2012$SOBRAS_BRUTAS / Dados_pivotados_2012$PATRIMONIOLIQUIDO
Dados_pivotados_2013["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2013$SOBRAS_BRUTAS / Dados_pivotados_2013$PATRIMONIOLIQUIDO
Dados_pivotados_2014["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2014$SOBRAS_BRUTAS / Dados_pivotados_2014$PATRIMONIOLIQUIDO
Dados_pivotados_2015["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2015$SOBRAS_BRUTAS / Dados_pivotados_2015$PATRIMONIOLIQUIDO
Dados_pivotados_2016["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2016$SOBRAS_BRUTAS / Dados_pivotados_2016$PATRIMONIOLIQUIDO
Dados_pivotados_2017["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2017$SOBRAS_BRUTAS / Dados_pivotados_2017$PATRIMONIOLIQUIDO
Dados_pivotados_2018["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2018$SOBRAS_BRUTAS / Dados_pivotados_2018$PATRIMONIOLIQUIDO
Dados_pivotados_2019["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2019$SOBRAS_BRUTAS / Dados_pivotados_2019$PATRIMONIOLIQUIDO
Dados_pivotados_2020["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2020$SOBRAS_BRUTAS / Dados_pivotados_2020$PATRIMONIOLIQUIDO
Dados_pivotados_2021["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2021$SOBRAS_BRUTAS / Dados_pivotados_2021$PATRIMONIOLIQUIDO
Dados_pivotados_2022["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2022$SOBRAS_BRUTAS / Dados_pivotados_2022$PATRIMONIOLIQUIDO
Dados_pivotados_2023["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2023$SOBRAS_BRUTAS / Dados_pivotados_2023$PATRIMONIOLIQUIDO
Dados_pivotados_2024["SOBRAS_BRUTA_POR_PL"] <- Dados_pivotados_2024$SOBRAS_BRUTAS / Dados_pivotados_2024$PATRIMONIOLIQUIDO



Dados_pivotados_1994["SOBRAS_POR_ATIVO"] <- Dados_pivotados_1994$SOBRAS_BRUTAS / Dados_pivotados_1994$ATIVOS_VERDADEIROS
Dados_pivotados_1995["SOBRAS_POR_ATIVO"] <- Dados_pivotados_1995$SOBRAS_BRUTAS / Dados_pivotados_1995$ATIVOS_VERDADEIROS
Dados_pivotados_1996["SOBRAS_POR_ATIVO"] <- Dados_pivotados_1996$SOBRAS_BRUTAS / Dados_pivotados_1996$ATIVOS_VERDADEIROS
Dados_pivotados_1997["SOBRAS_POR_ATIVO"] <- Dados_pivotados_1997$SOBRAS_BRUTAS / Dados_pivotados_1997$ATIVOS_VERDADEIROS
Dados_pivotados_1998["SOBRAS_POR_ATIVO"] <- Dados_pivotados_1998$SOBRAS_BRUTAS / Dados_pivotados_1998$ATIVOS_VERDADEIROS
Dados_pivotados_1999["SOBRAS_POR_ATIVO"] <- Dados_pivotados_1999$SOBRAS_BRUTAS / Dados_pivotados_1999$ATIVOS_VERDADEIROS
Dados_pivotados_2000["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2000$SOBRAS_BRUTAS / Dados_pivotados_2000$ATIVOS_VERDADEIROS
Dados_pivotados_2001["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2001$SOBRAS_BRUTAS / Dados_pivotados_2001$ATIVOS_VERDADEIROS
Dados_pivotados_2002["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2002$SOBRAS_BRUTAS / Dados_pivotados_2002$ATIVOS_VERDADEIROS
Dados_pivotados_2003["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2003$SOBRAS_BRUTAS / Dados_pivotados_2003$ATIVOS_VERDADEIROS
Dados_pivotados_2004["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2004$SOBRAS_BRUTAS / Dados_pivotados_2004$ATIVOS_VERDADEIROS
Dados_pivotados_2005["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2005$SOBRAS_BRUTAS / Dados_pivotados_2005$ATIVOS_VERDADEIROS
Dados_pivotados_2006["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2006$SOBRAS_BRUTAS / Dados_pivotados_2006$ATIVOS_VERDADEIROS
Dados_pivotados_2007["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2007$SOBRAS_BRUTAS / Dados_pivotados_2007$ATIVOS_VERDADEIROS
Dados_pivotados_2008["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2008$SOBRAS_BRUTAS / Dados_pivotados_2008$ATIVOS_VERDADEIROS
Dados_pivotados_2009["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2009$SOBRAS_BRUTAS / Dados_pivotados_2009$ATIVOS_VERDADEIROS
Dados_pivotados_2010["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2010$SOBRAS_BRUTAS / Dados_pivotados_2010$ATIVOS_VERDADEIROS
Dados_pivotados_2011["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2011$SOBRAS_BRUTAS / Dados_pivotados_2011$ATIVOS_VERDADEIROS
Dados_pivotados_2012["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2012$SOBRAS_BRUTAS / Dados_pivotados_2012$ATIVOS_VERDADEIROS
Dados_pivotados_2013["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2013$SOBRAS_BRUTAS / Dados_pivotados_2013$ATIVOS_VERDADEIROS
Dados_pivotados_2014["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2014$SOBRAS_BRUTAS / Dados_pivotados_2014$ATIVOS_VERDADEIROS
Dados_pivotados_2015["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2015$SOBRAS_BRUTAS / Dados_pivotados_2015$ATIVOS_VERDADEIROS
Dados_pivotados_2016["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2016$SOBRAS_BRUTAS / Dados_pivotados_2016$ATIVOS_VERDADEIROS
Dados_pivotados_2017["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2017$SOBRAS_BRUTAS / Dados_pivotados_2017$ATIVOS_VERDADEIROS
Dados_pivotados_2018["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2018$SOBRAS_BRUTAS / Dados_pivotados_2018$ATIVOS_VERDADEIROS
Dados_pivotados_2019["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2019$SOBRAS_BRUTAS / Dados_pivotados_2019$ATIVOS_VERDADEIROS
Dados_pivotados_2020["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2020$SOBRAS_BRUTAS / Dados_pivotados_2020$ATIVOS_VERDADEIROS
Dados_pivotados_2021["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2021$SOBRAS_BRUTAS / Dados_pivotados_2021$ATIVOS_VERDADEIROS
Dados_pivotados_2022["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2022$SOBRAS_BRUTAS / Dados_pivotados_2022$ATIVOS_VERDADEIROS
Dados_pivotados_2023["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2023$SOBRAS_BRUTAS / Dados_pivotados_2023$ATIVOS_VERDADEIROS
Dados_pivotados_2024["SOBRAS_POR_ATIVO"] <- Dados_pivotados_2024$SOBRAS_BRUTAS / Dados_pivotados_2024$ATIVOS_VERDADEIROS

# Dados_pivotados_2020$SOBRAS_POR_ATIVO


#### verififcar quantos NA existem
sapply(Dados_pivotados_1994, function(x) sum(is.na(x)))

######### TIRANDO TODAS ACENTUACOES DOS NOMES DAS COLUNAS#################
names(Dados_pivotados_1994) <- iconv(names(Dados_pivotados_1994), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_1995) <- iconv(names(Dados_pivotados_1995), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_1996) <- iconv(names(Dados_pivotados_1996), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_1997) <- iconv(names(Dados_pivotados_1997), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_1998) <- iconv(names(Dados_pivotados_1998), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_1999) <- iconv(names(Dados_pivotados_1999), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2000) <- iconv(names(Dados_pivotados_2000), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2001) <- iconv(names(Dados_pivotados_2001), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2002) <- iconv(names(Dados_pivotados_2002), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2003) <- iconv(names(Dados_pivotados_2003), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2004) <- iconv(names(Dados_pivotados_2004), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2005) <- iconv(names(Dados_pivotados_2005), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2006) <- iconv(names(Dados_pivotados_2006), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2007) <- iconv(names(Dados_pivotados_2007), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2008) <- iconv(names(Dados_pivotados_2008), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2009) <- iconv(names(Dados_pivotados_2009), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2010) <- iconv(names(Dados_pivotados_2010), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2011) <- iconv(names(Dados_pivotados_2011), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2012) <- iconv(names(Dados_pivotados_2012), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2013) <- iconv(names(Dados_pivotados_2013), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2014) <- iconv(names(Dados_pivotados_2014), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2015) <- iconv(names(Dados_pivotados_2015), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2016) <- iconv(names(Dados_pivotados_2016), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2017) <- iconv(names(Dados_pivotados_2017), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2018) <- iconv(names(Dados_pivotados_2018), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2019) <- iconv(names(Dados_pivotados_2019), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2020) <- iconv(names(Dados_pivotados_2020), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2021) <- iconv(names(Dados_pivotados_2021), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2022) <- iconv(names(Dados_pivotados_2022), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2023) <- iconv(names(Dados_pivotados_2023), from = "UTF-8", to = "ASCII//TRANSLIT")
names(Dados_pivotados_2024) <- iconv(names(Dados_pivotados_2024), from = "UTF-8", to = "ASCII//TRANSLIT")


total_dados <- bind_rows(
  Dados_pivotados_2024, Dados_pivotados_2023, Dados_pivotados_2022, 
  Dados_pivotados_2021, Dados_pivotados_2020, Dados_pivotados_2019,
  Dados_pivotados_2018, Dados_pivotados_2017, Dados_pivotados_2016,
  Dados_pivotados_2015, Dados_pivotados_2014, Dados_pivotados_2013,
  Dados_pivotados_2012, Dados_pivotados_2011, Dados_pivotados_2010,
  Dados_pivotados_2009, Dados_pivotados_2008, Dados_pivotados_2007,
  Dados_pivotados_2006, Dados_pivotados_2005, Dados_pivotados_2004,
  Dados_pivotados_2003, Dados_pivotados_2002, Dados_pivotados_2001,
  Dados_pivotados_2000, Dados_pivotados_1999, Dados_pivotados_1998,
  Dados_pivotados_1997, Dados_pivotados_1996, Dados_pivotados_1995,
  Dados_pivotados_1994
)


Dados_limpos_1994 <- Dados_pivotados_1994[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_1995 <- Dados_pivotados_1995[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_1996 <- Dados_pivotados_1996[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_1997 <- Dados_pivotados_1997[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_1998 <- Dados_pivotados_1998[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_1999 <- Dados_pivotados_1999[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2000 <- Dados_pivotados_2000[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2001 <- Dados_pivotados_2001[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2002 <- Dados_pivotados_2002[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2003 <- Dados_pivotados_2003[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2004 <- Dados_pivotados_2004[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2005 <- Dados_pivotados_2005[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2006 <- Dados_pivotados_2006[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2007 <- Dados_pivotados_2007[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2008 <- Dados_pivotados_2008[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2009 <- Dados_pivotados_2009[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2010 <- Dados_pivotados_2010[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2011 <- Dados_pivotados_2011[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2012 <- Dados_pivotados_2012[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2013 <- Dados_pivotados_2013[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2014 <- Dados_pivotados_2014[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2015 <- Dados_pivotados_2015[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2016 <- Dados_pivotados_2016[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2017 <- Dados_pivotados_2017[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2018 <- Dados_pivotados_2018[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2019 <- Dados_pivotados_2019[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2020 <- Dados_pivotados_2020[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2021 <- Dados_pivotados_2021[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2022 <- Dados_pivotados_2022[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]

Dados_limpos_2023 <- Dados_pivotados_2023[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
Dados_limpos_2024 <- Dados_pivotados_2024[, c(
  "NOME_INSTITUICAO", "CNPJ", "OPERACOESDECREDITO", "PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS", "SOBRASOUPERDASACUMULADAS", "RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS", "RECEITASNAOOPERACIONAIS", "RENDASDEPRESTACAODESERVICOS",
  "RENDASDEOPERACOESDECREDITO", "SOBRAS_BRUTAS", "ATIVOS_VERDADEIROS",
  "SOBRAS_BRUTA_POR_PL", "SOBRAS_POR_ATIVO", "ANO"
)]
class(Dados_limpos_2024$ANO)

total_dados_limpos <- bind_rows(
  Dados_limpos_2024, Dados_limpos_2023, Dados_limpos_2022, 
  Dados_limpos_2021, Dados_limpos_2020, Dados_limpos_2019,
  Dados_limpos_2018, Dados_limpos_2017, Dados_limpos_2016,
  Dados_limpos_2015, Dados_limpos_2014, Dados_limpos_2013,
  Dados_limpos_2012, Dados_limpos_2011, Dados_limpos_2010,
  Dados_limpos_2009, Dados_limpos_2008, Dados_limpos_2007,
  Dados_limpos_2006, Dados_limpos_2005, Dados_limpos_2004,
  Dados_limpos_2003, Dados_limpos_2002, Dados_limpos_2001,
  Dados_limpos_2000, Dados_limpos_1999, Dados_limpos_1998,
  Dados_limpos_1997, Dados_limpos_1996, Dados_limpos_1995,
  Dados_limpos_1994
)


summary(total_dados_limpos)


total_dados_limpos2 <- na.omit(total_dados_limpos)
summary(total_dados_limpos2) ### obs: nao da para limpar todos os NAs pq tem campos q n'ao preciso e ser'ao eliminados

table(total_dados_limpos2$UF)

contagem_por_ano <- total_dados_limpos2 %>% 
  group_by(ANO) %>% 
  summarise(contagem = n())

###### Adicionando o endereco
End_Coope_Br <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/End_Coope_Br.xlsx")
End_Coope_Br2009 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/200901COOPERATIVAS.xls")
End_Coope_Br2007 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/200709COOPERATIVAS.xls")
End_Coope_Br2008 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/200801COOPERATIVAS.xls")
End_Coope_Br2010 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/201001COOPERATIVAS.xls")
End_Coope_Br2011 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/201101COOPERATIVAS.xls")
End_Coope_Br2013 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/201301COOPERATIVAS.xls")
End_Coope_Br2015 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/201501COOPERATIVAS.xls")
End_Coope_Br2017 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/201701COOPERATIVAS.xls")
End_Coope_Br2020 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/202001COOPERATIVAS.xlsx")
End_Coope_Br2021 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/202101COOPERATIVAS.xlsx")
End_Coope_Br2023 <- read_excel("C:/Aula3/DadosCoopBrasil/Enderecos/202301COOPERATIVAS.xlsx")

class(End_Coope_Br$CNPJ)
End_Coope_Br$CNPJ[is.na(as.numeric(End_Coope_Br$CNPJ))]
End_Coope_Br$CNPJ <- as.numeric(End_Coope_Br$CNPJ)
# Verificar quais valores são convertidos em NA
End_Coope_Br$CNPJ[is.na(as.numeric(End_Coope_Br$CNPJ))]

End_Coope_Br2009$CNPJ <- as.numeric(End_Coope_Br2009$CNPJ)
End_Coope_Br2007$CNPJ <- as.numeric(End_Coope_Br2007$CNPJ)
End_Coope_Br2008$CNPJ <- as.numeric(End_Coope_Br2008$CNPJ)
End_Coope_Br2010$CNPJ <- as.numeric(End_Coope_Br2010$CNPJ)
End_Coope_Br2011$CNPJ <- as.numeric(End_Coope_Br2011$CNPJ)
End_Coope_Br2013$CNPJ <- as.numeric(End_Coope_Br2013$CNPJ)
End_Coope_Br2015$CNPJ <- as.numeric(End_Coope_Br2015$CNPJ)
End_Coope_Br2017$CNPJ <- as.numeric(End_Coope_Br2017$CNPJ)
End_Coope_Br2020$CNPJ <- as.numeric(End_Coope_Br2020$CNPJ)
End_Coope_Br2020$CNPJ[is.na(as.numeric(End_Coope_Br2020$CNPJ))]
End_Coope_Br2021$CNPJ <- as.numeric(End_Coope_Br2021$CNPJ)
End_Coope_Br2021$CNPJ[is.na(as.numeric(End_Coope_Br2021$CNPJ))]
End_Coope_Br2023$CNPJ <- as.numeric(End_Coope_Br2023$CNPJ)
End_Coope_Br2023$CNPJ[is.na(as.numeric(End_Coope_Br2023$CNPJ))]

class(total_dados_limpos$CNPJ)

### funcao criada para buscar cidades por CNPJs ausentes
source("C:/Users/cmarl/OneDrive/Documentos/Tese_novo/Funcoes.R")

total_dados_limpos %>%
  left_join(End_Coope_Br, by = "CNPJ") -> total_dados_limpos2

# Verificar quantos NAs existem na coluna CEP
sum(is.na(total_dados_limpos2$`MUNICIPIO IBGE`))


# Filtrar todas as linhas onde MUNICIPIO IBGE está vazio (NA)
municipios_vazios <- total_dados_limpos2 %>%
  filter(is.na(`MUNICIPIO IBGE`))

# Exibir o DataFrame com os CNPJs cujos municípios estão ausentes

# Filtrar para CNPJs únicos
df_cnpj_unicos <- municipios_vazios %>%
  distinct(CNPJ, .keep_all = TRUE)

# Exibir o resultado
print(df_cnpj_unicos)


# Aplicar a consulta aos CNPJs com intervalo de 1 segundo
resultado <- consultar_lista_cnpjs(df_cnpj_unicos$CNPJ, intervalo = 2)

# Verificar os resultados
print(resultado)
resultado_validos <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos1 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados1 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados1$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos2 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados2 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados2$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos3 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados3 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados3$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos4 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados4 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados4$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos5 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados5 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados5$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos6 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados6 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados6$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos7 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados7 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados7$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos8 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados8 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados8$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos9 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados9 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados9$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos10 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados10 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados10$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos11 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados11 <- resultado[is.na(resultado$razao_social), ]

# Opcional: salvar em arquivos CSV
save.image("novo_10_09_24_.RData")
load("my_workspace.RDatasdsdsd")
getwd()

resultado <- consultar_lista_cnpjs(resultado_falhados11$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos12 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados12 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados12$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos13 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados13 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados13$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos14 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados14 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados14$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos15 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados15 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados15$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos16 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados16 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados16$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos17 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados17 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados17$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos18 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados18 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados18$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos19 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados19 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados19$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos20 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados20 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados20$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos21 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados21 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados21$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos22 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados22 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados22$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos23 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados23 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados23$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos24 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados24 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados24$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos25 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados25 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados25$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos26 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados26 <- resultado[is.na(resultado$razao_social), ]

resultado <- consultar_lista_cnpjs(resultado_falhados26$CNPJ_ORIGINAL, intervalo = 1)
resultado_validos27 <- resultado[!is.na(resultado$razao_social), ]
resultado_falhados27 <- resultado[is.na(resultado$razao_social), ]

### Sao 176 CNPJs nao encontrados

####save.image("novo_11_09_24_.RData")
#########load("novo_11_09_24_.RData")

resultado_combinado <- bind_rows(
  resultado_validos23, resultado_validos24, resultado_validos25, resultado_validos26,
  resultado_validos22, resultado_validos21, resultado_validos20, resultado_validos19,
  resultado_validos18, resultado_validos17, resultado_validos16, resultado_validos15,
  resultado_validos14, resultado_validos13, resultado_validos12, resultado_validos11,
  resultado_validos10, resultado_validos9, resultado_validos8, resultado_validos7,
  resultado_validos6, resultado_validos5, resultado_validos4, resultado_validos3,
  resultado_validos2, resultado_validos1
)

view(resultado_combinado)

# Salvar o resultado final em um arquivo CSV
write.csv(resultado_combinado, "c:/Aula3/Docs/resultado_cnpjs.csv", row.names = FALSE)


# Supondo que o novo DataFrame seja chamado de df_novo e o antigo seja total_dados_limpos2

# Verificando as colunas que você deseja mesclar
names(resultado_combinado) # Para confirmar os nomes das colunas no novo DF

# Salvando o DataFrame total_dados_limpos2 em um arquivo CSV
write.csv(total_dados_limpos2, "c:/Aula3/Docs/total_dados_limpos2.csv", row.names = FALSE)
write.csv(resultado_combinado, "c:/Aula3/Docs/resultado_combinado.csv", row.names = FALSE)

resultado_combinado$CNPJ <- as.character(resultado_combinado$CNPJ)
total_dados_limpos2$CNPJ <- as.character(total_dados_limpos2$CNPJ)

# Realizar a junção dos dois DataFrames pelo CNPJ
library(dplyr)
total_dados_limposNOVO <- total_dados_limpos2 %>%
  left_join(resultado_combinado %>% select(CNPJ, MUNICÍPIO, UF, CEP),
    by = "CNPJ"
  )
# Preencher os valores ausentes no total_dados_limpos2 com os valores de resultado_combinado
total_dados_limposNOVO <- total_dados_limposNOVO %>%
  mutate(
    MUNICÍPIO = ifelse(is.na(MUNICÍPIO.x), MUNICÍPIO.y, MUNICÍPIO.x),
    UF = ifelse(is.na(UF.x), UF.y, UF.x),
    CEP = ifelse(is.na(CEP.x), CEP.y, CEP.x)
  )

# Remover as colunas duplicadas
total_dados_limposNOVO <- total_dados_limposNOVO %>%
  select(-MUNICÍPIO.y, -UF.y, -CEP.y)
# Salvando o DataFrame final em um arquivo CSV

write.csv(total_dados_limposNOVO, "caminho/para/total_dados_limpos2_atualizado.csv", row.names = FALSE)


municipios_vaziosS <- total_dados_limposNOVO %>%
  filter(is.na(SOBRAS_BRUTAS))

# Filtrar para CNPJs únicos
df_cnpj_unicosS <- municipios_vazios2 %>%
  distinct(SOBRAS_BRUTAS, .keep_all = TRUE)

##### 312 CNPJs sem endereço

save.image("novo2_11_09_24_.RData")
load("novo_11_09_24_.RData")

summary(total_dados_limposNOVO)

dbUse <- total_dados_limposNOVO

cod_municipios <- read_excel("C:/Aula3/DadosCoopBrasil/PIB_dos_Municipios_2010-2020.xlsx",
  col_names = TRUE
) %>%
  select(Cod_Munic, NomedoMunicipio, Cod_Reg_Imediata, Cod_Reg_Intermed)

cod_municipios2 <- cod_municipios %>%
  distinct()

df_principal <- padronizar_municipios(cod_municipios2, "NomedoMunicipio")

df_municipios_adicionar <- padronizar_municipios(cod_municipios2, "NomedoMunicipio")
df_principal <- padronizar_municipios(dbUse, "MUNICÍPIO")

# Verificar duplicatas em df_municipios_adicionar e manter apenas uma linha por município
df_municipios_adicionar <- df_municipios_adicionar %>%
  distinct(NomedoMunicipio, .keep_all = TRUE)

# Realizar a junção pelo nome do município
df_final <- df_principal %>%
  left_join(df_municipios_adicionar %>% select(NomedoMunicipio, Cod_Munic, Cod_Reg_Imediata, Cod_Reg_Intermed),
    by = c("MUNICÍPIO" = "NomedoMunicipio"),
    relationship = "many-to-many"
  )

summary(df_final2)

view(df_final2)
df_final2 <- df_final[, c(1, 2, 16, 34, 36, 37, 38, 14, 15)]

# Eliminar todas as linhas que contenham qualquer valor NA
library(naniar)
# gg_miss_var(df_final2)
vis_miss(df_final2)

df_limpo <- na.omit(df_final2)
vis_miss(df_limpo)

gg_miss_upset(df_final2)

summary(df_limpo)

##### INICIO DAS REGRESSOES

#############################################################
###I M P O R T A N T E#######################################
###Calcule o N de Nível 2 para a análise de MUNICÍPIOS - GERAL
#############################################################

n2_municipios <- n_distinct(df_limpo$Cod_Munic)
print(paste("Número total de Municípios na amostra (N de Nível 2):", n2_municipios))
  n2_regImed <- n_distinct(df_limpo$Cod_Reg_Imediata)
  print(paste("Número total de Regiões Imediatas na amostra (N de Nível 2):", n2_regImed))
    n2_regInter <- n_distinct(df_limpo$Cod_Reg_Intermed)
    print(paste("Número total de Regiões Intermediárias na amostra (N de Nível 2):", n2_regInter)) 
      n2_regUF <- n_distinct(df_limpo$UF)
      print(paste("Número total de UF na amostra (N de Nível 2):", n2_regUF)) 
    
    
# Garantir que as variáveis categóricas estão como fatores
df_limpo$Unidade_de_Negocio <- factor(df_limpo$CNPJ)
df_limpo$Localizacao_munic <- factor(df_limpo$Cod_Munic)
df_limpo$Localizacao_UF <- factor(df_limpo$UF)
df_limpo$Localizacao_Inter <- factor(df_limpo$Cod_Reg_Intermed)
df_limpo$Localizacao_Imed <- factor(df_limpo$Cod_Reg_Imediata)
df_limpo$Ano <- factor(df_limpo$ANO)

save.image("novo3_11_09_24_.RData")
load("novo_11_09_24_.RData")


# Definir os limites do intervalo
limite_inferior <- -0.10  # -10%
limite_superior <- 0.20   # +20%

# Contar quantos valores estão fora do intervalo
fora_intervalo <- sum(df_limpo$SOBRAS_POR_ATIVO < limite_inferior | 
                        df_limpo$SOBRAS_POR_ATIVO > limite_superior, 
                      na.rm = TRUE)

# Calcular o total de observações (excluindo NAs)
total_obs <- sum(!is.na(df_limpo$SOBRAS_POR_ATIVO))

# Calcular a porcentagem
porcentagem_fora <- (fora_intervalo / total_obs) * 100

# Exibir os resultados
cat("Número de dados fora do intervalo (-10% a +20%):", fora_intervalo, "\n")
cat("Total de observações:", total_obs, "\n")
cat("Porcentagem fora do intervalo:", round(porcentagem_fora, 2), "%\n")




# 1995–1998: Fernando Henrique Cardoso (1º Mandato).
# 1999–2002: Fernando Henrique Cardoso (2º Mandato).
# 2003–2006: Luiz Inácio Lula da Silva (1º Mandato).
# 2007–2010: Luiz Inácio Lula da Silva (2º Mandato).
# 2011–2014: Dilma Rousseff (1º Mandato).
# 2015–2016: Dilma Rousseff (2º Mandato).
# 2016–2018: Michel Temer.
# 2019–2022: Jair Bolsonaro.


df_Bolsonaro <- df_limpo[df_limpo$ANO %in% c(2019, 2020, 2021, 2022), ]
# Salvando o DataFrame df_Bolsonaro em um arquivo CSV no caminho especificado
write.csv(df_Bolsonaro, "C:/Aula3/Docs/df_Bolsonaro.csv", row.names = FALSE)

## PREMISSAS
# coop deve estar em todos os anos da janela
# número mínimo de coop por cidade = 3
# número mínimo de coop por Reg_Imed = 5
# número mínimo de coop por Ref_Inter = 5
# número mínimo de coop por Estado = 5



df_Bolsonado_filteredMunic <- filtrar_cooperativas(df_Bolsonaro,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Bolsonado_filteredImed <- filtrar_cooperativas(df_Bolsonaro,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Bolsonado_filteredIntermed <- filtrar_cooperativas(df_Bolsonaro,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_Bolsonado_filteredUF <- filtrar_cooperativas(df_Bolsonaro,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)


###Calcule o N de Nível 2 para a análise dessa JANELA
n2_municipios <- n_distinct(df_Bolsonado_filteredMunic$Cod_Munic)
print(paste("Número total de Municípios na amostra (N de Nível 2):", n2_municipios))
n2_regImed <- n_distinct(df_Bolsonado_filteredImed$Cod_Reg_Imediata)
print(paste("Número total de Regiões Imediatas na amostra (N de Nível 2):", n2_regImed))
n2_regInter <- n_distinct(df_Bolsonado_filteredIntermed$Cod_Reg_Intermed)
print(paste("Número total de Regiões Intermediárias na amostra (N de Nível 2):", n2_regInter)) 
n2_regUF <- n_distinct(df_Bolsonado_filteredUF$UF)
print(paste("Número total de UF na amostra (N de Nível 2):", n2_regUF)) 



library(lme4)

mod_BolsonaroUF1 <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_UF) + (1 | Ano), data = resultadosB1$df_sem_outliers)
summary(mod_BolsonaroUF1)

mod_BolsonaroMunic1 <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_munic) + (1 | Ano), data = df_Bolsonado_filteredMunic)
summary(mod_BolsonaroMunic1)

# Salvar o DataFrame filtrado
write.csv(df_filtered, "C:/Aula3/Docs/df_filtered_Bolsonaro.csv", row.names = FALSE)

# Visualizar o DataFrame final
head(df_filtered)

rmarkdown::render("mod_BolsonaroFil.Rmd")


save.image("novo_19_09_24_.RData")



df_Temer <- df_limpo[df_limpo$ANO %in% c(2017, 2018), ]

df_Temer_filteredMunic <- filtrar_cooperativas(df_Temer,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Temer_filteredImed <- filtrar_cooperativas(df_Temer,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Temer_filteredIntermed <- filtrar_cooperativas(df_Temer,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_Temer_filteredUF <- filtrar_cooperativas(df_Temer,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)


##JUNTAS AS JANELAS TEMER_BOSO



df_Dilma2 <- df_limpo[df_limpo$ANO %in% c(2015, 2016), ]

df_Dilma2_filteredMunic <- filtrar_cooperativas(df_Dilma2,
  min_coop_munic = 5,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Dilma2_filteredImed <- filtrar_cooperativas(df_Dilma2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Dilma2_filteredIntermed <- filtrar_cooperativas(df_Dilma2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_Dilma2_filteredUF <- filtrar_cooperativas(df_Dilma2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)

rmarkdown::render("C:\Users\cmarl\OneDrive\Documentos\Tese_novo\mod_BolsonaroFil.Rmd")


df_Dilma1 <- df_limpo[df_limpo$ANO %in% c(2011, 2012, 2013, 2014), ]

df_Dilma1_filteredMunic <- filtrar_cooperativas(df_Dilma1,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Dilma1_filteredImed <- filtrar_cooperativas(df_Dilma1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Dilma1_filteredIntermed <- filtrar_cooperativas(df_Dilma1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_Dilma1_filteredUF <- filtrar_cooperativas(df_Dilma1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)

rmarkdown::render("mod_BolsonaroFil.Rmd")



df_Lula2 <- df_limpo[df_limpo$ANO %in% c(2007, 2008, 2009, 2010), ]

df_Lula2_filteredMunic <- filtrar_cooperativas(df_Lula2,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Lula2_filteredImed <- filtrar_cooperativas(df_Lula2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Lula2_filteredIntermed <- filtrar_cooperativas(df_Lula2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_Lula2_filteredUF <- filtrar_cooperativas(df_Lula2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)

rmarkdown::render("mod_BolsonaroFil.Rmd")


df_Lula1 <- df_limpo[df_limpo$ANO %in% c(2003, 2004, 2005, 2006), ]

df_Lula1_filteredMunic <- filtrar_cooperativas(df_Lula1,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Lula1_filteredImed <- filtrar_cooperativas(df_Lula1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Lula1_filteredIntermed <- filtrar_cooperativas(df_Lula1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_Lula1_filteredUF <- filtrar_cooperativas(df_Lula1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)

rmarkdown::render("mod_BolsonaroFil.Rmd")

df_FHC2 <- df_limpo[df_limpo$ANO %in% c(1999, 2000, 2001, 2002), ]

df_FHC2_filteredMunic <- filtrar_cooperativas(df_FHC2,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_FHC2_filteredImed <- filtrar_cooperativas(df_FHC2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_FHC2_filteredIntermed <- filtrar_cooperativas(df_FHC2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_FHC2_filteredUF <- filtrar_cooperativas(df_FHC2,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)

rmarkdown::render("mod_BolsonaroFil.Rmd")


df_FHC1 <- df_limpo[df_limpo$ANO %in% c(1995, 1996, 1997, 1998), ]

df_FHC1_filteredMunic <- filtrar_cooperativas(df_FHC1,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_FHC1_filteredImed <- filtrar_cooperativas(df_FHC1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_FHC1_filteredIntermed <- filtrar_cooperativas(df_FHC1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_FHC1_filteredUF <- filtrar_cooperativas(df_FHC1,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)

rmarkdown::render("mod_BolsonaroFil.Rmd")

# Aplicar a função a cada uma das janelas temporais que você já criou
estatisticas_Bolsonaro <- calcular_estatisticas(df_Bolsonaro, "Bolsonaro")
estatisticas_Temer <- calcular_estatisticas(df_Temer, "Temer")
estatisticas_Dilma2 <- calcular_estatisticas(df_Dilma2, "Dilma2")
estatisticas_Dilma1 <- calcular_estatisticas(df_Dilma1, "Dilma1")
estatisticas_Lula2 <- calcular_estatisticas(df_Lula2, "Lula2")
estatisticas_Lula1 <- calcular_estatisticas(df_Lula1, "Lula1")
estatisticas_FHC2 <- calcular_estatisticas(df_FHC2, "FHC2")
estatisticas_FHC1 <- calcular_estatisticas(df_FHC1, "FHC1")

# Combinar os resultados em uma única tabela
estatisticas_totais <- bind_rows(
  estatisticas_Bolsonaro,
  estatisticas_Temer,
  estatisticas_Dilma2,
  estatisticas_Dilma1,
  estatisticas_Lula2,
  estatisticas_Lula1,
  estatisticas_FHC2,
  estatisticas_FHC1
)

estatisticas_totais

# Aplicar a função para calcular as estatísticas por ano em cada janela
estatisticas_Bolsonaro_ano <- calcular_estatisticas_por_ano(df_Bolsonaro, "Bolsonaro")
estatisticas_Temer_ano <- calcular_estatisticas_por_ano(df_Temer, "Temer")
estatisticas_Dilma2_ano <- calcular_estatisticas_por_ano(df_Dilma2, "Dilma2")
estatisticas_Dilma1_ano <- calcular_estatisticas_por_ano(df_Dilma1, "Dilma1")
estatisticas_Lula2_ano <- calcular_estatisticas_por_ano(df_Lula2, "Lula2")
estatisticas_Lula1_ano <- calcular_estatisticas_por_ano(df_Lula1, "Lula1")
estatisticas_FHC2_ano <- calcular_estatisticas_por_ano(df_FHC2, "FHC2")
estatisticas_FHC1_ano <- calcular_estatisticas_por_ano(df_FHC1, "FHC1")

# Combinar todas as janelas em um único dataframe
estatisticas_totais_ano <- bind_rows(
  estatisticas_Bolsonaro_ano,
  estatisticas_Temer_ano,
  estatisticas_Dilma2_ano,
  estatisticas_Dilma1_ano,
  estatisticas_Lula2_ano,
  estatisticas_Lula1_ano,
  estatisticas_FHC2_ano,
  estatisticas_FHC1_ano
)

view(estatisticas_totais_ano)

library(openxlsx)

wb <- createWorkbook()
addWorksheet(wb, "Resumo_Anual")

writeDataTable(
  wb,
  sheet = "Resumo_Anual",
  x = estatisticas_totais_ano,
  tableStyle = "TableStyleMedium9"
)

saveWorkbook(
  wb,
  "estatisticas_totais_ano.xlsx",
  overwrite = TRUE
)
dir.create("outputs", showWarnings = FALSE)

saveWorkbook(
  wb,
  file = "outputs/estatisticas_totais_ano.xlsx",
  overwrite = TRUE
)

file.exists("outputs/estatisticas_totais_ano.xlsx")

summary(df_Temer)

getwd()




library(lme4)
# mod_rgint_allyear_with_alloutliear <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_munic) + (1 | Ano), data = df_Bolsonaro)

mod_BolsonaroMunic1 <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_munic) + (1 | Ano), data = df_Bolsonado_filteredMunic)
summary(mod_BolsonaroMunic1)


# Contar a quantidade de registros por município
contagem_municipios <- df_sem_outliers_Zscore %>%
  group_by(Localizacao_munic) %>%
  summarise(quantidade = n())

# Exibir os primeiros resultados
head(contagem_municipios)

total_municipios <- nrow(contagem_municipios)
total_municipios

# Contagem de frequência para a variável Localizacao_UF
frequencia_UF <- table(df_sem_outliers_Zscore$Localizacao_UF)
frequencia_UF
# Distribuição percentual para Localizacao_munic
distribuicao_percentual_munic <- prop.table(table(df_sem_outliers_Zscore$Localizacao_munic)) * 100
distribuicao_percentual_munic

# Criar o gráfico com as etiquetas mostrando a quantidade de cooperativas por estado
ggplot(df_Bolsonado_filtered, aes(x = factor(Localizacao_UF))) +
  geom_bar() +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5) + # Adiciona as etiquetas com a contagem
  labs(title = "Distribuição por Estado (UF)", x = "Estado (UF)", y = "Frequência") +
  theme_minimal()



resumo_UF <- df_sem_outliers_Zscore %>%
  group_by(Localizacao_UF) %>%
  summarise(
    media = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    mediana = median(SOBRAS_POR_ATIVO, na.rm = TRUE),
    desvio_padrao = sd(SOBRAS_POR_ATIVO, na.rm = TRUE),
    min = min(SOBRAS_POR_ATIVO, na.rm = TRUE),
    max = max(SOBRAS_POR_ATIVO, na.rm = TRUE)
  )
resumo_UF

ggplot(df_sem_outliers_Zscore, aes(x = SOBRAS_POR_ATIVO)) +
  geom_histogram(binwidth = 0.05, fill = "steelblue", color = "black") +
  labs(title = "Distribuição de SOBRAS_POR_ATIVO por Estado (UF)", x = "SOBRAS_POR_ATIVO", y = "Frequência") +
  facet_wrap(~Localizacao_UF) + # Cria subgráficos para cada estado
  theme_minimal()

ggplot(df_sem_outliers_Zscore, aes(x = factor(Localizacao_munic), y = SOBRAS_POR_ATIVO)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Boxplot de SOBRAS_POR_ATIVO por Município", x = "Município", y = "SOBRAS_POR_ATIVO") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + # Rotacionar os rótulos
  theme_minimal()

ggplot(df_sem_outliers_Zscore, aes(x = factor(Localizacao_UF), y = SOBRAS_POR_ATIVO)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Boxplot de SOBRAS_POR_ATIVO por Estado (UF)", x = "Estado", y = "SOBRAS_POR_ATIVO") +
  theme_minimal()

ggplot(estatisticas_totais, aes(x = Janela, y = Media, fill = Janela)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = round(Media, 2)), vjust = -0.5) + # Adiciona valores acima das barras
  labs(title = "Média de SOBRAS_POR_ATIVO por Janela Temporal", x = "Janela Temporal", y = "Média") +
  theme_minimal()

ggplot(df_sem_outliers_Zscore, aes(x = Localizacao_munic, y = SOBRAS_POR_ATIVO, color = Localizacao_UF)) +
  geom_point(size = 3) +
  labs(title = "Dispersão de SOBRAS_POR_ATIVO por Município e Estado", x = "Município", y = "SOBRAS_POR_ATIVO") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()

library(plotly)

p <- ggplot(df_sem_outliers_Zscore, aes(x = factor(Localizacao_UF), y = SOBRAS_POR_ATIVO)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Boxplot Interativo de SOBRAS_POR_ATIVO por Estado (UF)", x = "Estado", y = "SOBRAS_POR_ATIVO") +
  theme_minimal()

ggplotly(p) # Torna o gráfico interativo



mod_Bolsonaro_UF <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_UF) + (1 | Ano), data = df_sem_outliers_Zscore)
summary(mod_Bolsonaro_UF)

mod_Bolsonaro_Inter <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_Inter) + (1 | Ano), data = df_sem_outliers_Zscore)
summary(mod_Bolsonaro_Inter)

mod_Bolsonaro_Imed <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_Imed) + (1 | Ano), data = df_sem_outliers_Zscore)
summary(mod_Bolsonaro_Imed)

mod_Bolsonaro_Munic <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_munic) + (1 | Ano), data = df_sem_outliers_Zscore)
summary(mod_Bolsonaro_Munic)

rmarkdown::render("mod_Bolsonaro.Rmd")

save.image("novo_22_09_24_.RData")

mod_Temer_UF <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_UF), data = df_Temer)
resultadosT <- remover_outliers_zscore(df_Temer, "SOBRAS_POR_ATIVO")
df_sem_outliers_ZscoreT <- resultadosT$df_sem_outliers
df_com_outliers_ZscoreT <- resultadosT$df_com_outliers

mod_Temer_UF1 <- lmer(SOBRAS_POR_ATIVO ~ (1 | Unidade_de_Negocio) + (1 | Localizacao_UF), data = df_sem_outliers_ZscoreT)

boxplot(df_Temer$SOBRAS_POR_ATIVO)
boxplot(df_sem_outliers_ZscoreT$SOBRAS_POR_ATIVO)
summary(mod_Temer_UF1)

summary(df_com_outliers_ZscoreT)

rmarkdown::render("mod_Bolsonaro.Rmd")


resultadosD2 <- remover_outliers_zscore(df_Dilma2, "SOBRAS_POR_ATIVO")
df_sem_outliers_ZscoreD2 <- resultadosD2$df_sem_outliers
df_com_outliers_ZscoreD2 <- resultadosD2$df_com_outliers


summary(df_com_outliers_ZscoreT)

rmarkdown::render("mod_Bolsonaro.Rmd")



save.image("c:/Aula3/docs/novo1_14_09_24_.RData")


df_TemerBolsonaro <- df_limpo[df_limpo$ANO %in% c(2017, 2018, 2019, 2020, 2021, 2022), ]
### write.csv(df_TemerBolsonaro, "c:/Aula3/docs/df_TemerBolsonaro.csv", row.names = FALSE)
# df_TemerBolsonaro <- read.csv("c:/Aula3/docs/df_TemerBolsonaro.csv",
#   sep = ",", # Use ";" se o arquivo estiver com separador de ponto e vírgula
#   stringsAsFactors = FALSE,
#   fileEncoding = "UTF-8"
# )

df_TemerBolsonaro_filteredMunic <- filtrar_cooperativas(df_TemerBolsonaro,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_TemerBolsonaro_filteredImed <- filtrar_cooperativas(df_TemerBolsonaro,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_TemerBolsonaro_filteredIntermed <- filtrar_cooperativas(df_TemerBolsonaro,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_TemerBolsonaro_filteredUF <- filtrar_cooperativas(df_TemerBolsonaro,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)


##########################
###Calcule o N de Nível 2 para a análise dessa JANELA
#########################
n2_municipios <- n_distinct(df_TemerBolsonaro_filteredMunic$Cod_Munic)
print(paste("Número total de Municípios na amostra (N de Nível 2):", n2_municipios))
n2_regImed <- n_distinct(df_TemerBolsonaro_filteredImed$Cod_Reg_Imediata)
print(paste("Número total de Regiões Imediatas na amostra (N de Nível 2):", n2_regImed))
n2_regInter <- n_distinct(df_TemerBolsonaro_filteredIntermed$Cod_Reg_Intermed)
print(paste("Número total de Regiões Intermediárias na amostra (N de Nível 2):", n2_regInter)) 
n2_regUF <- n_distinct(df_TemerBolsonaro_filteredUF$UF)
print(paste("Número total de UF na amostra (N de Nível 2):", n2_regUF)) 


getwd()
rmarkdown::render("mod_GovernosUnidos.Rmd")

df_Dilma12 <- df_limpo[df_limpo$ANO %in% c(2011, 2012, 2013, 2014, 2015, 2016), ]

df_Dilma12_filteredMunic <- filtrar_cooperativas(df_Dilma12,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Dilma12_filteredImed <- filtrar_cooperativas(df_Dilma12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Dilma12_filteredIntermed <- filtrar_cooperativas(df_Dilma12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_Dilma12_filteredUF <- filtrar_cooperativas(df_Dilma12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)


##########################
###Calcule o N de Nível 2 para a análise dessa JANELA
#########################
n2_municipios <- n_distinct(df_Dilma12_filteredMunic$Cod_Munic)
print(paste("Número total de Municípios na amostra (N de Nível 2):", n2_municipios))
n2_regImed <- n_distinct(df_Dilma12_filteredImed$Cod_Reg_Imediata)
print(paste("Número total de Regiões Imediatas na amostra (N de Nível 2):", n2_regImed))
n2_regInter <- n_distinct(df_Dilma12_filteredIntermed$Cod_Reg_Intermed)
print(paste("Número total de Regiões Intermediárias na amostra (N de Nível 2):", n2_regInter)) 
n2_regUF <- n_distinct(df_Dilma12_filteredUF$UF)
print(paste("Número total de UF na amostra (N de Nível 2):", n2_regUF)) 

rmarkdown::render("mod_GovernosUnidos.Rmd")


df_Lula12 <- df_limpo[df_limpo$ANO %in% c(2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010), ]

df_Lula12_filteredMunic <- filtrar_cooperativas(df_Lula12,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)


df_Lula12_filteredImed <- filtrar_cooperativas(df_Lula12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_Lula12_filteredIntermed <- filtrar_cooperativas(df_Lula12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_Lula12_filteredUF <- filtrar_cooperativas(df_Lula12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)

##########################
###Calcule o N de Nível 2 para a análise dessa JANELA
#########################
n2_municipios <- n_distinct(df_Lula12_filteredMunic$Cod_Munic)
print(paste("Número total de Municípios na amostra (N de Nível 2):", n2_municipios))
n2_regImed <- n_distinct(df_Lula12_filteredImed$Cod_Reg_Imediata)
print(paste("Número total de Regiões Imediatas na amostra (N de Nível 2):", n2_regImed))
n2_regInter <- n_distinct(df_Lula12_filteredIntermed$Cod_Reg_Intermed)
print(paste("Número total de Regiões Intermediárias na amostra (N de Nível 2):", n2_regInter)) 
n2_regUF <- n_distinct(df_Lula12_filteredUF$UF)
print(paste("Número total de UF na amostra (N de Nível 2):", n2_regUF)) 

rmarkdown::render("mod_GovernosUnidos.Rmd")

rmarkdown::render("Range_Outlers.Rmd")

rmarkdown::render("testeRange.Rmd") ### testando a geração de .PDF

# Exemplo de como usar a função com um dataframe
# carregar o arquivo CSV criado
df_inflacao <- read.csv("c:/Aula3/docs/metas_inflacao_brasil_com_margens.csv")
# Gerar o gráfico
criar_grafico_inflacao(df_inflacao)


df_FHC12 <- df_limpo[df_limpo$ANO %in% c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002), ]

df_FHC12_filteredMunic <- filtrar_cooperativas(df_FHC12,
  min_coop_munic = 3,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_FHC12_filteredImed <- filtrar_cooperativas(df_FHC12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = 5,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)

df_FHC12_filteredIntermed <- filtrar_cooperativas(df_FHC12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = 5,
  min_coop_estado = NULL
)

df_FHC12_filteredUF <- filtrar_cooperativas(df_FHC12,
  min_coop_munic = NULL,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = 5
)

##########################
###Calcule o N de Nível 2 para a análise dessa JANELA
#########################
n2_municipios <- n_distinct(df_FHC12_filteredMunic$Cod_Munic)
print(paste("Número total de Municípios na amostra (N de Nível 2):", n2_municipios))
n2_regImed <- n_distinct(df_FHC12_filteredImed$Cod_Reg_Imediata)
print(paste("Número total de Regiões Imediatas na amostra (N de Nível 2):", n2_regImed))
n2_regInter <- n_distinct(df_FHC12_filteredIntermed$Cod_Reg_Intermed)
print(paste("Número total de Regiões Intermediárias na amostra (N de Nível 2):", n2_regInter)) 
n2_regUF <- n_distinct(df_FHC12_filteredUF$UF)
print(paste("Número total de UF na amostra (N de Nível 2):", n2_regUF)) 

rmarkdown::render("mod_GovernosUnidos.Rmd")



## NOVOS TESTE DEPOIS DA ORIENTACAO 30/10

df_TemerBolsonaro_filtrado

saveRDS(df_TemerBolsonaro_filtrado, "c:/Aula3/docs/df_TemerBolsonaro_filtrado.rds")

df_TemerBolsonaro_filtradoMunic <- filtrar_cooperativas(df_TemerBolsonaro_filtrado,
  min_coop_munic = 5,
  min_coop_reg_imediata = NULL,
  min_coop_reg_intermediaria = NULL,
  min_coop_estado = NULL
)
novo <- calcular_estatisticas(df_TemerBolsonaro_filtradoMunic, "Janela TB (Z-score Município)")
novo

ggplot(df_TemerBolsonaro_filtradoMunic, aes(y = SOBRAS_POR_ATIVO)) +
  geom_boxplot() +
  ggtitle("Todos as dados da Janela Temer-Bolsonaro \nMunicípio")

library(lme4)
mod_TemerBolsonaro_Munic1 <- lmer(SOBRAS_POR_ATIVO ~ Ano + (1 | Unidade_de_Negocio) + (1 | Localizacao_munic), data = df_TemerBolsonaro_filtradoMunic)
summary(mod_TemerBolsonaro_Munic1)

plot_pizza_2D(mod_TemerBolsonaro_Munic1)

#################
### I P C A
#################

file_path <- "C:/Users/cmarl/OneDrive/Documentos/Tese_novo/STP-20241002110349062.csv"
library(readr)

ipca_data <- read_delim(file_path, delim = ";", col_names = c("Data", "IPCA"), skip = 1, col_types = cols(.default = "c"))

ipca_data$IPCA <- as.numeric(gsub(",", ".", ipca_data$IPCA))
ipca_data$Ano <- as.numeric(sub(".*/", "", ipca_data$Data)) # Extrair apenas o ano


source("C:/Users/cmarl/OneDrive/Documentos/Tese_novo/calcular_ipca_janelas.R")
resultado_ipca_janelas <- calcular_ipca_por_janelas(ipca_data)
resultado_ipca_anos <- calcular_ipca_acumulado_anual(ipca_data)

resultado_ipca_acumulado <- ipca_data %>%
  group_by(Ano) %>%
  summarise(IPCA_acumulado_anual = (prod(1 + IPCA / 100) - 1) * 100)

# Verificar nomes das colunas
names(df_TemerBolsonaro_filtrado)
names(resultado_ipca_acumulado)

# Unir os DataFrames pelo ano
df_TemerBolsonaro_filtrado <- merge(df_TemerBolsonaro_filtrado, resultado_ipca_acumulado, by = "Ano", all.x = TRUE)
df_TemerBolsonaro_filtrado$ROA_REAL <- df_TemerBolsonaro_filtrado$SOBRAS_POR_ATIVO_PCT - df_TemerBolsonaro_filtrado$IPCA



# Aplicar a função a cada uma das janelas temporais que você já criou
estatisticas_TemerBolsonaro <- calcular_estatisticas(df_TemerBolsonaro, "TemerBolsonaro")
estatisticas_Dilma12 <- calcular_estatisticas(df_Dilma12, "Dilma12")
estatisticas_Lula12 <- calcular_estatisticas(df_Lula12, "Lula12")
estatisticas_FHC12 <- calcular_estatisticas(df_FHC12, "FHC12")

# Combinar os resultados em uma única tabela
estatisticas_totais2 <- bind_rows(
  estatisticas_TemerBolsonaro,
  estatisticas_Dilma12,
  estatisticas_Lula12,
  estatisticas_FHC12
)

estatisticas_totais2
glimpse(df_TemerBolsonaro)



# Aplicar a função para calcular as estatísticas por ano em cada janela
estatisticas_TemerBolsonaro_ano <- calcular_estatisticas_por_ano(df_TemerBolsonaro, "TemerBolsonaro")
estatisticas_Dilma12_ano <- calcular_estatisticas_por_ano(df_Dilma12, "Dilma12")
estatisticas_Lula12_ano <- calcular_estatisticas_por_ano(df_Lula12, "Lula12")
estatisticas_FHC12_ano <- calcular_estatisticas_por_ano(df_FHC12, "FHC12")

# Combinar todas as janelas em um único dataframe
estatisticas_totais_ano2 <- bind_rows(
  estatisticas_TemerBolsonaro_ano,
  estatisticas_Dilma12_ano,
  estatisticas_Lula12_ano,
  estatisticas_FHC12_ano,
)

head(estatisticas_totais_ano2)

rmarkdown::render("mod_GovernosUnidos.Rmd")

save.image("c:/Aula3/docs/novo1_05_10_24_.RData")
load("c:/Aula3/docs/novo_05_10_24_.RData")

# Incorporando variáves socioeconomicas

library(sidrar)
pib_munic <- get_sidra(5938, period = "2020", geo = "City")


####DIA 07/10/2024

# Baixar o shapefile dos estados brasileiros
brasil_estados <- read_state(year = 2020, simplified = TRUE)


df_TemerBolsonaro <- df_limpo[df_limpo$ANO %in% c(2017, 2018, 2019, 2020, 2021, 2022), ]
# write.csv(df_TemerBolsonaro, "c:/Aula3/docs/df_TemerBolsonaro.csv", row.names = FALSE)
df_TemerBolsonaro <- read.csv("c:/Aula3/docs/df_TemerBolsonaro.csv",
                              sep = ",", # Use ";" se o arquivo estiver com separador de ponto e vírgula
                              stringsAsFactors = FALSE,
                              fileEncoding = "UTF-8"
)

df_TemerBolsonaro_filteredMunic$Ano <- as.factor(df_TemerBolsonaro_filteredMunic$Ano)
df_TemerBolsonaro_filteredIntermed$Ano <- as.factor(df_TemerBolsonaro_filteredIntermed$Ano)
df_TemerBolsonaro_filteredImed$Ano <- as.factor(df_TemerBolsonaro_filteredImed$Ano)
df_TemerBolsonaro_filteredUF$Ano <- as.factor(df_TemerBolsonaro_filteredUF$Ano)

rmarkdown::render("Range_Outlers.Rmd")


df_TemerBolsonaro_filteredMunic <- filtrar_cooperativas(df_TemerBolsonaro_filtrado,
                                                        min_coop_munic = 5,
                                                        min_coop_reg_imediata = NULL,
                                                        min_coop_reg_intermediaria = NULL,
                                                        min_coop_estado = NULL
)

df_TemerBolsonaro_filteredImed <- filtrar_cooperativas(df_TemerBolsonaro_filtrado,
                                                       min_coop_munic = NULL,
                                                       min_coop_reg_imediata = 5,
                                                       min_coop_reg_intermediaria = NULL,
                                                       min_coop_estado = NULL
)

df_TemerBolsonaro_filteredIntermed <- filtrar_cooperativas(df_TemerBolsonaro_filtrado,
                                                           min_coop_munic = NULL,
                                                           min_coop_reg_imediata = NULL,
                                                           min_coop_reg_intermediaria = 5,
                                                           min_coop_estado = NULL
)

df_TemerBolsonaro_filteredUF <- filtrar_cooperativas(df_TemerBolsonaro_filtrado,
                                                     min_coop_munic = NULL,
                                                     min_coop_reg_imediata = NULL,
                                                     min_coop_reg_intermediaria = NULL,
                                                     min_coop_estado = 5
)

rmarkdown::render("mod_GovUnidos.Rmd")

df_Dilma12 <- df_limpo[df_limpo$ANO %in% c(2011, 2012, 2013, 2014, 2015, 2016), ]

df_Dilma12_filteredMunic <- filtrar_cooperativas(df_Dilma12_filtrado,
                                                 min_coop_munic = 4,
                                                 min_coop_reg_imediata = NULL,
                                                 min_coop_reg_intermediaria = NULL,
                                                 min_coop_estado = NULL
)

df_Dilma12_filteredImed <- filtrar_cooperativas(df_Dilma12_filtrado,
                                                min_coop_munic = NULL,
                                                min_coop_reg_imediata = 5,
                                                min_coop_reg_intermediaria = NULL,
                                                min_coop_estado = NULL
)

df_Dilma12_filteredIntermed <- filtrar_cooperativas(df_Dilma12_filtrado,
                                                    min_coop_munic = NULL,
                                                    min_coop_reg_imediata = NULL,
                                                    min_coop_reg_intermediaria = 5,
                                                    min_coop_estado = NULL
)

df_Dilma12_filteredUF <- filtrar_cooperativas(df_Dilma12_filtrado,
                                              min_coop_munic = NULL,
                                              min_coop_reg_imediata = NULL,
                                              min_coop_reg_intermediaria = NULL,
                                              min_coop_estado = 5
)
rmarkdown::render("mod_GovUnidos.Rmd")


df_Lula12 <- df_limpo[df_limpo$ANO %in% c(2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010), ]

df_Lula12_filteredMunic <- filtrar_cooperativas(df_Lula12_filtrado,
                                                min_coop_munic = 5,
                                                min_coop_reg_imediata = NULL,
                                                min_coop_reg_intermediaria = NULL,
                                                min_coop_estado = NULL
)


df_Lula12_filteredImed <- filtrar_cooperativas(df_Lula12_filtrado,
                                               min_coop_munic = NULL,
                                               min_coop_reg_imediata = 5,
                                               min_coop_reg_intermediaria = NULL,
                                               min_coop_estado = NULL
)

df_Lula12_filteredIntermed <- filtrar_cooperativas(df_Lula12_filtrado,
                                                   min_coop_munic = NULL,
                                                   min_coop_reg_imediata = NULL,
                                                   min_coop_reg_intermediaria = 5,
                                                   min_coop_estado = NULL
)

df_Lula12_filteredUF <- filtrar_cooperativas(df_Lula12_filtrado,
                                             min_coop_munic = NULL,
                                             min_coop_reg_imediata = NULL,
                                             min_coop_reg_intermediaria = NULL,
                                             min_coop_estado = 5
)

rmarkdown::render("mod_GovernosUnidos.Rmd")

df_FHC12 <- df_limpo[df_limpo$ANO %in% c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002), ]

df_FHC12_filteredMunic <- filtrar_cooperativas(df_FHC12_filtrado,
                                               min_coop_munic = 3,
                                               min_coop_reg_imediata = NULL,
                                               min_coop_reg_intermediaria = NULL,
                                               min_coop_estado = NULL
)

df_FHC12_filteredImed <- filtrar_cooperativas(df_FHC12_filtrado,
                                              min_coop_munic = NULL,
                                              min_coop_reg_imediata = 4,
                                              min_coop_reg_intermediaria = NULL,
                                              min_coop_estado = NULL
)

df_FHC12_filteredIntermed <- filtrar_cooperativas(df_FHC12_filtrado,
                                                  min_coop_munic = NULL,
                                                  min_coop_reg_imediata = NULL,
                                                  min_coop_reg_intermediaria = 5,
                                                  min_coop_estado = NULL
)

df_FHC12_filteredUF <- filtrar_cooperativas(df_FHC12_filtrado,
                                            min_coop_munic = NULL,
                                            min_coop_reg_imediata = NULL,
                                            min_coop_reg_intermediaria = NULL,
                                            min_coop_estado = 5
)

rmarkdown::render("mod_GovUnidos.Rmd")
save.image("c:/Aula3/docs/novo_08_10_24_.RData")
#load("c:/Aula3/docs/novo_09_10_24_.RData")

rmarkdown::render("Resultados.Rmd")
rmarkdown::render("ResultadosComp.Rmd")


save.image("c:/Aula3/docs/novo1_09_10_24_.RData")


# Instalar o pacote networkD3
install.packages("ggraph")

# Carregar o pacote
library(networkD3)


# Definir os nós
nodes <- data.frame(name = c("FHC12", "Lula12", "Dilma12", "TemerBolsonaro", 
                             "Município", "Região Imediata", "Região Intermediária", "Estado"))

# Definir as conexões entre as janelas temporais e as subjanelas (índices correspondem ao vetor de nós)
links <- data.frame(source = c(0, 0, 0, 0,  # FHC12 conectado às 4 subjanelas
                               1, 1, 1, 1,  # Lula12 conectado às 4 subjanelas
                               2, 2, 2, 2,  # Dilma12 conectado às 4 subjanelas
                               3, 3, 3, 3), # TemerBolsonaro conectado às 4 subjanelas
                    target = c(4, 5, 6, 7,  # Subjanelas de FHC12
                               4, 5, 6, 7,  # Subjanelas de Lula12
                               4, 5, 6, 7,  # Subjanelas de Dilma12
                               4, 5, 6, 7), # Subjanelas de TemerBolsonaro
                    value = c(1, 1, 1, 1,   # Valor (peso) das conexões
                              1, 1, 1, 1,
                              1, 1, 1, 1,
                              1, 1, 1, 1))

# Criar o gráfico Sankey
sankeyNetwork(Links = links, Nodes = nodes, 
              Source = "source", Target = "target", 
              Value = "value", NodeID = "name", 
              fontSize = 12, nodeWidth = 30)

library(igraph)
library(ggraph)

# Definir os nós (janelas e subjanelas)
nodes <- data.frame(name = c("FHC12", "Lula12", "Dilma12", "TemerBolsonaro", 
                             "Município", "Região Imediata", "Região Intermediária", "Estado"),
                    type = c(TRUE, TRUE, TRUE, TRUE, 
                             FALSE, FALSE, FALSE, FALSE)) # TRUE para janelas, FALSE para subjanelas

# Definir as conexões (arestas)
edges <- data.frame(from = c("FHC12", "FHC12", "FHC12", "FHC12",
                             "Lula12", "Lula12", "Lula12", "Lula12",
                             "Dilma12", "Dilma12", "Dilma12", "Dilma12",
                             "TemerBolsonaro", "TemerBolsonaro", "TemerBolsonaro", "TemerBolsonaro"),
                    to = c("Município", "Região Imediata", "Região Intermediária", "Estado",
                           "Município", "Região Imediata", "Região Intermediária", "Estado",
                           "Município", "Região Imediata", "Região Intermediária", "Estado",
                           "Município", "Região Imediata", "Região Intermediária", "Estado"))

# Criar o grafo bipartido
g <- graph_from_data_frame(edges, vertices = nodes, directed = FALSE)

# Definir cores para cada janela
janela_colors <- c("FHC12" = "lightgreen", "Lula12" = "lightblue", 
                   "Dilma12" = "lightcoral", "TemerBolsonaro" = "purple")

# Atribuir cores às arestas com base na janela (nó de origem)
edges$color <- janela_colors[edges$from]

# Definir o layout customizado para ter janelas na vertical e subjanelas na horizontal
layout <- create_layout(g, layout = "bipartite")
layout$x[layout$type == TRUE] <- -1  # Colocar as janelas no lado esquerdo (x = -1)
layout$y[layout$type == TRUE] <- seq(-1, 1, length.out = sum(layout$type))  # Colocar as janelas em diferentes posições no eixo Y

layout$x[layout$type == FALSE] <- 1  # Colocar as subjanelas no lado direito (x = 1)
layout$y[layout$type == FALSE] <- seq(-1, 1, length.out = sum(!layout$type))  # Colocar as subjanelas no eixo Y de forma equidistante

# Plotar o grafo com labels à esquerda e direita
ggraph(layout) + 
  geom_edge_link(aes(color = edges$color), width = 1) +  # Cor das arestas
  geom_node_point(size = 10, aes(color = ifelse(nodes$type, 'Janelas Temporais', 'Subjanelas'))) +  # Tamanho e cor dos nós
  geom_node_text(aes(label = name), vjust = 0.5, hjust = ifelse(nodes$type, 1.2, -0.2), size = 5) +  # Posição das labels
  scale_color_manual(values = c('Janelas Temporais' = 'black', 'Subjanelas' = 'gray')) +  # Cores das labels
  theme_void() + 
  labs(title = "Janelas Temporais e Subjanelas por Localização (Janelas na Vertical)")


# Criar o gráfico com layout customizado e cores personalizadas
ggraph(layout) +
  geom_edge_link(aes(edge_color = edges$color), show.legend = FALSE, edge_alpha = 0.8) +  # Arestas coloridas
  geom_node_point(aes(color = name), size = 8) +  # Cor diferente para cada janela
  geom_node_text(aes(label = name, hjust = ifelse(type, -0.2, 1.2)), size = 3) +  # Ajustar posição dos textos para a esquerda (janelas) e direita (subjanelas)
  scale_color_manual(name = "Janelas", values = c(janela_colors, "lightblue" = "skyblue", "purple" = "purple")) + # Paleta de cores
  theme_void() + 
  ggtitle("Janelas Temporais e Subjanelas de Localização") +
  theme(plot.title = element_text(hjust = 0.5))


##ARTIGO 3 ####
##até a linha 2976 ei marquei para testar outro codigo
# library(readxl)
IFDM_Emp_Renda <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Emprego_Renda.xlsx")
IFDM_Edu <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Educacao.xlsx")
# 
# 
df_Art3 <- df_limpo[df_limpo$ANO %in% c(2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016), ]
# #df_Art3Cluster <- df_limpo[df_limpo$ANO %in% c(2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022), ]
# 
# 
# #O dígito verificador é um mecanismo que ajuda a evitar erros na digitação ou transmissão do código.
# df_Art3$Cod_Munic <- substr(df_Art3$Cod_Munic, 1, nchar(df_Art3$Cod_Munic)-1)
# #df_Art3Cluster$Cod_Munic <- substr(df_Art3Cluster$Cod_Munic, 1, nchar(df_Art3Cluster$Cod_Munic)-1)
# 
# IFDM_Emp_Renda <- IFDM_Emp_Renda [ , -c(2,3,4)]
# IFDM_Edu <- IFDM_Edu[,-c(2,3,4)]
# # Transforma a coluna Código e id_municipio para o mesmo formato
# IFDM_Emp_Renda$Código <- as.character(IFDM_Emp_Renda$Código)
# IFDM_Edu$Código <- as.character(IFDM_Edu$Código)
# 
# library(dplyr)
# library(tidyr)
# library(readr)
# 
# library(dplyr)
# library(tidyr)
# library(readr)  # para parse_number()
# 
# # ==================================================
# # 1) Padronizar nomes das chaves
# # ==================================================
IFDM_Emp_Renda <- IFDM_Emp_Renda %>%
  rename(Cod_Munic = `Código`) %>%
  mutate(Cod_Munic = as.character(Cod_Munic))

IFDM_Edu <- IFDM_Edu %>%
  rename(Cod_Munic = `Código`) %>%
  mutate(Cod_Munic = as.character(Cod_Munic))

df_Art3 <- df_Art3 %>%
  mutate(Cod_Munic = as.character(Cod_Munic))
# 
# # ==================================================
# # 2) Padronizar colunas de anos para numeric
# # ==================================================
# IFDM_Emp_Renda_fix <- IFDM_Emp_Renda %>%
#   mutate(across(matches("^20\\d{2}$"), ~parse_number(as.character(.))))
# 
# IFDM_Edu_fix <- IFDM_Edu %>%
#   mutate(across(matches("^20\\d{2}$"), ~parse_number(as.character(.))))
# 
# # ==================================================
# # 3) Pivotar de largo para longo
# # ==================================================
# IFDM_Emp_Renda_long <- IFDM_Emp_Renda_fix %>%
#   pivot_longer(
#     cols = matches("^20\\d{2}$"),        # colunas que são anos
#     names_to = "ANO",
#     values_to = "IFDM_Emp_Renda"
#   ) %>%
#   mutate(ANO = as.integer(ANO)) %>%
#   distinct(Cod_Munic, ANO, .keep_all = TRUE)  # evita duplicatas
# 
# IFDM_Edu_long <- IFDM_Edu_fix %>%
#   pivot_longer(
#     cols = matches("^20\\d{2}$"),
#     names_to = "ANO",
#     values_to = "IFDM_Edu"
#   ) %>%
#   mutate(ANO = as.integer(ANO)) %>%
#   distinct(Cod_Munic, ANO, .keep_all = TRUE)
# 
# # ==================================================
# # 4) Fazer os merges no df_Art3
# # ==================================================
# df_Art3 <- df_Art3 %>%
#   mutate(ANO = as.integer(ANO)) %>%
#   left_join(IFDM_Emp_Renda_long, by = c("Cod_Munic", "ANO")) %>%
#   left_join(IFDM_Edu_long,       by = c("Cod_Munic", "ANO"))
# 
# 
# 
# # # Transformar IFDM_Emp_Renda de formato largo para longo
# # IFDM_Emp_Renda_long <- IFDM_Emp_Renda %>%
# #   pivot_longer(cols = starts_with("20"), names_to = "ANO", values_to = "IFDM_Emp_Renda") %>%
# #   mutate(ANO = as.integer(ANO), Cod_Munic = Código)  # Certificar que ANO está em formato numérico
# # 
# # IFDM_Emp_Renda_long <- IFDM_Emp_Renda_long %>%
# #   mutate(Cod_Munic = as.character(Cod_Munic))
# # 
# # df_Art3 <- df_Art3 %>%
# #   left_join(IFDM_Emp_Renda_long, by = c("Cod_Munic", "ANO"))
# # # Fazer o merge dos DataFrames
# # df_Art3 <- df_Art3 %>%
# #   left_join(IFDM_Emp_Renda_long, by = c("Cod_Munic", "ANO"))
# # 
# # # df_Art3Cluster <- df_Art3Cluster %>%
# # #   left_join(IFDM_Emp_Renda_long, by = c("Cod_Munic", "ANO"))
# # 
# # 
# # ################################
# # ################################
# # # PARECE DESNECESSARIO##########
# # #VAMOS VER NA SEQUENCIA########
# # IFDM_Edu <- IFDM_Edu %>%
# #   mutate(across(starts_with("20"), as.character))
# # # Transformar IFDM_Edu de formato largo para longo
# # IFDM_Edu_long <- IFDM_Edu %>%
# #   pivot_longer(cols = starts_with("20"), names_to = "ANO", values_to = "IFDM_Edu") %>%
# #   mutate(ANO = as.integer(ANO), Cod_Munic = Código)  # Certificar que ANO está em formato numérico
# # 
# # # Fazer o merge dos DataFrames com IFDM_Edu
# # df_Art3 <- df_Art3 %>%
# #   left_join(IFDM_Edu_long, by = c("Cod_Munic", "ANO"))
# # df_Art3Cluster <- df_Art3Cluster %>%
# #   left_join(IFDM_Edu_long, by = c("Cod_Munic", "ANO"))
# 
# #####################################################
# 
# ######20.09.2025
# #### carregando VAB
# 
# df_Art3 <- df_Art3 %>%
#   # Se houver as duas, elimina a duplicada
#   select(-any_of("Ano")) %>%    
#   mutate(
#     ANO = as.integer(ANO),
#     Cod_Munic = stringr::str_pad(as.character(Cod_Munic), width = 7, pad = "0")
#   )
# 
# library(readxl)
# VAB1 <- read_excel("C:/Aula3/DadosCoopBrasil/IBGE/PIB_dos_Municipios_2002-2009_NOVO.xls") %>%
#   select(Código, Ano, Pib_agro, Pib_ind, Pib_serv, Pib_outros, VAB) %>%
#   filter(Ano %in% 2005:2009)
# 
# #VAB1 <- VAB1 %>% select(1,7,33,35,37,39,41)
# #VAB1 <- VAB1[VAB1$Ano %in% c(2005,2006,2007,2008,2009), ]
# 
# 
# VAB2 <- read_excel("C:/Aula3/DadosCoopBrasil/IBGE/PIB_dos_Municipios_2010-2020_NOVO.xls") %>%
#   select(Código, Ano, Pib_agro, Pib_ind, Pib_serv, Pib_outros, VAB) %>%
#   filter(Ano %in% 2010:2016)
# 
# 
# # -----------------------------
# # 2) Padronização das chaves
# # -----------------------------
# prep_vab <- function(df) {
#   df %>%
#     mutate(
#       Código = substr(Código, 1, nchar(Código) - 1),  # remove dígito verificador do IBGE
#       Cod_Munic = as.character(Código),
#       ANO = as.integer(Ano)
#     ) %>%
#     select(Cod_Munic, ANO, Pib_agro, Pib_ind, Pib_serv, Pib_outros, VAB)
# }
# 
# VAB1 <- prep_vab(VAB1)
# VAB2 <- prep_vab(VAB2)
# 
# # -----------------------------
# # 3) Consolidar dados IBGE
# # -----------------------------
# VAB <- bind_rows(VAB1, VAB2) %>%
#   group_by(Cod_Munic, ANO) %>%
#   summarise(
#     Pib_agro   = mean(Pib_agro, na.rm = TRUE),
#     Pib_ind    = mean(Pib_ind, na.rm = TRUE),
#     Pib_serv   = mean(Pib_serv, na.rm = TRUE),
#     Pib_outros = mean(Pib_outros, na.rm = TRUE),
#     VAB        = mean(VAB, na.rm = TRUE),
#     .groups = "drop"
#   )
# 
# # -----------------------------
# # 4) Garantir consistência no df_Art3
# # -----------------------------
# df_Art3 <- df_Art3 %>%
#   mutate(Cod_Munic = as.character(Cod_Munic), ANO = as.integer(ANO))
# 
# # -----------------------------
# # 5) Join final
# # -----------------------------
# df_Art3 <- df_Art3 %>%
#   left_join(VAB, by = c("Cod_Munic", "ANO"))
# 


###NOVO TESTE AJUSTADO
###################### 21.09.2025

#save.image("c:/Aula3/docs/novo_21_09_25_.RData")
load("c:/Aula3/docs/novo_21_09_25_.RData")

# ============== PACOTES ==============
library(dplyr)
library(tidyr)
library(readr)
library(readxl)
library(stringr)

# ============== 0) BASE PRINCIPAL df_Art3 ==============
# NÃO corte Cod_Munic original; crie uma chave de 6 dígitos para JOIN
df_Art3 <- df_limpo %>%
  filter(ANO %in% 2014:2016) %>%
  mutate(
    Cod_Munic = as.character(Cod_Munic),     # mantém o 7-dígitos original
    Cod6      = substr(Cod_Munic, 1, 6),     # chave comum (sem DV)
    ANO       = as.integer(ANO)
  ) %>%
  select(-any_of("Ano"))                     # elimina eventual duplicata "Ano"

# ============== 1) IFDM (Emprego/Renda e Educação) ==============
IFDM_Emp_Renda <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Emprego_Renda.xlsx")
IFDM_Edu       <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Educacao.xlsx")

# Se houver colunas 2:4 extras, remova:
IFDM_Emp_Renda <- IFDM_Emp_Renda[, -c(2,3,4)]
IFDM_Edu       <- IFDM_Edu[,       -c(2,3,4)]

# Padroniza chaves: cria Cod6 (6 dígitos) e mantém nomes
IFDM_Emp_Renda <- IFDM_Emp_Renda %>%
  rename(Codigo6 = `Código`) %>%
  mutate(Codigo6 = as.character(Codigo6))    # já vem com 6 dígitos

IFDM_Edu <- IFDM_Edu %>%
  rename(Codigo6 = `Código`) %>%
  mutate(Codigo6 = as.character(Codigo6))

# Converte colunas de anos para número (robusto)
fix_anos <- function(df) {
  df %>%
    mutate(
      across(
        matches("^20\\d{2}$"),
        ~ .x |>
          as.character() |>
          na_if("*") |> na_if("-") |> na_if("NA") |>
          parse_number()
      )
    )
}

IFDM_Emp_Renda_fix <- fix_anos(IFDM_Emp_Renda)
IFDM_Edu_fix       <- fix_anos(IFDM_Edu)

# Pivotar para longo e gerar chave Cod6
IFDM_Emp_Renda_long <- IFDM_Emp_Renda_fix %>%
  pivot_longer(
    cols = matches("^20\\d{2}$"),
    names_to  = "ANO",
    values_to = "IFDM_Emp_Renda"
  ) %>%
  mutate(ANO = as.integer(ANO),
         Cod6 = as.character(Codigo6)) %>%
  distinct(Cod6, ANO, .keep_all = TRUE) %>%
  select(Cod6, ANO, IFDM_Emp_Renda)

IFDM_Edu_long <- IFDM_Edu_fix %>%
  pivot_longer(
    cols = matches("^20\\d{2}$"),
    names_to  = "ANO",
    values_to = "IFDM_Edu"
  ) %>%
  mutate(ANO = as.integer(ANO),
         Cod6 = as.character(Codigo6)) %>%
  distinct(Cod6, ANO, .keep_all = TRUE) %>%
  select(Cod6, ANO, IFDM_Edu)

# ============== 2) JUNTAR IFDM NO df_Art3 POR Cod6 + ANO ==============
df_Art3 <- df_Art3 %>%
  left_join(IFDM_Emp_Renda_long, by = c("Cod6","ANO")) %>%
  left_join(IFDM_Edu_long,       by = c("Cod6","ANO"))

message("Sem IFDM_Emp_Renda: ",
        nrow(df_Art3 %>% filter(is.na(IFDM_Emp_Renda))))
message("Sem IFDM_Edu: ",
        nrow(df_Art3 %>% filter(is.na(IFDM_Edu))))

# ============== 3) VAB (IBGE) ==============
VAB1 <- read_excel("C:/Aula3/DadosCoopBrasil/IBGE/PIB_dos_Municipios_2002-2009_NOVO.xls") %>%
  select(Código, Ano, Pib_agro, Pib_ind, Pib_serv, Pib_outros, VAB) %>%
  filter(Ano %in% 2005:2009)

VAB2 <- read_excel("C:/Aula3/DadosCoopBrasil/IBGE/PIB_dos_Municipios_2010-2020_NOVO.xls") %>%
  select(Código, Ano, Pib_agro, Pib_ind, Pib_serv, Pib_outros, VAB) %>%
  filter(Ano %in% 2010:2016)

# Os arquivos do IBGE costumam vir com 7 dígitos -> gere Cod6 removendo o DV
prep_vab <- function(df) {
  df %>%
    mutate(
      Cod7 = as.character(Código),
      Cod6 = substr(Cod7, 1, 6),    # remove o DV para bater com IFDM/df_Art3
      ANO  = as.integer(Ano)
    ) %>%
    select(Cod6, ANO, Pib_agro, Pib_ind, Pib_serv, Pib_outros, VAB)
}

VAB <- bind_rows(prep_vab(VAB1), prep_vab(VAB2)) %>%
  group_by(Cod6, ANO) %>%
  summarise(
    Pib_agro   = mean(Pib_agro,   na.rm = TRUE),
    Pib_ind    = mean(Pib_ind,    na.rm = TRUE),
    Pib_serv   = mean(Pib_serv,   na.rm = TRUE),
    Pib_outros = mean(Pib_outros, na.rm = TRUE),
    VAB        = mean(VAB,        na.rm = TRUE),
    .groups = "drop"
  )

# Diagnóstico de chaves antes do join
sem_match_vab <- df_Art3 %>%
  anti_join(VAB, by = c("Cod6","ANO")) %>%
  select(Cod_Munic, Cod6, ANO) %>%
  distinct()

message("Pares (Cod6, ANO) de df_Art3 sem match no VAB: ", nrow(sem_match_vab))
# print(head(sem_match_vab, 20))

# ============== 4) JOIN VAB NO df_Art3 POR Cod6 + ANO ==============
df_Art3 <- df_Art3 %>%
  left_join(VAB, by = c("Cod6","ANO"))

message("Observações com VAB = NA após join: ",
        nrow(df_Art3 %>% filter(is.na(VAB))))




# Testar soluções intermediárias 
#######################################
######################################
ks_test <- 4:6
res <- list()

for (k in ks_test) {
  fit <- pam(X_scaled, k)
  base_cluster[[paste0("Cluster_",k)]] <- fit$clustering
  
  centros <- base_cluster %>%
    group_by(!!sym(paste0("Cluster_",k))) %>%
    summarise(across(where(is.numeric), median, na.rm = TRUE), .groups="drop")
  
  res[[as.character(k)]] <- centros
}

# Exibir as medianas dos clusters para k=4,5,6
res[["4"]]
res[["5"]]
res[["6"]]


##################
#Matriz de correlação
#################
library(dplyr)
library(corrplot)

vars_cluster <- df_Art3 %>%
  group_by(Cod_Munic) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    sh_agro        = mean(Pib_agro / VAB, na.rm = TRUE),
    sh_ind         = mean(Pib_ind  / VAB, na.rm = TRUE),
    sh_serv        = mean(Pib_serv / VAB, na.rm = TRUE),
    sh_outros      = mean(Pib_outros / VAB, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  tidyr::drop_na()

M <- cor(vars_cluster[,-1], use = "pairwise.complete.obs")

corrplot(M, method = "color", addCoef.col = "black", number.cex=0.7,
         tl.col="black", tl.srt=45)


##Testes de associação estatística
cor.test(vars_cluster$IFDM_Emp_Renda, vars_cluster$IFDM_Edu)


pca <- prcomp(vars_cluster[,-1], scale. = TRUE)
summary(pca)




##############
#############DEFININDO OS CLUSTERS K

library(dplyr)
library(cluster)   # pam, clusGap
# opcional: install.packages("fpc")
# opcional: install.packages("ggplot2")

# 1) Construa a base de painel consolidada (média 2005–2016 por município)
#    Ajuste os nomes abaixo se os seus forem diferentes.
base_cluster <- df_Art3 %>%
  group_by(Cod_Munic) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    sh_agro        = mean(Pib_agro / VAB, na.rm = TRUE),
    sh_ind         = mean(Pib_ind  / VAB, na.rm = TRUE),
    sh_serv        = mean(Pib_serv / VAB, na.rm = TRUE),
    sh_outros      = mean(Pib_outros / VAB, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  tidyr::drop_na()

X <- base_cluster %>% select(IFDM_Emp_Renda, IFDM_Edu, sh_agro, sh_ind, sh_serv, sh_outros)
X_scaled <- scale(X)
rownames(X_scaled) <- base_cluster$Cod_Munic

# 2) Silhueta (PAM)
ks <- 2:8
sil <- sapply(ks, function(k) pam(X_scaled, k = k)$silinfo$avg.width)
silhouette_tbl <- data.frame(k = ks, silhueta = sil)
print(silhouette_tbl)
k_sil <- silhouette_tbl$k[which.max(silhouette_tbl$silhueta)]
cat("k sugerido pela Silhueta (PAM):", k_sil, "\n")

# 3) Gap Statistic (k-means)
set.seed(123)
gap <- clusGap(X_scaled, FUN = stats::kmeans, K.max = 10, B = 200)
print(gap, method = "firstSEmax")  # critério de Tibshirani
k_gap <- with(gap, maxSE(Tab[,"gap"], Tab[,"SE.sim"], method = "firstSEmax"))
cat("k sugerido pelo Gap Statistic:", k_gap, "\n")

# 4) Calinski–Harabasz (k-means) — usa pacote fpc se disponível
if (requireNamespace("fpc", quietly = TRUE)) {
  ch <- sapply(ks, function(k){
    cl <- stats::kmeans(X_scaled, centers = k, nstart = 25)
    fpc::calinhara(X_scaled, cl$cluster, cn = k)
  })
  ch_tbl <- data.frame(k = ks, calinski_harabasz = ch)
  print(ch_tbl)
  k_ch <- ch_tbl$k[which.max(ch_tbl$calinski_harabasz)]
  cat("k sugerido por Calinski–Harabasz:", k_ch, "\n")
} else {
  k_ch <- NA
  message("Pacote 'fpc' não encontrado — pulando Calinski–Harabasz. Se quiser, instale: install.packages('fpc')")
}

# 5) Resumo final
cat("\nResumo dos critérios:\n",
    "- Silhueta (PAM): ", k_sil, "\n",
    "- Gap Statistic  : ", k_gap, "\n",
    "- Calinski-Harab.: ", ifelse(is.na(k_ch), "não calculado", k_ch), "\n")

# 6) Escolha do k (regra prática: convergência de 2+ critérios)
k_escolhido <- as.integer(names(sort(table(na.omit(c(k_sil, k_gap, k_ch))), decreasing = TRUE)[1]))
cat("\n>>> k escolhido:", k_escolhido, "\n")

# 
# Resumo dos critérios:
#   - Silhueta (PAM):  2 
# - Gap Statistic  :  7 
# - Calinski-Harab.:  2 

######



install.packages("clusterCrit")
library(clusterCrit)
valores2 <- data.frame(k = ks_test, dunn = NA_real_, dbi = NA_real_, ch = NA_real_)

for (k in ks_test) {
  fit <- pam(X_scaled, k = k)
  cl  <- as.integer(fit$clustering)
  cri <- intCriteria(as.matrix(X_scaled), cl,
                     c("Dunn", "Davies_Bouldin", "Calinski_Harabasz"))
  valores2$dunn[valores2$k == k] <- cri$dunn
  valores2$dbi[valores2$k == k]  <- cri$davies_bouldin
  valores2$ch[valores2$k == k]   <- cri$calinski_harabasz
}
print(valores2)


### AGORA TESTAR AS VAR DE DESEMPENHO
library(dplyr)
library(ggplot2)
library(rstatix)  # para kruskal_test e dunn_test




# 1) Estatísticas descritivas
df_Art3 %>%
  group_by(Cluster) %>%
  summarise(
    ROA_mediana  = median(ROA, na.rm = TRUE),
    CPLA_mediana = median(CPLA, na.rm = TRUE),
    Ativos_mediana = median(Ativos_Totais, na.rm = TRUE),
    n = n()
  )


# 3) Testes de diferença (Kruskal-Wallis)
kruskal_test(df_Art3, ROA ~ Cluster)
kruskal_test(df_Art3, CPLA ~ Cluster)
kruskal_test(df_Art3, Ativos_Totais ~ Cluster)

# 4) Pós-hoc de Dunn (se Kruskal significativo)
dunn_test(df_Art3, ROA ~ Cluster, p.adjust.method = "bonferroni")
dunn_test(df_Art3, CPLA ~ Cluster, p.adjust.method = "bonferroni")
dunn_test(df_Art3, Ativos_Totais ~ Cluster, p.adjust.method = "bonferroni")



df_Art3 <- df_Art3 %>%
  mutate(
    VAB_pos   = if_else(!is.na(VAB) & VAB > 0, VAB, NA_real_),
    sh_agro   = Pib_agro   / VAB_pos,
    sh_ind    = Pib_ind    / VAB_pos,
    sh_serv   = Pib_serv   / VAB_pos,
    sh_outros = Pib_outros / VAB_pos
  )



base_cluster <- df_Art3 %>%
  group_by(Cod_Munic) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    sh_agro        = mean(sh_agro,        na.rm = TRUE),
    sh_ind         = mean(sh_ind,         na.rm = TRUE),
    sh_serv        = mean(sh_serv,        na.rm = TRUE),
    sh_outros      = mean(sh_outros,      na.rm = TRUE),
    .groups = "drop"
  ) %>%
  drop_na()  # remove linhas com NA nas variáveis de cluster


# matriz padronizada
X <- base_cluster %>% select(IFDM_Emp_Renda, IFDM_Edu, sh_agro, sh_ind, sh_serv, sh_outros)
X_scaled <- scale(X)
rownames(X_scaled) <- base_cluster$Cod_Munic

# k principal (ex.: 4)
k_main <- 4
pam_fit <- pam(X_scaled, k = k_main)

# anexar rótulo de cluster ao data frame consolidado
base_cluster <- base_cluster %>%
  mutate(Cluster = factor(pam_fit$clustering))
table(base_cluster$Cluster)  # tamanhos dos clusters (checagem)


k_alt <- 5
pam_fit5 <- pam(X_scaled, k = k_alt)
base_cluster <- base_cluster %>%
  mutate(Cluster5 = factor(pam_fit5$clustering))
table(base_cluster$Cluster5) 

df_Art3 <- df_Art3 %>%
  select(-any_of("Cluster")) %>%   # remove se existir lixo de execuções anteriores
  left_join(base_cluster %>% select(Cod_Munic, Cluster), by = "Cod_Munic")



# Juntar os dataframes usando CNPJ e ANO como chaves
df_Art3_4 <- merge(df_Art3, df_preparado[, c("CNPJ", "ANO", "ATIVOS", "ROA", "CPLA")], 
                 by = c("CNPJ", "ANO"), 
                 all.x = TRUE)

# Verificar o resultado
head(df_Art3_4)



# Testes não-paramétricos (Kruskal–Wallis)
kw_roa  <- kruskal_test(df_Art3_4, ROA  ~ Cluster)
kw_cpla <- kruskal_test(df_Art3_4, CPLA ~ Cluster)
kw_at   <- kruskal_test(df_Art3_4, ATIVOS ~ Cluster)
kw_roa; kw_cpla; kw_at

# Pós-hoc de Dunn (se KW for significativo)
dunn_roa  <- dunn_test(df_Art3_4, ROA  ~ Cluster, p.adjust.method = "bonferroni")
dunn_cpla <- dunn_test(df_Art3_4, CPLA ~ Cluster, p.adjust.method = "bonferroni")
dunn_at   <- dunn_test(df_Art3_4, ATIVOS ~ Cluster, p.adjust.method = "bonferroni")
dunn_roa; dunn_cpla; dunn_at

library(ggplot2)

# ROA por Cluster
ggplot(df_Art3_4, aes(x = Cluster, y = ROA, fill = Cluster)) +
  geom_boxplot() +
  theme_minimal(base_size = 13) +
  labs(
    title = "Distribuição do ROA por Cluster",
    x = "Clusters",
    y = "Retorno sobre Ativos (ROA)",
    fill = "Cluster"
  )

# CPLA por Cluster
ggplot(df_Art3_4, aes(x = Cluster, y = CPLA, fill = Cluster)) +
  geom_boxplot() +
  theme_minimal(base_size = 13) +
  labs(
    title = "Distribuição do CPLA por Cluster",
    x = "Clusters",
    y = "Capital Próprio Líquido Ajustado (CPLA)",
    fill = "Cluster"
  )

# ATIVOS por Cluster
ggplot(df_Art3_4, aes(x = Cluster, y = ATIVOS, fill = Cluster)) +
  geom_boxplot() +
  theme_minimal(base_size = 13) +
  labs(
    title = "Distribuição dos Ativos Totais por Cluster",
    x = "Clusters",
    y = "Ativos Totais (R$)",
    fill = "Cluster"
  )



# CORREALCAO entre var de desempenho
M_desempenho <- cor(df_Art3_4[, c("ROA", "CPLA", "ATIVOS")], use = "pairwise.complete.obs")
print(round(M_desempenho, 2))


# Supondo df_Art3_4 com todas as variáveis
vars_completas <- c("ROA", "CPLA", "ATIVOS", "IFDM_Emp_Renda", "IFDM_Edu", "sh_agro", "sh_ind", "sh_serv", "sh_outros")
M_cruzada <- cor(df_Art3_4[, vars_completas], use = "pairwise.complete.obs")
print(round(M_cruzada, 2))


#Tabela de resumo (medianas e médias por cluster)
df_Art3_4 %>%
  group_by(Cluster) %>%
  summarise(
    ROA_mediana = median(ROA, na.rm = TRUE),
    ROA_media   = mean(ROA, na.rm = TRUE),
    CPLA_mediana = median(CPLA, na.rm = TRUE),
    CPLA_media   = mean(CPLA, na.rm = TRUE),
    AT_mediana   = median(ATIVOS, na.rm = TRUE),
    AT_media     = mean(ATIVOS, na.rm = TRUE),
    n = n()
  )

save.image("c:/Aula3/docs/novo_22_09_25_.RData")


vars_agrup <- c("IFDM_Emp_Renda","IFDM_Edu","sh_agro","sh_ind","sh_serv","sh_outros")
vars_perf  <- c("ROA","CPLA","ATIVOS")

t_resumo <- df_Art3_4 %>%
  group_by(Cluster) %>%
  summarise(
    across(all_of(c(vars_agrup, vars_perf)),
           list(med = ~median(.x, na.rm = TRUE),
                iqr = ~IQR(.x, na.rm = TRUE),
                mean = ~mean(.x, na.rm = TRUE),
                sd = ~sd(.x, na.rm = TRUE)),
           .names = "{.col}_{.fn}"),
    n = n(),
    .groups = "drop"
  )

t_resumo
write.csv(t_resumo, "c:/aula3/tabela_resumo_clusters.csv", row.names = FALSE)



###NOVO TESTE DA PARTE ACIMA 22.09.2025
############################

library(dplyr)
library(cluster)  # Para PAM e silhueta
library(factoextra)  # Para visualização de clusters
library(ggplot2)  # Para gráficos

# Definir variáveis de agrupamento e performance
vars_agrup <- c("IFDM_Emp_Renda", "IFDM_Edu", "sh_agro", "sh_ind", "sh_serv", "sh_outros")
vars_perf <- c("ROA", "CPLA", "ATIVOS")

# Criar resumo estatístico
t_resumo <- df_Art3_4 %>%
  group_by(Cluster) %>%
  summarise(
    across(all_of(c(vars_agrup, vars_perf)),
           list(med = ~median(.x, na.rm = TRUE),
                iqr = ~IQR(.x, na.rm = TRUE),
                mean = ~mean(.x, na.rm = TRUE),
                sd = ~sd(.x, na.rm = TRUE)),
           .names = "{.col}_{.fn}"),
    n = n(),
    .groups = "drop"
  )

# Verificar dados ausentes antes da análise
print("Proporção de NA por variável:")
print(colMeans(is.na(df_Art3_4[, c(vars_agrup, vars_perf)])))

# Adicionar validação de clusters (se já tiver clusters calculados com PAM)
if ("clustering" %in% names(df_Art3_4)) {
  X_scaled <- scale(df_Art3_4[, vars_agrup])  # Padronizar variáveis de agrupamento
  dist_matrix <- dist(X_scaled)
  sil <- cluster::silhouette(df_Art3_4$Cluster, dist_matrix)
  print("Média da Silhueta por Cluster:")
  print(aggregate(sil[, 3], by = list(df_Art3_4$Cluster), FUN = mean))
}

# Identificar outliers (ex.: usando IQR para ATIVOS)
for (var in c("ATIVOS")) {
  Q1 <- quantile(df_Art3_4[[var]], 0.25, na.rm = TRUE)
  Q3 <- quantile(df_Art3_4[[var]], 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  outliers <- df_Art3_4[df_Art3_4[[var]] < lower_bound | df_Art3_4[[var]] > upper_bound, ]
  print(paste("Outliers em", var, ":"))
  print(nrow(outliers))
}

# Visualização: Boxplot de ROA por Cluster
ggplot(t_resumo, aes(x = factor(Cluster), y = ROA_med)) +
  geom_boxplot() +
  labs(title = "Mediana de ROA por Cluster", x = "Cluster", y = "ROA") +
  theme_minimal()

# Salvar resumo para inspeção
write.csv(t_resumo, "c:/Aula3/tabela_resumo_clusters_melhorada.csv", row.names = FALSE)

# Exibir resumo
print(t_resumo)



# ###DEEP SEEk PARA RESOLVER PROBLEMA DE SALVAR E CARREGAR AS VARIAVEIS DO SISTEMA
# 
# # 1. Identifique o objeto problemático
which(sapply(ls(), function(x) inherits(get(x), "kccaFamily")))

# 2. Salve excluindo esse objeto
objetos_salvar <- ls()
objetos_problematicos <- objetos_salvar[sapply(objetos_salvar,
                                               function(x) inherits(get(x), "kccaFamily"))]
# 
# save(list = setdiff(objetos_salvar, objetos_problematicos), 
#      file = "c:/Aula3/docs/teste.RData")

#save.image("c:/Aula3/docs/novo_27_09_25_.RData") problema
load("c:/Aula3/docs/novo_22_09_25_.RData")

save.image("c:/Aula3/docs/novo_29_09_25_.RData")


#########TESTAR COM 5 CLUTERS
# construir base cross-section (médias 2005–2016) para cluster
base_cluster <- df_Art3_4 %>%
  group_by(Cod_Munic) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    sh_agro        = mean(sh_agro,        na.rm = TRUE),
    sh_ind         = mean(sh_ind,         na.rm = TRUE),
    sh_serv        = mean(sh_serv,        na.rm = TRUE),
    sh_outros      = mean(sh_outros,      na.rm = TRUE),
    .groups = "drop"
  ) %>%
  drop_na()

X <- base_cluster %>% select(IFDM_Emp_Renda, IFDM_Edu, sh_agro, sh_ind, sh_serv, sh_outros)
X_scaled <- scale(X); rownames(X_scaled) <- base_cluster$Cod_Munic

set.seed(123)
pam5 <- pam(X_scaled, k = 5)

df_Art3_4 <- df_Art3_4 %>%
  select(-any_of("Cluster5")) %>%
  left_join(
    base_cluster %>% transmute(Cod_Munic, Cluster5 = factor(pam5$clustering)),
    by = "Cod_Munic"
  )

# Testar diferenças de desempenho também para k=5
kw_roa_5  <- kruskal_test(df_Art3_4, ROA    ~ Cluster5)
kw_cpla_5 <- kruskal_test(df_Art3_4, CPLA   ~ Cluster5)
kw_at_5   <- kruskal_test(df_Art3_4, ATIVOS ~ Cluster5)

kw_roa_5; kw_cpla_5; kw_at_5

#Rodar Dunn test para os 5 clusters
dunn_roa_5  <- dunn_test(df_Art3_4, ROA ~ Cluster5, p.adjust.method = "bonferroni")
dunn_cpla_5 <- dunn_test(df_Art3_4, CPLA ~ Cluster5, p.adjust.method = "bonferroni")
dunn_at_5   <- dunn_test(df_Art3_4, ATIVOS ~ Cluster5, p.adjust.method = "bonferroni")

dunn_roa_5; dunn_cpla_5; dunn_at_5



df_Art3_4 %>%
  group_by(Cluster5) %>%
  summarise(
    ROA_mediana = median(ROA, na.rm = TRUE),
    CPLA_mediana = median(CPLA, na.rm = TRUE),
    ATIVOS_mediana = median(ATIVOS, na.rm = TRUE),
    n = n()
  )


library(dplyr)

# 1) Tabela de resumo (medianas e médias por cluster5)
tabela_clusters5 <- df_Art3_4 %>%
  group_by(Cluster5) %>%
  summarise(
    ROA_mediana   = median(ROA, na.rm = TRUE),
    ROA_media     = mean(ROA, na.rm = TRUE),
    CPLA_mediana  = median(CPLA, na.rm = TRUE),
    CPLA_media    = mean(CPLA, na.rm = TRUE),
    ATIVOS_mediana= median(ATIVOS, na.rm = TRUE),
    ATIVOS_media  = mean(ATIVOS, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )

tabela_clusters5
write.csv(tabela_clusters5, "c:/Aula3/tabela_clusters5.csv", row.names = FALSE)


# Criar um resumo com os resultados de Dunn (já rodados)
interpretar_dunn <- function(dunn_df, var){
  dunn_df %>%
    select(group1, group2, p.adj.signif) %>%
    mutate(variavel = var)
}

resumo_dunn <- bind_rows(
  interpretar_dunn(dunn_roa_5,  "ROA"),
  interpretar_dunn(dunn_cpla_5, "CPLA"),
  interpretar_dunn(dunn_at_5,   "ATIVOS")
)

# Visualizar
resumo_dunn
write.csv(resumo_dunn, "c:/Aula3/comparacoes_dunn_clusters5.csv", row.names = FALSE)


######REFAZENDO COM ATIVOS log z
####################################
#####################################
#####22.09.25

df_Art3_5 <- df_Art3_4 %>%
  mutate(ATIVOS_log_z = scale(log(ATIVOS + 1)))

#Resumo descritivo (usando Ativos padronizados)
df_Art3_5 %>%
  group_by(Cluster) %>%
  summarise(
    ROA_mediana   = median(ROA, na.rm = TRUE),
    CPLA_mediana  = median(CPLA, na.rm = TRUE),
    ATIVOS_mediana = median(ATIVOS_log_z, na.rm = TRUE),
    n = n()
  )


#Testes de diferenças (Kruskal–Wallis e Dunn)
library(rstatix)
# Kruskal–Wallis
kw_roa  <- df_Art3_5 %>% kruskal_test(ROA ~ Cluster)
kw_cpla <- df_Art3_5 %>% kruskal_test(CPLA ~ Cluster)
kw_at   <- df_Art3_5 %>% kruskal_test(ATIVOS_log_z ~ Cluster)

kw_roa
kw_cpla
kw_at

# Testes post-hoc
dunn_roa  <- df_Art3_5 %>% dunn_test(ROA ~ Cluster, p.adjust.method = "bonferroni")
dunn_cpla <- df_Art3_5 %>% dunn_test(CPLA ~ Cluster, p.adjust.method = "bonferroni")
dunn_at   <- df_Art3_5 %>% dunn_test(ATIVOS_log_z ~ Cluster, p.adjust.method = "bonferroni")

dunn_roa
dunn_cpla
dunn_at

ggplot(df_Art3_5, aes(x = as.factor(Cluster), y = ATIVOS_log_z)) +
  geom_boxplot(fill = "salmon") +
  labs(title = "Distribuição dos Ativos (padronizados) por Cluster",
       x = "Cluster", y = "Ativos (log + z-score)")




library(dplyr)
library(tidyr)
library(readr)

# garanta que Cluster é fator
df_Art3_5 <- df_Art3_5 %>% mutate(Cluster = as.factor(Cluster))

# ----- listas de variáveis -----
vars_drivers <- c("IFDM_Emp_Renda","IFDM_Edu","sh_agro","sh_ind","sh_serv","sh_outros")
vars_perf    <- c("ROA","CPLA","ATIVOS_log_z")   # análises com Ativos padronizados
vars_perf_exibir <- c("ROA","CPLA","ATIVOS")     # opcional: para leitura humana (se quiser mostrar Ativos originais)

# 1A) Perfil dos DRIVERS (socioeconômicos/estruturais)
perfil_drivers <- df_Art3_5 %>%
  group_by(Cluster) %>%
  summarise(
    across(all_of(vars_drivers),
           list(med = ~median(.x, na.rm = TRUE),
                iqr = ~IQR(.x, na.rm = TRUE),
                mean = ~mean(.x, na.rm = TRUE),
                sd   = ~sd(.x, na.rm = TRUE)),
           .names = "{.col}_{.fn}"),
    n = n(), .groups = "drop"
  ) %>%
  arrange(Cluster)

# 1B) Perfil de DESEMPENHO (usando Ativos padronizados)
perfil_perf_pad <- df_Art3_5 %>%
  group_by(Cluster) %>%
  summarise(
    across(all_of(vars_perf),
           list(med = ~median(.x, na.rm = TRUE),
                iqr = ~IQR(.x, na.rm = TRUE),
                mean = ~mean(.x, na.rm = TRUE),
                sd   = ~sd(.x, na.rm = TRUE)),
           .names = "{.col}_{.fn}"),
    n = n(), .groups = "drop"
  ) %>%
  arrange(Cluster)

# 1C) (Opcional) Tabela “para leitura” com Ativos em milhões (mais intuitivo no texto)
perfil_perf_legivel <- df_Art3_5 %>%
  group_by(Cluster) %>%
  summarise(
    ROA_med = median(ROA, na.rm = TRUE),
    CPLA_med = median(CPLA, na.rm = TRUE),
    ATIVOS_med_milhoes = median(ATIVOS, na.rm = TRUE)/1e6,
    n = n(), .groups = "drop"
  ) %>% arrange(Cluster)

# 1D) Exportar se quiser
write_csv(perfil_drivers, "c:/Aula3/perfil_clusters_drivers.csv")
write_csv(perfil_perf_pad, "c:/Aula3/perfil_clusters_desempenho_padronizado.csv")
# write_csv(perfil_perf_legivel, "perfil_clusters_desempenho_legivel.csv")

perfil_drivers
perfil_perf_pad
perfil_perf_legivel

library(scales)

# medianas dos drivers + desempenho padronizado
mat_med <- df_Art3_5 %>%
  group_by(Cluster) %>%
  summarise(
    across(c(all_of(vars_drivers), all_of(vars_perf)), ~median(.x, na.rm = TRUE)),
    .groups = "drop"
  )

# padroniza por coluna (z-score) só para visualização
mat_z <- mat_med %>%
  mutate(across(-Cluster, ~ as.numeric(scale(.x))))

# desenha de forma simples
print(mat_med)
print(mat_z)   # valores > 0 = acima da média da amostra; < 0 = abaixo

write_csv(mat_med, "c:/Aula3/mat_med.csv")
write_csv(mat_z, "c:/Aula3/mat_z.csv")

####TESTANDO OS MAPAS

library(geobr)
municipios <- read_municipality(year = 2016)  # ou 2022

mapa_clusters <- municipios %>%
  left_join(df_Art3_4 %>% select(Cod_Munic, Cluster), by = c("code_muni" = "Cod_Munic"))



# 📌 O que já foi feito:
#   
#   Seleção das variáveis de agrupamento (IFDM Emprego & Renda, IFDM Educação, PIB setorial).
# 
# Padronização e preparação do painel (2005–2016).
# 
# Definição do número de clusters (critérios estatísticos → 4 principal, 5 robustez).
# 
# Execução da análise de cluster (PAM) e geração dos grupos.
# 
# Validação interna (Silhueta, Gap, Calinski-Harabasz, Dunn, DBI).
# 
# Validação externa (Kruskal–Wallis e Dunn test nas variáveis de desempenho ROA, CPLA, ATIVOS).
# 
# Construção de tabelas descritivas (medianas, médias, tamanho dos grupos).
# 
# Gráficos comparativos (boxplots por cluster).



###29.09.25

# Se não tiver o ggplot2 instalado, rode: install.packages("ggplot2")
# Se quiser colocar os gráficos lado a lado, instale também o patchwork: install.packages("patchwork")

library(ggplot2)
library(patchwork)


# Crie o gráfico da variável original
grafico_antes <- ggplot(df_Art3_5, aes(x = ATIVOS)) +
  geom_histogram(bins = 50, fill = "#0072B2", alpha = 0.7) +
  labs(
    title = "Distribuição da Variável 'Ativos' (Original)",
    subtitle = "Observa-se forte assimetria positiva (cauda à direita)",
    x = "Total de Ativos",
    y = "Frequência"
  ) +
  theme_minimal()

# Exiba o gráfico
print(grafico_antes)

# Crie o gráfico da variável com transformação logarítmica
grafico_depois <- ggplot(df_Art3_5, aes(x = log(ATIVOS))) +
  geom_histogram(bins = 50, fill = "#009E73", alpha = 0.7) +
  labs(
    title = "Distribuição da Variável 'Ativos' (Após Log)",
    subtitle = "A distribuição se aproxima da simetria (normalidade)",
    x = "Log(Total de Ativos)",
    y = "Frequência"
  ) +
  theme_minimal()

# Exiba o gráfico
print(grafico_depois)

# Plota os dois gráficos um ao lado do outro para comparação direta
grafico_antes + grafico_depois


###RESULTADOS 39.09.25
####################################
####################################

# Certifique-se de que a biblioteca dplyr está carregada
library(dplyr)

# Código ATUALIZADO para gerar a tabela de medianas com o porte relativo
tabela_desempenho_final <- df_Art3_5 %>%
  group_by(Cluster) %>%
  summarise(
    `ROA (Mediana)` = median(ROA, na.rm = TRUE),
    `CPLA (Mediana)` = median(CPLA, na.rm = TRUE),
    `Porte Relativo [ATIVOS_log_z] (Mediana)` = median(ATIVOS_log_z, na.rm = TRUE)
  )

# Este comando irá imprimir a tabela com os resultados no seu console
print(tabela_desempenho_final)

library(writexl)
write_xlsx(tabela_desempenho_final, "c:/Aula3/docs/tabela_desempenho.xlsx")


save.image("c:/Aula3/docs/novo_29.1._09_25_.RData")



#####30.09

#RESULTADOS

# 2. Código para gerar a tabela de caracterização dos clusters
tabela_caracterizacao_clusters <- df_Art3_5 %>%
  group_by(Cluster) %>%
  summarise(
    `IFDM Emprego & Renda` = mean(IFDM_Emp_Renda, na.rm = TRUE),
    `IFDM Educação` = mean(IFDM_Edu, na.rm = TRUE),
    `Agro (%)` = mean(sh_agro, na.rm = TRUE) * 100,
    `Indústria (%)` = mean(sh_ind, na.rm = TRUE) * 100,
    `Serviços (%)` = mean(sh_serv, na.rm = TRUE) * 100,
    `Outros (%)` = mean(sh_outros, na.rm = TRUE) * 100,
    N = n() # Conta o número de observações (cooperativa-ano) em cada cluster
  )

# 3. Imprimir a tabela resultante no console
print(tabela_caracterizacao_clusters)


### TABELA QUANTIDADE OBSEVAOES

# 1. Carregar a biblioteca necessária
library(dplyr)

# (Assumindo que o dataframe 'dados_para_grafico' já existe no seu ambiente R)

# 2. Criar a tabela de observações por estado, agrupada por região
tabela_observacoes_estado <- dados_para_grafico %>%
  
  # Agrupa por região e estado
  group_by(name_region, abbrev_state) %>%
  
  # Soma as contagens de 'n' para obter o total por estado
  summarise(
    `Número de Observações` = sum(n)
  ) %>%
  
  # Desagrupa para as próximas operações
  ungroup() %>%
  
  # Ordena a tabela por região e, dentro de cada região, pelo número de observações
  arrange(name_region, desc(`Número de Observações`)) %>%
  
  # Renomeia as colunas para a apresentação final
  rename(
    Região = name_region,
    `Estado (UF)` = abbrev_state
  )

# 3. Imprimir a tabela resultante no console
print(tabela_observacoes_estado, n = 30) # n = 30 para garantir que todos os estados sejam mostrados

write_xlsx(tabela_observacoes_estado, "c:/Aula3/docs/tabela_observacoes_estado.xls")


##GERANDO MAPAS PARA ARTIGO 3 30.09.25

library(dplyr)

# Agregue seus dados para encontrar o cluster dominante por município
dados_para_mapa <- df_Art3_5 %>%
  count(Cod_Munic, Cluster) %>% # Assumindo que a coluna se chama 'code_muni'
  group_by(Cod_Munic) %>%
  filter(n == max(n)) %>%
  slice(1) # Em caso de empate, pega o primeiro

# Verifique o resultado
print(head(dados_para_mapa))


# Instale se necessário: install.packages("geobr")
library(geobr)

# Baixa os shapes de todos os municípios do Brasil para um ano de referência (ex: 2010)
municipios_br <- read_municipality(year = 2010)

dados_para_mapa <- rename(dados_para_mapa, code_muni = Cod_Munic)

municipios_br <- municipios_br %>%
  mutate(code_muni = as.character(code_muni))

# Une as duas tabelas pelo código do município
mapa_data <- left_join(municipios_br, dados_para_mapa, by = "code_muni")

municipios_br <- municipios_br %>%
  mutate(code_muni = as.character(code_muni))

# Filtra apenas os municípios que estão no seu dataset para o mapa ficar mais limpo
mapa_data_filtrado <- mapa_data %>%
  filter(!is.na(Cluster))



# Instale se necessário: install.packages("ggplot2"), install.packages("sf")
library(ggplot2)
library(sf)

# Garante que os nomes dos clusters fiquem na ordem e com os nomes que usamos no texto
mapa_data_filtrado$cluster_desc <- factor(mapa_data_filtrado$Cluster,
                                          levels = c(1, 2, 3, 4),
                                          labels = c("Cluster 1: Economia Mista",
                                                     "Cluster 2: Base Agropecuária",
                                                     "Cluster 3: Polos de Serviços",
                                                     "Cluster 4: Polos Industriais"))

# Gera o mapa
ggplot() +
  # Desenha o contorno de todos os municípios do Brasil em cinza claro ao fundo
  geom_sf(data = municipios_br, fill = "#f0f0f0", color = "white", size = 0.1) +
  
  # Desenha por cima apenas os municípios do seu estudo, coloridos pelo cluster
  geom_sf(data = mapa_data_filtrado, aes(fill = cluster_desc), color = "white", size = 0.1) +
  
  # Divide o gráfico em 4, um para cada cluster
  facet_wrap(~ cluster_desc) +
  
  # Remove eixos e melhora a aparência
  theme_void() +
  labs(
    title = "Distribuição Geográfica dos Clusters Socioeconômicos",
    fill = "Perfil do Cluster"
  ) +
  theme(
    legend.position = "none", # O título de cada faceta já serve como legenda
    strip.text = element_text(size = 10, face = "bold") # Ajusta o texto do título de cada mapa
  )


##MAPA DO PERFIL DOMINANTE DE CADA ESTADO

library(dplyr)
library(geobr)
library(ggplot2)
library(sf)

# 1. Obter a sigla do estado (UF) para cada município
# (O geobr já nos dá essa informação)
municipios_br <- read_municipality(year = 2010)

# 2. Juntar a informação de estado aos seus dados de cluster por município
dados_com_uf <- left_join(dados_para_mapa, select(municipios_br, code_muni, abbrev_state), by = "code_muni")

# 3. Calcular o cluster dominante (moda) para cada estado
clusters_por_estado <- dados_com_uf %>%
  filter(!is.na(abbrev_state)) %>%
  count(abbrev_state, Cluster) %>%
  group_by(abbrev_state) %>%
  filter(n == max(n)) %>%
  slice(1) # Pega o primeiro em caso de empate

# 4. Baixar o mapa dos estados
estados_br <- read_state(year = 2010)

# 5. Juntar os dados de cluster dominante ao mapa dos estados
mapa_estados_data <- left_join(estados_br, clusters_por_estado, by = "abbrev_state")

# 6. Adicionar os nomes descritivos dos clusters
mapa_estados_data$cluster_desc <- factor(mapa_estados_data$Cluster,
                                         levels = c(1, 2, 3, 4),
                                         labels = c("Economia Mista", "Base Agropecuária", "Polos de Serviços", "Polos Industriais"))

# 7. Gerar o mapa final
ggplot(data = mapa_estados_data) +
  geom_sf(aes(fill = cluster_desc), color = "white", size = 0.2) +
  geom_sf_text(aes(label = abbrev_state), size = 3, color = "black") + # Adiciona siglas
  scale_fill_viridis_d(option = "cividis", name = "Perfil Dominante") + # Paleta de cores
  labs(title = "Perfil Socioeconômico Dominante por Estado") +
  theme_void()



##NOVO

library(dplyr)
library(geobr)
library(ggplot2)
library(sf)

# 1. Obter a sigla do estado (UF) para cada município
municipios_br <- read_municipality(year = 2010)

# 2. Juntar a informação de estado aos seus dados de cluster por município
dados_com_uf <- left_join(dados_para_mapa, select(municipios_br, code_muni, abbrev_state), by = "code_muni")

# 3. Calcular o cluster dominante (moda) para cada estado
clusters_por_estado <- dados_com_uf %>%
  filter(!is.na(abbrev_state)) %>%
  count(abbrev_state, Cluster) %>%
  group_by(abbrev_state) %>%
  filter(n == max(n)) %>%
  slice(1)

# 4. Baixar o mapa dos estados
estados_br <- read_state(year = 2010)

# 5. Juntar os dados de cluster dominante ao mapa dos estados
mapa_estados_data <- left_join(estados_br, clusters_por_estado, by = "abbrev_state")

# ---- ALTERAÇÃO 1: Adicionar número do cluster nos labels ----
# 6. Adicionar os nomes descritivos dos clusters
mapa_estados_data$cluster_desc <- factor(mapa_estados_data$Cluster,
                                         levels = c(1, 2, 3, 4),
                                         labels = c("Cluster 1: Economia Mista",
                                                    "Cluster 2: Base Agropecuária",
                                                    "Cluster 3: Polos de Serviços",
                                                    "Cluster 4: Polos Industriais"))

# 7. Gerar o mapa final com os títulos e legendas ajustados
ggplot(data = mapa_estados_data) +
  geom_sf(aes(fill = cluster_desc), color = "white", size = 0.2) +
  geom_sf_text(aes(label = abbrev_state), size = 3, color = "black") +
  
  # ---- ALTERAÇÃO 2: Ajustar o nome da legenda ----
scale_fill_viridis_d(option = "cividis", name = "Cluster Dominante") +
  
  # ---- ALTERAÇÃO 3: Ajustar o título principal ----
labs(title = "Distribuição Geográfica do Cluster Dominante por Estado") +
  
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"), # Centraliza o título
    legend.title = element_text(face = "bold") # Deixa o título da legenda em negrito
  )



#### MAPA REGIONAL

# 1. Carregar as bibliotecas necessárias
library(dplyr)
library(geobr)
library(ggplot2)
library(sf) # Necessary for st_drop_geometry

# 2. Preparar os dados de referência (com a correção)

# Primeiro, crie uma tabela NÃO-ESPACIAL com os dados dos estados
estados_ref_attributes <- read_state(year = 2010) %>%
  st_drop_geometry() %>% # <-- A CORREÇÃO ESTÁ AQUI
  select(abbrev_state, name_region)

# Em seguida, carregue os dados dos municípios e junte a informação da região
# Este join agora é entre um objeto espacial (municípios) e um não-espacial (estados), o que funciona.
municipios_ref <- read_municipality(year = 2010) %>%
  select(code_muni, abbrev_state) %>%
  left_join(estados_ref_attributes, by = "abbrev_state") %>%
  mutate(code_muni = as.character(code_muni))


# 3. Calcular as porcentagens (este código permanece o mesmo)
dados_para_grafico <- df_Art3_5 %>%
  mutate(code_muni = as.character(code_muni)) %>%
  left_join(municipios_ref, by = "code_muni") %>%
  filter(!is.na(abbrev_state), !is.na(Cluster)) %>%
  count(name_region, abbrev_state, Cluster) %>%
  group_by(name_region, abbrev_state) %>%
  mutate(porcentagem = n / sum(n)) %>%
  ungroup() %>%
  mutate(cluster_desc = factor(Cluster,
                               levels = c(1, 2, 3, 4),
                               labels = c("1: Eco. Mista", "2: Agropecuária", "3: Serviços", "4: Industrial")))

# 4. Gerar o gráfico de barras empilhadas (este código permanece o mesmo)
ggplot(dados_para_grafico, aes(x = porcentagem, y = reorder(abbrev_state, abbrev_state, decreasing = TRUE), fill = cluster_desc)) +
  geom_col() +
  geom_text(aes(label = ifelse(porcentagem > 0.05, paste0(round(porcentagem * 100), "%"), "")),
            position = position_stack(vjust = 0.5),
            size = 3,
            color = "white") +
  facet_grid(name_region ~ ., scales = "free_y", space = "free_y") +
  scale_x_continuous(labels = scales::percent_format()) +
  labs(
    title = "Distribuição Percentual dos Clusters por Estado e Região",
    x = "Percentual de Observações no Estado",
    y = "Estado",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    strip.text.y = element_text(angle = 0, face = "bold"),
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, face = "bold")
  )

###NOVA VERSAO
library(dplyr)
library(geobr)
library(ggplot2)
library(sf)

# --- 1) Tabelas de referência (sem geometria) ---
estados_ref_attributes <- read_state(year = 2010) |>
  st_drop_geometry() |>
  select(abbrev_state, name_region)

municipios_ref <- read_municipality(year = 2010) |>
  st_drop_geometry() |>
  select(code_muni, abbrev_state) |>
  left_join(estados_ref_attributes, by = "abbrev_state") |>
  mutate(code_muni = as.character(code_muni))

# --- 2) (Opcional) Filtro de período se df_Art3_5 cobre 2005–2016 ---
# df_Art3_5 <- df_Art3_5 |> filter(Ano >= 2005, Ano <= 2016)

# --- 3) Cálculo das porcentagens por estado ---
dados_para_grafico <- df_Art3_5 |>
  mutate(code_muni = as.character(code_muni)) |>
  left_join(municipios_ref, by = "code_muni") |>
  filter(!is.na(abbrev_state), !is.na(Cluster)) |>
  count(name_region, abbrev_state, Cluster, name = "n") |>
  group_by(name_region, abbrev_state) |>
  mutate(porcentagem = n / sum(n)) |>
  ungroup() |>
  mutate(
    cluster_desc = factor(
      Cluster,
      levels = c(1, 2, 3, 4),
      labels = c("1: Eco. Mista", "2: Agropecuária", "3: Serviços", "4: Industrial")
    ),
    # ordena estados dentro de cada região (alfabético)
    abbrev_state = factor(
      abbrev_state,
      levels = dados_para_grafico |>
        distinct(name_region, abbrev_state) |>
        arrange(name_region, abbrev_state) |>
        pull(abbrev_state)
    )
  )

# --- 4) (Recomendado) Checagem: somatório=1 por estado ---
checagem <- dados_para_grafico |>
  group_by(name_region, abbrev_state) |>
  summarise(soma = sum(porcentagem), .groups = "drop")
# Expectativa: todas as 'soma' próximas de 1.0 (ex.: 0.9999–1.0001)

# --- 5) Gráfico ---
ggplot(
  dados_para_grafico,
  aes(x = porcentagem, y = abbrev_state, fill = cluster_desc)
) +
  geom_col() +
  geom_text(
    aes(label = ifelse(porcentagem >= 0.05, paste0(round(porcentagem * 100), "%"), "")),
    position = position_stack(vjust = 0.5),
    size = 3,
    color = "white"
  ) +
  facet_grid(name_region ~ ., scales = "free_y", space = "free_y") +
  scale_x_continuous(labels = scales::percent_format()) +
  labs(
    title = "Distribuição Percentual dos Clusters por Estado e Região (2005–2016)",
    x = "Percentual de Observações no Estado",
    y = "Estado",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    strip.text.y = element_text(angle = 0, face = "bold"),
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, face = "bold")
  )



tabela_estados_full <- df_Art3_5 %>%
  mutate(code_muni = as.character(code_muni)) %>%
  left_join(municipios_ref, by = "code_muni") %>%
  filter(!is.na(abbrev_state), !is.na(Cluster)) %>%
  mutate(Cluster = factor(Cluster, levels = 1:4, labels = rotulos)) %>%
  count(name_region, abbrev_state, Cluster, name = "N", .drop = FALSE) %>%
  group_by(name_region, abbrev_state) %>%
  mutate(Percentual = N / sum(N)) %>%
  ungroup() %>%
  arrange(name_region, abbrev_state, Cluster)

# Visualizar como tabela “longa”
kable(tabela_estados_full %>%
        mutate(Percentual = percent(Percentual, accuracy = 0.1)),
      caption = "Distribuição dos Clusters por Estado e Região (2005–2016)",
      align = c("l","l","l","r","r"))

# (Opcional) Pivot para formato “wide” (colunas=clusters)
tabela_estados_wide <- tabela_estados_full %>%
  select(name_region, abbrev_state, Cluster, Percentual) %>%
  mutate(Percentual = percent(Percentual, accuracy = 0.1)) %>%
  tidyr::pivot_wider(names_from = Cluster, values_from = Percentual)

kable(tabela_estados_wide,
      caption = "Distribuição Percentual por Estado (colunas = clusters)",
      align = "l")
write.csv(tabela_estados_wide, "c:/Aula3/tabela_estados_wide_2005_2016.csv", row.names = FALSE)
openxlsx::write.xlsx(tabela_estados_wide, "c:/Aula3/tabela_estados_wide_2005_2016.xlsx")

####MELHORANDO TABELA DISTRICCUICAO CLUSTERSS

tabela_estados_wide_pct <- tabela_estados_full %>%
  select(name_region, abbrev_state, Cluster, Percentual) %>%
  mutate(Cluster = paste0("C", Cluster, "_pct")) %>%          # C1_pct ... C4_pct
  pivot_wider(names_from = Cluster, values_from = Percentual)

tabela_estados_wide_obs <- tabela_estados_full %>%
  select(name_region, abbrev_state, Cluster, N) %>%
  mutate(Cluster = paste0("C", Cluster, "_n")) %>%            # C1_n ... C4_n
  pivot_wider(names_from = Cluster, values_from = N)

tabela_estados_wide3 <- tabela_estados_wide_pct %>%
  left_join(tabela_estados_wide_obs, by = c("name_region","abbrev_state")) %>%
  left_join(
    tabela_estados_full %>% group_by(name_region, abbrev_state) %>%
      summarise(Observacoes = sum(N), .groups="drop"),
    by = c("name_region","abbrev_state")
  )

openxlsx::write.xlsx(tabela_estados_wide3, "c:/Aula3/tabela_estados_wide_pct_n_2005_2016.xlsx")



###NOVA VERSAO 2

# --- Pacotes ---
library(dplyr)
library(geobr)
library(sf)
library(ggplot2)
library(scales)
library(tidyr)

# ============================================
# 1) Tabelas de referência (sem geometria)
# ============================================
estados_ref_attributes <- read_state(year = 2010) |>
  st_drop_geometry() |>
  select(abbrev_state, name_region)

municipios_ref <- read_municipality(year = 2010) |>
  st_drop_geometry() |>
  select(code_muni, abbrev_state) |>
  left_join(estados_ref_attributes, by = "abbrev_state") |>
  mutate(code_muni = as.character(code_muni))

# ============================================
# 2) Cálculo das porcentagens por UF e cluster
#    (ajuste os nomes das colunas de df_Art3_5 se necessário)
# ============================================
dados_para_grafico <- df_Art3_5 |>
  mutate(code_muni = as.character(code_muni)) |>
  left_join(municipios_ref, by = "code_muni") |>
  filter(!is.na(abbrev_state), !is.na(Cluster)) |>
  count(name_region, abbrev_state, Cluster, name = "n") |>
  group_by(name_region, abbrev_state) |>
  mutate(porcentagem = n / sum(n)) |>
  ungroup() |>
  mutate(
    cluster_desc = factor(
      Cluster,
      levels = c(1, 2, 3, 4),
      labels = c("1: Eco. Mista", "2: Agropecuária", "3: Serviços", "4: Industrial")
    )
  )

# (opcional) checagem: a soma por UF deve ser 1
checagem <- dados_para_grafico |>
  group_by(name_region, abbrev_state) |>
  summarise(soma = sum(porcentagem), .groups = "drop")
stopifnot(all(abs(checagem$soma - 1) < 1e-6))

# ============================================
# 3) Ordenação dos estados dentro de cada região (alfabética)
# ============================================
ordem_ufs <- dados_para_grafico |>
  distinct(name_region, abbrev_state) |>
  arrange(name_region, abbrev_state) |>
  pull(abbrev_state)

dados_plot <- dados_para_grafico |>
  mutate(abbrev_state = factor(abbrev_state, levels = ordem_ufs))

# ============================================
# 4) Gráfico de barras empilhadas
#    - rótulos com 1 casa decimal
#    - vírgula como separador decimal (padrão brasileiro)
# ============================================
p <- ggplot(dados_plot,
            aes(x = porcentagem,
                y = abbrev_state,
                fill = cluster_desc)) +
  geom_col() +
  geom_text(
    aes(label = ifelse(porcentagem >= 0.03,
                       scales::percent(porcentagem, accuracy = 0.1, decimal.mark = ","),
                       "")),
    position = position_stack(vjust = 0.5),
    size = 3,
    color = "white"
  ) +
  facet_grid(name_region ~ ., scales = "free_y", space = "free_y") +
  scale_x_continuous(labels = scales::percent_format(accuracy = 0.1, decimal.mark = ",")) +
  labs(
    title = "Distribuição Percentual dos Clusters por Estado e Região (2005–2016)",
    x = "Percentual de Observações no Estado",
    y = "Estado",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    strip.text.y = element_text(angle = 0, face = "bold"),
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, face = "bold")
  )

print(p)

# ============================================
# 5) Exportar em alta
# ============================================
ggsave("dist_clusters_estado_regiao_2005_2016.png", p, width = 10, height = 7, dpi = 300)
ggsave("dist_clusters_estado_regiao_2005_2016.pdf",  p, width = 10, height = 7)



#### PARA REGIOES SUL SUDESTE

library(dplyr)
library(tidyr)
library(geobr)
library(sf)
library(ggplot2)
library(scales)

# --- 1) Referências: município -> UF -> região (sem geometria) ---
estados_ref <- read_state(year = 2010) |>
  st_drop_geometry() |>
  select(abbrev_state, name_region)

municipios_ref <- read_municipality(year = 2010) |>
  st_drop_geometry() |>
  select(code_muni, abbrev_state) |>
  left_join(estados_ref, by = "abbrev_state") |>
  mutate(code_muni = as.character(code_muni))

# --- 2) Percentuais por UF e Cluster (apenas Sul/Sudeste) ---
tabela_uf <- df_Art3_5 |>
  mutate(code_muni = as.character(code_muni)) |>
  left_join(municipios_ref, by = "code_muni") |>
  filter(name_region %in% c("Sul","Sudeste"),
         !is.na(Cluster), !is.na(abbrev_state)) |>
  count(name_region, abbrev_state, Cluster, name = "N") |>
  group_by(name_region, abbrev_state) |>
  mutate(Percentual = N / sum(N)) |>
  ungroup()

rotulos <- c("1: Eco. Mista","2: Agropecuária","3: Serviços","4: Industrial")

dom_uf <- tabela_uf |>
  mutate(Cluster_dominante = factor(Cluster, levels = 1:4, labels = rotulos)) |>
  group_by(name_region, abbrev_state) |>
  slice_max(order_by = Percentual, n = 1, with_ties = FALSE) |>
  ungroup() |>
  transmute(name_region, abbrev_state, Cluster_dominante, Pct_dom = Percentual)

# --- 3) Shape dos ESTADOS (Sul/Sudeste) e JOIN -> estados_mapa ---
estados_sf <- read_state(year = 2010) |>
  filter(name_region %in% c("Sul","Sudeste")) |>
  select(abbrev_state, name_region)   # geometria é mantida automaticamente

estados_mapa <- estados_sf |>
  left_join(dom_uf, by = c("abbrev_state","name_region"))

# --- 3a) Diagnóstico de chaves (se nada casar, esta tabela NÃO fica vazia) ---
anti <- anti_join(estados_sf |> st_drop_geometry(),
                  dom_uf, by = c("abbrev_state","name_region"))
print(anti)          # Deve ficar vazio. Se não, tem UF/região sem match.

stopifnot("Cluster_dominante" %in% names(estados_mapa))  # garante coluna

# --- 4) Pontos de rótulo (faz em CRS projetado e volta) ---
estados_proj <- st_transform(estados_mapa, 3857)
label_points <- st_point_on_surface(estados_proj) |> st_transform(st_crs(estados_mapa))
labels_sf <- cbind(st_drop_geometry(estados_mapa), st_geometry(label_points))
st_geometry(labels_sf) <- "geometry"

# --- 5) Mapa (use estados_mapa, não estados_sf) ---
pal <- c("1: Eco. Mista"="#F8766D","2: Agropecuária"="#7CAE00",
         "3: Serviços"="#00BFC4","4: Industrial"="#C77CFF")

p <- ggplot() +
  geom_sf(data = estados_mapa, aes(fill = Cluster_dominante), color = "white", linewidth = 0.4) +
  geom_sf_text(data = labels_sf,
               aes(label = ifelse(!is.na(Pct_dom) & Pct_dom >= 0.15,
                                  paste0(abbrev_state, "\n", percent(Pct_dom, 0.1)),
                                  abbrev_state)),
               size = 3.2, fontface = "bold") +
  scale_fill_manual(values = pal, drop = FALSE, na.value = "grey85") +
  coord_sf(datum = NA) +
  facet_wrap(~ name_region, nrow = 1) +  # sem scales="free"
  labs(title = "Cluster dominante por estado – Regiões Sul e Sudeste (2005–2016)",
       subtitle = "Rótulo mostra UF e % do cluster dominante (quando ≥ 15%)",
       fill = "Cluster dominante",
       caption = "Fonte: IBGE via geobr (2010) e dados do estudo") +
  theme_minimal(base_size = 12) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position  = "bottom",
        plot.title = element_text(face = "bold", hjust = 0.5),
        strip.text = element_text(face = "bold"))

print(p)





df_Art3_5 %>% 
  group_by(Cluster) %>% 
  summarise(correlacao = cor(ROA, CPLA, use = "complete.obs"))



##### REFAZENDO SECAO 4.2 02.10.25

# ===================================================================
# PASSO 0: PREPARAÇÃO DO AMBIENTE
# ===================================================================

# Carregue as bibliotecas necessárias (rode install.packages se necessário)
library(dplyr)
library(rstatix)
library(ggplot2)

# ===================================================================
# PASSO PRELIMINAR: AJUSTE DO DATAFRAME
# ===================================================================

# Vamos renomear a coluna de Porte para um nome mais simples de usar
# E garantir que a coluna Cluster é um fator
df_analise <- df_Art3_5 %>%
  rename(Porte_Relativo = `ATIVOS_log_z`) %>%
  mutate(Cluster = factor(Cluster))


# ===================================================================
# PASSO 1: ANÁLISE DO ROA (EFICIÊNCIA)
# ===================================================================

# 1.1: Testes Estatísticos
teste_kw_roa <- df_analise %>% kruskal_test(ROA ~ Cluster)
teste_dunn_roa <- df_analise %>% dunn_test(ROA ~ Cluster, p.adjust.method = "bonferroni")

# 1.2: Visualização com Boxplot
boxplot_roa <- ggplot(df_analise, aes(x = Cluster, y = ROA, fill = Cluster)) +
  geom_boxplot(show.legend = FALSE) +
  labs(
    title = "Distribuição do ROA (Eficiência) por Cluster",
    x = "Cluster Socioeconômico",
    y = "ROA (Retorno sobre os Ativos)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# ===================================================================
# PASSO 2: ANÁLISE DO CPLA (CRESCIMENTO)
# ===================================================================

# 2.1: Testes Estatísticos
teste_kw_cpla <- df_analise %>% kruskal_test(CPLA ~ Cluster)
teste_dunn_cpla <- df_analise %>% dunn_test(CPLA ~ Cluster, p.adjust.method = "bonferroni")

# 2.2: Visualização com Boxplot
boxplot_cpla <- ggplot(df_analise, aes(x = Cluster, y = CPLA, fill = Cluster)) +
  geom_boxplot(show.legend = FALSE) +
  labs(
    title = "Distribuição do CPLA (Crescimento) por Cluster",
    x = "Cluster Socioeconômico",
    y = "CPLA (Crescimento do Patrimônio Líquido)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# ===================================================================
# PASSO 3: ANÁLISE DO PORTE RELATIVO
# ===================================================================

# 3.1: Testes Estatísticos
teste_kw_porte <- df_analise %>% kruskal_test(Porte_Relativo ~ Cluster)
teste_dunn_porte <- df_analise %>% dunn_test(Porte_Relativo ~ Cluster, p.adjust.method = "bonferroni")

# 3.2: Visualização com Boxplot
boxplot_porte <- ggplot(df_analise, aes(x = Cluster, y = Porte_Relativo, fill = Cluster)) +
  geom_boxplot(show.legend = FALSE) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  labs(
    title = "Distribuição do Porte Relativo por Cluster",
    x = "Cluster Socioeconômico",
    y = "Porte Relativo (ATIVOS_log_z)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# ===================================================================
# PASSO 4: EXIBIÇÃO DE TODOS OS RESULTADOS
# ===================================================================

# Exibir os resultados dos testes no console
print("--- RESULTADOS DOS TESTES PARA ROA ---")
print(teste_kw_roa)
print(teste_dunn_roa)

print("--- RESULTADOS DOS TESTES PARA CPLA ---")
print(teste_kw_cpla)
print(teste_dunn_cpla)

print("--- RESULTADOS DOS TESTES PARA PORTE ---")
print(teste_kw_porte)
print(teste_dunn_porte)

# Exibir os gráficos
print(boxplot_roa)
print(boxplot_cpla)
print(boxplot_porte)

# Gerar e exibir a tabela de resumo final (similar à sua Tabela 5)
tabela_resumo_final <- df_analise %>%
  group_by(Cluster) %>%
  summarise(
    N_Observacoes = n(),
    Mediana_ROA = median(ROA, na.rm = TRUE),
    Mediana_CPLA = median(CPLA, na.rm = TRUE),
    Mediana_Porte = median(Porte_Relativo, na.rm = TRUE)
  )

print("--- TABELA RESUMO FINAL DAS MEDIANAS ---")
print(tabela_resumo_final)





save.image("c:/Aula3/docs/novo_30_1_09_25_.RData")
load("c:/Aula3/docs/novo_30_1_09_25_.RData")

#VAB2 <- VAB2 %>% select(1,7,33,35,37,39,41)
#VAB2 <- VAB2[VAB2$Ano %in% c(2010,2011,2012,2013,2014,2015,2016), ]

#VAB3 <- read_excel("C:/Aula3/DadosCoopBrasil/IBGE/PIB_dos_Municipios_2010-2021.xlsx")
#VAB3 <- VAB3 %>% select(1,7,33,34,35,36,37)
#VAB3 <- VAB3[VAB3$Ano %in% c(2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021), ]


VAB <- bind_rows(VAB1, VAB2)
VAB$Código <- substr(VAB$Código, 1, nchar(VAB$Código)-1)

#VABNovo <- bind_rows(VAB1, VAB3)
#VABNovo$Código <- substr(VABNovo$Código, 1, nchar(VABNovo$Código)-1)


# Renomear a coluna Código para Cod_Munic, se necessário
VAB <- VAB %>%
  rename(Cod_Munic = Código, ANO = Ano)  # Ajustar nomes conforme necessário

#VABNovo <- VABNovo %>%
  rename(Cod_Munic = Código, ANO = Ano)  # Ajustar nomes conforme necessário

# Unir o VAB com df_Art3 com base em Cod_Munic e ANO
df_Art3 <- df_Art3 %>%
  left_join(VAB, by = c("Cod_Munic", "ANO"))

#df_Art3Cluster <- df_Art3Cluster %>%
  left_join(VABNovo, by = c("Cod_Munic", "ANO"))

########################
#######################
#VOU TESTAR SEM ADICIONAR ESSAS LINHAS 20/09/2025
###VOU para a linha 14590
df_Art3$IFDM_Emp_Renda <- as.factor(df_Art3$IFDM_Emp_Renda)
df_Art3$IFDM_Edu <- as.factor(df_Art3$IFDM_Edu)
df_Art3$VAB <- as.factor(df_Art3$VAB)

df_Art3Cluster$IFDM_Emp_Renda <- as.factor(df_Art3Cluster$IFDM_Emp_Renda)
df_Art3Cluster$IFDM_Edu <- as.factor(df_Art3Cluster$IFDM_Edu)
df_Art3Cluster$VAB <- as.factor(df_Art3Cluster$VAB)

###################################


# Verifica se há valores NA em cada coluna específica
sapply(df_Art3[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB", "Código.y")], function(x) sum(is.na(x)))
sapply(df_Art3Cluster[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB", "Código.y")], function(x) sum(is.na(x)))
df_Art3Cluster_limpo <- na.omit(df_Art3Cluster)



write.csv(df_Art3, "c:/Aula3/docsdf_Art3.csv", row.names = FALSE)
library()
modelo_ROA <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB + Ano + (1 | Localizacao_munic), data = df_Art3)
modelo_ROA <- lmer(SOBRAS_POR_ATIVO ~ + VAB + (1 | Localizacao_munic), data = df_Art3)

save.image("c:/Aula3/docs/novo_04_11_24_.RData")
load("c:/Aula3/novo_02_11_24_.RData")


df_sample <- df_Art3 %>% sample_frac(0.1)
modelo_amostra <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB + Ano + (1 | Localizacao_munic), 
                       data = df_sample)

print(modelo_amostra)
df_sample$IFDM_Emp_Renda <- as.factor(df_sample$IFDM_Emp_Renda)
df_sample$IFDM_Edu <- as.factor(df_sample$IFDM_Edu)
df_sample$VAB <- as.factor(df_sample$VAB)
cor(df_sample[c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])

sum(is.na(df_sample$IFDM_Edu))
df_sample <- df_sample[complete.cases(df_sample), ]



summary(modelo_amostra) -> sumario_modelo
write.csv(sumario_modelo, "c:/Aula3/docs/sumario_modelo.csv", row.names = FALSE)

# Extrair coeficientes fixos e salvar em CSV
library(lme4)

coeficientes_fixos2 <- fixef(modelo_amostra)
write.csv(as.data.frame(coeficientes_fixos2), "c:/Aula3/docs/coeficientes_fixos_modelo.csv", row.names = TRUE)

library(writexl)
write_xlsx(as.data.frame(coeficientes_fixos2), "c:/Aula3/docs/coeficientes_fixos_modelo.xlsx")

# Instalar e carregar o pacote
install.packages("broom.mixed")
library(broom.mixed)

# Salvar o resumo como data frame e exportar para CSV
resumo_df <- tidy(modelo_amostra)
write.csv(resumo_df, "c:/Aula3/docs/sumario_modelo.csv", row.names = FALSE)

# Resumo dos coeficientes fixos e aleatórios
tidy_fixed <- tidy(modelo_amostra, effects = "fixed")
tidy_random <- tidy(modelo_amostra, effects = "ran_pars")

# Estatísticas de ajuste
glance_stats <- glance(modelo_amostra)

# Ajustes e resíduos para cada observação
augment_results <- augment(modelo_amostra, data = df_sample)

##backup DF
df_Art3_Bk <- df_Art3 

df_Art3$IFDM_Emp_Renda <- as.numeric(df_Art3$IFDM_Emp_Renda)

df_Art3$IFDM_Emp_Renda <- round(df_Art3$IFDM_Emp_Renda, 2)
df_Art3$IFDM_Edu <- round(df_Art3$IFDM_Edu, 2)
df_Art3$VAB <- as.numeric(df_Art3$VAB)

df_Art3$VAB <- scale(df_Art3$VAB)

tempo_processamento3 <- system.time(
  modelo_amostra2 <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB + Ano + (1 | Localizacao_munic), 
                          data = df_Art3)
)

summary(modelo_amostra2)
fixef(modelo_amostra2)
efeito_aleatorio_ROA <- ranef(modelo_amostra2)
plot(modelo_amostra2)
sink("resumo_modelo.txt")
print(summary(modelo_amostra2))
sink()

######14/11

modelo_amostra2 <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB +  (1 | Localizacao_munic), 
                        data = df_Art3_clean)

library(lme4)
library(ggplot2)
interceptos <- ranef(modelo_amostra2)$Localizacao_munic
interceptos_df <- data.frame(Localizacao_munic = rownames(interceptos), Intercepto = interceptos[,1])
interceptos_df <- merge(interceptos_df, df_Art3, by = "Localizacao_munic")

# Supondo que o dataframe interceptos_df tem as colunas 'Estado' e 'Intercepto'
ggplot(interceptos_df, aes(x = UF, y = Intercepto)) +
  geom_violin(trim = FALSE, fill = "lightblue", color = "black") +
  labs(title = "Distribuição dos Interceptos por Estado",
       x = "Estado",
       y = "Intercepto Aleatório (Localizacao_munic)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
######





# Extrai o data frame completo
df_efeito_aleatorio <- efeito_aleatorio_ROA$Localizacao_munic

# Filtra os valores positivos e negativos mantendo todas as colunas
# Criar data frames para valores positivos e negativos, mantendo todas as colunas
efeito_positivo <- df_efeito_aleatorio[df_efeito_aleatorio$`(Intercept)` > 0, , drop = FALSE]
efeito_negativo <- df_efeito_aleatorio[df_efeito_aleatorio$`(Intercept)` < 0, , drop = FALSE]

# Verifique os nomes das colunas
print("Nomes das colunas em efeito_positivo:")
print(names(efeito_positivo))

# Exemplo de uso da função novamente
criar_mapa_intercepto(df_efeito_aleatorio)

# Exibe os resultados
efeito_positivo
efeito_negativo
# Verifique os nomes das colunas no data frame
names(efeito_positivo)

# Carregar o script no ambiente
source("script_mapas.R")

# Agora você pode chamar a função
criar_mapa_intercepto(efeito_positivo)


library(tibble)

# Converter o índice para uma coluna no df_efeito_aleatorio
df_efeito_aleatorio <- df_efeito_aleatorio %>%
  rownames_to_column(var = "code_muni")

# Certifique-se de que a coluna code_muni esteja no mesmo formato que no mapa (numérico)
df_efeito_aleatorio$code_muni <- as.numeric(df_efeito_aleatorio$code_muni)

# Filtra os valores positivos e negativos mantendo todas as colunas
# Criar data frames para valores positivos e negativos, mantendo todas as colunas
efeito_positivo <- df_efeito_aleatorio[df_efeito_aleatorio$`(Intercept)` > 0, , drop = FALSE]
efeito_negativo <- df_efeito_aleatorio[df_efeito_aleatorio$`(Intercept)` < 0, , drop = FALSE]

criar_mapa_intercepto(efeito_positivo)

criar_mapa_dinamico(efeito_negativo)


# Exemplo de uso da função
criar_mapa_dinamico_personalizado(df_efeito_aleatorio)

save.image("c:/Aula3/docs/novo_06_11_24_.RData")
load("c:/Aula3/docs/novo_06_11_24_.RData")


criar_mapa_dinamico_fixo(df_efeito_aleatorio)

library(dplyr)
library(geobr)

# Carregar o mapa dos municípios, que contém o código dos estados
municipios <- read_municipality(year = 2020, showProgress = FALSE) %>%
  select(code_muni, code_state)  # Selecionar apenas as colunas de interesse

# Exibir as primeiras linhas para verificar
head(municipios)

# Suponha que df_efeito_aleatorio seja o seu data frame com o código do município
df_efeito_aleatorio2 <- df_efeito_aleatorio %>%
  left_join(municipios, by = c("code_muni" = "code_muni"))

library(leaflet) 
library(geobr)

criar_mapa_estado(df_efeito_aleatorio, codigo_estado = 41)
# SP? 35
# Paraná (PR): 41
# Santa Catarina (SC): 42
# Rio Grande do Sul (RS): 43
# Minas Gerais (MG): 31


resultado_contagem <- contar_municipios_por_estado(df_efeito_aleatorio)
print(resultado_contagem)

library(tidyr)

mapa_estatico_contagem(resultado_contagem)
# Exemplo de uso da função
mapa_estatico_contagem3(resultado_contagem)
library(lme4)
modelo_IFDM_Emp_Renda <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + (1 | Localizacao_munic), 
                        data = df_Art3)
modelo_IFDM_Edu <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Edu + (1 | Localizacao_munic), 
                        data = df_Art3)
modelo_VAB <- lmer(SOBRAS_POR_ATIVO ~ VAB + (1 | Localizacao_munic), 
                        data = df_Art3)
AIC(modelo_IFDM_Emp_Renda, modelo_IFDM_Edu, modelo_VAB)
BIC(modelo_IFDM_Emp_Renda, modelo_IFDM_Edu, modelo_VAB)

# Remover linhas com NAs nas variáveis de interesse
df_Art3_clean <- na.omit(df_Art3[, c("SOBRAS_POR_ATIVO", "IFDM_Emp_Renda", "IFDM_Edu", "VAB", "Localizacao_munic")])

# Rodar os modelos novamente usando o dataset limpo
modelo_IFDM_Emp_Renda <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + (1 | Localizacao_munic), data = df_Art3_clean)
modelo_IFDM_Edu <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Edu + (1 | Localizacao_munic), data = df_Art3_clean)
modelo_VAB <- lmer(SOBRAS_POR_ATIVO ~ VAB + (1 | Localizacao_munic), data = df_Art3_clean)


anova(modelo_amostra3, modelo_amostra4, modelo_amostra5)

plot(resid(modelo_amostraSEM_ANO), main = "Resíduos - Completa")
plot(resid(modelo_IFDM_Edu), main = "Resíduos - IFDM_Edu")
plot(resid(modelo_VAB), main = "Resíduos - VAB")

confint(modelo_amostra3)
confint(modelo_amostra4)
confint(modelo_amostra5)


modelo_amostraANO <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB + Ano + (1 | Localizacao_munic), 
                        data = df_Art3)

modelo_amostraSEM_ANO <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB + (1 | Localizacao_munic), 
                          data = df_Art3)

AIC(modelo_amostraANO, modelo_amostraSEM_ANO)
BIC(modelo_amostraANO, modelo_amostraSEM_ANO)

# Extraindo resíduos do modelo
residuos <- resid(modelo_amostraSEM_ANO)

# Valores ajustados pelo modelo
fitted_values <- fitted(modelo_amostraSEM_ANO)
hist(residuos, breaks = 30, main = "Histograma dos Resíduos", xlab = "Resíduos", ylab = "Frequência")
plot(fitted_values, residuos, 
     main = "Gráfico de Resíduos vs Valores Ajustados",
     xlab = "Valores Ajustados", 
     ylab = "Resíduos",
     pch = 20)
abline(h = 0, col = "red")
library(lme4)
residuos_padronizados <- residuals(modelo_amostraANO, type = "pearson")
plot(fitted_values, residuos_padronizados,
     main = "Gráfico de Resíduos Padronizados vs Valores Ajustados",
     xlab = "Valores Ajustados",
     ylab = "Resíduos Padronizados",
     pch = 20)
abline(h = 0, col = "red")
shapiro.test(residuos)
qqnorm(residuos, main = "QQ-Plot dos Resíduos")
qqline(residuos, col = "red")
ks.test(residuos, "pnorm", mean(residuos), sd(residuos))

#save.image("c:/Aula3/docs/novo_13_11_24_.RData")
#load("c:/Aula3/docs/novo_13_11_24_.RData")


teste <- remover_outliers_zscore(df_Art3, "SOBRAS_POR_ATIVO")

modelo_amostraSEM_ANO <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB + (1 | Localizacao_munic), 
                              data = teste$df_sem_outliers)
####################### 15/11
install.packages("influence.ME")
library(influence.ME)

# Assumindo que teste$df_sem_outliers está disponível
assign("teste$df_sem_outliers", teste$df_sem_outliers, envir = .GlobalEnv)


influence_model <- influence(modelo_amostraSEM_ANO, group = "Localizacao_munic")
plot(influence_model, which = "cook")
plot(influence_model, which = "cook", log = "x")

cooks_dist <- cooks.distance(influence_model)
influential_points <- which(cooks_dist > 0.1)
plot(cooks_dist, type = "h")
points(influential_points, cooks_dist[influential_points], col = "red", pch = 16)

library(lme4)
standardized_residuals <- resid(modelo_amostraSEM_ANO, type = "pearson")
plot(standardized_residuals)

# Ordenar os índices de maior para menor influência
influential_points <- order(cooks_dist, decreasing = TRUE)[1:4]  # Exibe os 10 pontos mais influentes
cooks_dist[influential_points]

View(teste$df_sem_outliers[influential_points, ])


################

# Salva o DataFrame em um arquivo CSV
write.csv(teste$df_sem_outliers, file = "df_sem_outliers.csv", row.names = FALSE)
getwd()

df_sem_outliers <- teste$df_sem_outliers

library(bestNormalize)
yj_trans <- yeojohnson(df_clean$SOBRAS_POR_ATIVO)
df_clean$SOBRAS_POR_ATIVO_yj <- yj_trans$x.t

yj_trans_vab <- yeojohnson(df_clean$VAB)
df_clean$VAB_yj <- yj_trans_vab$x.t

yj_trans_IFDM_Edu <- yeojohnson(df_clean$IFDM_Edu)
df_clean$IFDM_Edu_yj <- yj_trans_IFDM_Edu$x.t

yj_trans_IFDM_Emp_Renda <- yeojohnson(df_clean$IFDM_Emp_Renda)
df_clean$IFDM_Emp_Renda_yj <- yj_trans_IFDM_Emp_Renda$x.t

# Criação de um boxplot para a variável resposta
boxplot(df_clean$SOBRAS_POR_ATIVO,
        main = "Boxplot da Variável Resposta SOBRAS_POR_ATIVO",
        ylab = "SOBRAS_POR_ATIVO",
        col = "lightblue",
        border = "black")


# Exemplo de uso
df_clean <- remove_outliers_iqr(df_Art3, "SOBRAS_POR_ATIVO")
write.csv(df_Art3, "C:/Aula3/docs/df_Art3.csv", row.names = FALSE)

modelo_amostraSEM_ANO <- lmer(SOBRAS_POR_ATIVO_yj ~ IFDM_Emp_Renda_yj + IFDM_Edu_yj + VAB_yj + (1 | Localizacao_munic), 
                              data = df_clean)


residuos <- resid(modelo_robusto_lmm)

# Valores ajustados pelo modelo
fitted_values <- fitted(modelo_robusto_lmm)
hist(residuos, breaks = 30, main = "Histograma dos Resíduos", xlab = "Resíduos", ylab = "Frequência")
plot(fitted_values, residuos, 
     main = "Gráfico de Resíduos vs Valores Ajustados",
     xlab = "Valores Ajustados", 
     ylab = "Resíduos",
     pch = 20)
abline(h = 0, col = "red")

shapiro.test(residuos)
qqnorm(residuos, main = "QQ-Plot dos Resíduos")
qqline(residuos, col = "red")
ks.test(residuos, "pnorm", mean(residuos), sd(residuos))


library(MASS)
modelo_robusto <- rlm(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB, 
                      data = df_clean)

library(robustlmm)
modelo_robusto_lmm <- rlmer(SOBRAS_POR_ATIVO_yj ~ IFDM_Emp_Renda + IFDM_Edu + VAB + (1 | Localizacao_munic), 
                            data = df_clean)

save.image("c:/Aula3/docs/novo_18_11_24_.RData")
load("c:/Aula3/docs/novo_18_11_24_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")


# Dados das janelas (incluindo 2021 e 2022 na Janela Temer-Bolsonaro)

# Dados FHC-Lula
data_fhc <- data.frame(
  Ano = c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003),
  Variancia = c(1.06e-05, 9.49e-06, 8.13e-06, 6.47e-06, 5.67e-06, 6.14e-06, 7.44e-06, 1.04e-05, 7.83e-06)
)

# Dados Lula
data_lula <- data.frame(
  Ano = c(2003, 2004, 2005, 2006, 2007),
  Variancia = c(7.83e-06, 7.23e-06, 7.95e-06, 8.75e-06, 6.67e-06)
)

# Dados Dilma-Temer
data_dilma <- data.frame(
  Ano = c(2011, 2012, 2013, 2014, 2015, 2016),
  Variancia = c(1.01e-05, 9.68e-06, 1.01e-05, 1.45e-05, 1.04e-05, 8.93e-06)
)

# Dados Temer-Bolsonaro (incluindo 2021 e 2022)
data_temer_bolsonaro <- data.frame(
  Ano = c(2017, 2018, 2019, 2020, 2021, 2022),
  Variancia = c(1.24e-05, 1.99e-05, 1.14e-05, 9.05e-06, 8.48e-06, 1.04e-05)
)

# Visualizar os dados
print(data_fhc_lula)
print(data_lula)
print(data_dilma_temer)
print(data_temer_bolsonaro)

library(ggplot2)

# Exemplo dos dados que representam as porcentagens de variância por janela temporal
data <- data.frame(
  Periodo = c("FHC", "Lula", "Dilma", "Temer_Bolsonaro"),
  Unidade_Negocio = c(44.67, 37.77, 51.29, 56.33),
  Localizacao_munic = c(5.65, 10.82, 0.38, 4.81),
  Residual = c(49.68, 51.41, 48.33, 38.86)
)

data_long <- data %>%
  pivot_longer(cols = c(Unidade_Negocio, Localizacao_munic, Residual), 
               names_to = "Efeito", values_to = "Proporcao")

# Criando o gráfico com rótulos dentro das barras
ggplot(data_long, aes(x = Periodo, y = Proporcao, fill = Efeito)) +
  geom_bar(stat = "identity", position = "fill") +
  geom_text(aes(label = paste0(round(Proporcao, 1), "%")),
            position = position_fill(vjust = 0.5), 
            color = "white", size = 3) +
  labs(title = "Composição dos Componentes de Variância por Período",
       y = "Proporção da Variância (%)",
       x = "Período") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal()

# Converter os dados para formato longo (tidy)
library(tidyr)
data_long <- pivot_longer(data, cols = -Periodo, names_to = "Efeito", values_to = "Porcentagem")

# Criar o gráfico
ggplot(data_long, aes(fill = Efeito, y = Porcentagem, x = Periodo)) +
  geom_bar(position = "fill", stat = "identity") +
  ylab("Proporção da Variância (%)") +
  xlab("Período") +
  ggtitle("Composição dos Componentes de Variância por Período") +
  theme_minimal()


library(reshape2)

# Converter para formato de matriz e gerar um mapa de calor
data_matrix <- as.matrix(data[,-1])
rownames(data_matrix) <- data$Periodo

heatmap(data_matrix, main = "Mapa de Calor dos Componentes de Variância", col = colorRampPalette(c("white", "red"))(100))

ggplot(data_long, aes(x = Periodo, y = Porcentagem, group = Efeito, color = Efeito)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  ylab("Porcentagem da Variância (%)") +
  xlab("Período") +
  ggtitle("Evolução dos Componentes de Variância por Período") +
  theme_minimal()


#load("c:/Aula3/docs/novo_18_11_24_.RData")
save.image("c:/Aula3/docs/novo_XX_11_24_.RData")
load("c:/Aula3/docs/novo_18_11_24_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")







################################################
#INICIO
####Cluster - Artigo 3 com df_Art3

df_cluster <- df_Art3
df_cluster2 <- df_Art3
str(df_cluster2)
####Dados_pivotados_2021["ATIVOS_VERDADEIROS"] <- CIRCULANTEEREALIZAVELALONGOPRAZO + Dados_pivotados_2021$PERMANENTE

# Lista os nomes dos objetos no ambiente
dfs <- ls(pattern = "Dados_pivotados_199[5-9]|Dados_pivotados_200[0-9]|Dados_pivotados_201[0-9]|Dados_pivotados_202[0-2]$")

# Cria uma lista para armazenar os DataFrames filtrados
selected_columns <- list()

# Loop pelos DataFrames
for (df_name in dfs) {
  # Obtém o DataFrame pelo nome
  df <- get(df_name)
  
  # Seleciona as colunas desejadas (exemplo: CNPJ, ANO e ATIVOS_VERDADEIROS)
  selected_columns[[df_name]] <- df[, c("CNPJ", "ANO", "ATIVOS_VERDADEIROS")]
}

# Verifica o resultado
selected_columns[["Dados_pivotados_1995"]] # Exemplo para verificar o DataFrame de 1995

str(selected_columns)

df_combined <- bind_rows(selected_columns, .id = "Source")
tail(df_combined)


library(dplyr)

# Combinar todos os DataFrames da lista em um só
combined_selected <- bind_rows(selected_columns)

# Converter ambas as colunas para character
df_cluster$CNPJ <- as.character(df_cluster$CNPJ)
combined_selected$CNPJ <- as.character(combined_selected$CNPJ)


df_cluster <- df_cluster %>%
  left_join(combined_selected, by = c("CNPJ", "ANO"))


df_Ativos <- data.frame(
  CNPJ = Dados_pivotados_1995$CNPJ,
  ANO = Dados_pivotados_1995$ANO,
  ATIVOS_VERDADEIROS = Dados_pivotados_1995$ATIVOS_VERDADEIROS,
)

#load("c:/Aula3/docs/novo_18_11_24_.RData")
#save.image("c:/Aula3/docs/novo_08_01_25_.RData")
#load("c:/Aula3/docs/novo_18_11_24_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")

write.csv(df_cluster, "c:/Aula3/docs/df_cluster.csv", row.names = FALSE)


summary(df_cluster[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])
# Remover linhas com NA
#df_cluster <- na.omit(df_cluster[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])

# OU substituir NA pela média de cada coluna
df_cluster$IFDM_Emp_Renda[is.na(df_cluster$IFDM_Emp_Renda)] <- mean(df_cluster$IFDM_Emp_Renda, na.rm = TRUE)
df_cluster$IFDM_Edu[is.na(df_cluster$IFDM_Edu)] <- mean(df_cluster$IFDM_Edu, na.rm = TRUE)
df_cluster$VAB[is.na(df_cluster$VAB)] <- mean(df_cluster$VAB, na.rm = TRUE)

set.seed(123)  # Garantir reprodutibilidade
cluster_result <- kmeans(df_cluster[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")], centers = 3)  # Ajuste o número de clusters
df_cluster$cluster <- as.factor(cluster_result$cluster)


df_cluster_filtered <- df_cluster %>%
  filter(SOBRAS_POR_ATIVO > -10 & SOBRAS_POR_ATIVO < 20)

#Obter estatísticas descritivas para cada cluster, como média, mediana, 
#desvio padrão, etc., para as variáveis de desempenho (ROA, CPLA e Ativos Totais).
library(dplyr)
df_cluster_filtered %>%
  group_by(cluster) %>%
  summarise(
    ROA_mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    #CPLA_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),  # Substituir se necessário
    ATIVOS_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE)
  )
#Testes de Significância (ANOVA e Post Hoc)
anova_result <- aov(SOBRAS_POR_ATIVO ~ cluster, data = df_cluster)
summary(anova_result)

# Teste Post Hoc (Tukey)
TukeyHSD(anova_result)

library(ggplot2)
ggplot(df_cluster_filtered, aes(x = cluster, y = SOBRAS_POR_ATIVO)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuição do ROA por Cluster", x = "Cluster", y = "ROA")

df_cluster$SOBRAS_POR_ATIVO_log <- log1p(df_cluster$SOBRAS_POR_ATIVO - min(df_cluster$SOBRAS_POR_ATIVO) + 1)

df_cluster_filtered <- df_cluster %>%
  filter(SOBRAS_POR_ATIVO > -10 & SOBRAS_POR_ATIVO < 20)

set.seed(123) # Garantir reprodutibilidade
cluster_result_filtered <- kmeans(df_cluster_filtered[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")], centers = 3)
df_cluster_filtered$Cluster <- as.factor(cluster_result_filtered$cluster)

table(df_cluster_filtered$Cluster)

mapa <- criar_mapa_clusters(df_cluster_filtered)
mapa

###refazendo

set.seed(123)
cluster_result_emp <- kmeans(df_cluster_filtered[, "IFDM_Emp_Renda", drop = FALSE], centers = 3)
df_cluster_filtered$Cluster_IFDM_Emp_Renda <- as.factor(cluster_result_emp$cluster)

library(ggplot2)
ggplot(df_cluster_filtered, aes(x = Cluster_IFDM_Emp_Renda, y = IFDM_Emp_Renda)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuição do IFDM Emprego e Renda por Cluster", x = "Cluster", y = "IFDM Emprego e Renda")

ggplot(df_cluster_filtered, aes(x = IFDM_Emp_Renda, y = SOBRAS_POR_ATIVO, color = Cluster_IFDM_Emp_Renda)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Clusters baseados no IFDM Emprego e Renda", x = "IFDM Emprego e Renda", y = "ROA")
table(df_cluster_filtered$Cluster_IFDM_Emp_Renda)

df_cluster_filtered %>%
  group_by(Cluster_IFDM_Emp_Renda) %>%
  summarise(
    ROA_mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    CPLA_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    Ativos_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE)
  )

df_cluster_filtered <- df_cluster_filtered %>%
  mutate(Cluster = Cluster_IFDM_Emp_Renda)
df_cluster_filtered <- df_cluster_filtered %>%
  rename(Cluster_temp = Cluster_IFDM_Emp_Renda)


# Criar o mapa
mapa_emp <- criar_mapa_clusters(df_cluster_filtered)

# Use `Cluster_temp` na função de criação do mapa
mapa_emp <- criar_mapa_clusters(df_cluster_filtered %>% rename(Cluster = Cluster_temp))

mapa_emp

###medindo as mariaveis de desempenho

library(dplyr)

descritiva_desempenho <- df_cluster_filtered %>%
  group_by(Cluster_temp) %>%
  summarise(
    ROA_mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    ROA_sd = sd(SOBRAS_POR_ATIVO, na.rm = TRUE),
    CPLA_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    CPLA_sd = sd(ATIVOS_VERDADEIROS, na.rm = TRUE),
    Ativos_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    Ativos_sd = sd(ATIVOS_VERDADEIROS, na.rm = TRUE)
  )

ggplot(df_cluster_filtered, aes(x = Cluster_temp, y = SOBRAS_POR_ATIVO)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuição de ROA por Cluster de IFDM Emprego e Renda", x = "Cluster", y = "ROA")
ggplot(df_cluster_filtered, aes(x = Cluster_temp, y = ATIVOS_VERDADEIROS)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuição de Ativos Totais por Cluster de IFDM Emprego e Renda", x = "Cluster", y = "Ativos Totais")
# 
# 3. Testes de Significância
# Use testes estatísticos para avaliar se as diferenças entre os clusters são significativas.
# 
# ANOVA para ROA:
anova_roa <- aov(SOBRAS_POR_ATIVO ~ Cluster_temp, data = df_cluster_filtered)
summary(anova_roa)

anova_ativos <- aov(ATIVOS_VERDADEIROS ~ Cluster_temp, data = df_cluster_filtered)
summary(anova_ativos)

tukey_result <- TukeyHSD(anova_roa)
print(tukey_result)

tukey_resultAtivos <- TukeyHSD(anova_ativos)
print(tukey_resultAtivos)


df_means <- df_cluster_filtered %>%
  group_by(Cluster_temp) %>%
  summarise(ROA_mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE))

df_meansAtivos <- df_cluster_filtered %>%
  group_by(Cluster_temp) %>%
  summarise(Ativos_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE))

ggplot(df_means, aes(x = Cluster_temp, y = ROA_mean, fill = Cluster_temp)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Média de ROA por Cluster (IFDM Emprego e Renda)", x = "Cluster", y = "Média de ROA")

ggplot(df_meansAtivos, aes(x = Cluster_temp, y = Ativos_mean, fill = Cluster_temp)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Média de ATIVOS por Cluster (IFDM Emprego e Renda)", x = "Cluster", y = "Média de ATIVOS")


library(ggplot2)
df_means <- df_cluster_filtered %>%
  group_by(Cluster_temp) %>%
  summarise(
    ROA_mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    Ativos_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE)
  )

# ROA
ggplot(df_means, aes(x = Cluster_temp, y = ROA_mean, fill = Cluster_temp)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(
    title = "Média de ROA por Cluster (IFDM Emprego e Renda)",
    x = "Cluster",
    y = "Média de ROA"
  )

# Ativos
ggplot(df_means, aes(x = Cluster_temp, y = Ativos_mean, fill = Cluster_temp)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(
    title = "Média de Ativos por Cluster (IFDM Emprego e Renda)",
    x = "Cluster",
    y = "Média de Ativos"
  )


####agora com o cluster _IFDM educação
set.seed(123)
cluster_result_edu <- kmeans(df_cluster_filtered[, "IFDM_Edu", drop = FALSE], centers = 3)
df_cluster_filtered$Cluster_edu <- as.factor(cluster_result_edu$cluster)

library(ggplot2)
ggplot(df_cluster_filtered, aes(x = Cluster_edu, y = IFDM_Edu)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuição do IFDM Emprego e Renda por Cluster", x = "Cluster", y = "IFDM Emprego e Renda")

ggplot(df_cluster_filtered, aes(x = Cluster_edu, y = SOBRAS_POR_ATIVO, color = Cluster_edu)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Clusters baseados no IFDM Emprego e Renda", x = "IFDM Emprego e Renda", y = "ROA")

table(df_cluster_filtered$Cluster_edu)

df_cluster_filtered %>%
  group_by(Cluster_edu) %>%
  summarise(
    ROA_mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    CPLA_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    Ativos_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE)
  )

###número de cluster
wss <- sapply(1:10, function(k) {
  kmeans(df_cluster_filtered[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")], centers = k, nstart = 20)$tot.withinss
})

plot(1:10, wss, type = "b", pch = 19, frame = FALSE,
     xlab = "Número de Clusters", ylab = "Soma dos Quadrados Totais")

library(cluster)
silhouette_score <- sapply(2:10, function(k) {
  pam(df_cluster_filtered[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")], k = k)$silinfo$avg.width
})

plot(2:10, silhouette_score, type = "b", pch = 19, frame = FALSE,
     xlab = "Número de Clusters", ylab = "Silhouette Score")

data_matrix <- df_cluster_filteredTest %>%
  select(IFDM_Emp_Renda, IFDM_Edu) %>%  # Selecionar apenas colunas numéricas
  as.matrix()
str(data_matrix)  # Verifique a estrutura
head(data_matrix)  # Visualize as primeiras linhas
data_matrix <- na.omit(data_matrix)
optics_result <- optics(data_matrix, eps = 0.5, minPts = 10)

plot(optics_result, main = "Reachability Plot", xlab = "Index", ylab = "Reachability Distance")
library(ggplot2)

ggplot(df_cluster_filteredTest, aes(x = IFDM_Emp_Renda, y = IFDM_Edu, color = as.factor(Cluster))) +
  geom_point() +
  theme_minimal() +
  labs(title = "Clusters Formados pelo OPTICS", x = "IFDM Emprego e Renda", y = "IFDM Educação", color = "Cluster")

library(dplyr)

df_summary <- df_cluster_filteredTest %>%
  group_by(Cluster) %>%
  summarise(
    mean_IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    mean_IFDM_Edu = mean(IFDM_Edu, na.rm = TRUE),
    count = n()
  )

print(df_summary)

df_performance <- df_cluster_filteredTest %>%
  group_by(Cluster) %>%
  summarise(
    ROA_mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    Ativos_mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE)
  )

print(df_performance)

library(dplyr)

# Estatísticas descritivas por cluster
descritiva_clusters <- df_cluster_filteredTest %>%
  group_by(Cluster) %>%
  summarise(
    IFDM_Emp_Renda_Mean = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu_Mean = mean(IFDM_Edu, na.rm = TRUE),
    ROA_Mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    Ativos_Mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    Count = n()
  )

print(descritiva_clusters)

ggplot(df_cluster_filteredTest, aes(x = as.factor(Cluster), y = SOBRAS_POR_ATIVO, fill = as.factor(Cluster))) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Distribuição de ROA por Cluster",
    x = "Cluster",
    y = "ROA",
    fill = "Cluster"
  )
ggplot(df_cluster_filteredTest, aes(x = as.factor(Cluster), y = ATIVOS_VERDADEIROS, fill = as.factor(Cluster))) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Distribuição de Ativos por Cluster",
    x = "Cluster",
    y = "Ativos",
    fill = "Cluster"
  )

####refazendo todos os cluster

library(dplyr)
library(ggplot2)
library(dbscan)

# Certifique-se de que as colunas estão disponíveis e numéricas
df_cluster_filtered <- df_cluster_filtered %>%
  mutate(
    IFDM_Emp_Renda = as.numeric(IFDM_Emp_Renda),
    IFDM_Edu = as.numeric(IFDM_Edu),
    VAB = as.numeric(VAB),
    ROA = as.numeric(SOBRAS_POR_ATIVO),
    Ativos = as.numeric(ATIVOS_VERDADEIROS)
    #Crescimento_PL = as.numeric(CRESCIMENTO_PL)  # Ajuste para o nome correto da coluna
  )
# Selecionar variáveis de agrupamento
data_matrix_global <- df_cluster_filtered %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB) %>%
  as.matrix()

# Aplicar OPTICS
optics_result_global <- optics(data_matrix_global, eps = 0.5, minPts = 10)
clusters_global <- extractDBSCAN(optics_result_global, eps_cl = 5.0)$cluster
df_cluster_filtered$Cluster_Global <- clusters_global

ggplot(df_cluster_filtered, aes(x = IFDM_Emp_Renda, y = IFDM_Edu, color = as.factor(Cluster_Global))) +
  geom_point(size = 2, alpha = 0.7) +
  theme_minimal() +
  labs(title = "Clusters Globais (Agrupamento Combinado)", x = "IFDM Emprego e Renda", y = "IFDM Educação", color = "Cluster")

df_summary <- df_cluster_filtered %>%
  group_by(Cluster_Global) %>%
  summarise(
    Mean_IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    Mean_IFDM_Edu = mean(IFDM_Edu, na.rm = TRUE),
    Count = n()
  )

print(df_summary)

desempenho_clusters <- df_cluster_filtered %>%
  group_by(Cluster_Global) %>%
  summarise(
    ROA_Mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    Ativos_Mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
#    Crescimento_PL_Mean = mean(CRESCIMENTO_PL, na.rm = TRUE),
    Count = n()
  )

print(desempenho_clusters)

ggplot(df_cluster_filtered, aes(x = as.factor(Cluster_Global), y = SOBRAS_POR_ATIVO, fill = as.factor(Cluster_Global))) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "ROA por Cluster Global", x = "Cluster", y = "ROA", fill = "Cluster")
ggplot(df_cluster_filtered, aes(x = as.factor(Cluster_Global), y = ATIVOS_VERDADEIROS, fill = as.factor(Cluster_Global))) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Ativos por Cluster Global", x = "Cluster", y = "Ativos", fill = "Cluster")

anova_roa <- aov(SOBRAS_POR_ATIVO ~ as.factor(Cluster_Global), data = df_cluster_filtered)
summary(anova_roa)
TukeyHSD(anova_roa)


#load("c:/Aula3/docs/novo_18_11_24_.RData")
#save.image("c:/Aula3/docs/novo_15_01_25_.RData")
#load("c:/Aula3/docs/novo_15_01_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")

#### testando com dbscab

###############################################
# 1) Instalar e carregar o pacote dbscan
###############################################
# Se ainda não tiver instalado:
# install.packages("dbscan")

library(dbscan)

###############################################
# 2) Preparar os dados
###############################################
# Exemplo: selecionar somente as colunas numéricas
novoCluster <- df_cluster_filtered[, -c(22,23,24,25,27,28)]
novoCluster2 <- df_cluster_filtered[, -c(22,23,24,25,27,28)]

df_numeric <- novoCluster[, sapply(novoCluster, is.numeric)]

# Opcional: escalar/normalizar os dados para uniformizar escalas
df_scaled <- scale(df_numeric)

# Caso existam NA, você pode removê-los ou tratá-los antes:
# df_scaled <- na.omit(df_scaled)

###############################################
# 3) Encontrar eps com kNNdistplot
###############################################
# Ajuste k = minPts - 1. Supondo minPts = 5, use k = 4.
kNNdistplot(df_scaled, k = 4)
abline(h = 1.5, col = "red", lty = 2)

kNNdist <- kNNdist(df_scaled, k = 4)
plot(sort(kNNdist), type = "l", ylim = c(0, 2),
     main = "4-NN Distance (Zoom)",
     xlab = "Points sorted by distance",
     ylab = "4-NN distance")
abline(h = 0.5, col = "red", lty = 2)


# -> Observe o gráfico para definir o eps.
#   A linha em 1.5 é apenas exemplo.

###############################################
# 4) Executar o DBSCAN
###############################################
# Supondo eps = 1.5 e minPts = 5
res_dbscan <- dbscan(df_scaled, eps = 1, minPts = 5)

# Inspecione o resultado:
res_dbscan

# Ver a frequência de cada cluster
table(res_dbscan$cluster)

###############################################
# 5) Visualizar resultados
###############################################
# A) Se tiver só 2 colunas, pode plotar diretamente:
# plot(df_scaled, col = res_dbscan$cluster + 1L, pch = res_dbscan$cluster + 1L,
#      main = "Clusters - DBSCAN")

# B) Se o dataset tiver várias colunas, use PCA para reduzir a 2D:
pca_res <- prcomp(df_scaled)
plot(pca_res$x[, 1:2],
     col = res_dbscan$cluster + 1L,
     pch = res_dbscan$cluster + 1L,
     main = "Clusters via DBSCAN (PCA)")

###############################################
# Observações
###############################################
# 1. Ajuste eps e minPts de acordo com o que o kNNdistplot indicar
#    ou usando conhecimento prévio do seu dataset.
# 2. 'cluster = 0' é onde o DBSCAN marca pontos como ruído.
# 3. Você pode experimentar outras técnicas de
#    redução dimensional (t-SNE, UMAP) para visualizar resultados.

#####novo teste

############################################################
# 1) Instalar / Carregar Pacotes
############################################################
# install.packages("dbscan") # se não instalado
# install.packages("ggplot2") # para plotar
# install.packages("dplyr")   # manipulação de dados

library(dbscan)
library(ggplot2)
library(dplyr)

############################################################
# 2) Selecionar as Variáveis de Agrupamento
############################################################
# Supondo que seu data frame principal se chame 'df'
# E que ele contenha colunas: 
#   IFDM_EmpregoRenda, IFDM_Educacao, VAB_Agro, VAB_Ind, VAB_Serv, VAB_Outros, ...
# Ajuste conforme seus nomes de colunas.

df_cluster_vars <- df_cluster_filtered %>%
  select(
    NOME_INSTITUICAO,
    CNPJ,
    UF,
    Cod_Munic,
    Cod_Reg_Imediata,
    Cod_Reg_Intermed,
    ANO,
    IFDM_Emp_Renda,
    IFDM_Edu,
    VAB,
    ATIVOS_VERDADEIROS,
    SOBRAS_POR_ATIVO
  )

# Se as colunas de agrupamento forem IFDM_EmpregoRenda, IFDM_Educacao, VAB
df_agrup <- df_cluster_vars[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")]

# Verifique se há valores ausentes (NA). Se houver, trate ou remova:
# df_cluster_vars <- na.omit(df_cluster_vars)

############################################################
# 3) Normalizar / Escalonar
############################################################
df_cluster_scaled <- scale(df_cluster_vars[c(3,4,5,6,7)])
df_agrup_scaled <- scale(df_agrup)
############################################################
# 4) Escolher eps com kNNdistplot
############################################################
# (Opcional) Ajustar k = minPts - 1, por ex. se minPts=5, k=4
kNNdistplot(df_cluster_scaled, k = 4)
abline(h = 0.8, col = "red", lty = 2)
# -> Observe o gráfico e defina um 'eps' aproximado
#   A linha horizontal (0.8) é apenas EXEMPLO

############################################################
# 5) Rodar o DBSCAN
############################################################
eps_value  <- 0.6  # escolha após observar o kNNdistplot
minPts_val <- 5

res_dbscan <- dbscan(df_agrup_scaled, eps = eps_value, minPts = minPts_val)
res_dbscan


# Ver quantos clusters (excluindo 0) e quantos ruídos
table(res_dbscan$cluster)

# Opcional: destacar ruído (cluster 0) de outra forma



############################################################
# 6) Atribuir o cluster ao Data Frame principal
############################################################
df_cluster_vars$cluster_socioeco <- res_dbscan$cluster  # Salva o ID do cluster

# Se quiser transformar cluster em fator para análises estatísticas:
df_cluster_vars$cluster_socioeco <- as.factor(df_cluster_vars$cluster_socioeco)

############################################################
# 7) Analisar Desempenho por Cluster
############################################################
# Supondo que df contenha as colunas: ROA, CPLA, ATIVOS
# 7.1) Estatísticas Descritivas
df_cluster_vars %>%
  group_by(cluster_socioeco) %>%
  summarise(
    n_cooper = n(),
    mean_ROA   = mean(SOBRAS_POR_ATIVO,   na.rm = TRUE),
    mean_ATIVOS= mean(ATIVOS_VERDADEIROS,na.rm = TRUE),
    sd_ROA     = sd(SOBRAS_POR_ATIVO,   na.rm = TRUE),
    sd_ATIVOS  = sd(ATIVOS_VERDADEIROS,na.rm = TRUE)
  )

df_cluster_vars %>%
  group_by(cluster_socioeco) %>%
  summarise(
    n = n(),
    mean_ifdm_emp = mean(IFDM_Emp_Renda, na.rm = TRUE),
    sd_ifdm_emp   = sd(IFDM_Emp_Renda, na.rm = TRUE),
    mean_ifdm_educ= mean(IFDM_Edu, na.rm = TRUE),
    sd_ifdm_educ  = sd(IFDM_Edu, na.rm = TRUE),
    mean_vab = mean(VAB, na.rm = TRUE),    # Ajuste nomes das colunas VAB
    sd_vba  = sd(VAB, na.rm = TRUE)
    
    # etc. inclua outros VAB, caso existam
  )


# 7.2) Exemplo de Visualização (boxplot do ROA por cluster)
ggplot(df_cluster_vars, aes(x = cluster_socioeco, y = VAB)) +
  geom_boxplot() +
  labs(title = "VAB por Cluster Socioeconômico",
       x = "Cluster (DBSCAN)",
       y = "VAB") +
  theme_minimal()

# 7.3) Se quiser analisar diferenças estatísticas formais, pode usar ANOVA ou Kruskal-Wallis
# (depende da distribuição dos dados).
# Exemplo rápido com ANOVA (caso ROA seja ~ normal):
anova_res <- aov(VAB ~ cluster_socioeco, data = df_cluster_vars)
summary(anova_res)


df_cluster_vars %>%
  group_by(cluster_socioeco) %>%
  summarise(
    n = n(),
    mean_ativos = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    sd_ativos = sd(ATIVOS_VERDADEIROS, na.rm = TRUE),
    median_ativos = median(ATIVOS_VERDADEIROS, na.rm = TRUE)
  )
tukey_res <- TukeyHSD(anova_res, "cluster_socioeco")
print(tukey_res)

df_cluster_vars$cluster_socioeco <- relevel(df_cluster_vars$cluster_socioeco, ref = "1")
lm_roa <- lm(ATIVOS_VERDADEIROS ~ cluster_socioeco, data = df_cluster_vars)
summary(lm_roa)


df_clusters_3_5 <- df_cluster_vars %>%
  filter(cluster_socioeco %in% c("3", "5"))

df_clusters_3_5 <- df_final %>%
  filter(cluster_socioeco %in% c("3", "5"))

# Ver estatísticas básicas
summary(df_clusters_3_5[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])

# Checar médias/medianas em cada cluster separadamente
df_clusters_3_5 %>%
  group_by(cluster_socioeco) %>%
  summarise(
    mean_IFDM_Emp = mean(IFDM_Emp_Renda, na.rm = TRUE),
    mean_IFDM_Educ= mean(IFDM_Edu, na.rm = TRUE),
    mean_VAB = mean(VAB, na.rm = TRUE),
    median_VAB = median(VAB, na.rm = TRUE),
    # inclua as outras colunas de VAB
  )

# Frequência de clusters por estado
table(df_clusters_3_5$ANO, df_clusters_3_5$cluster_socioeco)

# Frequência de clusters por município
table(df_completo$MUNICIPIO, df_completo$cluster_socioeco)


library(ggplot2)

# Comparando, por exemplo, VAB_Agro em clusters 3 e 5
ggplot(df_clusters_3_5, aes(x = cluster_socioeco, y = ATIVOS_VERDADEIROS)) +
  geom_boxplot() +
  labs(title = "CPLA em Clusters 3 e 5",
       x = "Cluster Socioeconômico",
       y = "CPLA") +
  theme_minimal()

######capturando o CPLA
##CPLA_1995 <- (Dados_pivotados_1995$PATRIMONIOLIQUIDO / Dados_pivotados_1994$PATRIMONIOLIQUIDO) -1
library(dplyr)

Dados_combinados_teste <- left_join(Dados_pivotados_1995, Dados_pivotados_1994, by = "CNPJ", suffix = c("_1995", "_1994"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_1995 = (PATRIMONIOLIQUIDO_1995 / PATRIMONIOLIQUIDO_1994) - 1)
Dados_combinados_95 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_1996, Dados_pivotados_1995, by = "CNPJ", suffix = c("_1996", "_1995"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_1996 = (PATRIMONIOLIQUIDO_1996 / PATRIMONIOLIQUIDO_1995) - 1)
Dados_combinados_96 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_1997, Dados_pivotados_1996, by = "CNPJ", suffix = c("_1997", "_1996"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_1997 = (PATRIMONIOLIQUIDO_1997 / PATRIMONIOLIQUIDO_1996) - 1)
Dados_combinados_97 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_1998, Dados_pivotados_1997, by = "CNPJ", suffix = c("_1998", "_1997"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_1998 = (PATRIMONIOLIQUIDO_1998 / PATRIMONIOLIQUIDO_1997) - 1)
Dados_combinados_98 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_1999, Dados_pivotados_1998, by = "CNPJ", suffix = c("_1999", "_1998"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_1999 = (PATRIMONIOLIQUIDO_1999 / PATRIMONIOLIQUIDO_1998) - 1)
Dados_combinados_99 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2000, Dados_pivotados_1999, by = "CNPJ", suffix = c("_2000", "_1999"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2000 = (PATRIMONIOLIQUIDO_2000 / PATRIMONIOLIQUIDO_1999) - 1)
Dados_combinados_2000 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2001, Dados_pivotados_2000, by = "CNPJ", suffix = c("_2001", "_2000"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2001 = (PATRIMONIOLIQUIDO_2001 / PATRIMONIOLIQUIDO_2000) - 1)
Dados_combinados_2001 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2002, Dados_pivotados_2001, by = "CNPJ", suffix = c("_2002", "_2001"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2002 = (PATRIMONIOLIQUIDO_2002 / PATRIMONIOLIQUIDO_2001) - 1)
Dados_combinados_2002 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2003, Dados_pivotados_2002, by = "CNPJ", suffix = c("_2003", "_2002"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2002 = (PATRIMONIOLIQUIDO_2003 / PATRIMONIOLIQUIDO_2002) - 1)
Dados_combinados_2003 <- Dados_combinados_teste[, c(1, 2, 138)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2004, Dados_pivotados_2003, by = "CNPJ", suffix = c("_2004", "_2003"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2004 = (PATRIMONIOLIQUIDO_2004 / PATRIMONIOLIQUIDO_2003) - 1)
Dados_combinados_2004 <- Dados_combinados_teste[, c(1, 2, 160)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2005, Dados_pivotados_2004, by = "CNPJ", suffix = c("_2005", "_2004"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2005 = (PATRIMONIOLIQUIDO_2005 / PATRIMONIOLIQUIDO_2004) - 1)
Dados_combinados_2005 <- Dados_combinados_teste[, c(1, 2, 160)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2006, Dados_pivotados_2005, by = "CNPJ", suffix = c("_2006", "_2005"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2006 = (PATRIMONIOLIQUIDO_2006 / PATRIMONIOLIQUIDO_2005) - 1)
Dados_combinados_2006 <- Dados_combinados_teste[, c(1, 2, 160)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2007, Dados_pivotados_2006, by = "CNPJ", suffix = c("_2007", "_2006"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2007 = (PATRIMONIOLIQUIDO_2007 / PATRIMONIOLIQUIDO_2006) - 1)
Dados_combinados_2007 <- Dados_combinados_teste[, c(1, 2, 160)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2008, Dados_pivotados_2007, by = "CNPJ", suffix = c("_2008", "_2007"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2008 = (PATRIMONIOLIQUIDO_2008 / PATRIMONIOLIQUIDO_2007) - 1)
Dados_combinados_2008 <- Dados_combinados_teste[, c(1, 2, 162)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2009, Dados_pivotados_2008, by = "CNPJ", suffix = c("_2009", "_2008"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2009 = (PATRIMONIOLIQUIDO_2009 / PATRIMONIOLIQUIDO_2008) - 1)
Dados_combinados_2009 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2010, Dados_pivotados_2009, by = "CNPJ", suffix = c("_2010", "_2009"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2010 = (PATRIMONIOLIQUIDO_2010 / PATRIMONIOLIQUIDO_2009) - 1)
Dados_combinados_2010 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2011, Dados_pivotados_2010, by = "CNPJ", suffix = c("_2011", "_2010"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2011 = (PATRIMONIOLIQUIDO_2011 / PATRIMONIOLIQUIDO_2010) - 1)
Dados_combinados_2011 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2012, Dados_pivotados_2011, by = "CNPJ", suffix = c("_2012", "_2011"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2012 = (PATRIMONIOLIQUIDO_2012 / PATRIMONIOLIQUIDO_2011) - 1)
Dados_combinados_2012 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2013, Dados_pivotados_2012, by = "CNPJ", suffix = c("_2013", "_2012"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2013 = (PATRIMONIOLIQUIDO_2013 / PATRIMONIOLIQUIDO_2012) - 1)
Dados_combinados_2013 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2014, Dados_pivotados_2013, by = "CNPJ", suffix = c("_2014", "_2013"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2014 = (PATRIMONIOLIQUIDO_2014 / PATRIMONIOLIQUIDO_2013) - 1)
Dados_combinados_2014 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2015, Dados_pivotados_2014, by = "CNPJ", suffix = c("_2015", "_2014"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2015 = (PATRIMONIOLIQUIDO_2015 / PATRIMONIOLIQUIDO_2014) - 1)
Dados_combinados_2015 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2016, Dados_pivotados_2015, by = "CNPJ", suffix = c("_2016", "_2015"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2016 = (PATRIMONIOLIQUIDO_2016 / PATRIMONIOLIQUIDO_2015) - 1)
Dados_combinados_2016 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2017, Dados_pivotados_2016, by = "CNPJ", suffix = c("_2017", "_2016"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2017 = (PATRIMONIOLIQUIDO_2017 / PATRIMONIOLIQUIDO_2016) - 1)
Dados_combinados_2017 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2018, Dados_pivotados_2017, by = "CNPJ", suffix = c("_2018", "_2017"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2018 = (PATRIMONIOLIQUIDO_2018 / PATRIMONIOLIQUIDO_2017) - 1)
Dados_combinados_2018 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2019, Dados_pivotados_2018, by = "CNPJ", suffix = c("_2019", "_2018"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2019 = (PATRIMONIOLIQUIDO_2019 / PATRIMONIOLIQUIDO_2018) - 1)
Dados_combinados_2019 <- Dados_combinados_teste[, c(1, 2, 164)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2020, Dados_pivotados_2019, by = "CNPJ", suffix = c("_2020", "_2019"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2020 = (PATRIMONIOLIQUIDO_2020 / PATRIMONIOLIQUIDO_2019) - 1)
Dados_combinados_2020 <- Dados_combinados_teste[, c(1, 2, 162)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2021, Dados_pivotados_2020, by = "CNPJ", suffix = c("_2021", "_2020"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2021 = (PATRIMONIOLIQUIDO_2021 / PATRIMONIOLIQUIDO_2020) - 1)
Dados_combinados_2021 <- Dados_combinados_teste[, c(1, 2, 160)]
#
Dados_combinados_teste <- left_join(Dados_pivotados_2022, Dados_pivotados_2021, by = "CNPJ", suffix = c("_2022", "_2021"))
Dados_combinados_teste <- Dados_combinados_teste %>%
  mutate(CPLA_2022 = (PATRIMONIOLIQUIDO_2022 / PATRIMONIOLIQUIDO_2021) - 1)
Dados_combinados_2022 <- Dados_combinados_teste[, c(1, 2, 159)]

# Exemplo para o ano 1995
Dados_combinados_95$Ano <- NULL
Dados_combinados_96$Ano <- NULL
Dados_combinados_97$Ano <- NULL
Dados_combinados_98$Ano <- NULL
Dados_combinados_99$Ano <- NULL
Dados_combinados_2000$Ano <- NULL
Dados_combinados_2001$Ano <- NULL
Dados_combinados_2002$Ano <- NULL
Dados_combinados_2003$Ano <- NULL
Dados_combinados_2004$Ano <- NULL
Dados_combinados_2005$Ano <- NULL
Dados_combinados_2006$Ano <- NULL
Dados_combinados_2007$Ano <- NULL
Dados_combinados_2008$Ano <- NULL
Dados_combinados_2009$Ano <- NULL
Dados_combinados_2010$Ano <- NULL
Dados_combinados_2011$Ano <- NULL
Dados_combinados_2012$Ano <- NULL
Dados_combinados_2013$Ano <- NULL
Dados_combinados_2014$Ano <- NULL
Dados_combinados_2015$Ano <- NULL
Dados_combinados_2016$Ano <- NULL
Dados_combinados_2017$Ano <- NULL
Dados_combinados_2018$Ano <- NULL
Dados_combinados_2019$Ano <- NULL
Dados_combinados_2020$Ano <- NULL
Dados_combinados_2021$Ano <- NULL
Dados_combinados_2022$Ano <- NULL

Dados_combinados_95$ANO <- 1995
Dados_combinados_96$ANO <- 1996
Dados_combinados_97$ANO <- 1997
Dados_combinados_98$ANO <- 1998
Dados_combinados_99$ANO <- 1999
Dados_combinados_2000$ANO <- 2000
Dados_combinados_2001$ANO <- 2001
Dados_combinados_2002$ANO <- 2002
Dados_combinados_2003$ANO <- 2003
Dados_combinados_2004$ANO <- 2004
Dados_combinados_2005$ANO <- 2005
Dados_combinados_2006$ANO <- 2006
Dados_combinados_2007$ANO <- 2007
Dados_combinados_2008$ANO <- 2008
Dados_combinados_2009$ANO <- 2009
Dados_combinados_2010$ANO <- 2010
Dados_combinados_2011$ANO <- 2011
Dados_combinados_2012$ANO <- 2012
Dados_combinados_2013$ANO <- 2013
Dados_combinados_2014$ANO <- 2014
Dados_combinados_2015$ANO <- 2015
Dados_combinados_2016$ANO <- 2016
Dados_combinados_2017$ANO <- 2017
Dados_combinados_2018$ANO <- 2018
Dados_combinados_2019$ANO <- 2019
Dados_combinados_2020$ANO <- 2020
Dados_combinados_2021$ANO <- 2021
Dados_combinados_2022$ANO <- 2022


lista_dfs_complementares <- list(Dados_combinados_2005, Dados_combinados_2006, Dados_combinados_2007,
                                 Dados_combinados_2008, Dados_combinados_2009, Dados_combinados_2010, 
                                 Dados_combinados_2011, Dados_combinados_2012, Dados_combinados_2013,
                                 Dados_combinados_2014, Dados_combinados_2015, Dados_combinados_2016
                                 )

##########################

# Converter CNPJ para character em TODOS os dataframes complementares DENTRO da lista
lista_dfs_complementares <- lapply(lista_dfs_complementares, function(df) {
  df$CNPJ <- as.character(df$CNPJ)
  return(df)
})

# Inicializa o dataframe final com o df_cluster_vars original
df_final <- df_cluster_vars

# Loop para juntar cada DataFrame complementar
for (Dados_combinados in lista_dfs_complementares) {
  df_final <- df_final %>%
    left_join(Dados_combinados, by = c("CNPJ", "ANO"))
}

# Visualiza o DataFrame final
print(df_final)

# Salva o DataFrame final (opcional)
write.csv(df_final, "df_cluster_vars_completo.csv", row.names = FALSE)

#######################

library(dplyr)
library(tidyr) # Para usar pivot_longer

# Converter CNPJ para character em TODOS os dataframes complementares DENTRO da lista
lista_dfs_complementares <- lapply(lista_dfs_complementares, function(df) {
  df$CNPJ <- as.character(df$CNPJ)
  return(df)
})

# Inicializando o DataFrame final
df_final <- df_cluster_vars

# Loop para juntar os DataFrames
for (Dados_combinados in lista_dfs_complementares) {
  df_final <- df_final %>%
    left_join(Dados_combinados, by = c("CNPJ", "ANO"))
}

# Reorganizar as colunas CPLA_ANO para uma única coluna CPLA
df_final <- df_final %>%
  pivot_longer(
    cols = starts_with("CPLA_"), # Seleciona as colunas que começam com "CPLA_"
    names_to = "CPLA_ANO",      # Nome da nova coluna com os nomes das colunas originais
    values_to = "CPLA",        # Nome da nova coluna com os valores
    values_drop_na = TRUE        # Remove linhas com NA na coluna CPLA
  ) %>%
  select(-CPLA_ANO) # Remove a coluna auxiliar CPLA_ANO


# Remover as colunas que começam com "NOME_INSTITUICAO_"
df_final <- df_final %>%
  select(!starts_with("NOME_INSTITUICAO_"))







######agora estou com o CPLA que não tinha antes


#refazer os cluster
library(ggplot2)
library(dplyr)
library(dbscan)
df_agrup <- df_final %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB)

df_agrup_scaled <- scale(df_agrup)

kNNdistplot(df_agrup_scaled, k = 4)
abline(h = 0.3, col = "red", lty = 2)

eps_value  <- 0.2
minPts_val <- 5

res_dbscan <- dbscan(df_agrup_scaled, eps = eps_value, minPts = minPts_val)

# Ver resultado

res_dbscan
table(res_dbscan$cluster)

df_final$cluster_socioeco15 <- res_dbscan$cluster

table(df_final$cluster_socioeco15)

####TESTE DE SILUETA
install.packages("cluster")
install.packages("factoextra")

library(cluster)
library(factoextra)
data_matrix <- scale(df_final[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])  # Padronizar os dados
clusters <- df_final$cluster_socioeco  # Coluna com os clusters atribuídos
clusters <- as.numeric(as.character(df_final$cluster_socioeco))


silhouette_score <- silhouette(clusters, dist(data_matrix))

# Visualizar o resumo da análise de Silhouette
summary(silhouette_score)

# Plotar o gráfico de Silhouette
fviz_silhouette(silhouette_score) +
  labs(title = "Análise de Silhouette para Clusters com DBSCAN")

fviz_nbclust(data_matrix, kmeans, method = "silhouette") +
  labs(title = "Número Ótimo de Clusters")

kmeans_result <- kmeans(data_matrix, centers = 5, nstart = 25)
kmeans_result <- kmeans(data_matrix, centers = 4, nstart = 25)
df_final$Cluster_Kmeans <- kmeans_result$cluster

library(ggplot2)
ggplot(df_final, aes(x = IFDM_Emp_Renda, y = IFDM_Edu, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  theme_minimal() +
  labs(title = "Clusters com K-means (k=4)", x = "IFDM Emprego e Renda", y = "IFDM Educação")

library(plotly)
library(rgl)

fig <- plot_ly(df_final, 
               x = ~IFDM_Emp_Renda, 
               y = ~IFDM_Edu, 
               z = ~VAB, 
               color = ~as.factor(Cluster_Kmeans), 
               colors = c("red", "blue", "green", "purple"),
               type = "scatter3d", 
               mode = "markers") %>%
  layout(title = "Clusters das Cooperativas - K-means",
         scene = list(xaxis = list(title = "IFDM Emprego e Renda"),
                      yaxis = list(title = "IFDM Educação"),
                      zaxis = list(title = "VAB")))

fig


df_final %>%
  group_by(Cluster_Kmeans) %>%
  summarise(
    Mean_IFDM_Emp_Renda = mean(IFDM_Emp_Renda),
    Mean_IFDM_Edu = mean(IFDM_Edu),
    Mean_VAB = mean(VAB),
    Count = n()
  )


shapiro.test(df_final$SOBRAS_POR_ATIVO)  # Teste de normalidade para ROA
shapiro.test(df_final$ATIVOS_VERDADEIROS)  # Teste de normalidade para Ativos
shapiro.test(df_final$CPLA)  # Teste de normalidade para CPLA

ks.test(df_final$SOBRAS_POR_ATIVO, "pnorm", mean(df_final$SOBRAS_POR_ATIVO), sd(df_final$SOBRAS_POR_ATIVO))
ks.test(df_final$ATIVOS_VERDADEIROS, "pnorm", mean(df_final$ATIVOS_VERDADEIROS), sd(df_final$ATIVOS_VERDADEIROS))
ks.test(df_final$CPLA, "pnorm", mean(df_final$CPLA), sd(df_final$CPLA))

kruskal.test(SOBRAS_POR_ATIVO ~ as.factor(Cluster_Kmeans), data = df_final)
kruskal.test(ATIVOS_VERDADEIROS ~ as.factor(Cluster_Kmeans), data = df_final)
kruskal.test(CPLA ~ as.factor(Cluster_Kmeans), data = df_final)

library(FSA)
dunnTest(SOBRAS_POR_ATIVO ~ as.factor(Cluster_Kmeans), data = df_final, method = "bonferroni")
dunnTest(ATIVOS_VERDADEIROS ~ as.factor(Cluster_Kmeans), data = df_final, method = "bonferroni")
dunnTest(CPLA ~ as.factor(Cluster_Kmeans), data = df_final, method = "bonferroni")










# install.packages("rgl")  # se ainda não instalado
library(rgl)

open3d()  # abre uma nova janela interativa

# Plotar em 3D
plot3d(
  x = df_agrup_scaled[,1],
  y = df_agrup_scaled[,2],
  z = df_agrup_scaled[,3],
  col = res_dbscan$cluster + 1,   # +1 evita cor 0
  size = 5,                       # tamanho dos pontos
  xlab = "Emprego e Renda",
  ylab = "Educacao",
  zlab = "VAB",
  main = "Clusters em 3D (rgl)"
)

library(rgl)
legend3d(
  "topright",
  legend = c("Cluster 0", "Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5"),
  pch = 16,
  col = c("black","red","blue","green","purple","orange")
)


df_final %>%
  group_by(cluster_socioeco) %>%
  summarise(
    n = n(),
    mean_ROA   = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    sd_ROA     = sd(SOBRAS_POR_ATIVO, na.rm = TRUE),
    mean_CPLA  = mean(CPLA, na.rm = TRUE),
    sd_CPLA    = sd(CPLA, na.rm = TRUE),
    mean_Ativo = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    sd_Ativo   = sd(ATIVOS_VERDADEIROS, na.rm = TRUE)
  ) -> df_finalExcel


ggplot(df_final, aes(x = factor(cluster_socioeco), y = ATIVOS_VERDADEIROS)) +
  geom_boxplot() +
  labs(title = "ATIVOS por Cluster Socioeconômico",
       x = "Cluster (DBSCAN)",
       y = "ATIVOS") +
  theme_minimal()

anova_res <- aov(ATIVOS_VERDADEIROS ~ factor(cluster_socioeco), data = df_final)
summary(anova_res) -> anova_Cluster_ATIVOS

# Transformar a lista anova_Cluster_ATIVOS em um dataframe
df_anova_ATIVOS <- as.data.frame(anova_Cluster_ATIVOS[[1]])
# Transformar a lista anova_Cluster_CPLA em um dataframe
df_anova_CPLA <- as.data.frame(anova_Cluster_CPLA[[1]])
# Transformar a lista anova_Cluster_ROA em um dataframe
df_anova_ROA <- as.data.frame(anova_Cluster_ROA[[1]])


library(ggplot2)
ggplot(df_final, aes(x = IFDM_Emp_Renda, y = IFDM_Edu, color = as.factor(cluster_socioeco))) +
  geom_point(size = 2) +
  theme_minimal() +
  labs(title = "Clusters Identificados pelo DBSCAN", x = "IFDM Emprego e Renda", y = "IFDM Educação", color = "Cluster")

table(df_final$cluster_socioeco)

#Testes Estatísticos de Normalidade
#H0​: Os dados seguem uma distribuição normal.
#H1​: Os dados não seguem uma distribuição normal.
shapiro.test(df_final$SOBRAS_POR_ATIVO)  # Teste de normalidade para ROA
ks.test(df_final$SOBRAS_POR_ATIVO, "pnorm", mean(df_final$SOBRAS_POR_ATIVO), sd(df_final$SOBRAS_POR_ATIVO))
hist(df_final$SOBRAS_POR_ATIVO, breaks = 30, main = "Histograma de ROA", xlab = "ROA", probability = TRUE)
lines(density(df_final$SOBRAS_POR_ATIVO), col = "red")

kruskal.test(SOBRAS_POR_ATIVO ~ as.factor(cluster_socioeco), data = df_final)
wilcox.test(SOBRAS_POR_ATIVO ~ as.factor(cluster_socioeco), data = df_final)

library(FSA)
dunn_test <- dunnTest(SOBRAS_POR_ATIVO ~ as.factor(cluster_socioeco), data = df_final, method = "bonferroni")
print(dunn_test)

ggplot(df_final, aes(x = as.factor(cluster_socioeco), y = SOBRAS_POR_ATIVO, fill = as.factor(cluster_socioeco))) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Comparação de ROA entre Clusters",
       x = "Cluster",
       y = "ROA",
       fill = "Cluster")


#load("c:/Aula3/docs/novo_18_11_24_.RData")
save.image("c:/Aula3/docs/novo_19_01_25_.RData")
#load("c:/Aula3/docs/novo_15_01_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")       
       

kmeans_result <- kmeans(data_matrix, centers = 4, nstart = 20)
df_cluster_filtered$Cluster <- kmeans_result$cluster
       
       
ggplot(df_final, aes(x = as.factor(cluster_socioeco), y = SOBRAS_POR_ATIVO, fill = as.factor(cluster_socioeco))) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Comparação de ROA entre Clusters",
       x = "Cluster",
       y = "ROA",
       fill = "Cluster")

df_summary <- df_final %>%
  group_by(Cluster_Kmeans) %>%
  summarise(
    ROA_Mean = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    ROA_Median = median(SOBRAS_POR_ATIVO, na.rm = TRUE),
    ROA_SD = sd(SOBRAS_POR_ATIVO, na.rm = TRUE),
    Ativos_Mean = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    Ativos_Median = median(ATIVOS_VERDADEIROS, na.rm = TRUE),
    Ativos_SD = sd(ATIVOS_VERDADEIROS, na.rm = TRUE),
    CPLA_Mean = mean(CPLA, na.rm = TRUE),
    CPLA_Median = median(CPLA, na.rm = TRUE),
    CPLA_SD = sd(CPLA, na.rm = TRUE),
    Count = n()
  )

print(df_summary)

# Boxplot para ROA
ggplot(df_final, aes(x = as.factor(Cluster_Kmeans), y = SOBRAS_POR_ATIVO, fill = as.factor(Cluster_Kmeans))) +
  geom_boxplot() +
  labs(title = "Distribuição do ROA por Cluster", x = "Cluster", y = "ROA") +
  theme_minimal()

# Boxplot para Ativos Totais
ggplot(df_final, aes(x = as.factor(Cluster_Kmeans), y = ATIVOS_VERDADEIROS, fill = as.factor(Cluster_Kmeans))) +
  geom_boxplot() +
  labs(title = "Distribuição de Ativos Totais por Cluster", x = "Cluster", y = "Ativos Totais") +
  theme_minimal()

# Boxplot para CPLA
ggplot(df_final, aes(x = as.factor(Cluster_Kmeans), y = CPLA, fill = as.factor(Cluster_Kmeans))) +
  geom_boxplot() +
  labs(title = "Distribuição do Crescimento do PL por Cluster", x = "Cluster", y = "CPLA") +
  theme_minimal()


###dispercao
ggplot(df_final, aes(x = IFDM_Emp_Renda, y = SOBRAS_POR_ATIVO, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "ROA vs IFDM Emprego e Renda", x = "IFDM Emprego e Renda", y = "ROA") +
  theme_minimal()

ggplot(df_final, aes(x = IFDM_Emp_Renda, y = ATIVOS_VERDADEIROS, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "ATIVOS vs IFDM Emprego e Renda", x = "IFDM Emprego e Renda", y = "ATIVOS") +
  theme_minimal()

ggplot(df_final, aes(x = IFDM_Emp_Renda, y = CPLA, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "CPLA vs IFDM Emprego e Renda", x = "IFDM Emprego e Renda", y = "CPLA") +
  theme_minimal()

ggplot(df_final, aes(x = IFDM_Edu, y = SOBRAS_POR_ATIVO, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "ROA vs IFDM Educação", x = "IFDM Educação", y = "ROA") +
  theme_minimal()

ggplot(df_final, aes(x = IFDM_Edu, y = ATIVOS_VERDADEIROS, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "ATIVOS vs IFDM Educação", x = "IFDM Educação", y = "ATIVOS") +
  theme_minimal()

ggplot(df_final, aes(x = IFDM_Edu, y = CPLA, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "CPLA vs IFDM Educação", x = "IFDM Educação", y = "CPLA") +
  theme_minimal()

ggplot(df_final, aes(x = VAB, y = SOBRAS_POR_ATIVO, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "ROA vs VAB", x = "VAB", y = "ROA") +
  theme_minimal()

ggplot(df_final, aes(x = VAB, y = ATIVOS_VERDADEIROS, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "ATIVOS vs VAB", x = "VAB", y = "ATIVOS") +
  theme_minimal()

ggplot(df_final, aes(x = VAB, y = CPLA, color = as.factor(Cluster_Kmeans))) +
  geom_point() +
  labs(title = "CPLA vs VAB", x = "VAB", y = "CPLA") +
  theme_minimal()

library(GGally)

# Criar a matriz de gráficos de dispersão para todas as variáveis
ggpairs(df_final[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB", "SOBRAS_POR_ATIVO", "ATIVOS_VERDADEIROS", "CPLA")], 
        aes(color = as.factor(df_final$Cluster_Kmeans), alpha = 0.7)) +
  labs(title = "Matriz de Dispersão entre Variáveis") +
  theme_minimal()


####

correlation_matrix <- cor(df_final[, c("SOBRAS_POR_ATIVO", "ATIVOS_VERDADEIROS", "CPLA", "IFDM_Emp_Renda", "IFDM_Edu", "VAB")], use = "complete.obs")
print(correlation_matrix)

lm(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
lm(ATIVOS_VERDADEIROS ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
lm(CPLA ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)

summary(lm(ATIVOS_VERDADEIROS ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final))
plot(lm(ATIVOS_VERDADEIROS ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final))

library(MASS)
rlm_model <- rlm(ATIVOS_VERDADEIROS ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
summary(rlm_model)


library(lmtest)
bptest(lm(ATIVOS_VERDADEIROS ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final))


df_final$ATIVOS_VERDADEIROS_log <- log(df_final$ATIVOS_VERDADEIROS + 1)
lm_log <- lm(ATIVOS_VERDADEIROS_log ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
plot(lm_log)
# 
# Considerações Finais e Próximos Passos
# Melhorias observadas:
#   
#   A transformação logarítmica melhorou a normalidade dos resíduos e reduziu a heterocedasticidade.
# A distribuição dos resíduos é mais homogênea e simétrica.
# Próximos passos recomendados:
#   
#   Revisar e tratar outliers: Avaliar as observações com maior impacto (leverage) e considerar sua remoção ou tratamento robusto.
# Aplicar regressão robusta: Para minimizar o impacto dos outliers sem removê-los.
# Testes adicionais: Realizar o teste de Breusch-Pagan novamente para verificar a presença de heterocedasticidade após a transformação.
# Avaliação de multicolinearidade: Utilizar o VIF para garantir que não há forte colinearidade entre as variáveis explicativas.

# Aplicando a regressão robusta com a transformação logarítmica
modelo_robusto_Log_ATIVOS <- rlm(log(ATIVOS_VERDADEIROS) ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
modelo_robusto_CPLA <- rlm(CPLA ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
modelo_robusto_ROA <- rlm(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)

# Resumo dos resultados
summary(modelo_robusto)

# Diagnóstico visual dos resíduos
plot(modelo_robusto_CPLA)

# Verificar a influência das observações
influence.measures(modelo_robusto)


# Modelo de regressão linear comum
modelo_linear <- lm(log(ATIVOS_VERDADEIROS) ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)

# Comparação dos coeficientes entre os dois modelos
summary(modelo_linear)
summary(modelo_robusto)



install.packages("quantreg")
library(quantreg)

# Regressão quantílica (mediana - quantil 0.5)
modelo_quantil <- rq(log(ATIVOS_VERDADEIROS) ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final, tau = 0.5)

# Resumo dos resultados
summary(modelo_quantil)

# Carregar pacotes necessários
library(ggplot2)

# Avaliar distribuição das variáveis
ggplot(df_final, aes(x = SOBRAS_POR_ATIVO)) + 
  geom_histogram(bins = 30, fill = "blue", color = "black") + 
  labs(title = "Distribuição de ROA", x = "ROA", y = "Frequência")

ggplot(df_final, aes(x = CPLA)) + 
  geom_histogram(bins = 30, fill = "red", color = "black") + 
  labs(title = "Distribuição de CPLA", x = "CPLA", y = "Frequência")

# Boxplots para detectar outliers
ggplot(df_final, aes(y = SOBRAS_POR_ATIVO)) + geom_boxplot(fill = "blue") + labs(title = "Boxplot de ROA")
ggplot(df_final, aes(y = CPLA)) + geom_boxplot(fill = "red") + labs(title = "Boxplot de CPLA")


# Aplicar transformação logarítmica com deslocamento proporcional
df_final$ROA_log <- log(df_final$SOBRAS_POR_ATIVO - min(df_final$SOBRAS_POR_ATIVO, na.rm = TRUE) + 1)
df_final$CPLA_log <- log(df_final$CPLA - min(df_final$CPLA, na.rm = TRUE) + 1)

# Verificar se a transformação resolveu os problemas
summary(df_final$ROA_log)
summary(df_final$CPLA_log)


# Modelo sem transformação
modelo_roa <- lm(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
modelo_cpla <- lm(CPLA ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)

# Modelo com transformação logarítmica
modelo_roa_log <- lm(ROA_log ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
modelo_cpla_log <- lm(CPLA_log ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)

# Resumo dos modelos
summary(modelo_roa)
summary(modelo_cpla)
summary(modelo_roa_log)
summary(modelo_cpla_log)

# Diagnóstico do modelo original (sem log)
par(mfrow = c(2, 2))
plot(modelo_roa)
plot(modelo_cpla)

# Diagnóstico do modelo transformado (com log)
par(mfrow = c(2, 2))
plot(modelo_roa_log)
plot(modelo_cpla_log)


library(MASS)

# Regressão robusta para ROA_log
modelo_roa_robusto <- rlm(ROA_log ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
summary(modelo_roa_robusto)

# Regressão robusta para CPLA_log
modelo_cpla_robusto <- rlm(CPLA_log ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)
summary(modelo_cpla_robusto)

library(car)

# Ajuste do modelo linear
modelo_vif <- lm(ROA_log ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final)

# Cálculo do VIF
vif(modelo_vif)


# Resumo dos modelos
summary(modelo_roa_robusto)
summary(modelo_robusto_Log_ATIVOS)
summary(modelo_cpla_robusto)

# Extraindo R² ajustado (apenas para lm, como proxy para rlm)
roa_r2 <- summary(lm(ROA_log ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final))$adj.r.squared
ativos_r2 <- summary(lm(log(ATIVOS_VERDADEIROS) ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final))$adj.r.squared
cpla_r2 <- summary(lm(CPLA_log ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final))$adj.r.squared

cat("R² ajustado para ROA:", roa_r2, "\n")
cat("R² ajustado para ATIVOS:", ativos_r2, "\n")
cat("R² ajustado para CPLA:", cpla_r2, "\n")

AIC(modelo_roa_robusto, modelo_robusto_Log_ATIVOS, modelo_cpla_robusto)
BIC(modelo_roa_robusto, modelo_robusto_Log_ATIVOS, modelo_cpla_robusto)

ks.test(residuals(modelo_roa_robusto), "pnorm", mean(residuals(modelo_roa_robusto)), sd(residuals(modelo_roa_robusto)))
ks.test(residuals(modelo_robusto_Log_ATIVOS), "pnorm", mean(residuals(modelo_robusto_Log_ATIVOS)), sd(residuals(modelo_robusto_Log_ATIVOS)))
ks.test(residuals(modelo_cpla_robusto), "pnorm", mean(residuals(modelo_cpla_robusto)), sd(residuals(modelo_cpla_robusto)))


par(mfrow = c(1, 3))
hist(residuals(modelo_roa_robusto), main = "Histograma dos Resíduos ROA")
hist(residuals(modelo_robusto_Log_ATIVOS), main = "Histograma dos Resíduos ATIVOS")
hist(residuals(modelo_cpla_robusto), main = "Histograma dos Resíduos CPLA")

##o resultado nao foi umadistribuicao normal

# Carregar pacotes necessários
library(MASS)

# Adicionar uma constante para garantir valores positivos
df_final$ROA_adjusted <- df_final$SOBRAS_POR_ATIVO - min(df_final$SOBRAS_POR_ATIVO) + 1
df_final$CPLA_adjusted <- df_final$CPLA - min(df_final$CPLA) + 1

# Aplicando a transformação de Box-Cox
lambda_roa <- boxcox(lm(ROA_adjusted ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final), lambda = seq(-2, 2, 0.1))
lambda_cpla <- boxcox(lm(CPLA_adjusted ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final), lambda = seq(-2, 2, 0.1))

# Obter o valor ótimo de lambda
optimal_lambda_roa <- lambda_roa$x[which.max(lambda_roa$y)]
optimal_lambda_cpla <- lambda_cpla$x[which.max(lambda_cpla$y)]

# Aplicar transformação com lambda ótimo
df_final$ROA_boxcox <- (df_final$ROA_adjusted^optimal_lambda_roa - 1) / optimal_lambda_roa
df_final$CPLA_boxcox <- (df_final$CPLA_adjusted^optimal_lambda_cpla - 1) / optimal_lambda_cpla

# Verificar a normalidade após transformação
ks.test(df_final$ROA_boxcox, "pnorm", mean(df_final$ROA_boxcox), sd(df_final$ROA_boxcox))
ks.test(df_final$CPLA_boxcox, "pnorm", mean(df_final$CPLA_boxcox), sd(df_final$CPLA_boxcox))

library(moments)
# Cálculo de assimetria e curtose
skewness(df_final$ROA_boxcox)
kurtosis(df_final$ROA_boxcox)

skewness(df_final$CPLA_boxcox)
kurtosis(df_final$CPLA_boxcox)


library(MASS)
df_final$ROA_yeo <- car::yeojohnson(df_final$SOBRAS_POR_ATIVO)
df_final$CPLA_yeo <- car::yeojohnson(df_final$CPLA)

library(bestNormalize)
# Aplicando a transformação Yeo-Johnson para ROA
yeo_roa <- yeojohnson(df_final$SOBRAS_POR_ATIVO)
df_final$ROA_yeo <- predict(yeo_roa)

# Aplicando a transformação Yeo-Johnson para CPLA
yeo_cpla <- yeojohnson(df_final$CPLA)
df_final$CPLA_yeo <- predict(yeo_cpla)

summary(df_final$ROA_yeo)
summary(df_final$CPLA_yeo)

ks.test(df_final$ROA_yeo, "pnorm", mean(df_final$ROA_yeo), sd(df_final$ROA_yeo))
ks.test(df_final$CPLA_yeo, "pnorm", mean(df_final$CPLA_yeo), sd(df_final$CPLA_yeo))

###testes nao parametricos
kruskal.test(SOBRAS_POR_ATIVO ~ Cluster_Kmeans, data = df_final)
kruskal.test(CPLA ~ Cluster_Kmeans, data = df_final)

library(FSA)
dunnTest(SOBRAS_POR_ATIVO ~ Cluster_Kmeans, data = df_final, method = "bonferroni")
dunnTest(CPLA ~ Cluster_Kmeans, data = df_final, method = "bonferroni")

library(ggplot2)
ggplot(df_final, aes(x = as.factor(Cluster_Kmeans), y = SOBRAS_POR_ATIVO)) +
  geom_boxplot() +
  labs(title = "Distribuição de SOBRAS_POR_ATIVO por Cluster", x = "Clusters", y = "SOBRAS_POR_ATIVO")

ggplot(df_final, aes(x = as.factor(Cluster_Kmeans), y = CPLA)) +
  geom_boxplot() +
  labs(title = "Distribuição de CPLA por Cluster", x = "Clusters", y = "CPLA")

cor.test(df_final$SOBRAS_POR_ATIVO, df_final$IFDM_Emp_Renda, method = "spearman")
cor.test(df_final$CPLA, df_final$IFDM_Edu, method = "spearman")

cor.test(df_final$SOBRAS_POR_ATIVO, df_final$IFDM_Emp_Renda, method = "kendall")
cor.test(df_final$CPLA, df_final$IFDM_Edu, method = "kendall")

library(quantreg)
rq_model_roa <- rq(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final, tau = 0.5)
summary(rq_model_roa)

rq_model_cpla <- rq(CPLA ~ IFDM_Emp_Renda + IFDM_Edu + VAB, data = df_final, tau = 0.5)
summary(rq_model_cpla)

#load("c:/Aula3/docs/novo_18_11_24_.RData")
save.image("c:/Aula3/docs/novo_03_01_25_.RData")
#load("c:/Aula3/docs/novo_15_01_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData") 

###22.02

str(df_final)



##### ULTIMO CLUSTER CRIATION

# Selecionar colunas relevantes de df_final e criar df_cluster3
df_cluster3 <- df_final %>%
  select(CNPJ, ANO, IFDM_Emp_Renda, IFDM_Edu, VAB, 
         SOBRAS_POR_ATIVO, CPLA, ATIVOS_VERDADEIROS) %>%
  distinct()

# Confirmar os anos presentes
unique(df_cluster3$ANO)  # Verifica se é só 2016 ou mais anos

# Padronizar variáveis de agrupamento
df_cluster3 <- df_cluster3 %>%
  mutate(
    IFDM_Emp_Renda_pad = scale(IFDM_Emp_Renda),
    IFDM_Edu_pad = scale(IFDM_Edu),
    VAB_pad = VAB  # Já está padronizado
  )

# Resumo para verificar
summary(df_cluster3)

library(dplyr)


# Trazer as transformações de df_final para df_cluster3_agg
df_cluster3_agg <- df_final %>%
  group_by(CNPJ) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu = mean(IFDM_Edu, na.rm = TRUE),
    VAB = mean(VAB, na.rm = TRUE),
    SOBRAS_POR_ATIVO = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    CPLA = mean(CPLA, na.rm = TRUE),
    ATIVOS_VERDADEIROS = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    ROA_yeo = mean(ROA_yeo, na.rm = TRUE),           # ROA transformado (Yeo-Johnson)
    CPLA_yeo = mean(CPLA_yeo, na.rm = TRUE),         # CPLA transformado (Yeo-Johnson)
    ATIVOS_VERDADEIROS_log = mean(ATIVOS_VERDADEIROS_log, na.rm = TRUE)  # Ativos em log
  ) %>%
  mutate(
    IFDM_Emp_Renda_pad = scale(IFDM_Emp_Renda),
    IFDM_Edu_pad = scale(IFDM_Edu),
    VAB_pad = VAB  # Já padronizado
  )



###apenas ajustando os ATIVOS -> retirando o termo "VERDADEIROS"
df_cluster3_agg <- df_final %>%
  group_by(CNPJ) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu = mean(IFDM_Edu, na.rm = TRUE),
    VAB = mean(VAB, na.rm = TRUE),
    SOBRAS_POR_ATIVO = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    CPLA = mean(CPLA, na.rm = TRUE),
    ATIVOS_VERDADEIROS = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    ROA_yeo = mean(ROA_yeo, na.rm = TRUE),           # ROA transformado (Yeo-Johnson)
    CPLA_yeo = mean(CPLA_yeo, na.rm = TRUE),         # CPLA transformado (Yeo-Johnson)
    ATIVOS_log = mean(ATIVOS_VERDADEIROS_log, na.rm = TRUE)  # Ativos em log
  ) %>%
  mutate(
    IFDM_Emp_Renda_pad = scale(IFDM_Emp_Renda),
    IFDM_Edu_pad = scale(IFDM_Edu),
    VAB_pad = VAB  # Já padronizado
  )

df_cluster3_agg %>%
  group_by(cluster) %>%
  summarise(across(
    c(IFDM_Emp_Renda, IFDM_Edu, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log),
    \(x) mean(x, na.rm = TRUE)
  ))

df_cluster3_agg %>%
  filter(cluster == 2) %>%
  select(CNPJ, IFDM_Emp_Renda, IFDM_Edu, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log)



# Novo resumo para verificar as transformações
summary(df_cluster3_agg)
# Selecionar variáveis padronizadas para clustering
vars_cluster <- c("IFDM_Emp_Renda_pad", "IFDM_Edu_pad", "VAB_pad")
dados_cluster <- df_cluster3_agg[, vars_cluster]

# Elbow Method
set.seed(123)
wss <- sapply(1:10, function(k) {
  kmeans(dados_cluster, centers = k, nstart = 10)$tot.withinss
})
plot(1:10, wss, type = "b", pch = 19, 
     xlab = "Número de Clusters", ylab = "Soma dos Quadrados Dentro dos Clusters",
     main = "Elbow Method")

# Silhouette Method
library(cluster)
sil <- sapply(2:10, function(k) {
  km <- kmeans(dados_cluster, centers = k, nstart = 10)
  ss <- silhouette(km$cluster, dist(dados_cluster))
  mean(ss[, 3])
})
plot(2:10, sil, type = "b", pch = 19, 
     xlab = "Número de Clusters", ylab = "Média do Coeficiente de Silhouette",
     main = "Silhouette Method")


set.seed(123)  # Para reprodutibilidade
kmeans_result <- kmeans(dados_cluster, centers = 4, nstart = 25)
df_cluster3_agg$cluster <- kmeans_result$cluster

# Resumo das médias por cluster (valores originais das variáveis de agrupamento)
aggregate(df_cluster3_agg[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")], 
          by = list(df_cluster3_agg$cluster), mean)


library(ggplot2)

# Boxplots com transformações
ggplot(df_cluster3_agg, aes(x = factor(cluster), y = ROA_yeo)) +
  geom_boxplot() +
  labs(x = "Cluster", y = "ROA (Yeo-Johnson)", title = "Distribuição de ROA por Cluster")

ggplot(df_cluster3_agg, aes(x = factor(cluster), y = CPLA_yeo)) +
  geom_boxplot() +
  labs(x = "Cluster", y = "CPLA (Yeo-Johnson)", title = "Distribuição de CPLA por Cluster")

ggplot(df_cluster3_agg, aes(x = factor(cluster), y = ATIVOS_log)) +
  geom_boxplot() +
  labs(x = "Cluster", y = "Ativos (Log)", title = "Distribuição de Ativos por Cluster")

# Teste Kruskal-Wallis
kruskal.test(ROA_yeo ~ cluster, data = df_cluster3_agg)
kruskal.test(CPLA_yeo ~ cluster, data = df_cluster3_agg)
kruskal.test(ATIVOS_log ~ cluster, data = df_cluster3_agg)

library(dunn.test)

# Teste para ROA_yeo
dunn.test(df_cluster3_agg$ROA_yeo, df_cluster3_agg$cluster, method = "bonferroni")

# Teste para CPLA_yeo
dunn.test(df_cluster3_agg$CPLA_yeo, df_cluster3_agg$cluster, method = "bonferroni")

# Teste para ATIVOS_VERDADEIROS_log
dunn.test(df_cluster3_agg$ATIVOS_log, df_cluster3_agg$cluster, method = "bonferroni")


df_cluster3_BK <- df_cluster3
df_cluster3_agg_BK <- df_cluster3_agg
library(ggplot2)
library(sf)

df_cluster3_agg <- merge(df_cluster3_agg, df_cluster2[, c("CNPJ", "Cod_Munic")], by = "CNPJ", all.x = TRUE)
library(dplyr)
df_cluster3_agg <- df_cluster3_agg %>%
  rename(code_muni = cod_munic)


###################
###################
####nova versao da formacao dos clusters
###################
# ===========================
# CLUSTER POR MUNICÍPIO (k=4)
# ===========================
library(dplyr)
library(stringr)
library(stringi)
library(geobr)
library(cluster)
library(ggplot2)

set.seed(123)

# ---------- 1) Base mínima por CNPJ ----------
geo_min <- df_principal %>%
  transmute(
    CNPJ      = as.character(CNPJ),
    cod_ibge  = suppressWarnings(as.numeric(`MUNICIPIO IBGE`)),
    municipio = str_squish(as.character(`MUNICÍPIO`)),
    UF        = toupper(as.character(UF))
  ) %>%
  distinct(CNPJ, .keep_all = TRUE)

# Junta com a base financeira
base <- df_final %>%
  mutate(CNPJ = as.character(CNPJ)) %>%
  inner_join(geo_min, by = "CNPJ")

# ---------- 2) Reparo do cod_ibge faltante via dicionário do geobr ----------
# Dicionário oficial (nomes IBGE 2020)
dic_muni <- geobr::read_municipality(year = 2020) %>%
  st_drop_geometry() %>%
  transmute(
    cod_ibge_ref = as.numeric(code_muni),
    UF           = toupper(as.character(abbrev_state)),
    municipio_of = as.character(name_muni),
    # chaves normalizadas (sem acento, caixa alta)
    muni_key     = str_to_upper(stri_trans_general(municipio_of, "Latin-ASCII"))
  ) %>%
  distinct(cod_ibge_ref, UF, muni_key)

# Cria a mesma chave na sua base
base <- base %>%
  mutate(
    muni_key = str_to_upper(stri_trans_general(municipio, "Latin-ASCII"))
  )

# Primeiro: mantém cod_ibge quando existe; para NAs tenta preencher pelo match (UF + nome normalizado)
base_fix <- base %>%
  left_join(dic_muni, by = c("UF", "muni_key")) %>%
  mutate(
    cod_ibge_final = if_else(is.na(cod_ibge), cod_ibge_ref, cod_ibge)
  )

# Aviso de quantos ainda ficaram sem IBGE
faltantes <- sum(is.na(base_fix$cod_ibge_final))
message("CNPJs ainda sem cod_ibge após reparo: ", faltantes)

# Se ainda houver faltantes, você pode optar por removê-los da clusterização municipal:
base_fix <- base_fix %>% filter(!is.na(cod_ibge_final))

# ---------- 3) Agregar por MUNICÍPIO ----------
mun <- base_fix %>%
  group_by(cod_ibge = cod_ibge_final, municipio, UF) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    VAB            = mean(VAB,            na.rm = TRUE),
    n_coops        = n_distinct(CNPJ),
    .groups = "drop"
  )

# Verificação: 1 linha por cod_ibge
dup_check <- mun %>% count(cod_ibge) %>% filter(n > 1)
if (nrow(dup_check) > 0) {
  warning("Ainda há cod_ibge repetido. Revise nomes/UF nesses casos:\n",
          paste(dup_check$cod_ibge, collapse = ", "))
}

# ---------- 4) Cluster por município (k=4) ----------
X_raw <- mun %>% select(IFDM_Emp_Renda, IFDM_Edu, VAB)
idx_ok <- complete.cases(X_raw)
X      <- scale(X_raw[idx_ok, , drop = FALSE])

km_m <- kmeans(X, centers = 4, nstart = 25)

mun$cluster_mun <- NA_integer_
mun$cluster_mun[idx_ok] <- km_m$cluster

# Checagem final: cada município com 1 cluster
stopifnot(all(mun %>% filter(!is.na(cluster_mun)) %>% count(cod_ibge) %>% pull(n) == 1))

# ---------- 5) Propagar para df_final (via CNPJ -> cod_ibge_final) ----------
df_final_fix <- df_final %>%
  mutate(CNPJ = as.character(CNPJ)) %>%
  left_join(base_fix %>% select(CNPJ, cod_ibge_final) %>% distinct(),
            by = "CNPJ") %>%
  left_join(mun %>% select(cod_ibge, cluster_mun),
            by = c("cod_ibge_final" = "cod_ibge"))

# ---------- 6) Resumo ----------
resumo_mun <- mun %>%
  group_by(cluster_mun) %>%
  summarise(
    n_municipios   = n(),
    n_coops_total  = sum(n_coops),
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    VAB            = mean(VAB,            na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(cluster_mun)

print(resumo_mun)

# ---------- 7) Visual rápido ----------
ggplot(as.data.frame(X), aes(IFDM_Emp_Renda, IFDM_Edu, color = factor(km_m$cluster))) +
  geom_point(alpha = .7) +
  theme_minimal() +
  labs(title = "K-means (k=4) por município — z-scores",
       x = "IFDM Emprego & Renda (z)", y = "IFDM Educação (z)", color = "Cluster")



#############CRIANDO NOVAMENTE AS ANALISES 11.08
######################


# df_final e df_principal já carregados no ambiente
df_final <- df_final %>% 
  rename(ATIVOS_log = ATIVOS_VERDADEIROS_log)

# Seleção do essencial (ajuste nomes se preciso)
df_base <- df_final %>%
  select(CNPJ, IFDM_Emp_Renda, IFDM_Edu, VAB,
         ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  distinct()

# Agrega por CNPJ (média no período)
df_cluster3_agg <- df_base %>%
  group_by(CNPJ) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    VAB            = mean(VAB,            na.rm = TRUE),
    ROA_yeo        = mean(ROA_yeo,        na.rm = TRUE),
    CPLA_yeo       = mean(CPLA_yeo,       na.rm = TRUE),
    ATIVOS_log     = mean(ATIVOS_log,     na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(
    IFDM_Emp_Renda_pad = as.numeric(scale(IFDM_Emp_Renda)),
    IFDM_Edu_pad       = as.numeric(scale(IFDM_Edu)),
    VAB_pad            = VAB,  # já padronizado na sua base
    ATIVOS_log_pad     = as.numeric(scale(ATIVOS_log)) # Adicionando a padronização dos ativos
  )


write.csv(df_cluster3_agg, "dados_agregados_para_analise.csv", row.names = FALSE)

# Matriz de agrupamento
X <- df_cluster3_agg %>% select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad)

km4 <- kmeans(X, centers = 4, nstart = 25)
df_cluster3_agg$cluster <- km4$cluster

# Médias por cluster – use estas para preencher a Tabela aaaaa (Artigo 3)
tab_medias <- df_cluster3_agg %>%
  group_by(cluster) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    VAB            = mean(VAB_pad,        na.rm = TRUE),
    ROA_yeo        = mean(ROA_yeo,        na.rm = TRUE),
    CPLA_yeo       = mean(CPLA_yeo,       na.rm = TRUE),
    ATIVOS_log     = mean(ATIVOS_log,     na.rm = TRUE),
    n_coops        = n(),
    .groups = "drop"
  ) %>% arrange(cluster)

print(tab_medias)
write.csv(tab_medias, "c:/Aula3/docs/tabela_medias_k4.csv", row.names = FALSE)

# Elbow
fviz_nbclust(X, kmeans, method="wss") + labs(title="Elbow (variáveis padronizadas)")
# Silhouette
fviz_nbclust(X, kmeans, method="silhouette") + labs(title="Silhouette (variáveis padronizadas)")



# Kruskal-Wallis
kw_roa   <- kruskal.test(ROA_yeo    ~ factor(cluster), data = df_cluster3_agg)
kw_cpla  <- kruskal.test(CPLA_yeo   ~ factor(cluster), data = df_cluster3_agg)
kw_ativos<- kruskal.test(ATIVOS_log ~ factor(cluster), data = df_cluster3_agg)

kw_tab <- tibble::tibble(
  Variavel   = c("ROA (Yeo-Johnson)", "CPLA (Yeo-Johnson)", "Ativos (Log)"),
  Chi_sq     = c(unname(kw_roa$statistic), unname(kw_cpla$statistic), unname(kw_ativos$statistic)),
  df         = c(unname(kw_roa$parameter), unname(kw_cpla$parameter), unname(kw_ativos$parameter)),
  p_value    = c(unname(kw_roa$p.value),   unname(kw_cpla$p.value),   unname(kw_ativos$p.value))
)
print(kw_tab)
write.csv(kw_tab, "c:/Aula3/docs/anexoI_kw.csv", row.names = FALSE)

# Dunn (Bonferroni) — iguais aos que você já trouxe
d_roa    <- FSA::dunnTest(ROA_yeo    ~ factor(cluster), data = df_cluster3_agg, method="bonferroni")
d_cpla   <- FSA::dunnTest(CPLA_yeo   ~ factor(cluster), data = df_cluster3_agg, method="bonferroni")
d_ativos <- FSA::dunnTest(ATIVOS_log ~ factor(cluster), data = df_cluster3_agg, method="bonferroni")

# Tabelas limpas para colar no Anexo I
fmt_dunn <- function(dt){
  out <- dt$res %>%
    transmute(
      Comparacao = Comparison,
      Z          = Z,
      P_ajust    = P.adj,
      Signif     = ifelse(P.adj <= 0.05, "SIM", "NÃO")
    )
  return(out)
}
dunn_roa_tab    <- fmt_dunn(d_roa)
dunn_cpla_tab   <- fmt_dunn(d_cpla)
dunn_ativos_tab <- fmt_dunn(d_ativos)

print(dunn_roa_tab)
print(dunn_cpla_tab)
print(dunn_ativos_tab)
write.csv(dunn_roa_tab, "c:/Aula3/docs/anexoI_dunn_roa.csv", row.names=FALSE)
write.csv(dunn_cpla_tab, "c:/Aula3/docs/anexoI_dunn_cpla.csv", row.names=FALSE)
write.csv(dunn_ativos_tab, "c:/Aula3/docs/anexoI_dunn_ativos.csv", row.names=FALSE)


km3 <- kmeans(X, centers = 3, nstart = 25)
df_cluster3_agg$cluster3 <- km3$cluster

tab_medias_k3 <- df_cluster3_agg %>%
  group_by(cluster3) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
    VAB            = mean(VAB_pad,        na.rm = TRUE),
    ROA_yeo        = mean(ROA_yeo,        na.rm = TRUE),
    CPLA_yeo       = mean(CPLA_yeo,       na.rm = TRUE),
    ATIVOS_log     = mean(ATIVOS_log,     na.rm = TRUE),
    n_coops        = n(),
    .groups = "drop"
  ) %>% arrange(cluster3)

print(tab_medias_k3)
write.csv(tab_medias_k3, "c:/Aula3/docs/anexoII_medias_k3.csv", row.names = FALSE)

#Passo 6) PAM com métricas alternativas (Manhattan, Minkowski p=3, Chebyshev, Canberra)

# Função geral para rodar PAM dado um "dist" e extrair médias
run_pam_medias <- function(dist_obj, k = 4, data_join){
  pam_fit <- pam(dist_obj, k = k, diss = TRUE)
  data_join$cluster_pam <- pam_fit$clustering
  data_join %>%
    group_by(cluster_pam) %>%
    summarise(
      IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
      IFDM_Edu       = mean(IFDM_Edu,       na.rm = TRUE),
      VAB            = mean(VAB_pad,        na.rm = TRUE),
      ROA_yeo        = mean(ROA_yeo,        na.rm = TRUE),
      CPLA_yeo       = mean(CPLA_yeo,       na.rm = TRUE),
      ATIVOS_log     = mean(ATIVOS_log,     na.rm = TRUE),
      n_coops        = n(),
      .groups = "drop"
    ) %>%
    arrange(cluster_pam)
}

X_pam <- df_cluster3_agg %>% select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad)

# Manhattan
d_manh <- dist(X_pam, method = "manhattan")
med_manh <- run_pam_medias(d_manh, 4, df_cluster3_agg)
print(med_manh)

# Minkowski p=3
d_mink3 <- proxy::dist(X_pam, method = function(a,b) sum(abs(a-b)^3)^(1/3))
med_mink3 <- run_pam_medias(d_mink3, 4, df_cluster3_agg)
print(med_mink3)

# Chebyshev (máximo)
d_cheb <- proxy::dist(X_pam, method = function(a,b) max(abs(a-b)))
med_cheb <- run_pam_medias(d_cheb, 4, df_cluster3_agg)
print(med_cheb)

# Canberra
d_canb <- proxy::dist(X_pam, method = "canberra")
med_canb <- run_pam_medias(d_canb, 4, df_cluster3_agg)
print(med_canb)

# Tabela 1 do Anexo II)
write.csv(med_manh,  "c:/Aula3/docs/anexoII_medias_pam_manhattan.csv", row.names = FALSE)
write.csv(med_mink3, "c:/Aula3/docs/anexoII_medias_pam_minkowski3.csv", row.names = FALSE)
write.csv(med_cheb,  "c:/Aula3/docs/anexoII_medias_pam_chebyshev.csv", row.names = FALSE)
write.csv(med_canb,  "c:/Aula3/docs/anexoII_medias_pam_canberra.csv", row.names = FALSE)



#PCA (para as projeções PC1 x PC2 no Anexo II)
# PCA somente nas variáveis de cluster
pca <- prcomp(X, scale. = FALSE, center = FALSE) # já padronizado
summary(pca)  # para conferir % de variância em PC1 e PC2
loadings <- pca$rotation[,1:2]
print(loadings)

# Biplot simples (opcional, as figuras do Anexo II podem ser geradas aqui)
fviz_pca_biplot(pca, repel = TRUE, geom.ind = "point",
                title = "PCA - variáveis de agrupamento (PC1 x PC2)") +
  theme_minimal()



###NOVOS TESTES
# Pacotes
library(dplyr)
library(FSA)      # dunnTest
library(readr)

# >>> 1) Apontar o data frame correto
df <- df_cluster3_agg   

# >>> 2) Descobrir a coluna do cluster (várias opções possíveis)
possiveis_clusters <- c("cluster", "Cluster", "Cluster_Kmeans", "cluster_socioeco")
cluster_col <- possiveis_clusters[possiveis_clusters %in% names(df)][1]
if (is.na(cluster_col)) stop("Não encontrei coluna de cluster no df.")

# >>> 3) Mapear variáveis de desempenho disponíveis
mapa_vars <- c(ROA_yeo = "ROA_yeo",
               CPLA_yeo = "CPLA_yeo",
               ATIVOS_log = "ATIVOS_log")

vars_presentes <- mapa_vars[mapa_vars %in% names(df)]
if (length(vars_presentes) == 0) stop("Não encontrei ROA_yeo / CPLA_yeo / ATIVOS_log no df.")

# >>> 4) Função para rodar KW + Dunn (Bonferroni) com checagens
rodar_tests <- function(d, var, cluster) {
  x <- d[[var]]
  g <- as.factor(d[[cluster]])
  if (all(is.na(x))) stop(paste("Variável", var, "está toda NA."))
  # remove NAs
  ok <- complete.cases(x, g)
  x <- x[ok]; g <- g[ok]
  if (length(unique(g)) < 2) stop("Menos de 2 grupos após remoção de NAs.")
  if (any(table(g) < 2)) warning("Algum grupo com n<2; teste pode ficar instável.")
  
  kw <- kruskal.test(x ~ g)
  
  dun <- tryCatch(
    dunnTest(x ~ g, method = "bonferroni")$res,
    error = function(e) {
      message("Falha no Dunn para ", var, ": ", e$message)
      return(NULL)
    }
  )
  
  list(kw = kw, dunn = dun)
}

# >>> 5) Rodar para todas as variáveis encontradas
resultados <- list()
for (v in vars_presentes) {
  cat("\n=============================\n",
      "Variável:", v, "\n",
      "=============================\n")
  resultados[[v]] <- rodar_tests(df, v, cluster_col)
  
  # Mostrar KW
  print(resultados[[v]]$kw)
  
  # Mostrar Dunn com coluna de significância (alpha=0.05)
  if (!is.null(resultados[[v]]$dunn)) {
    dtab <- resultados[[v]]$dunn %>%
      mutate(signif_0_05 = ifelse(P.adj <= 0.05, "SIM", "NÃO"))
    print(dtab)
    
    # salvar CSV
    out_name <- paste0("c:/Aula3/docs/dunn_", v, "_bonferroni.csv")
    write_csv(dtab, out_name)
    cat(">> Salvo:", out_name, "\n")
  }
}

# >>> 6) Opcional: salvar um resumo dos KW para o Anexo
kw_resumo <- lapply(names(resultados), function(v) {
  kw <- resultados[[v]]$kw
  data.frame(Variavel = v,
             Chi_sq = unname(kw$statistic),
             df = unname(kw$parameter),
             p_value = unname(kw$p.value))
}) %>% bind_rows()

write_csv(kw_resumo, "c:/Aula3/docs/anexoI_kw_atualizado.csv")
kw_resumo



####RODANDO PCA NOVO

# ===========================
# Pacotes
# ===========================
packages <- c("dplyr","ggplot2","ggrepel","scales","patchwork")
to_install <- setdiff(packages, rownames(installed.packages()))
if(length(to_install)) install.packages(to_install)
lapply(packages, library, character.only = TRUE)

# ===========================
# 1) Dados de entrada
# ===========================
# Use seu data frame agregado por CNPJ com as colunas socioeconômicas e as colunas de clusters
df <- df_cluster3_agg  # ajuste se seu objeto tiver outro nome

# variáveis usadas no PCA (ajuste se usa VAB_pad)
SOCIO_COLS <- c("IFDM_Emp_Renda","IFDM_Edu","VAB")  # ou c("IFDM_Emp_Renda","IFDM_Edu","VAB_pad")

# possíveis colunas de cluster; mantenha só as que existem no seu df
POSSIVEIS_CLUSTERS <- c(
  "cluster"
)

# ===========================
# 2) PCA (uma única vez)
# ===========================
run_pca <- function(data, socio_cols) {
  X <- data %>%
    select(all_of(socio_cols)) %>%
    mutate(across(everything(), as.numeric)) %>%
    tidyr::drop_na()
  pca <- prcomp(X, center = TRUE, scale. = TRUE)
  list(
    pca = pca,
    socio_cols = socio_cols,
    scores = as.data.frame(pca$x),
    var_explained = summary(pca)$importance[2, 1:2]*100,
    loadings = as.data.frame(pca$rotation[, 1:2])
  )
}
pca_res <- run_pca(df, SOCIO_COLS)

# ===========================
# 3) Função de plot (com elipses)
# ===========================
plot_pca_clusters <- function(data, pca_res, cluster_col,
                              title = NULL,
                              out_file = NULL,
                              width = 9, height = 7, dpi = 300,
                              ellipse_level = 0.80) {
  stopifnot(cluster_col %in% names(data))
  socio_cols <- pca_res$socio_cols
  
  data_clean <- data %>%
    select(all_of(c(socio_cols, cluster_col))) %>%
    mutate(across(all_of(socio_cols), as.numeric)) %>%
    tidyr::drop_na(all_of(socio_cols))
  
  scores <- pca_res$scores
  if(nrow(scores) != nrow(data_clean)) {
    stop("Número de linhas de scores != data_clean. Garanta que não mexeu na ordem/linhas entre o PCA e aqui.")
  }
  scores$cluster <- factor(data_clean[[cluster_col]])
  colnames(scores)[1:2] <- c("PC1","PC2")
  
  loads <- pca_res$loadings
  loads$var <- rownames(loads)
  colnames(loads)[1:2] <- c("PC1","PC2")
  
  # Escala para as setas (ajuste fino visual)
  arrow_scale <- 1.8 * max(abs(c(range(scores$PC1), range(scores$PC2))))
  loads_s <- loads %>%
    mutate(PC1s = PC1 * arrow_scale,
           PC2s = PC2 * arrow_scale)
  
  pc1_lab <- paste0("PC1 (", sprintf('%.2f', pca_res$var_explained[1]), "%)")
  pc2_lab <- paste0("PC2 (", sprintf('%.2f', pca_res$var_explained[2]), "%)")
  
  if (is.null(title)) {
    title <- paste0("PCA (", paste(pca_res$socio_cols, collapse = " + "),
                    ") — Cluster: ", cluster_col)
  }
  
  g <- ggplot() +
    # pontos
    geom_point(data = scores,
               aes(PC1, PC2, color = cluster),
               alpha = 0.85, size = 2) +
    # elipses (se houver pontos suficientes por grupo, pode emitir warning quando grupo < 3)
    stat_ellipse(data = scores,
                 aes(PC1, PC2, color = cluster),
                 type = "norm", level = ellipse_level,
                 linewidth = 0.5, show.legend = FALSE) +
    # setas dos loadings
    geom_segment(data = loads_s,
                 aes(x = 0, y = 0, xend = PC1s, yend = PC2s),
                 arrow = arrow(length = unit(0.02, "npc")),
                 linewidth = 0.6) +
    # rótulos dos loadings
    geom_label_repel(data = loads_s,
                     aes(PC1s, PC2s, label = var),
                     size = 4, label.size = 0.15, alpha = 0.9) +
    labs(title = title, x = pc1_lab, y = pc2_lab, color = "Cluster") +
    theme_minimal(base_size = 12) +
    theme(legend.position = "right",
          plot.title = element_text(face = "bold"))
  
  if (!is.null(out_file)) {
    ggsave(out_file, g, width = width, height = height, dpi = dpi)
  }
  g
}

# ===========================
# 4) Gerar todos os gráficos + salvar PNG
# ===========================
plots <- list()
for (cc in CLUSTER_COLS) {
  out_png <- paste0("PCA_", cc, ".png")
  message("Gerando: ", out_png)
  p <- plot_pca_clusters(df, pca_res, cluster_col = cc,
                         title = paste0("PCA — ", cc, " (PC1 × PC2)"),
                         out_file = out_png)
  plots[[cc]] <- p
}

# ===========================
# 5) Grid com todos (patchwork)
# ===========================
# Monta um grid 2xN (ajuste ncol conforme qtd)
ncol_grid <- min(2, length(plots))
grid <- wrap_plots(plots, ncol = ncol_grid, guides = "collect") &
  theme(legend.position = "right")

# Visualizar no RStudio
grid

# Salvar o grid em alta resolução
ggsave("PCA_TODOS_GRID.png", grid, width = 14, height = 10, dpi = 300)


####REFAZENDO UZANDO AS VAR DE AGRUP. PADRINIZADAS
#12/08
# Seleciona apenas as variáveis padronizadas
dados_cluster <- df_cluster3_agg[, c("IFDM_Emp_Renda_pad", "IFDM_Edu_pad", "VAB_pad")]

# Clustering k-means
set.seed(123)
km4 <- kmeans(dados_cluster, centers = 4, nstart = 50)
df_cluster3_agg$cluster <- km4$cluster

# PCA
pca <- prcomp(dados_cluster, center = FALSE, scale. = FALSE)

# Scores e loadings
scores <- as.data.frame(pca$x)
loads  <- as.data.frame(pca$rotation[,1:2])
loads$var <- rownames(loads)
colnames(loads)[1:2] <- c("PC1","PC2")

# Percentual de variância
var_pc <- summary(pca)$importance[2,1:2] * 100
x_lab <- paste0("PC1 (", sprintf('%.2f', var_pc[1]), "%)")
y_lab <- paste0("PC2 (", sprintf('%.2f', var_pc[2]), "%)")

# Escala para setas
arrow_scale <- 1.8 * max(abs(range(scores$PC1, scores$PC2)))
loads_s <- loads %>%
  mutate(PC1s = PC1 * arrow_scale,
         PC2s = PC2 * arrow_scale)

scores$cluster <- factor(df_cluster3_agg$cluster)

# Gráfico PCA
library(ggplot2)
library(ggrepel)

g_pca <- ggplot() +
  geom_point(data = scores, aes(PC1, PC2, color = cluster), alpha = 0.85, size = 2) +
  stat_ellipse(data = scores, aes(PC1, PC2, color = cluster), type = "norm", level = 0.80) +
  geom_segment(data = loads_s, aes(0,0, xend = PC1s, yend = PC2s),
               arrow = arrow(length = unit(0.02, "npc")), linewidth = 0.6) +
  geom_label_repel(data = loads_s, aes(PC1s, PC2s, label = var), size = 4) +
  labs(title = "PCA — Variáveis padronizadas",
       x = x_lab, y = y_lab, color = "Cluster") +
  theme_minimal(base_size = 12)

g_pca

#####script completo - 12/08

# ---- Pacotes
library(dplyr)
library(ggplot2)
library(ggrepel)
library(grid)
library(cluster)   # pam()
# Se quiser usar ggsave com unidade "cm": library(grid)

# ---- 1) Dados padronizados para clustering e PCA
X <- df_cluster3_agg %>%
  select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad) %>%
  as.data.frame()

stopifnot(ncol(X) == 3)

# ---- 2) PCA (usamos o MESMO PCA para projetar todos os resultados)
# Já estão padronizadas, então não reescale/recente
pca <- prcomp(X, center = FALSE, scale. = FALSE)

scores <- as.data.frame(pca$x)              # PC1, PC2, PC3...
loads  <- as.data.frame(pca$rotation[,1:2]) # loadings p/ PC1 e PC2
loads$var <- rownames(loads)
colnames(loads)[1:2] <- c("PC1","PC2")

# Percentuais de variância para rótulos dos eixos
var_pc <- summary(pca)$importance[2,1:2] * 100
x_lab <- sprintf("PC1 (%.2f%%)", var_pc[1])
y_lab <- sprintf("PC2 (%.2f%%)", var_pc[2])

# Escala das setas (ajuste fino, se quiser)
arrow_scale <- 1.6 * max(abs(range(scores$PC1, scores$PC2)))
loads_s <- loads %>%
  mutate(PC1s = PC1 * arrow_scale,
         PC2s = PC2 * arrow_scale)

plot_pam_pca <- function(X, metric = c("euclidean","manhattan","minkowski3","chebyshev","canberra"),
                         k = 4, out_dir = "pca_pam_out") {
  metric <- match.arg(metric)
  
  if (metric == "euclidean") { D <- dist(as.matrix(X), "euclidean"); metric_title <- "Euclidiana"
  } else if (metric == "manhattan") { D <- dist(as.matrix(X), "manhattan"); metric_title <- "Manhattan"
  } else if (metric == "minkowski3") { D <- dist(as.matrix(X), "minkowski", p = 3); metric_title <- "Minkowski_p3"
  } else if (metric == "chebyshev") { D <- dist(as.matrix(X), "maximum"); metric_title <- "Chebyshev"
  } else if (metric == "canberra") { D <- dist(as.matrix(X), "canberra"); metric_title <- "Canberra" }
  
  set.seed(123)
  pam_fit <- pam(D, k = k, diss = TRUE)
  
  plot_df <- scores %>% mutate(cluster = factor(pam_fit$clustering))
  
  g <- ggplot() +
    geom_point(data = plot_df, aes(PC1, PC2, color = cluster), size = 1.6, alpha = 0.85) +
    stat_ellipse(data = plot_df, aes(PC1, PC2, color = cluster),
                 type = "norm", level = 0.80, linewidth = 0.5) +
    geom_segment(data = loads_s, aes(0,0, xend = PC1s, yend = PC2s),
                 arrow = arrow(length = unit(0.02, "npc")), linewidth = 0.6, color = "gray25") +
    geom_label_repel(data = loads_s, aes(PC1s, PC2s, label = var),
                     size = 4, label.padding = unit(0.15, "lines"),
                     label.r = unit(0.15, "lines"), segment.size = 0.3) +
    labs(title = paste0("PCA — PAM (", metric_title, ")"),
         subtitle = "Projeção no mesmo PCA das variáveis padronizadas",
         x = x_lab, y = y_lab, color = "Cluster") +
    theme_minimal(base_size = 12) +
    theme(legend.position = "right")
  
  if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)
  file_png <- file.path(out_dir, paste0("PCA_PAM_", gsub("[ ()=]", "", metric_title), ".png"))
  ggsave(file_png, g, width = 22, height = 14, units = "cm", dpi = 300)
  message("OK: ", metric_title, " -> ", file_png)
  
  # >>> NOVO: retornar também o vetor de clusters e o título para salvar
  list(plot = g, clusters = pam_fit$clustering, metric_title = metric_title)
}


# # ---- 4) Rodar todas as métricas e salvar os 5 PNGs
# metrics <- c("euclidean","manhattan","minkowski3","chebyshev","canberra")
# plots <- lapply(metrics, function(m) plot_pam_pca(X, metric = m, k = 4, out_dir = "pca_pam_out"))
metrics <- c("euclidean","manhattan","minkowski3","chebyshev","canberra")
outs <- lapply(metrics, function(m) plot_pam_pca(X, metric = m, k = 4, out_dir = "pca_pam_out"))

# Adicionar colunas de cluster ao df_cluster3_agg
df_cluster3_agg$cluster_euclidiana  <- outs[[1]]$clusters
df_cluster3_agg$cluster_manhattan   <- outs[[2]]$clusters
df_cluster3_agg$cluster_minkowski_p3<- outs[[3]]$clusters
df_cluster3_agg$cluster_chebyshev   <- outs[[4]]$clusters
df_cluster3_agg$cluster_canberra    <- outs[[5]]$clusters

# (Opcional) salvar uma base de trabalho para as tabelas do anexo
write.csv(df_cluster3_agg, "pca_pam_out/base_clusters_por_metrica.csv", row.names = FALSE)


###### tabela de médias por cluster (para o Anexo II)

tab_medias_euclidiana <- df_cluster3_agg %>%
  mutate(cluster = factor(cluster_euclidiana)) %>%
  group_by(cluster) %>%
  summarise(
    IFDM_Emprego_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Educacao      = mean(IFDM_Edu, na.rm = TRUE),
    VAB                = mean(VAB, na.rm = TRUE),
    ROA_yeo            = mean(ROA_yeo, na.rm = TRUE),
    CPLA_yeo           = mean(CPLA_yeo, na.rm = TRUE),
    Ativos_Log         = mean(ATIVOS_log, na.rm = TRUE),
    Qtd_Cooperativas   = dplyr::n(),
    .groups = "drop"
  )

write.csv(tab_medias_euclidiana, "pca_pam_out/tabela_medias_euclidiana.csv", row.names = FALSE)

############# Resumo de separação por métrica (silhouette)
sil_summ <- function(d, cl){
  s <- silhouette(cl, d)
  c(mean_sil = mean(s[, "sil_width"]))
}

sil_df <- data.frame(
  metrica = c("Euclidiana","Manhattan","Minkowski_p3","Chebyshev","Canberra"),
  mean_sil = c(
    sil_summ(dist(as.matrix(X), "euclidean"),  outs[[1]]$clusters),
    sil_summ(dist(as.matrix(X), "manhattan"),  outs[[2]]$clusters),
    sil_summ(dist(as.matrix(X), "minkowski", p=3), outs[[3]]$clusters),
    sil_summ(dist(as.matrix(X), "maximum"),   outs[[4]]$clusters),
    sil_summ(dist(as.matrix(X), "canberra"),  outs[[5]]$clusters)
  )
)
write.csv(sil_df, "pca_pam_out/resumo_silhouette.csv", row.names = FALSE)


getwd()


####coletando os dados 13/08
#########################

df_clusters <- df_cluster3_agg
df_clusters$Cluster <- resultado_pam$clustering

# 2. Exportar para CSV para me enviar
write.csv(df_clusters, "base_clusters_variaveis_originais.csv", row.names = FALSE)


#####refazer a tabela de estatísticas por cluster usando as variáveis originais 
#####13/08

# Pacotes
library(dplyr)
library(readr)

# >>> 1) Verifique se o df_cluster3_agg tem a coluna do cluster que você quer usar como referência
#     (no seu fluxo, costuma ser 'cluster_euclidiana')
stopifnot(exists("df_cluster3_agg"))
stopifnot(all(c("IFDM_Emp_Renda","IFDM_Edu","VAB","ROA_yeo","CPLA_yeo","ATIVOS_log") %in% names(df_cluster3_agg)))
stopifnot("cluster_euclidiana" %in% names(df_cluster3_agg))  # ajuste o nome se for outro

# >>> 2) (Opcional) Checagem rápida de que as variáveis NÃO estão padronizadas
#     Se estiverem padronizadas, médias ~0 e dp ~1 chamam atenção.
check_stats <- df_cluster3_agg %>%
  summarise(
    m_emp = mean(IFDM_Emp_Renda, na.rm=TRUE), sd_emp = sd(IFDM_Emp_Renda, na.rm=TRUE),
    m_edu = mean(IFDM_Edu, na.rm=TRUE),       sd_edu = sd(IFDM_Edu, na.rm=TRUE),
    m_vab = mean(VAB, na.rm=TRUE),            sd_vab = sd(VAB, na.rm=TRUE)
  )
print(check_stats)

# >>> 3) Tabela de estatísticas por cluster (USANDO VALORES ORIGINAIS)
tabela_medias_orig <- df_cluster3_agg %>%
  mutate(cluster = factor(cluster_euclidiana)) %>%   # use a coluna de cluster desejada
  group_by(cluster) %>%
  summarise(
    IFDM_Emprego_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Educacao      = mean(IFDM_Edu,       na.rm = TRUE),
    VAB                = mean(VAB,            na.rm = TRUE),
    ROA_yeo            = mean(ROA_yeo,        na.rm = TRUE),
    CPLA_yeo           = mean(CPLA_yeo,       na.rm = TRUE),
    Ativos_Log         = mean(ATIVOS_log,     na.rm = TRUE),
    Qtd_Cooperativas   = dplyr::n(),
    .groups = "drop"
  ) %>%
  arrange(as.numeric(as.character(cluster))) %>%
  mutate(
    dplyr::across(
      c(IFDM_Emprego_Renda, IFDM_Educacao, VAB, ROA_yeo, CPLA_yeo, Ativos_Log),
      ~ round(.x, 4)
    )
  )

print(tabela_medias_orig)

# >>> 4) Salvar a tabela para usar no Anexo II
write_csv(tabela_medias_orig, "tabela_medias_euclidiana_ORIGINAIS.csv")

# >>> 5) (Opcional) Uma verificação simples que ajuda a confirmar o "cluster rico"
#     Ordena por IFDM (emprego/renda e educação) para ver quem lidera.
ordem_renda <- tabela_medias_orig %>% arrange(desc(IFDM_Emprego_Renda))
ordem_educ  <- tabela_medias_orig %>% arrange(desc(IFDM_Educacao))
ordem_vab   <- tabela_medias_orig %>% arrange(desc(VAB))

cat("\nClusters ordenados por IFDM Emprego & Renda (desc):\n"); print(ordem_renda$cluster)
cat("\nClusters ordenados por IFDM Educação (desc):\n");      print(ordem_educ$cluster)
cat("\nClustergs ordenados por VAB (desc):\n");                 print(ordem_vab$cluster)





####VENDO AS CIDADES E RGIOES

# 3. Verificar a estrutura dos dataframes
print("Estrutura de df_cluster3_agg:")
str(df_cluster3_agg)
print("Estrutura de df_Art3:")
str(df_Art3)

if (!"CNPJ" %in% names(df_cluster3_agg) || !"CNPJ" %in% names(df_Art3)) {
  stop("Coluna CNPJ não encontrada em um dos dataframes. Verifique os nomes das colunas.")
}


# 5. Garantir que CNPJ seja tratado como character para evitar problemas de tipo
df_cluster3_agg$CNPJ <- as.character(df_cluster3_agg$CNPJ)
df_Art3$CNPJ <- as.character(df_Art3$CNPJ)

# 6. Remover duplicatas em df_Art3, mantendo a primeira ocorrência por CNPJ
df_Art3_unique <- df_Art3 %>%
  distinct(CNPJ, .keep_all = TRUE)

# 7. Selecionar apenas as colunas desejadas de df_Art3_unique
df_Art3_subset <- df_Art3_unique %>%
  select(CNPJ, NOME_INSTITUICAO, UF, Cod_Munic, Cod_Reg_Imediata, Cod_Reg_Intermed)

# 8. Realizar um left join para manter apenas as linhas de df_cluster3_agg
df_novo <- df_cluster3_agg %>%
  left_join(df_Art3_subset, by = "CNPJ") %>%
  select(-CNPJ)  # Remover a coluna CNPJ do resultado final, se desejar

# 9. Verificar o resultado
print("Número de linhas em df_cluster3_agg:")
print(nrow(df_cluster3_agg))  # Deve ser 1.087
print("Número de linhas em df_novo:")
print(nrow(df_novo))
if (nrow(df_cluster3_agg) == nrow(df_novo)) {
  print("Sucesso: Número de linhas preservado!")
} else {
  print("Erro: Número de linhas difere. Verifique correspondências.")
  # Identificar CNPJs sem correspondência
  cnpjs_sem_correspondencia <- df_cluster3_agg$CNPJ[!df_cluster3_agg$CNPJ %in% df_Art3_subset$CNPJ]
  print("CNPJs sem correspondência em df_Art3_subset:")
  print(cnpjs_sem_correspondencia)
  print("Número de CNPJs sem correspondência:")
  print(length(cnpjs_sem_correspondencia))
}

# 10. Exibir as primeiras linhas para inspeção
head(df_novo)

# 11. Salvar o resultado, se desejar
write.csv(df_novo, "df_novo.csv", row.names = FALSE)



####MONTARNDO ALGUNS MAPAS
#####13/08

library(dplyr)
library(ggplot2)
library(geobr)
library(sf)


# Carregar o DF
df_novo <- read.csv("df_novo.csv")

# Filtrar linhas sem NA em UF e cluster_euclidiana
df_filtrado <- df_novo %>%
  filter(!is.na(UF) & !is.na(cluster_euclidiana))

# Agrupar por UF e cluster_euclidiana
contagem_uf <- df_filtrado %>%
  group_by(UF, cluster_euclidiana) %>%
  summarise(Contagem = n()) %>%
  ungroup()

# Carregar shapefile de estados do Brasil
estados <- read_state(year = 2020)

# Unir dados ao shapefile
estados$UF <- estados$abbrev_state  # Renomear para matching
map_data <- estados %>%
  left_join(contagem_uf, by = "UF")

# Plotar mapa de calor por contagem total
ggplot(map_data) +
  geom_sf(aes(fill = Contagem)) +
  scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "gray") +
  facet_wrap(~cluster_euclidiana) +
  theme_minimal() +
  labs(title = "Distribuição de Cooperativas por Cluster e Estado (sem NA)", fill = "Contagem")
ggsave("mapa_contagem_uf_sem_na.png")


### CIDADES
library(dplyr)
library(ggplot2)
library(geobr)
library(sf)

# Carregar o DF
df_novo <- read.csv("df_novo.csv")

# Filtrar linhas sem NA em Cod_Munic, UF e cluster_euclidiana
df_filtrado <- df_novo %>%
  filter(!is.na(Cod_Munic) & !is.na(UF) & !is.na(cluster_euclidiana))

# Depuração: Verificar quantas linhas foram filtradas
print("Número de linhas em df_novo:")
print(nrow(df_novo))  # Deve ser 1.087
print("Número de linhas em df_filtrado:")
print(nrow(df_filtrado))

# Depuração: Verificar valores originais de Cod_Munic e UF
print("Primeiros valores de Cod_Munic em df_filtrado:")
print(head(df_filtrado$Cod_Munic))
print("Primeiros valores de UF em df_filtrado:")
print(head(df_filtrado$UF))
print("Valores únicos de UF em df_filtrado:")
print(unique(df_filtrado$UF))

# Criar um mapeamento de UF para código de estado (baseado no IBGE)
uf_to_code <- c("AC" = 12, "AL" = 27, "AM" = 13, "AP" = 16, "BA" = 29, "CE" = 23,
                "DF" = 53, "ES" = 32, "GO" = 52, "MA" = 21, "MG" = 31, "MS" = 50,
                "MT" = 51, "PA" = 15, "PB" = 25, "PE" = 26, "PI" = 22, "PR" = 41,
                "RJ" = 33, "RN" = 24, "RO" = 11, "RR" = 14, "RS" = 43, "SC" = 42,
                "SE" = 28, "SP" = 35, "TO" = 17)

# Verificar se todos os UFs estão mapeados
ufs_nao_mapeados <- setdiff(unique(df_filtrado$UF), names(uf_to_code))
print("UFs não mapeados:")
print(ufs_nao_mapeados)

# Padronizar Cod_Munic para 6 dígitos
df_filtrado$Cod_Munic_padded <- sprintf("%06d", as.numeric(trimws(df_filtrado$Cod_Munic)))

# Depuração: Verificar valores de Cod_Munic_padded
print("Primeiros valores de Cod_Munic_padded:")
print(head(df_filtrado$Cod_Munic_padded))

# Depuração: Verificar mapeamento de UF para código
print("Primeiros códigos de estado de UF:")
print(head(uf_to_code[df_filtrado$UF]))

# Criar code_muni completo (7 dígitos: código do estado + Cod_Munic_padded)
df_filtrado$code_muni_temp <- mapply(function(uf, cod) {
  code_state <- uf_to_code[toupper(trimws(uf))]  # Normalizar UF
  if (is.na(code_state)) NA else paste0(code_state, cod)
}, df_filtrado$UF, df_filtrado$Cod_Munic_padded)

# Depuração: Verificar valores temporários como string
print("Primeiros valores de code_muni_temp:")
print(head(df_filtrado$code_muni_temp, n = 20))

# Converter para numeric apenas após validação
df_filtrado$code_muni <- as.numeric(df_filtrado$code_muni_temp)

# Depuração: Verificar valores de code_muni
print("Primeiros valores de code_muni:")
print(head(df_filtrado$code_muni, n = 20))
print("Valores únicos de code_muni em df_filtrado:")
print(head(unique(sort(df_filtrado$code_muni))))
print("Número de valores únicos de code_muni:")
print(length(unique(df_filtrado$code_muni)))

# Filtrar linhas com code_muni válido (não NA)
df_filtrado <- df_filtrado %>% filter(!is.na(code_muni))

# Depuração: Verificar interseção com códigos do shapefile
municipios_sample <- read_municipality(year = 2020)
print("Primeiros valores únicos de code_muni em municipios:")
print(head(unique(sort(municipios_sample$code_muni))))
print("Número de correspondências entre df_filtrado e municipios:")
print(length(intersect(df_filtrado$code_muni, municipios_sample$code_muni)))

# Carregar shapefile de municípios
municipios <- read_municipality(year = 2020)

# Unir dados ao shapefile e obter centroides
df_geo <- municipios %>%
  inner_join(df_filtrado, by = "code_muni") %>%
  st_centroid()

# Depuração: Verificar se há dados após a junção
print("Número de linhas em df_geo:")
print(nrow(df_geo))

# Garantir que cluster_euclidiana seja fator com níveis específicos
df_geo$cluster_euclidiana <- factor(df_geo$cluster_euclidiana, levels = c(1, 2, 3, 4))

# Plotar mapa com pontos coloridos por cluster
ggplot() +
  geom_sf(data = read_country(year = 2020), fill = "white") +
  geom_sf(data = df_geo, aes(color = cluster_euclidiana), size = 2, alpha = 0.7) +
  scale_color_manual(values = c("1" = "red", "2" = "blue", "3" = "green", "4" = "purple"),
                     labels = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4")) +
  theme_minimal() +
  labs(title = "Distribuição de Cooperativas por Cluster e Município (sem NA)",
       color = "Cluster Euclidiana")
ggsave("mapa_pontos_municipio_sem_na.png")

#### POR GREGIOES

library(dplyr)
library(ggplot2)
library(geobr)
library(sf)

# Carregar o DF
df_novo <- read.csv("df_novo.csv")

# Filtrar linhas sem NA em Cod_Reg_Intermed e cluster_euclidiana
df_filtrado <- df_novo %>%
  filter(!is.na(Cod_Reg_Intermed) & !is.na(cluster_euclidiana))

# Agrupar por Cod_Reg_Intermed e cluster
contagem_reg <- df_filtrado %>%
  group_by(Cod_Reg_Intermed, cluster_euclidiana) %>%
  summarise(Contagem = n()) %>%
  ungroup()

# Carregar shapefile de regiões intermediárias
regioes_intermed <- read_intermediate_region(year = 2020)

# Unir dados ao shapefile
map_data <- regioes_intermed %>%
  left_join(contagem_reg, by = c("code_intermediate" = "Cod_Reg_Intermed"))

# Plotar mapa de calor
ggplot(map_data) +
  geom_sf(aes(fill = Contagem)) +
  scale_fill_gradient(low = "lightgreen", high = "darkgreen", na.value = "gray") +
  facet_wrap(~cluster_euclidiana) +
  theme_minimal() +
  labs(title = "Distribuição de Clusters por Região Intermediária (sem NA)", fill = "Contagem")
ggsave("mapa_regioes_intermed_sem_na.png")


### NOVO
library(dplyr)
library(leaflet)
library(geobr)
library(sf)

# Carregar o DF
df_novo <- read.csv("df_novo.csv")

# Filtrar linhas sem NA em Cod_Munic, NOME_INSTITUICAO e cluster_euclidiana
df_filtrado <- df_novo %>%
  filter(!is.na(Cod_Munic) & !is.na(NOME_INSTITUICAO) & !is.na(cluster_euclidiana))

# Carregar municípios e unir
municipios <- read_municipality(year = 2020)
df_filtrado$code_muni <- as.numeric(df_filtrado$Cod_Munic)
df_geo <- municipios %>%
  inner_join(df_filtrado, by = "code_muni") %>%
  st_centroid()

# Plotar mapa interativo
leaflet(df_geo) %>%
  addTiles() %>%
  addCircleMarkers(
    color = ~factor(cluster_euclidiana),
    popup = ~paste("Nome: ", NOME_INSTITUICAO, "<br>Cluster: ", cluster_euclidiana, "<br>IFDM_Edu: ", IFDM_Edu, "<br>ROA: ", ROA_yeo),
    radius = 5
  )
getwd()

library(fmsb)

# Extrair dados de tabela_medias_euclidiana.csv
data_radar <- data.frame(
  row.names = c("1", "2", "3", "4"),
  IFDM_Emprego_Renda = c(0.541, 0.759, 0.770, 0.732),
  IFDM_Educacao = c(0.699, 0.841, 0.676, 0.879),
  VAB = c(-0.373, -0.074, -0.184, 4.014),
  ROA_yeo = c(-0.116, -0.024, -0.345, 0.143)
)

# Normalizar dados para radar
data_radar_norm <- rbind(rep(4,4), rep(-0.5,4), data_radar)  # Max e Min para escala

# Plotar radar
radarchart(data_radar_norm, pcol = c("red", "blue", "green", "purple"), plty = 1, vlcex = 0.8)
legend("topright", legend = rownames(data_radar), fill = c("red", "blue", "green", "purple"))



###############XXXXXXX
library(dplyr)
library(ggplot2)
library(tidyr)
library(gridExtra)
library(ggpubr)
library(fmsb)  # Adicionar pacote fmsb para radarchart

# Ler os arquivos
resumo_sil <- read.csv("resumo_silhouette.csv")
medias_euclid <- read.csv("tabela_medias_euclidiana.csv")
base_clusters <- read.csv("base_clusters_por_metrica.csv")

# 1. Tabela de Silhueta
resumo_sil <- resumo_sil %>% arrange(desc(mean_sil))
print("Tabela 1: Coeficientes de Silhueta por Métrica")
print(resumo_sil)

# Gráfico de Barras para Silhueta
g1 <- ggplot(resumo_sil, aes(x = reorder(metrica, -mean_sil), y = mean_sil)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Coeficientes de Silhueta por Métrica", x = "Métrica", y = "Silhueta Média") +
  theme_minimal()
ggsave("grafico_silhueta.png", g1)

# 2. Tabela de Médias por Cluster (arredondar para 3 dígitos)
medias_euclid_arred <- medias_euclid %>%
  mutate(across(where(is.numeric), ~round(., 3)))
print("Tabela 2: Médias por Cluster (Euclidiana)")
print(medias_euclid_arred)

# Gráfico de Radar para Médias (usando radarchart do fmsb)
medias_radar <- medias_euclid_arred %>%
  select(cluster, IFDM_Emprego_Renda, IFDM_Educacao, VAB, ROA_yeo, CPLA_yeo) %>%
  as.data.frame()
# Normalizar dados: adicionar max e min para radarchart
medias_radar_norm <- rbind(rep(4, 5), rep(-0.5, 5), medias_radar[, -1])  # Max 4, Min -0.5
rownames(medias_radar_norm) <- c("Max", "Min", medias_radar$cluster)
# Plotar radar
g2 <- radarchart(medias_radar_norm, axistype = 1, 
                 pcol = c("red", "blue", "green", "purple"), 
                 plwd = 2, plty = 1,
                 cglcol = "grey", cglty = 1, axislabcol = "grey", 
                 vlcex = 0.8)
legend("topright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"), 
       fill = c("red", "blue", "green", "purple"), bty = "n")
# Salvar como imagem (necessário usar png ou pdf separadamente)
png("grafico_radar_clusters.png", width = 600, height = 600)
radarchart(medias_radar_norm, axistype = 1, 
           pcol = c("red", "blue", "green", "purple"), 
           plwd = 2, plty = 1,
           cglcol = "grey", cglty = 1, axislabcol = "grey", 
           vlcex = 0.8)
legend("topright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"), 
       fill = c("red", "blue", "green", "purple"), bty = "n")
dev.off()

# 3. Tabela de Contagem por Métrica
col_clusters <- c("cluster_euclidiana", "cluster_manhattan", "cluster_minkowski_p3", "cluster_chebyshev", "cluster_canberra")
contagem_metricas <- base_clusters %>%
  select(all_of(col_clusters)) %>%
  pivot_longer(cols = everything(), names_to = "metrica", values_to = "cluster") %>%
  group_by(metrica, cluster) %>%
  summarise(Qtd = n()) %>%
  pivot_wider(names_from = cluster, values_from = Qtd, values_fill = 0)
print("Tabela 3: Contagem de Cooperativas por Cluster e Métrica")
print(contagem_metricas)

# 4. Exemplos de Cooperativas
exemplos <- base_clusters %>%
  group_by(cluster_euclidiana) %>%
  slice_head(n = 5) %>%
  select(CNPJ, IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, cluster_euclidiana)
print("Tabela 4: Exemplos de Cooperativas por Cluster")
print(exemplos)

if (!requireNamespace("png", quietly = TRUE)) install.packages("png")  # Instalar pacote se necessário
library(png)
# Salvar tudo em PDF
pdf("anexo_II_atualizado1.pdf")
print(g1)
grid.table(medias_euclid_arred)
# Para o radar, usamos uma abordagem separada pois radarchart não é ggplot
grid.newpage()
pushViewport(viewport(x = 0.5, y = 0.5))
grid.raster(readPNG("grafico_radar_clusters.png"))
popViewport()
grid.table(contagem_metricas)
grid.table(exemplos)
dev.off()


####GRAFICOS
library(dplyr)
library(fmsb)
library(png)
library(grid)

# Ler o arquivo
medias_euclid <- read.csv("tabela_medias_euclidiana.csv")

# Extrair dados e arredondar para 3 dígitos
medias_euclid_arred <- medias_euclid %>%
  mutate(across(where(is.numeric), ~round(., 3)))

# Selecionar variáveis para o radar
medias_radar <- medias_euclid_arred %>%
  select(cluster, IFDM_Emprego_Renda, IFDM_Educacao, VAB, ROA_yeo, CPLA_yeo)

# Normalizar dados: adicionar max e min com nomes de clusters preservados
max_vals <- apply(medias_radar[, -1], 2, max, na.rm = TRUE) * 1.1  # 10% acima do máximo
min_vals <- apply(medias_radar[, -1], 2, min, na.rm = TRUE) * 1.1  # 10% abaixo do mínimo
medias_radar_norm <- rbind(max_vals, min_vals, medias_radar[, -1])
rownames(medias_radar_norm) <- c("Max", "Min", paste0("Cluster ", medias_radar$cluster))

# Depuração: Verificar a ordem dos clusters
print("Ordem dos clusters no dataframe normalizado:")
print(rownames(medias_radar_norm))

# Gerar e salvar o gráfico de radar
png("grafico_radar_clusters_corrigido.png", width = 600, height = 600)
radarchart(medias_radar_norm, axistype = 1,
           pcol = c("red", "blue", "green", "purple"),
           plwd = 2, plty = 1,
           cglcol = "grey", cglty = 1, axislabcol = "grey",
           vlcex = 0.8)
legend("topright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"),
       fill = c("red", "blue", "green", "purple"), bty = "n")
dev.off()

# Ler e exibir para verificação
img <- readPNG("grafico_radar_clusters_corrigido.png")
grid.newpage()
grid.raster(img, width = 1, height = 1)


################
library(dplyr)
library(ggplot2)
library(tidyr)
library(ggradar)  # Instale com install.packages("ggradar") se necessário

# Ler o arquivo
medias_euclid <- read.csv("tabela_medias_euclidiana.csv")

# Extrair dados e arredondar para 3 dígitos
medias_euclid_arred <- medias_euclid %>%
  mutate(across(where(is.numeric), ~round(., 3)))

# Pivotar para formato longo e depois largo para ggradar
medias_long <- medias_euclid_arred %>%
  pivot_longer(cols = -cluster, names_to = "variavel", values_to = "valor") %>%
  pivot_wider(names_from = variavel, values_from = valor)

# Normalizar os dados: deslocar o mínimo para zero e escalar
normalize_data <- function(x) {
  min_val <- min(x, na.rm = TRUE)
  max_val <- max(x, na.rm = TRUE)
  (x - min_val) / (max_val - min_val) * 100  # Escala de 0 a 100
}
medias_normalized <- medias_long %>%
  mutate(across(.cols = -cluster, .fns = normalize_data))

# Depuração: Verificar a estrutura de medias_normalized
print("Estrutura de medias_normalized:")
print(str(medias_normalized))
print("Nomes das colunas em medias_normalized:")
print(names(medias_normalized))

# Ajustar axis.labels para corresponder às colunas numéricas
axis_labels <- c("IFDM_Emprego_Renda", "IFDM_Educacao", "VAB", "ROA_yeo", "CPLA_yeo")
if (length(axis_labels) != (ncol(medias_normalized) - 1)) {
  stop("Número de axis.labels não corresponde ao número de colunas numéricas. Verifique medias_normalized.")
}

# Gerar o gráfico de radar
g2 <- ggradar(medias_normalized,
              group.colours = c("red", "blue", "green", "purple"),
              axis.labels = names(medias_normalized)[-1],  # Usar nomes das colunas numéricas
              legend.title = "Clusters") +
  labs(title = "Perfil das Variáveis por Cluster (Normalizado)") +
  theme(legend.position = "right")
ggsave("grafico_radar_clusters_corrigido.png", g2, width = 8, height = 6)

# Exibir o gráfico para verificação (opcional)
print(g2)



##### GERANDO NOVAMENTE OS PCAs XXX
###OPCAO 1
# Carregar pacotes necessários
if (!requireNamespace("factoextra", quietly = TRUE)) install.packages("factoextra")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
library(factoextra)
library(ggplot2)
library(dplyr)

base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar variáveis numéricas para PCA (excluindo colunas de cluster e identificadores)
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, CPLA_yeo, ATIVOS_log,
         IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad) %>%
  na.omit()  # Remover linhas com NA, se houver

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)  # Escala os dados para unit variance

# Definir função para plotar PCA por métrica
plot_pca_by_metric <- function(data, cluster_col, metric_name) {
  # Extrair componentes principais
  pca_scores <- as.data.frame(pca_result$x[, 1:2])  # PC1 e PC2
  pca_scores$cluster <- data[[cluster_col]]  # Adicionar coluna de cluster
  
  # Depuração: Verificar valores de cluster
  print(paste("Valores únicos de", cluster_col, ":"))
  print(unique(pca_scores$cluster))
  
  # Plotar com factoextra para visualização inicial
  p <- fviz_pca_ind(pca_result,
                    habillage = pca_scores$cluster,
                    palette = c("red", "blue", "green", "purple"),
                    ggtheme = theme_minimal(),
                    title = paste("PCA - Clusters por", metric_name)) +
    labs(color = "Cluster")
  
  # Salvar gráfico
  ggsave(paste0("pca_", tolower(gsub(" ", "_", metric_name)), ".png"),
         p, width = 8, height = 6)
  
  return(p)
}

# Gerar gráficos para cada métrica
metrics <- c("cluster_euclidiana" = "Euclidiana",
             "cluster_manhattan" = "Manhattan",
             "cluster_minkowski_p3" = "Minkowski p=3",
             "cluster_chebyshev" = "Chebyshev",
             "cluster_canberra" = "Canberra")

for (metric_col in names(metrics)) {
  plot_pca_by_metric(base_clusters, metric_col, metrics[metric_col])
}

# Exibir os gráficos (opcional, para verificação no RStudio)
for (metric_col in names(metrics)) {
  p <- plot_pca_by_metric(base_clusters, metric_col, metrics[metric_col])
  print(p)
}


#####OPCAO 2
library(dplyr)
library(factoextra)
library(ggplot2)

# Ler o arquivo
base_clusters <- read.csv("base_clusters_por_metrica.csv")

# Selecionar variáveis para PCA
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)

# Plotar biplot com clusters (para Euclidiana)
p <- fviz_pca_biplot(pca_result,
                     habillage = base_clusters$cluster_euclidiana,
                     palette = c("red", "blue", "green", "purple"),
                     geom.ind = "point",  # Pontos para observações
                     geom.var = "arrow",  # Setas para variáveis
                     label = "var",  # Rótulos para variáveis
                     ggtheme = theme_minimal(),
                     title = "Biplot PCA - Clusters por Euclidiana")
ggsave("pca_biplot_euclidiana.png", p, width = 8, height = 6)
print(p)  # Exibir no RStudio

###OPCAO 3
library(dplyr)
library(factoextra)
library(ggplot2)

# Ler o arquivo
base_clusters <- read.csv("base_clusters_por_metrica.csv")

# Selecionar variáveis para PCA
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)

# Plotar scatter com ellipses
p <- fviz_pca_ind(pca_result,
                  habillage = base_clusters$cluster_euclidiana,
                  palette = c("red", "blue", "green", "purple"),
                  addEllipses = TRUE,  # Adicionar ellipses
                  ellipse.type = "confidence",  # Ellipses de confiança
                  ellipse.level = 0.95,  # 95%
                  ggtheme = theme_minimal(),
                  title = "PCA - Clusters por Euclidiana com Ellipses")
ggsave("pca_ellipses_euclidiana.png", p, width = 8, height = 6)
print(p)  # Exibir no RStudio

##### OPCAO 4
library(dplyr)
library(factoextra)
library(ggplot2)

# Ler o arquivo
base_clusters <- read.csv("base_clusters_por_metrica.csv")

# Selecionar variáveis para PCA
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)

# Plotar scree plot
p <- fviz_screeplot(pca_result, addlabels = TRUE, barfill = "skyblue", barcolor = "blue") +
  labs(title = "Scree Plot - Variância Explicada por Componente") +
  theme_minimal()
ggsave("pca_scree_plot.png", p, width = 8, height = 6)
print(p)  # Exibir no RStudio

####OPCAO 5
library(dplyr)
library(factoextra)
library(ggplot2)
library(reshape2)

# Ler o arquivo
base_clusters <- read.csv("base_clusters_por_metrica.csv")

# Selecionar variáveis para PCA
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)

# Extrair loadings e criar heatmap
loadings <- as.data.frame(pca_result$rotation[, 1:2])  # PC1 e PC2
loadings$var <- rownames(loadings)
loadings_long <- melt(loadings, id.vars = "var")

p <- ggplot(loadings_long, aes(x = variable, y = var, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) +
  labs(title = "Heatmap de Loadings da PCA (PC1 e PC2)", x = "Componente Principal", y = "Variável", fill = "Loading") +
  theme_minimal()
ggsave("pca_heatmap_loadings.png", p, width = 8, height = 6)
print(p)  # Exibir no RStudio


###OPCAO 6
library(dplyr)
library(factoextra)
library(ggplot2)

# Ler o arquivo
base_clusters <- read.csv("base_clusters_por_metrica.csv")

# Selecionar variáveis para PCA (opção de incluir padronizadas ou todas)
 # pca_data <- base_clusters %>%
 #  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, CPLA_yeo, ATIVOS_log,
 #         IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad) %>%  # Inclui padronizadas
 #   na.omit()

pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, CPLA_yeo, ATIVOS_log,
         ) %>%  # Inclui padronizadas
  na.omit()

# Depuração: Verificar as primeiras linhas dos dados
print("Primeiras linhas dos dados para PCA:")
print(head(pca_data))

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)  # Escala para variância unitária
print("Variância explicada por componente:")
print(summary(pca_result)$importance[2, 1:2])  # PC1 e PC2

# Plotar biplot com clusters (exemplo com Euclidiana)
p <- fviz_pca_biplot(pca_result,
                     habillage = base_clusters$cluster_euclidiana,
                     palette = c("red", "blue", "green", "purple"),
                     geom.ind = "point",
                     geom.var = "arrow",
                     label = "var",
                     ggtheme = theme_minimal(),
                     title = "Biplot PCA - Clusters por Euclidiana") +
  labs(color = "Cluster") +
  theme(legend.position = "right")

# Salvar e exibir
ggsave("pca_biplot_euclidiana.png", p, width = 8, height = 6, dpi = 300)
print(p)

# Comparar com outra métrica (ex.: Chebyshev)
p_chebyshev <- fviz_pca_biplot(pca_result,
                               habillage = base_clusters$cluster_chebyshev,
                               palette = c("red", "blue", "green", "purple"),
                               geom.ind = "point",
                               geom.var = "arrow",
                               label = "var",
                               ggtheme = theme_minimal(),
                               title = "Biplot PCA - Clusters por Chebyshev")
ggsave("pca_biplot_chebyshev.png", p_chebyshev, width = 8, height = 6, dpi = 300)
print(p_chebyshev)

##### OPCAO NOVA 7
library(dplyr)
library(factoextra)
library(ggplot2)

# Definir seed para reprodutibilidade
set.seed(123)  # Fixa a aleatoriedade

# Ler o arquivo
base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar variáveis para PCA
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Depuração: Verificar consistência dos dados
print("Número de linhas após na.omit:")
print(nrow(pca_data))
print("Primeiras linhas dos dados para PCA:")
print(head(pca_data))

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)
print("Variância explicada por PC1 e PC2:")
print(summary(pca_result)$importance[2, 1:2])

# Função para gerar biplot para Euclidiana com timestamp
generate_pca_biplot_euclidiana <- function(data, metric_col, metric_name, timestamp) {
  # Extrair componentes principais
  pca_scores <- as.data.frame(pca_result$x[, 1:2])  # PC1 e PC2
  pca_scores$cluster <- data[[metric_col]]  # Adicionar coluna de cluster
  
  # Depuração: Verificar distribuição dos clusters
  print(paste("Distribuição de clusters para", metric_name, ":"))
  print(table(pca_scores$cluster))
  
  # Plotar biplot com labels nas flechas
  p <- fviz_pca_biplot(pca_result,
                       habillage = pca_scores$cluster,
                       palette = c("red", "blue", "green", "purple"),
                       geom.ind = "point",
                       geom.var = "arrow",
                       label = "var",  # Labels nas flechas das variáveis
                       ggtheme = theme_minimal(),
                       title = paste("Biplot PCA - Clusters por", metric_name)) +
    labs(color = "Cluster") +
    theme(legend.position = "right")
  
  # Salvar o gráfico com timestamp para evitar sobrescrição
  filename <- paste0("pca_biplot_", tolower(gsub(" ", "_", metric_name)), "_", timestamp, ".png")
  ggsave(filename, p, width = 8, height = 6, dpi = 300)
  
  return(p)
}

# Obter timestamp
timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")

# Gerar dois gráficos Euclidiana com timestamps diferentes para comparação
p1 <- generate_pca_biplot_euclidiana(base_clusters, "cluster_euclidiana", "Euclidiana", paste0(timestamp, "_1"))
p2 <- generate_pca_biplot_euclidiana(base_clusters, "cluster_euclidiana", "Euclidiana", paste0(timestamp, "_2"))

# Exibir os gráficos no RStudio
print(p1)
print(p2)


###NOVA ANALISE PCA
library(dplyr)
library(factoextra)
library(ggplot2)

# Definir seed para reprodutibilidade
set.seed(123)

# Ler o arquivo
base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar apenas variáveis padronizadas para PCA (evitar duplicação)
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Depuração: Verificar consistência dos dados
print("Número de linhas após na.omit:")
print(nrow(pca_data))
print("Primeiras linhas dos dados para PCA:")
print(head(pca_data))

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)
print("Variância explicada por PC1 e PC2:")
print(summary(pca_result)$importance[2, 1:2])

# Função para gerar biplot para Euclidiana com timestamp
generate_pca_biplot_euclidiana <- function(data, metric_col, metric_name, timestamp) {
  # Extrair componentes principais
  pca_scores <- as.data.frame(pca_result$x[, 1:2])  # PC1 e PC2
  pca_scores$cluster <- data[[metric_col]]  # Adicionar coluna de cluster
  
  # Depuração: Verificar distribuição dos clusters
  print(paste("Distribuição de clusters para", metric_name, ":"))
  print(table(pca_scores$cluster))
  
  # Plotar biplot com labels nas flechas
  p <- fviz_pca_biplot(pca_result,
                       habillage = pca_scores$cluster,
                       palette = c("red", "blue", "green", "purple"),
                       geom.ind = "point",
                       geom.var = "arrow",
                       label = "var",  # Labels nas flechas das variáveis
                       ggtheme = theme_minimal(),
                       title = paste("Biplot PCA - Clusters por", metric_name)) +
    labs(color = "Cluster") +
    theme(legend.position = "right")
  
  # Salvar o gráfico com timestamp
  filename <- paste0("pca_biplot_", tolower(gsub(" ", "_", metric_name)), "_", timestamp, ".png")
  ggsave(filename, p, width = 8, height = 6, dpi = 300)
  
  return(p)
}

# Obter timestamp
timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")

# Gerar dois gráficos Euclidiana para comparação
p1 <- generate_pca_biplot_euclidiana(base_clusters, "cluster_euclidiana", "Euclidiana", paste0(timestamp, "_1"))
p2 <- generate_pca_biplot_euclidiana(base_clusters, "cluster_euclidiana", "Euclidiana", paste0(timestamp, "_2"))

# Exibir os gráficos no RStudio
print(p1)
print(p2)


### OUTRO TESTE 8 


#### o utiliado em 14/08

library(dplyr)
library(factoextra)
library(ggplot2)

# Definir seed para reprodutibilidade
set.seed(123)

# Ler o arquivo
base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar variáveis para PCA
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log_pad) %>%
  na.omit()

# Depuração: Verificar consistência dos dados
print("Número de linhas após na.omit:")
print(nrow(pca_data))
print("Primeiras linhas dos dados para PCA:")
print(head(pca_data))

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)
print("Variância explicada por PC1 e PC2:")
print(summary(pca_result)$importance[2, 1:2])

# Depuração: Verificar loadings das variáveis
print("Loadings das variáveis para PC1 e PC2:")
print(pca_result$rotation[, 1:2])

# Função para gerar biplot para cada métrica com rótulos legíveis nas setas
generate_pca_biplot <- function(data, metric_col, metric_name, timestamp) {
  # Extrair componentes principais
  pca_scores <- as.data.frame(pca_result$x[, 1:2])  # PC1 e PC2
  pca_scores$cluster <- data[[metric_col]]  # Adicionar coluna de cluster
  
  # Depuração: Verificar distribuição dos clusters
  print(paste("Distribuição de clusters para", metric_name, ":"))
  print(table(pca_scores$cluster))
  
  # Definir rótulos personalizados para as variáveis
  var_labels <- c("IFDM_Emp_Renda_pad" = "Emprego",
                  "IFDM_Edu_pad" = "Educação",
                  "VAB_pad" = "VAB",
                  "ROA_yeo" = "ROA",
                  "CPLA_yeo" = "CPLA",
                  "ATIVOS_log" = "Ativos")
  
  # Extrair loadings para posicionamento dinâmico
  loadings_df <- as.data.frame(pca_result$rotation[, 1:2]) %>%
    mutate(var = rownames(.)) %>%
    filter(var %in% names(var_labels))
  
  # Filtrar loadings para variáveis exceto "IFDM_Edu_pad"
  other_loadings <- loadings_df %>% filter(var != "IFDM_Edu_pad")
  
  # Plotar biplot com rótulos personalizados nas flechas
  p <- fviz_pca_biplot(pca_result,
                       habillage = pca_scores$cluster,
                       palette = c("red", "green", "blue", "purple"),  # 1=red, 2=green, 3=blue, 4=purple
                       geom.ind = "point",
                       geom.var = "arrow",
                       label = "var",
                       labelsize = 5,
                       alpha.var = 1,
                       ggtheme = theme_minimal(),
                       title = paste("Biplot PCA - Clusters por", metric_name)) +
    labs(color = "Cluster") +
    theme(legend.position = "right")
  
  # Adicionar rótulos para variáveis exceto "Educação Pad"
  p <- p + geom_text(data = other_loadings,
                     aes(x = PC1 * 7, y = PC2 * 7, label = var_labels[var]),
                     size = 4.5,
                     angle = 0,
                     vjust = ifelse(other_loadings$PC2 > 0, -0.5, 1.5),
                     hjust = ifelse(other_loadings$PC1 > 0, -0.5, 1.5),
                     check_overlap = TRUE)
  
  # Adicionar rótulo "Educação Pad" no centro da seta
  edu_loading <- loadings_df %>% filter(var == "IFDM_Edu_pad")
  p <- p + geom_text(data = edu_loading,
                     aes(x = PC1 * 0.5, y = PC2 * 0.5, label = var_labels[var]),  # Posicionar no centro
                     size = 4.5,
                     angle = 0,
                     vjust = 0,  # Centralizar verticalmente
                     hjust = 0.5,  # Centralizar horizontalmente
                     check_overlap = TRUE)
  
  # Salvar o gráfico com timestamp
  filename <- paste0("pca_biplot_", tolower(gsub(" ", "_", metric_name)), "_", timestamp, ".png")
  ggsave(filename, p, width = 12, height = 10, dpi = 300)
  
  return(p)
}

# Obter timestamp
timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")

# Gerar gráficos para todas as distâncias
metrics <- list("Euclidiana" = "cluster_euclidiana",
                "Manhattan" = "cluster_manhattan",
                "Minkowski p=3" = "cluster_minkowski_p3",
                "Chebyshev" = "cluster_chebyshev",
                "Canberra" = "cluster_canberra")

for (metric_name in names(metrics)) {
  metric_col <- metrics[[metric_name]]
  p <- generate_pca_biplot(base_clusters, metric_col, metric_name, timestamp)
  print(p)  # Exibir no RStudio
}




#### CRIACAO DE TABELA COM VAR PADRINIZADAS
library(dplyr)
library(factoextra)
library(ggplot2)
library(cluster)

# Definir seed para reprodutibilidade
set.seed(123)

# Ler o arquivo
base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar variáveis padronizadas para clusterização
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log_pad) %>%
  na.omit()

# Depuração: Verificar escala dos dados
print("Média e desvio padrão das variáveis padronizadas:")
print(sapply(pca_data, function(x) c(mean = mean(x), sd = sd(x))))

# Realizar clusterização K-means com 3 clusters usando distância Euclidiana
kmeans_3 <- kmeans(pca_data, centers = 3, nstart = 25)
base_clusters$cluster_euclidiana_3 <- kmeans_3$cluster

# Calcular médias padronizadas por cluster
pca_summary_3 <- base_clusters %>%
  group_by(cluster_euclidiana_3) %>%
  summarise(across(all_of(c("IFDM_Emp_Renda_pad", "IFDM_Edu_pad", "VAB_pad", "ROA_yeo", "CPLA_yeo", "ATIVOS_log")), mean, na.rm = TRUE)) %>%
  mutate(Métrica = "Euclidiana (3 clusters)") %>%
  rename(Cluster = cluster_euclidiana_3)

# Renomear colunas para legibilidade
colnames(pca_summary_3)[2:7] <- c("IFDM Emp & Renda", "IFDM Educação", "VAB", "ROA", "CPLA", "Ativos Totais")

# Arredondar para 3 casas decimais
pca_summary_3 <- pca_summary_3 %>%
  mutate(across(where(is.numeric), ~round(., 3)))

# Exibir a tabela
print("Tabela de Médias Padronizadas com 3 Clusters:")
print(pca_summary_3)

# Salvar como CSV
write.csv(pca_summary_3, "tabela_pca_padronizada_3clusters.csv", row.names = FALSE)

# Gerar biplot para 3 clusters
pca_result <- prcomp(pca_data, scale. = FALSE)  # Já padronizado, scale. = FALSE
pca_scores <- as.data.frame(pca_result$x[, 1:2])
pca_scores$cluster <- kmeans_3$cluster

p <- fviz_pca_biplot(pca_result,
                     habillage = pca_scores$cluster,
                     palette = c("red", "green", "blue"),  # 3 clusters: 1=red, 2=green, 3=blue
                     geom.ind = "point",
                     geom.var = "arrow",
                     label = "var",
                     labelsize = 5,
                     alpha.var = 1,
                     ggtheme = theme_minimal(),
                     title = "Biplot PCA - Clusters por Euclidiana (3 Clusters)") +
  labs(color = "Cluster") +
  theme(legend.position = "right") +
  geom_text(data = as.data.frame(pca_result$rotation[, 1:2]) %>%
              mutate(var = rownames(.)),
            aes(x = PC1 * 7, y = PC2 * 7, label = var),
            size = 4.5,
            vjust = ifelse(pca_result$rotation[, 2] > 0, -0.5, 1.5),
            hjust = ifelse(pca_result$rotation[, 1] > 0, -0.5, 1.5),
            check_overlap = TRUE)

ggsave("pca_biplot_euclidiana_3clusters.png", p, width = 12, height = 10, dpi = 300)


########geRANDO CLUSTER COM 3 PARA TESTAR

#pca_pam_out/

library(dplyr)
library(factoextra)
library(ggplot2)
library(cluster)

# Definir seed para reprodutibilidade
set.seed(123)

# Ler o arquivo
base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar variáveis padronizadas para clusterização (incluir ATIVOS_log_pad)
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Padronizar ATIVOS_log separadamente
base_clusters$ATIVOS_log_pad <- scale(base_clusters$ATIVOS_log)[, 1]

# Depuração: Verificar escala dos dados
print("Média e desvio padrão das variáveis padronizadas:")
print(sapply(pca_data[, 1:5], function(x) c(mean = mean(x), sd = sd(x))))  # Excluir ATIVOS_log bruto
print("Média e desvio padrão de ATIVOS_log_pad:")
print(c(mean = mean(base_clusters$ATIVOS_log_pad, na.rm = TRUE), sd = sd(base_clusters$ATIVOS_log_pad, na.rm = TRUE)))

# Realizar clusterização PAM com 3 clusters usando distância Euclidiana
pam_3 <- pam(pca_data[, 1:5], k = 3, metric = "euclidean")  # Usar apenas variáveis padronizadas
base_clusters$cluster_euclidiana_3 <- pam_3$clustering

# Depuração: Verificar contagem de clusters
print("Contagem de observações por cluster:")
print(table(pam_3$clustering))

# Calcular médias padronizadas por cluster (incluir ATIVOS_log_pad)
pca_summary_3 <- base_clusters %>%
  group_by(cluster_euclidiana_3) %>%
  summarise(across(all_of(c("IFDM_Emp_Renda_pad", "IFDM_Edu_pad", "VAB_pad", "ROA_yeo", "CPLA_yeo", "ATIVOS_log_pad")), mean, na.rm = TRUE)) %>%
  mutate(Métrica = "Euclidiana (3 clusters)") %>%
  rename(Cluster = cluster_euclidiana_3)

# Renomear colunas para legibilidade
colnames(pca_summary_3)[2:7] <- c("IFDM Emp & Renda", "IFDM Educação", "VAB", "ROA", "CPLA", "Ativos Totais")

# Arredondar para 3 casas decimais
pca_summary_3 <- pca_summary_3 %>%
  mutate(across(where(is.numeric), ~round(., 3)))

# Exibir a tabela
print("Tabela de Médias Padronizadas com 3 Clusters (PAM):")
print(pca_summary_3)

# Salvar como CSV
write.csv(pca_summary_3, "tabela_pca_padronizada_3clusters_pam.csv", row.names = FALSE)

# Gerar biplot para 3 clusters
pca_result <- prcomp(pca_data[, 1:5], scale. = FALSE)  # Usar mesmas variáveis da clusterização
pca_scores <- as.data.frame(pca_result$x[, 1:2])
pca_scores$cluster <- pam_3$clustering

p <- fviz_pca_biplot(pca_result,
                     habillage = pca_scores$cluster,
                     palette = c("red", "green", "blue"),  # 3 clusters: 1=red, 2=green, 3=blue
                     geom.ind = "point",
                     geom.var = "arrow",
                     label = "var",
                     labelsize = 5,
                     alpha.var = 1,
                     ggtheme = theme_minimal(),
                     title = "Biplot PCA - Clusters por Euclidiana (3 Clusters com PAM)") +
  labs(color = "Cluster") +
  theme(legend.position = "right") +
  geom_text(data = as.data.frame(pca_result$rotation[, 1:2]) %>%
              mutate(var = rownames(.)),
            aes(x = PC1 * 7, y = PC2 * 7, label = var),
            size = 4.5,
            vjust = ifelse(pca_result$rotation[, 2] > 0, -0.5, 1.5),
            hjust = ifelse(pca_result$rotation[, 1] > 0, -0.5, 1.5),
            check_overlap = TRUE)

ggsave("pca_biplot_euclidiana_3clusters_pam.png", p, width = 12, height = 10, dpi = 300)



###resolvendo o problema visual do Biplot com 3 cluster


#pca_pam_out/

library(dplyr)
library(factoextra)
library(ggplot2)
library(cluster)

# Definir seed para reprodutibilidade
set.seed(123)

# Ler o arquivo
base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar variáveis padronizadas para clusterização
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Padronizar ATIVOS_log separadamente
base_clusters$ATIVOS_log_pad <- scale(base_clusters$ATIVOS_log)[, 1]

# Remover outliers potenciais em ROA_yeo (> 5 ou < -5)
outlier_indices <- which(pca_data$ROA_yeo > 5 | pca_data$ROA_yeo < -5)
if (length(outlier_indices) > 0) {
  pca_data <- pca_data[-outlier_indices, ]
  base_clusters <- base_clusters[-outlier_indices, ]  # Sincronizar base_clusters
}

# Depuração: Verificar escala dos dados
print("Média e desvio padrão das variáveis padronizadas:")
print(sapply(pca_data[, 1:5], function(x) c(mean = mean(x), sd = sd(x))))  # Excluir ATIVOS_log bruto
print("Média e desvio padrão de ATIVOS_log_pad:")
print(c(mean = mean(base_clusters$ATIVOS_log_pad, na.rm = TRUE), sd = sd(base_clusters$ATIVOS_log_pad, na.rm = TRUE)))

# Realizar clusterização PAM com 3 clusters usando distância Euclidiana
pam_3 <- pam(pca_data[, 1:5], k = 3, metric = "euclidean")
base_clusters$cluster_euclidiana_3 <- pam_3$clustering  # Agora com o mesmo número de linhas

# Depuração: Verificar contagem de clusters
print("Contagem de observações por cluster:")
print(table(pam_3$clustering))

# Identificar dados do Cluster 3
cluster_3_data <- base_clusters[base_clusters$cluster_euclidiana_3 == 3, ]
print("Dados do Cluster 3 após remoção de outliers:")
print(cluster_3_data[, c("IFDM_Emp_Renda_pad", "IFDM_Edu_pad", "VAB_pad", "ROA_yeo", "CPLA_yeo", "ATIVOS_log_pad")])

# Calcular médias padronizadas por cluster (incluir ATIVOS_log_pad)
pca_summary_3 <- base_clusters %>%
  group_by(cluster_euclidiana_3) %>%
  summarise(across(all_of(c("IFDM_Emp_Renda_pad", "IFDM_Edu_pad", "VAB_pad", "ROA_yeo", "CPLA_yeo", "ATIVOS_log_pad")), mean, na.rm = TRUE)) %>%
  mutate(Métrica = "Euclidiana (3 clusters)") %>%
  rename(Cluster = cluster_euclidiana_3)

# Renomear colunas para legibilidade
colnames(pca_summary_3)[2:7] <- c("IFDM Emp & Renda", "IFDM Educação", "VAB", "ROA", "CPLA", "Ativos Totais")

# Arredondar para 3 casas decimais
pca_summary_3 <- pca_summary_3 %>%
  mutate(across(where(is.numeric), ~round(., 3)))

# Exibir a tabela
print("Tabela de Médias Padronizadas com 3 Clusters (PAM após remoção de outliers):")
print(pca_summary_3)

# Salvar como CSV
write.csv(pca_summary_3, "tabela_pca_padronizada_3clusters_pam_no_outliers.csv", row.names = FALSE)

# Gerar biplot para 3 clusters
pca_result <- prcomp(pca_data[, 1:5], scale. = FALSE)
pca_scores <- as.data.frame(pca_result$x[, 1:2])
pca_scores$cluster <- pam_3$clustering

p <- fviz_pca_biplot(pca_result,
                     habillage = pca_scores$cluster,
                     palette = c("red", "green", "blue"),  # 3 clusters: 1=red, 2=green, 3=blue
                     geom.ind = "point",
                     geom.var = "arrow",
                     label = "var",
                     labelsize = 5,
                     alpha.var = 1,
                     ggtheme = theme_minimal(),
                     title = "Biplot PCA - Clusters por Euclidiana (3 Clusters com PAM, sem outliers)") +
  labs(color = "Cluster") +
  theme(legend.position = "right") +
  geom_text(data = as.data.frame(pca_result$rotation[, 1:2]) %>%
              mutate(var = rownames(.)),
            aes(x = PC1 * 7, y = PC2 * 7, label = var),
            size = 4.5,
            vjust = ifelse(pca_result$rotation[, 2] > 0, -0.5, 1.5),
            hjust = ifelse(pca_result$rotation[, 1] > 0, -0.5, 1.5),
            check_overlap = TRUE)

ggsave("pca_biplot_euclidiana_3clusters_pam_no_outliers.png", p, width = 12, height = 10, dpi = 300)

###procurando o outlier do cluster 2

library(dplyr)
library(factoextra)
library(ggplot2)
library(cluster)

# Definir seed para reprodutibilidade
set.seed(123)

# Ler o arquivo
base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar variáveis padronizadas para clusterização
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log) %>%
  na.omit()

# Padronizar ATIVOS_log separadamente
base_clusters$ATIVOS_log_pad <- scale(base_clusters$ATIVOS_log)[, 1]

# Remover outliers potenciais em ROA_yeo (> 5 ou < -5) e o caso específico da linha 322
outlier_indices <- which(pca_data$ROA_yeo > 5 | pca_data$ROA_yeo < -5 | rownames(pca_data) == "322")
if (length(outlier_indices) > 0) {
  pca_data <- pca_data[-outlier_indices, ]
  base_clusters <- base_clusters[-outlier_indices, ]  # Sincronizar base_clusters
}

# Depuração: Verificar escala dos dados
print("Média e desvio padrão das variáveis padronizadas:")
print(sapply(pca_data[, 1:5], function(x) c(mean = mean(x), sd = sd(x))))  # Excluir ATIVOS_log bruto
print("Média e desvio padrão de ATIVOS_log_pad:")
print(c(mean = mean(base_clusters$ATIVOS_log_pad, na.rm = TRUE), sd = sd(base_clusters$ATIVOS_log_pad, na.rm = TRUE)))

# Realizar clusterização PAM com 3 clusters usando distância Euclidiana
pam_3 <- pam(pca_data[, 1:5], k = 3, metric = "euclidean")
base_clusters$cluster_euclidiana_3 <- pam_3$clustering

# Depuração: Verificar contagem de clusters
print("Contagem de observações por cluster:")
print(table(pam_3$clustering))

# Calcular médias padronizadas por cluster (incluir ATIVOS_log_pad)
pca_summary_3 <- base_clusters %>%
  group_by(cluster_euclidiana_3) %>%
  summarise(across(all_of(c("IFDM_Emp_Renda_pad", "IFDM_Edu_pad", "VAB_pad", "ROA_yeo", "CPLA_yeo", "ATIVOS_log_pad")), mean, na.rm = TRUE)) %>%
  mutate(Métrica = "Euclidiana (3 clusters)") %>%
  rename(Cluster = cluster_euclidiana_3)

# Renomear colunas para legibilidade
colnames(pca_summary_3)[2:7] <- c("IFDM Emp & Renda", "IFDM Educação", "VAB", "ROA", "CPLA", "Ativos Totais")

# Arredondar para 3 casas decimais
pca_summary_3 <- pca_summary_3 %>%
  mutate(across(where(is.numeric), ~round(., 3)))

# Exibir a tabela
print("Tabela de Médias Padronizadas com 3 Clusters (PAM após remoção de outliers):")
print(pca_summary_3)

# Salvar como CSV
write.csv(pca_summary_3, "tabela_pca_padronizada_3clusters_pam_no_outliers.csv", row.names = FALSE)
getwd()
# Gerar biplot para 3 clusters e exibir no Plots do RStudio
pca_result <- prcomp(pca_data[, 1:5], scale. = FALSE)
pca_scores <- as.data.frame(pca_result$x[, 1:2])
pca_scores$cluster <- pam_3$clustering

p <- fviz_pca_biplot(pca_result,
                     habillage = pca_scores$cluster,
                     palette = c("red", "green", "blue"),  # 3 clusters: 1=red, 2=green, 3=blue
                     geom.ind = "point",
                     geom.var = "arrow",
                     label = "var",
                     labelsize = 6,  # Aumentar tamanho dos rótulos
                     alpha.var = 1,
                     ggtheme = theme_minimal(),
                     title = "Biplot PCA - Clusters por Euclidiana (3 Clusters com PAM)") +
  labs(color = "Cluster") +
  theme(legend.position = "right") +
  geom_text(data = as.data.frame(pca_result$rotation[, 1:2]) %>%
              mutate(var = rownames(.)),
            aes(x = PC1 * 4, y = PC2 * 4, label = var),  # Reduzir escalonamento
            size = 5,  # Aumentar tamanho do texto
            angle = 0,
            vjust = ifelse(pca_result$rotation[, 2] > 0, -0.5, 1.5),
            hjust = ifelse(pca_result$rotation[, 1] > 0, -0.5, 1.5),
            check_overlap = TRUE) +
  coord_cartesian(xlim = c(-10, 10), ylim = c(-10, 10))  # Definir limites para garantir visibilidade

# Exibir o gráfico no Plots do RStudio
print(p)  # Garante que o gráfico apareça no painel Plots

# Opcional: Salvar como PNG para o Word
ggsave("pca_biplot_euclidiana_3clusters_pam_no_outliers.png", p, width = 14, height = 12, dpi = 300)


#####gerando com k-means com 3 cluster

library(dplyr)
library(factoextra)
library(ggplot2)
library(cluster)

# Definir seed para reprodutibilidade
set.seed(123)

# Ler o arquivo
base_clusters <- read.csv("pca_pam_out/base_clusters_por_metrica.csv")

# Selecionar variáveis padronizadas para clusterização
pca_data <- base_clusters %>%
  select(IFDM_Emp_Renda_pad, IFDM_Edu_pad, VAB_pad, ROA_yeo, CPLA_yeo, ATIVOS_log_pad) %>%
  na.omit()

# Remover outliers potenciais em ROA_yeo (> 5 ou < -5) e o caso específico da linha 322
outlier_indices <- which(pca_data$ROA_yeo > 5 | pca_data$ROA_yeo < -5 | rownames(pca_data) == "322")
if (length(outlier_indices) > 0) {
  pca_data <- pca_data[-outlier_indices, ]
  base_clusters <- base_clusters[-outlier_indices, ]  # Sincronizar base_clusters
}

# Depuração: Verificar consistência dos dados
print("Número de linhas após na.omit e remoção de outliers:")
print(nrow(pca_data))
print("Primeiras linhas dos dados para PCA:")
print(head(pca_data))

# Realizar PCA
pca_result <- prcomp(pca_data, scale. = TRUE)
print("Variância explicada por PC1 e PC2:")
print(summary(pca_result)$importance[2, 1:2])

# Depuração: Verificar loadings das variáveis
print("Loadings das variáveis para PC1 e PC2:")
print(pca_result$rotation[, 1:2])

# Realizar clusterização K-means com 3 clusters usando distância Euclidiana
kmeans_3 <- kmeans(pca_data, centers = 3, nstart = 50)
base_clusters$cluster_euclidiana_3 <- kmeans_3$cluster

# Depuração: Verificar distribuição dos clusters
print("Distribuição de clusters para 3 clusters:")
print(table(kmeans_3$cluster))

# Calcular médias padronizadas por cluster
pca_summary_3 <- base_clusters %>%
  group_by(cluster_euclidiana_3) %>%
  summarise(across(all_of(c("IFDM_Emp_Renda_pad", "IFDM_Edu_pad", "VAB_pad", "ROA_yeo", "CPLA_yeo", "ATIVOS_log_pad")), mean, na.rm = TRUE)) %>%
  mutate(Métrica = "Euclidiana (3 clusters)") %>%
  rename(Cluster = cluster_euclidiana_3)

# Renomear colunas para legibilidade
colnames(pca_summary_3)[2:7] <- c("IFDM Emp & Renda", "IFDM Educação", "VAB", "ROA", "CPLA", "Ativos Totais")

# Arredondar para 3 casas decimais
pca_summary_3 <- pca_summary_3 %>%
  mutate(across(where(is.numeric), ~round(., 3)))

# Exibir a tabela
print("Tabela de Médias Padronizadas com 3 Clusters (K-means após remoção de outliers):")
print(pca_summary_3)

# Salvar como CSV
write.csv(pca_summary_3, "tabela_pca_padronizada_3clusters_kmeans_no_outliers.csv", row.names = FALSE)

# Função para gerar biplot (mesmo modelo dos 4 clusters)
generate_pca_biplot <- function(pca_result, cluster_data, metric_name, timestamp) {
  var_labels <- c("IFDM_Emp_Renda_pad" = "Emprego",
                  "IFDM_Edu_pad" = "Educação",
                  "VAB_pad" = "VAB",
                  "ROA_yeo" = "ROA",
                  "CPLA_yeo" = "CPLA",
                  "ATIVOS_log_pad" = "Ativos")
  
  loadings_df <- as.data.frame(pca_result$rotation[, 1:2]) %>%
    mutate(var = rownames(.)) %>%
    filter(var %in% names(var_labels))
  
  # Filtrar loadings para variáveis exceto "IFDM_Edu_pad"
  other_loadings <- loadings_df %>% filter(var != "IFDM_Edu_pad")
  
  # Plotar biplot com rótulos personalizados nas flechas
  p <- fviz_pca_biplot(pca_result,
                       habillage = cluster_data$cluster,
                       palette = c("red", "green", "blue"),  # 3 clusters: 1=red, 2=green, 3=blue
                       geom.ind = "point",
                       geom.var = "arrow",
                       label = "var",
                       labelsize = 5,
                       alpha.var = 1,
                       ggtheme = theme_minimal(),
                       title = paste("Biplot PCA - Clusters por", metric_name)) +
    labs(color = "Cluster") +
    theme(legend.position = "right")
  
  # Adicionar rótulos para variáveis exceto "Educação"
  p <- p + geom_text(data = other_loadings,
                     aes(x = PC1 * 7, y = PC2 * 7, label = var_labels[var]),
                     size = 4.5,
                     angle = 0,
                     vjust = ifelse(other_loadings$PC2 > 0, -0.5, 1.5),
                     hjust = ifelse(other_loadings$PC1 > 0, -0.5, 1.5),
                     check_overlap = TRUE)
  
  # Adicionar rótulo "Educação" no centro da seta
  edu_loading <- loadings_df %>% filter(var == "IFDM_Edu_pad")
  p <- p + geom_text(data = edu_loading,
                     aes(x = PC1 * 0.5, y = PC2 * 0.5, label = var_labels[var]),  # Posicionar no centro
                     size = 4.5,
                     angle = 0,
                     vjust = 0,  # Centralizar verticalmente
                     hjust = 0.5,  # Centralizar horizontalmente
                     check_overlap = TRUE)
  
  # Salvar o gráfico com timestamp
  filename <- paste0("pca_biplot_", tolower(gsub(" ", "_", metric_name)), "_", timestamp, ".png")
  ggsave(filename, p, width = 12, height = 10, dpi = 300)
  
  return(p)
}

# Gerar e exibir o biplot no Plots do RStudio
pca_result <- prcomp(pca_data, scale. = TRUE)
pca_scores <- as.data.frame(pca_result$x[, 1:2])
pca_scores$cluster <- kmeans_3$cluster

p <- generate_pca_biplot(pca_result, pca_scores, "Euclidiana (3 Clusters com K-means)", format(Sys.time(), "%Y%m%d_%H%M%S"))
print(p)  # Exibir no painel Plots do RStudio

# Opcional: Salvar como PNG para o Word
ggsave("pca_biplot_euclidiana_3clusters_kmeans_no_outliers.png", p, width = 12, height = 10, dpi = 300)




#### REFAZENDO TUDO NOVAMENTE 15/08

#############CRIANDO NOVAMENTE AS ANALISES 11.08
######################
df_cluster_vars1 <- df_cluster_filtered %>%
  select(
    NOME_INSTITUICAO,
    CNPJ,
    UF,
    Cod_Munic,
    Cod_Reg_Imediata,
    Cod_Reg_Intermed,
    ANO,
    IFDM_Emp_Renda,
    IFDM_Edu,
    VAB,
    ATIVOS_VERDADEIROS,
    SOBRAS_POR_ATIVO
  )

write.csv(df_cluster_vars1, "df_clusterOriginal.csv", row.names = FALSE)

lista_de_dfs_anuais <- list(Dados_pivotados_2004, Dados_pivotados_2005, Dados_pivotados_2006, Dados_pivotados_2007,
                            Dados_pivotados_2008, Dados_pivotados_2009, Dados_pivotados_2010,
                            Dados_pivotados_2011, Dados_pivotados_2012, Dados_pivotados_2013,
                            Dados_pivotados_2014, Dados_pivotados_2015, Dados_pivotados_2016)

# Juntando todos em um único dataframe longo
dados_completos_pl <- bind_rows(lista_de_dfs_anuais)

# Certifique-se de que a biblioteca dplyr está carregada
library(dplyr)

# Calcula o CPLA
df_cpla_calculado <- dados_completos_pl %>%
  group_by(CNPJ) %>%                  # Agrupa os dados por empresa
  arrange(ANO) %>%                    # Ordena os anos para cada empresa
  mutate(
    patrimonio_ano_anterior = lag(PATRIMONIOLIQUIDO), # Pega o PL do ano anterior
    CPLA = (PATRIMONIOLIQUIDO / patrimonio_ano_anterior) - 1 # Calcula o CPLA
  ) %>%
  ungroup() %>%                       # Desagrupa para operações futuras
  select(CNPJ, ANO, CPLA)             # Seleciona apenas as colunas que precisamos


df_cpla_calculado <- df_cpla_calculado %>%
  mutate(CNPJ = as.character(CNPJ))

df_final_com_cpla <- left_join(df_cluster_vars1, df_cpla_calculado, by = c("CNPJ", "ANO"))


write.csv(df_final_com_cpla, "df_clusterOriginal.csv", row.names = FALSE)


library(dplyr)
library(cluster)
library(factoextra)

# Carregue seu dataframe
df_original <- read.csv("df_clusterOriginal.csv")

# Preparação dos dados
df_preparado <- df_original %>%
  # Renomeia as colunas para os nomes desejados
  rename(
    ATIVOS = ATIVOS_VERDADEIROS,
    ROA = SOBRAS_POR_ATIVO
  ) %>%
  # Seleciona apenas as colunas que usaremos na análise
  select(
    CNPJ,
    ANO,
    IFDM_Emp_Renda,
    IFDM_Edu,
    VAB,
    ATIVOS,
    ROA,
    CPLA
  ) %>%
  # Remove linhas com qualquer valor ausente nas colunas selecionadas
  na.omit()

# Mostra as primeiras linhas para verificar
head(df_preparado)

# A partir do seu 'df_preparado' do passo anterior

# Passo 1.5: Calcular as médias por CNPJ
df_agregado_por_media <- df_preparado %>%
  group_by(CNPJ) %>%
  summarise(
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Edu = mean(IFDM_Edu, na.rm = TRUE),
    VAB = mean(VAB, na.rm = TRUE),
    ATIVOS = mean(ATIVOS, na.rm = TRUE),
    ROA = mean(ROA, na.rm = TRUE),
    CPLA = mean(CPLA, na.rm = TRUE)
  ) %>%
  # É importante remover linhas que possam ter ficado com NA após a média
  na.omit()

df_para_cluster <- df_agregado_por_media %>%
  select(-CNPJ) # Remove a coluna CNPJ antes de padronizar

# Passo 2: Padronizar as Variáveis (agora sobre as médias)
df_padronizado <- scale(df_para_cluster)

# Certifique-se de que as bibliotecas estão carregadas
library(factoextra)
library(cluster)

# O df_padronizado já foi criado a partir do df_agregado_por_media
# Agora, vamos encontrar o k ideal para ESTE novo dataframe

fviz_nbclust(df_padronizado, pam, method = "silhouette") +
  labs(subtitle = "Método da Silhueta para dados agregados por média")

### 3

# Certifique-se de que as bibliotecas estão carregadas
library(factoextra)
library(cluster)


# --- MÉTODO 2: MÉTODO DO COTOVELO (ELBOW) ---
p_cotovelo <- fviz_nbclust(df_padronizado, pam, method = "wss") +
  geom_vline(xintercept = 4, linetype = 2) + # Adiciona uma linha pontilhada em k=4 para ajudar a visualização
  labs(subtitle = "Método do Cotovelo para dados agregados (Elbow Method)")

# --- MÉTODO 3: GAP STATISTIC ---
# Este método pode ser um pouco mais demorado para rodar
p_gap <- fviz_nbclust(df_padronizado, pam, method = "gap_stat", nboot = 50) +
  labs(subtitle = "Gap Statistic para dados agregados")

# --- VISUALIZAR OS GRÁFICOS ---
print(p_cotovelo)
print(p_gap)

###############      DADOS INCONCLUSIVOS

# --- GERAÇÃO DA SOLUÇÃO COM K=3 ---
pam_k3 <- pam(df_padronizado, k = 3)
df_final_k3 <- df_agregado_por_media %>%
  mutate(Cluster = pam_k3$clustering)

tabela_perfis_k3 <- df_final_k3 %>%
  group_by(Cluster) %>%
  summarise_at(vars(IFDM_Emp_Renda:CPLA), mean, na.rm = TRUE) %>%
  mutate(N_Cooperativas = pam_k3$clusinfo[,1])


# --- GERAÇÃO DA SOLUÇÃO COM K=4 ---
pam_k4 <- pam(df_padronizado, k = 4)
df_final_k4 <- df_agregado_por_media %>%
  mutate(Cluster = pam_k4$clustering)

tabela_perfis_k4 <- df_final_k4 %>%
  group_by(Cluster) %>%
  summarise_at(vars(IFDM_Emp_Renda:CPLA), mean, na.rm = TRUE) %>%
  mutate(N_Cooperativas = pam_k4$clusinfo[,1])


# --- IMPRIMIR E COMPARAR AS TABELAS DE PERFIS ---
print("--- Tabela de Perfis para k=3 ---")
print(as.data.frame(tabela_perfis_k3))

print("--- Tabela de Perfis para k=4 ---")
print(as.data.frame(tabela_perfis_k4))

# --- VISUALIZAÇÃO GRÁFICA (MUITO ÚTIL) ---
p_k3 <- fviz_cluster(pam_k3, data = df_padronizado, geom = "point") + labs(title = "Clusterização k=3")
p_k4 <- fviz_cluster(pam_k4, data = df_padronizado, geom = "point") + labs(title = "Clusterização k=4")

print(p_k3)
print(p_k4)


######################## testando a formacao do num. dos cluster com apenas as
#### variaveis de agrupamento

# Seleciona apenas as variáveis socioeconômicas (de agrupamento)
df_socioeconomico <- df_agregado_por_media %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB)

# Padroniza este novo conjunto de dados
df_socio_padronizado <- scale(df_socioeconomico)


# --- PASSO 2: RODAR OS 3 TESTES DE NÚMERO IDEAL DE CLUSTERS ---

print("--- Rodando testes para as 3 variáveis socioeconômicas ---")

# Método da Silhueta
p_silhueta_socio <- fviz_nbclust(df_socio_padronizado, pam, method = "silhouette") +
  labs(subtitle = "Silhueta (Apenas Variáveis Socioeconômicas)")

# Método do Cotovelo (Elbow)
p_cotovelo_socio <- fviz_nbclust(df_socio_padronizado, pam, method = "wss") +
  labs(subtitle = "Cotovelo (Apenas Variáveis Socioeconômicas)")

# Gap Statistic
p_gap_socio <- fviz_nbclust(df_socio_padronizado, pam, method = "gap_stat", nboot = 50) +
  labs(subtitle = "Gap Statistic (Apenas Variáveis Socioeconômicas)")


# --- PASSO 3: VISUALIZAR OS GRÁFICOS ---
print(p_silhueta_socio)
print(p_cotovelo_socio)
print(p_gap_socio)


# Assumindo que 'df_agregado_por_media' e 'df_padronizado' já foram criados
# a partir da sua base com as médias por CNPJ

# --- PASSO 4: EXECUTAR O ALGORITMO FINAL COM k=4 ---
resultado_pam_final <- pam(df_padronizado, k = 4)

# --- PASSO 5: CRIAR A TABELA DE PERFIS E O DATAFRAME FINAL ---

# Adiciona a coluna de cluster ao dataframe com os dados originais (médias)
df_final_com_clusters <- df_agregado_por_media %>%
  mutate(Cluster = resultado_pam_final$clustering)

# Calcula as médias para cada cluster para criar a tabela de perfis
tabela_perfis_final <- df_final_com_clusters %>%
  group_by(Cluster) %>%
  summarise(
    N_Cooperativas = n(), # Conta o N de cada cluster
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda),
    IFDM_Edu = mean(IFDM_Edu),
    VAB = mean(VAB),
    ATIVOS = mean(ATIVOS),
    ROA = mean(ROA),
    CPLA = mean(CPLA)
  ) %>%
  arrange(Cluster)

# --- VISUALIZAR A TABELA FINAL ---
print("--- Tabela Final de Perfis (k=4) ---")
print(as.data.frame(tabela_perfis_final))

# Opcional: Salvar o dataframe final com a coluna de cluster para futuras análises
write.csv(df_final_com_clusters, "df_final_com_clusters.csv", row.names = FALSE)


###TESTES DE VALIDACAO
df_final_com_clusters <- read.csv("df_final_com_clusters.csv")

# --- Validação Interna com Teste de Kruskal-Wallis ---

# Lista das variáveis que queremos testar
variaveis_para_teste <- c("IFDM_Emp_Renda", "IFDM_Edu", "VAB", "ATIVOS", "ROA", "CPLA")

# Roda o teste para cada variável e armazena os resultados
resultados_kw <- lapply(variaveis_para_teste, function(var) {
  teste <- kruskal.test(get(var) ~ as.factor(Cluster), data = df_final_com_clusters)
  # Cria uma linha de resultado com o nome da variável, estatística e p-valor
  data.frame(Variavel = var, Estatistica_KW = teste$statistic, p_valor = teste$p.value)
})

# Combina todos os resultados em uma única tabela
tabela_validacao_interna <- bind_rows(resultados_kw)

# Formata o p-valor para melhor visualização científica
tabela_validacao_interna$p_valor_formatado <- scales::pvalue(tabela_validacao_interna$p_valor)


# --- Imprime a tabela final de validação ---
print("--- Tabela de Validação Interna (Teste de Kruskal-Wallis) ---")
print(as.data.frame(tabela_validacao_interna))



### TESTE VDE VALIDACAO EXTERNA

# Carregue o dataframe final com os clusters por CNPJ
df_clusters <- read.csv("df_final_com_clusters.csv")

# Carregue o dataframe original que contém a UF de cada CNPJ
df_original <- read.csv("df_clusterOriginal.csv")


# --- PASSO 2: PREPARAR OS DADOS PARA O TESTE ---

# Precisamos de uma lista única de CNPJ e sua respectiva UF
# O 'distinct' garante que pegaremos apenas uma linha por CNPJ
df_ufs <- df_original %>%
  select(CNPJ, UF) %>%
  distinct(CNPJ, .keep_all = TRUE)

# Converte o CNPJ para character em ambos para garantir o join
df_clusters <- df_clusters %>% mutate(CNPJ = as.character(CNPJ))
df_ufs <- df_ufs %>% mutate(CNPJ = as.character(CNPJ))

# Junta a informação da UF com a informação do Cluster
df_validacao_externa <- left_join(df_clusters, df_ufs, by = "CNPJ") %>%
  # Remove qualquer linha que possa ter ficado sem UF
  filter(!is.na(UF))


# --- PASSO 3: EXECUTAR O TESTE QUI-QUADRADO ---

###erificar se há células com contagens baixas (e.g., any(tabela_contingencia < 5)). Se houver, considerar o teste de Fisher:

if (any(tabela_contingencia < 5)) {
  resultado_fisher <- fisher.test(tabela_contingencia)
  print("--- Resultado do Teste de Fisher ---")
  print(resultado_fisher)
}

# Run Fisher test with simulated p-value
resultado_fisher <- fisher.test(tabela_contingencia, simulate.p.value = TRUE, B = 2000)
print("--- Resultado do Teste de Fisher com Simulação ---")
print(resultado_fisher)


# Cria uma tabela de contingência (cruzamento entre Cluster e UF)
tabela_contingencia <- table(df_validacao_externa$Cluster, df_validacao_externa$UF)

# Imprime a tabela para você ter uma ideia da distribuição
print("--- Tabela de Contingência: Clusters vs. Estados (UF) ---")
print(tabela_contingencia)

# Executa o teste Qui-quadrado
resultado_chisq <- chisq.test(tabela_contingencia)

# Imprime o resultado do teste
print("--- Resultado do Teste Qui-quadrado de Independência ---")
print(resultado_chisq)


####FAZENDO OS TESTES EXTERNOS COM REGIOES

# Certifique-se de que a biblioteca dplyr está carregada
library(dplyr)

# --- PASSO 1: CARREGAR OS DADOS NECESSÁRIOS (se não estiverem na memória) ---

# df_clusters <- read.csv("df_final_com_clusters.csv")
# df_original <- read.csv("df_clusterOriginal.csv")


# --- PASSO 2: PREPARAR OS DADOS PARA O TESTE ---

# Crie uma lista única de CNPJ com suas respectivas localizações
df_localizacao <- df_original %>%
  select(CNPJ, Cod_Reg_Imediata, Cod_Reg_Intermed) %>%
  distinct(CNPJ, .keep_all = TRUE)

# Garanta que o CNPJ seja do tipo 'character' para o join
df_clusters <- df_clusters %>% mutate(CNPJ = as.character(CNPJ))
df_localizacao <- df_localizacao %>% mutate(CNPJ = as.character(CNPJ))

# Junte a informação de localização com a informação do Cluster
df_validacao_final <- left_join(df_clusters, df_localizacao, by = "CNPJ") %>%
  filter(!is.na(Cod_Reg_Imediata) & !is.na(Cod_Reg_Intermed))


# --- PASSO 3: EXECUTAR OS TESTES QUI-QUADRADO ---

# --- Teste para Regiões INTERMEDIÁRIAS ---
print("--- Tabela de Contingência: Clusters vs. Regiões Intermediárias ---")
tabela_intermediaria <- table(df_validacao_final$Cluster, df_validacao_final$Cod_Reg_Intermed)
print(tabela_intermediaria)

print("--- Resultado do Teste Qui-quadrado (Regiões Intermediárias) ---")
resultado_chisq_intermed <- chisq.test(tabela_intermediaria)
print(resultado_chisq_intermed)


# --- Teste para Regiões IMEDIATAS ---
print("--- Tabela de Contingência: Clusters vs. Regiões Imediatas ---")
tabela_imediata <- table(df_validacao_final$Cluster, df_validacao_final$Cod_Reg_Imediata)
print(tabela_imediata)

print("--- Resultado do Teste Qui-quadrado (Regiões Imediatas) ---")
resultado_chisq_imediata <- chisq.test(tabela_imediata)
print(resultado_chisq_imediata)




####### TESTANDO AS OUTRAS DISTANCIAS


metricas_para_teste <- c("euclidean", "manhattan", "minkowski", "maximum", "canberra")

# Renomeamos 'maximum' para 'chebyshev' no resultado final para clareza
nomes_para_tabela <- c("euclidean", "manhattan", "minkowski", "chebyshev", "canberra")


# Define o número de clusters que já escolhemos
k_final <- 4

# Cria um dataframe vazio para guardar os resultados
resultados_metricas <- data.frame(Metrica = character(),
                                  Silhueta_Media = numeric(),
                                  stringsAsFactors = FALSE)

# Loop para executar a análise para cada métrica
for (i in 1:length(metricas_para_teste)) {
  
  metrica_atual <- metricas_para_teste[i]
  nome_metrica <- nomes_para_tabela[i]
  
  print(paste("Processando a métrica:", nome_metrica))
  
  # Para Minkowski, p=3 como você solicitou. Para as outras, o 'p' é ignorado.
  matriz_dist <- dist(df_padronizado, method = metrica_atual, p = 3)
  
  # Roda o PAM com a matriz de distância atual
  resultado_pam <- pam(matriz_dist, k = k_final)
  
  # Calcula o score de silhueta médio
  silhueta <- silhouette(resultado_pam$clustering, matriz_dist)
  score_silhueta_medio <- mean(silhueta[, "sil_width"])
  
  # Adiciona o resultado à nossa tabela de resultados
  resultados_metricas <- rbind(resultados_metricas, data.frame(Metrica = nome_metrica,
                                                               Silhueta_Media = score_silhueta_medio))
}

# --- Apresenta o resultado final ---
print("--- Tabela Comparativa de Métricas de Distância ---")
# Ordena a tabela pela melhor silhueta (maior para menor)
resultados_finais_ordenados <- resultados_metricas %>%
  arrange(desc(Silhueta_Media))

print(resultados_finais_ordenados)


#### DIA 18
# Certifique-se de que as bibliotecas e seus dataframes estão prontos
library(dplyr)
library(cluster)
library(ggplot2)

# --- PASSO 1: GARANTIR QUE OS OBJETOS PRINCIPAIS EXISTEM ---
# (Rode novamente para garantir que estamos usando os objetos corretos)

# df_agregado_por_media <- ... # seu dataframe com médias por CNPJ
df_numerico <- df_agregado_por_media %>% select(-CNPJ)
df_padronizado <- scale(df_numerico)
resultado_pam_final <- pam(df_padronizado, k = 4)
resultado_pca <- prcomp(df_padronizado)


# --- PASSO 2: EXTRAIR OS DADOS DA PCA PARA O PLOT ---

# Pega as coordenadas (scores) de cada cooperativa nos 2 primeiros componentes
scores_pca <- as.data.frame(resultado_pca$x[, 1:2])
colnames(scores_pca) <- c("PC1", "PC2")

# Adiciona a informação do cluster e o CNPJ a essa tabela de scores
scores_pca$Cluster <- factor(resultado_pam_final$clustering)
scores_pca$CNPJ <- df_agregado_por_media$CNPJ

# Pega as direções (loadings) de cada variável nos 2 primeiros componentes
loadings_pca <- as.data.frame(resultado_pca$rotation[, 1:2])
loadings_pca$Variavel <- rownames(loadings_pca)
colnames(loadings_pca) <- c("PC1", "PC2", "Variavel")


# --- PASSO 3: CONSTRUIR O GRÁFICO MANUALMENTE COM GGPLOT2 ---

# Fator de escala para as setas (ajuste visual para que caibam no gráfico)
arrow_scale <- 3

grafico_manual_final <- ggplot() +
  # Desenha os pontos das cooperativas, coloridos por cluster
  geom_point(data = scores_pca, aes(x = PC1, y = PC2, fill = Cluster), 
             shape = 21, size = 2, alpha = 0.7) +
  
  # Desenha as elipses de confiança
  stat_ellipse(data = scores_pca, aes(x = PC1, y = PC2, color = Cluster), 
               type = "confidence", level = 0.95, linewidth = 1) +
  
  # Desenha as setas das variáveis
  geom_segment(data = loadings_pca, aes(x = 0, y = 0, xend = PC1 * arrow_scale, yend = PC2 * arrow_scale),
               arrow = arrow(length = unit(0.2, "cm")), color = "red", linewidth = 0.8) +
  
  # Adiciona os nomes das variáveis
  geom_text(data = loadings_pca, aes(x = PC1 * arrow_scale * 1.15, y = PC2 * arrow_scale * 1.15, label = Variavel),
            color = "red", fontface = "bold", repel = TRUE) +
  
  # Melhora a estética do gráfico
  labs(
    title = "Biplot PCA dos Clusters e Variáveis (Construção Manual)",
    x = paste0("Componente Principal 1 (", round(summary(resultado_pca)$importance[2,1] * 100, 1), "%)"),
    y = paste0("Componente Principal 2 (", round(summary(resultado_pca)$importance[2,2] * 100, 1), "%)"),
    fill = "Clusters",
    color = "Clusters"
  ) +
  theme_minimal() +
  coord_equal() # Garante que a escala dos eixos seja a mesma

# Imprime o gráfico final e consistente
print(grafico_manual_final)

# Salve este gráfico para sua tese
# ggsave("grafico_pca_final_manual.png", plot = grafico_manual_final, width = 11, height = 8, dpi = 300)





# Certifique-se de que a biblioteca ggplot2 está carregada
library(ggplot2)

# --- 1. Definir os textos para cada cluster ---
# Usamos \n para criar quebras de linha e organizar o texto

cluster1_text <- "Cluster 1: Desempenho Limitado\n\nO ambiente desafiador impõe um teto\nao desenvolvimento de capacidades\ne ao desempenho."
cluster2_text <- "Cluster 2: Sucesso Equilibrado\n\nSinergia entre um bom ambiente e fortes\ncapacidades internas, levando ao\nmelhor desempenho geral."
cluster3_text <- "Cluster 3: Paradoxo da Renda-Educação\n\nApesar de um ambiente de alta renda, a falta de\ncapacidades (associada à baixa educação)\nleva ao pior desempenho."
cluster4_text <- "Cluster 4: Enigma do Contexto Excepcional\n\nApesar de um ambiente de elite, as capacidades\ninternas não se traduzem em\ndesempenho superior generalizado."
quadrante_vazio_text <- "(Nenhum perfil identificado)"

# --- 2. Criar o gráfico com ggplot2 ---
matriz_conceitual <- ggplot() +
  
  # Define os limites do gráfico
  coord_cartesian(xlim = c(-10, 10), ylim = c(-10, 10)) +
  
  # Desenha os eixos X e Y que formam os quadrantes
  geom_hline(yintercept = 0, color = "gray40") +
  geom_vline(xintercept = 0, color = "gray40") +
  
  # --- RÓTULOS DOS EIXOS ---
  # Eixo X
  annotate("text", x = -9.5, y = 10.5, label = "Desafiador", hjust = 0, fontface = "bold", size = 4.5, color = "gray20") +
  annotate("text", x = 9.5, y = 10.5, label = "Favorável", hjust = 1, fontface = "bold", size = 4.5, color = "gray20") +
  annotate("text", x = 0, y = 11.2, label = "Qualidade do Ambiente Institucional", hjust = 0.5, fontface = "bold.italic", size = 5) +
  
  # Eixo Y
  annotate("text", x = -11.5, y = 9.5, label = "Fortes", angle = 90, vjust = 1, fontface = "bold", size = 4.5, color = "gray20") +
  annotate("text", x = -11.5, y = -9.5, label = "Fracas", angle = 90, vjust = 0, fontface = "bold", size = 4.5, color = "gray20") +
  annotate("text", x = -12.5, y = 0, label = "Capacidades Internas & Desempenho", angle = 90, vjust = 0.5, fontface = "bold.italic", size = 5) +
  
  # --- CONTEÚDO DOS QUADRANTES ---
  # Usamos 'geom_label' para criar uma caixa de texto com fundo branco
  
  # Quadrante Superior Direito (Cluster 2)
  geom_label(aes(x = 5, y = 5, label = cluster2_text), size = 3.5, fill = "#E0F2F7", color = "black") +
  
  # Quadrante Inferior Esquerdo (Cluster 1)
  geom_label(aes(x = -5, y = -5, label = cluster1_text), size = 3.5, fill = "#F7E0E0", color = "black") +
  
  # Quadrante Inferior Direito (Clusters 3 e 4)
  geom_label(aes(x = 5, y = -3, label = cluster3_text), size = 3.5, fill = "#F7F5E0", color = "black") +
  geom_label(aes(x = 5, y = -7, label = cluster4_text), size = 3.5, fill = "#F7F5E0", color = "black") +
  
  # Quadrante Superior Esquerdo (Vazio)
  annotate("text", x = -5, y = 5, label = quadrante_vazio_text, fontface = "italic", color = "gray50", size = 4) +
  
  # Remove todos os elementos desnecessários do tema (eixos, fundo, etc.)
  theme_void() +
  # Adiciona um título geral
  labs(title = "Matriz de Perfis Estratégicos das Cooperativas de Crédito") +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold", margin = margin(b = 20)))

# Imprime o gráfico
print(matriz_conceitual)


# Opcional: Salvar o gráfico em alta resolução
# ggsave("matriz_conceitual_clusters.png", plot = matriz_conceitual, width = 11, height = 8.5, dpi = 300)


####CRIANDO OS ANEXOS
# Carregue as bibliotecas necessárias
library(dunn.test)
library(dplyr)

# Carregue seu dataframe final com a coluna de cluster
# df_final_com_clusters <- read.csv("df_final_com_clusters.csv")

# --- Teste Post Hoc de Dunn para Validação Interna ---

# Lista das variáveis que queremos testar
variaveis_para_teste <- c("IFDM_Emp_Renda", "IFDM_Edu", "VAB", "ATIVOS", "ROA", "CPLA")

# Loop para executar o teste para cada variável
for (variavel in variaveis_para_teste) {
  
  print(paste("--- Teste Post Hoc de Dunn para a variável:", variavel, "---"))
  
  # Executa o teste de Dunn
  # O método "bonferroni" é um ajuste conservador e robusto para múltiplas comparações
  teste_dunn <- dunn.test(
    x = df_final_com_clusters[[variavel]],
    g = as.factor(df_final_com_clusters$Cluster),
    method = "bonferroni"
  )
  
  # Imprime os resultados do teste
  print(teste_dunn)
  
  # Imprime uma linha em branco para separar os resultados
  cat("\n\n")
}

######################################## 18/08
# ===================================================================
# SCRIPT MESTRE PARA GERAÇÃO DE ANEXOS - TESE DE DOUTORADO
# ===================================================================

# --- PASSO 0: CARREGAR PACOTES E DADOS ---
# Certifique-se de que todos os pacotes necessários estão instalados

library(dplyr)
library(cluster)
library(factoextra)
library(ggplot2)
library(dunn.test)

# Carregue seus dataframes (ajuste o caminho se necessário)
df_original <- read.csv("df_clusterOriginal.csv")
# O df_final_com_clusters foi o que geramos e salvamos anteriormente
df_final_com_clusters <- read.csv("df_final_com_clusters.csv") 


# --- PREPARAÇÃO DOS OBJETOS PRINCIPAIS (Recriando para garantir consistência) ---

# 1. Dados Agregados por Média (para a análise principal)
df_agregado_por_media <- df_final_com_clusters %>% select(-Cluster) # Remove o cluster antigo se houver

# 2. Dados Padronizados (6 variáveis)
df_padronizado <- df_agregado_por_media %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ATIVOS, ROA, CPLA) %>%
  scale()

# 3. Dados Socioeconômicos Padronizados (3 variáveis, para sensibilidade)
df_socio_padronizado <- df_agregado_por_media %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB) %>%
  scale()

# ===================================================================
# ANEXO I: DETERMINAÇÃO DO NÚMERO DE CLUSTERS (ANÁLISE PRINCIPAL)
# ===================================================================
print("--- GERANDO GRÁFICOS PARA O ANEXO I ---")

p_silhueta_main <- fviz_nbclust(df_padronizado, pam, method = "silhouette") + labs(subtitle = "Método da Silhueta (6 Variáveis)")
p_cotovelo_main <- fviz_nbclust(df_padronizado, pam, method = "wss") + labs(subtitle = "Método do Cotovelo (6 Variáveis)")
p_gap_main <- fviz_nbclust(df_padronizado, pam, method = "gap_stat", nboot = 50) + labs(subtitle = "Gap Statistic (6 Variáveis)")

ggsave("Anexo_I_Silhueta.png", plot = p_silhueta_main, width = 8, height = 6, dpi = 300)
ggsave("Anexo_I_Cotovelo.png", plot = p_cotovelo_main, width = 8, height = 6, dpi = 300)
ggsave("Anexo_I_Gap.png", plot = p_gap_main, width = 8, height = 6, dpi = 300)

print("Gráficos do Anexo I salvos como arquivos PNG.")

# ===================================================================
# ANEXO II: ANÁLISE DE SENSIBILIDADE DA MÉTRICA DE DISTÂNCIA
# ===================================================================
print("--- GERANDO TABELA PARA O ANEXO II ---")

metricas_para_teste <- c("euclidean", "manhattan", "minkowski", "maximum", "canberra")
nomes_para_tabela <- c("euclidean", "manhattan", "minkowski", "chebyshev", "canberra")
k_final <- 4
resultados_metricas <- data.frame(Metrica = character(), Silhueta_Media = numeric(), stringsAsFactors = FALSE)

for (i in 1:length(metricas_para_teste)) {
  metrica_atual <- metricas_para_teste[i]
  nome_metrica <- nomes_para_tabela[i]
  matriz_dist <- dist(df_padronizado, method = metrica_atual, p = 3)
  resultado_pam <- pam(matriz_dist, k = k_final)
  silhueta <- silhouette(resultado_pam$clustering, matriz_dist)
  score_silhueta_medio <- mean(silhueta[, "sil_width"])
  resultados_metricas <- rbind(resultados_metricas, data.frame(Metrica = nome_metrica, Silhueta_Media = score_silhueta_medio))
}

resultados_finais_ordenados <- resultados_metricas %>% arrange(desc(Silhueta_Media))
print(resultados_finais_ordenados)


# ===================================================================
# ANEXO III: ANÁLISE DE SENSIBILIDADE (VARIÁVEIS SOCIOECONÔMICAS)
# ===================================================================
print("--- GERANDO GRÁFICOS PARA O ANEXO III ---")

p_silhueta_socio <- fviz_nbclust(df_socio_padronizado, pam, method = "silhouette") + labs(subtitle = "Silhueta (3 Variáveis)")
p_cotovelo_socio <- fviz_nbclust(df_socio_padronizado, pam, method = "wss") + labs(subtitle = "Cotovelo (3 Variáveis)")
p_gap_socio <- fviz_nbclust(df_socio_padronizado, pam, method = "gap_stat", nboot = 50) + labs(subtitle = "Gap Statistic (3 Variáveis)")

ggsave("Anexo_III_Silhueta_Socio.png", plot = p_silhueta_socio, width = 8, height = 6, dpi = 300)
ggsave("Anexo_III_Cotovelo_Socio.png", plot = p_cotovelo_socio, width = 8, height = 6, dpi = 300)
ggsave("Anexo_III_Gap_Socio.png", plot = p_gap_socio, width = 8, height = 6, dpi = 300)

print("Gráficos do Anexo III salvos como arquivos PNG.")


# ===================================================================
# ANEXO IV: VALIDAÇÃO ESTATÍSTICA DOS CLUSTERS
# ===================================================================
print("--- GERANDO TABELAS PARA O ANEXO IV ---")

# --- Validação Interna (Kruskal-Wallis) ---
print("--- Tabela de Validação Interna (Teste de Kruskal-Wallis) ---")
variaveis_para_teste <- c("IFDM_Emp_Renda", "IFDM_Edu", "VAB", "ATIVOS", "ROA", "CPLA")
resultados_kw <- lapply(variaveis_para_teste, function(var) {
  teste <- kruskal.test(get(var) ~ as.factor(Cluster), data = df_final_com_clusters)
  data.frame(Variavel = var, Estatistica_KW = teste$statistic, p_valor = teste$p.value)
})
tabela_validacao_interna <- bind_rows(resultados_kw)
print(as.data.frame(tabela_validacao_interna))

# --- Testes Post Hoc de Dunn ---
print("--- Tabelas de Validação Post Hoc (Teste de Dunn) ---")
for (variavel in variaveis_para_teste) {
  print(paste("--- Teste Post Hoc de Dunn para a variável:", variavel, "---"))
  dunn.test(x = df_final_com_clusters[[variavel]], g = as.factor(df_final_com_clusters$Cluster), method = "bonferroni")
}

# --- Validação Externa (Qui-quadrado) ---
print("--- Tabelas de Validação Externa (Teste Qui-quadrado) ---")
df_ufs <- df_original %>% select(CNPJ, UF) %>% distinct(CNPJ, .keep_all = TRUE)
df_clusters_temp <- df_final_com_clusters %>% mutate(CNPJ = as.character(CNPJ))
df_ufs <- df_ufs %>% mutate(CNPJ = as.character(CNPJ))
df_validacao_externa <- left_join(df_clusters_temp, df_ufs, by = "CNPJ") %>% filter(!is.na(UF))
tabela_contingencia_uf <- table(df_validacao_externa$Cluster, df_validacao_externa$UF)
print("--- Resultado do Teste (UF) ---")
print(chisq.test(tabela_contingencia_uf))


# ===================================================================
# ANEXO V: VISUALIZAÇÃO PCA DOS CLUSTERS
# ===================================================================
print("--- GERANDO GRÁFICO PARA O ANEXO V ---")

resultado_pam_final <- pam(df_padronizado, k = 4)
resultado_pca <- prcomp(df_padronizado)
grafico_pca_final <- fviz_pca_biplot(
  resultado_pca, geom.ind = "point", pointshape = 21, pointsize = 2,
  fill.ind = factor(resultado_pam_final$clustering), col.ind = "black",
  palette = "jco", addEllipses = TRUE, ellipse.type = "confidence",
  col.var = "red", repel = TRUE, legend.title = "Clusters",
  title = "Biplot PCA dos Clusters e Variáveis",
  ggtheme = theme_minimal()
)
ggsave("Anexo_V_Biplot_PCA.png", plot = grafico_pca_final, width = 11, height = 8, dpi = 300)

print("Gráfico do Anexo V salvo como arquivo PNG.")
print("--- GERAÇÃO DE TODOS OS MATERIAIS PARA OS ANEXOS CONCLUÍDA ---")







#######criar os arq no excel
# --- PASSO 0: INSTALAR E CARREGAR PACOTES ---
# Instale o pacote 'openxlsx' se ainda não o tiver
# install.packages("openxlsx")

library(openxlsx)
library(dplyr)
library(cluster)
library(factoextra)
library(dunn.test)
library(broom) # Útil para organizar saídas de testes

# --- PASSO 1: CARREGAR E PREPARAR DADOS ---
# (Recriando os objetos para garantir consistência)

df_original <- read.csv("df_clusterOriginal.csv")
df_final_com_clusters_base <- read.csv("df_final_com_clusters.csv")

df_agregado_por_media <- df_final_com_clusters_base %>% select(-Cluster)
df_padronizado <- df_agregado_por_media %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB, ATIVOS, ROA, CPLA) %>%
  scale()

# --- PASSO 2: GERAR AS TABELAS-CHAVE ---

# Tabela 1: Perfis dos 4 Clusters
tabela_perfis <- df_final_com_clusters_base %>%
  group_by(Cluster) %>%
  summarise_at(vars(IFDM_Emp_Renda:CPLA), mean, na.rm = TRUE) %>%
  mutate(N_Cooperativas = as.numeric(table(df_final_com_clusters_base$Cluster)))

# Tabela 2: Comparativo das Métricas de Distância
# (Código do teste de sensibilidade)
metricas_para_teste <- c("euclidean", "manhattan", "minkowski", "maximum", "canberra")
nomes_para_tabela <- c("euclidean", "manhattan", "minkowski", "chebyshev", "canberra")
resultados_metricas <- data.frame(Metrica=character(), Silhueta_Media=numeric())
for (i in 1:length(metricas_para_teste)) {
  matriz_dist <- dist(df_padronizado, method = metricas_para_teste[i], p = 3)
  pam_res <- pam(matriz_dist, k = 4)
  sil_res <- silhouette(pam_res$clustering, matriz_dist)
  resultados_metricas <- rbind(resultados_metricas, data.frame(Metrica = nomes_para_tabela[i], Silhueta_Media = mean(sil_res[, "sil_width"])))
}
tabela_comparativo_distancias <- resultados_metricas %>% arrange(desc(Silhueta_Media))

# Tabela 3: Validação Interna (Kruskal-Wallis)
variaveis_para_teste <- c("IFDM_Emp_Renda", "IFDM_Edu", "VAB", "ATIVOS", "ROA", "CPLA")
resultados_kw <- lapply(variaveis_para_teste, function(v) {
  teste <- kruskal.test(get(v) ~ as.factor(Cluster), data = df_final_com_clusters_base)
  data.frame(Variavel = v, Estatistica_KW = teste$statistic, p_valor = teste$p.value)
})
tabela_kruskal_wallis <- bind_rows(resultados_kw)

# Tabela 4: Validação Post Hoc (Teste de Dunn)
# Capturando a saída do teste de Dunn para um formato de tabela
resultados_dunn <- lapply(variaveis_para_teste, function(v) {
  teste <- dunn.test(x = df_final_com_clusters_base[[v]], g = as.factor(df_final_com_clusters_base$Cluster), method = "bonferroni")
  # Converte a saída em um dataframe mais limpo
  df_dunn <- data.frame(
    comparacao = teste$comparisons,
    z = teste$Z,
    p_ajustado = teste$P.adjusted
  )
  df_dunn$Variavel <- v
  return(df_dunn)
})
tabela_dunn_posthoc <- bind_rows(resultados_dunn)

# Tabela 5: Validação Externa (Qui-quadrado)
df_ufs <- df_original %>% select(CNPJ, UF, Cod_Reg_Imediata, Cod_Reg_Intermed) %>% distinct(CNPJ, .keep_all = TRUE)
df_clusters_temp <- df_final_com_clusters_base %>% mutate(CNPJ = as.character(CNPJ))
df_ufs <- df_ufs %>% mutate(CNPJ = as.character(CNPJ))
df_validacao_externa <- left_join(df_clusters_temp, df_ufs, by = "CNPJ")

# Teste para UF
tabela_contingencia_uf <- table(df_validacao_externa$Cluster, df_validacao_externa$UF)
resultado_chisq_uf <- tidy(chisq.test(tabela_contingencia_uf))
resultado_chisq_uf$Nivel <- "UF (Estado)"

# Teste para Região Intermediária
tabela_contingencia_intermed <- table(df_validacao_externa$Cluster, df_validacao_externa$Cod_Reg_Intermed)
resultado_chisq_intermed <- tidy(chisq.test(tabela_contingencia_intermed))
resultado_chisq_intermed$Nivel <- "Região Intermediária"

# Teste para Região Imediata
tabela_contingencia_imediata <- table(df_validacao_externa$Cluster, df_validacao_externa$Cod_Reg_Imediata)
resultado_chisq_imediata <- tidy(chisq.test(tabela_contingencia_imediata))
resultado_chisq_imediata$Nivel <- "Região Imediata"

tabela_qui_quadrado <- bind_rows(resultado_chisq_uf, resultado_chisq_intermed, resultado_chisq_imediata)


# --- PASSO 3: CRIAR O ARQUIVO EXCEL COM MÚLTIPLAS ABAS ---

# Crie uma lista com todos os dataframes que queremos salvar
lista_de_tabelas <- list(
  "Perfis dos Clusters" = tabela_perfis,
  "Dados Completos com Clusters" = df_final_com_clusters_base,
  "Comparativo Distancias" = tabela_comparativo_distancias,
  "Validacao Kruskal-Wallis" = tabela_kruskal_wallis,
  "Validacao Dunn Post-Hoc" = tabela_dunn_posthoc,
  "Validacao Qui-Quadrado" = tabela_qui_quadrado
)

# Escreve a lista de dataframes para o arquivo Excel
write.xlsx(lista_de_tabelas, file = "Resultados_Completos_Tese.xlsx", 
           asTable = TRUE, # Formata como tabela para melhor visualização
           overwrite = TRUE)

print("Arquivo 'Resultados_Completos_Tese.xlsx' foi gerado com sucesso!")




####### 20.08
###Criando relacao de coop. por clusters

library(dplyr)

# Carregar o dataframe com clusters
df_clusters <- read.csv("df_final_com_clusters.csv")

# Carregar o original para nomes e UF (se necessário)
df_original <- read.csv("df_clusterOriginal.csv") %>%
  select(CNPJ, NOME_INSTITUICAO, UF) %>%
  distinct(CNPJ, .keep_all = TRUE) %>%
  mutate(CNPJ = as.character(CNPJ))

# Juntar nomes e UF ao dataframe de clusters
df_clusters <- df_clusters %>%
  mutate(CNPJ = as.character(CNPJ)) %>%
  left_join(df_original, by = "CNPJ")

# Selecionar 10 aleatórias por cluster
set.seed(123)  # Para reprodutibilidade
amostra_por_cluster <- df_clusters %>%
  group_by(Cluster) %>%
  sample_n(10, replace = FALSE) %>%  # Se algum cluster tiver <10, ajuste replace=TRUE
  select(Cluster, NOME_INSTITUICAO, CNPJ, UF) %>%
  arrange(Cluster)

# Exibir a tabela
print(amostra_por_cluster)

# Salvar como CSV para anexo
write.csv(amostra_por_cluster, "amostra_10_por_cluster.csv", row.names = FALSE)

###CRIANDO MAPAS

#### 20.08

# Carregar pacotes necessários
library(geobr)
library(ggplot2)
library(dplyr)
library(sf)

# Carregar dados completos dos clusters
df_clusters <- read.csv("df_final_com_clusters.csv") %>%
  mutate(CNPJ = as.character(CNPJ))

# Carregar dados originais para obter UF, Cod_Munic, Cod_Reg_Intermed e Cod_Reg_Imediata
df_original <- read.csv("df_clusterOriginal.csv") %>%
  select(CNPJ, UF, Cod_Munic, Cod_Reg_Intermed, Cod_Reg_Imediata) %>%
  distinct(CNPJ, .keep_all = TRUE) %>%
  mutate(CNPJ = as.character(CNPJ))

# Juntar ao dataframe de clusters
df_amostra <- df_clusters %>%
  left_join(df_original, by = "CNPJ") %>%
  filter(!is.na(UF) & !is.na(Cod_Munic) & !is.na(Cod_Reg_Intermed) & !is.na(Cod_Reg_Imediata))

# Definir cores para os clusters
cores_clusters <- c("1" = "#FF9999", "2" = "#66CC99", "3" = "#FFCC66", "4" = "#9999FF")

# Função para criar mapa por cluster (genérica)
criar_mapa_cluster <- function(shapefile, cluster_id, titulo, fill_var = "n_cooperativas", subtitulo = "") {
  ggplot(data = shapefile %>% filter(Cluster == cluster_id | is.na(Cluster))) +
    geom_sf(aes(fill = !!sym(fill_var)), color = "black", size = 0.1) +  # Espessura fina das bordas
    scale_fill_gradient(low = "white", high = cores_clusters[as.character(cluster_id)], 
                        na.value = "grey90", name = "Nº de Cooperativas") +
    theme_minimal() +
    labs(title = paste(titulo, "(2005 a 2016)"), subtitle = subtitulo) +
    theme(legend.position = "bottom",
          plot.title = element_text(size = 10, hjust = 0.5),  # Reduzir tamanho do título
          legend.title = element_text(size = 8),              # Reduzir tamanho do título da legenda
          legend.text = element_text(size = 7),               # Reduzir tamanho do texto da legenda
          plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "cm")) + # Ajustar margens
    coord_sf(expand = FALSE)  # Zoom automático nos limites do estado
}

# Função para criar mapa consolidado (genérica)
criar_mapa_consolidado <- function(shapefile, titulo, subtitulo = "") {
  ggplot(data = shapefile) +
    geom_sf(aes(fill = as.factor(Cluster)), color = "black", size = 0.1) +  # Espessura fina das bordas
    scale_fill_manual(values = cores_clusters, 
                      na.value = "grey90", 
                      name = "Cluster",
                      labels = c("1: Desempenho Limitado", 
                                 "2: Sucesso Equilibrado", 
                                 "3: Paradoxo da Renda-Educação", 
                                 "4: Enigma do Contexto Excepcional")) +
    theme_minimal() +
    labs(title = paste(titulo, "(2005 a 2016)"), subtitle = subtitulo) +
    theme(legend.position = "bottom",
          plot.title = element_text(size = 10, hjust = 0.5),  # Reduzir tamanho do título
          legend.title = element_text(size = 8),              # Reduzir tamanho do título da legenda
          legend.text = element_text(size = 7),               # Reduzir tamanho do texto da legenda
          plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "cm")) + # Ajustar margens
    coord_sf(expand = FALSE)  # Zoom automático nos limites do estado
}

# --- Mapas por UF ---

# Criar mapeamento de UF para códigos IBGE numéricos
uf_to_ibge <- data.frame(
  UF = c("AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", 
         "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", 
         "RO", "RR", "RS", "SC", "SE", "SP", "TO"),
  code_state = c(12, 27, 13, 16, 29, 23, 53, 32, 52, 21, 
                 31, 50, 51, 15, 25, 26, 22, 41, 33, 24, 
                 11, 14, 43, 42, 28, 35, 17)
)

# Agregar por cluster e UF
df_uf <- df_amostra %>%
  mutate(UF = as.character(UF)) %>%
  left_join(uf_to_ibge, by = "UF") %>%
  filter(!is.na(code_state)) %>%
  group_by(Cluster, code_state) %>%
  summarise(n_cooperativas = n(), .groups = "drop")

# Carregar shapefile para UFs
brasil_uf <- geobr::read_state(year = 2020)

# Mesclar com dados geográficos
brasil_uf <- brasil_uf %>%
  mutate(code_state = as.numeric(code_state)) %>%
  left_join(df_uf, by = "code_state")

# Criar mapas por UF
for (i in 1:4) {
  mapa <- criar_mapa_cluster(brasil_uf, i, paste("Distribuição Geográfica do Cluster", i, " - UFs"))
  ggsave(paste0("mapa_uf_cluster_", i, ".png"), mapa, width = 10, height = 8, dpi = 300)  # Aumentar dimensões
}

# Mapa consolidado por UF
mapa_consolidado_uf <- criar_mapa_consolidado(brasil_uf, "Distribuição Geográfica de Todos os Clusters - UFs")
ggsave("mapa_consolidado_uf.png", mapa_consolidado_uf, width = 10, height = 8, dpi = 300)  # Aumentar dimensões

# --- Mapas por Regiões Intermediárias ---

# Agregar para regiões intermediárias
df_intermed <- df_amostra %>%
  group_by(Cluster, Cod_Reg_Intermed) %>%
  summarise(n_cooperativas = n(), .groups = "drop") %>%
  rename(code_intermediate = Cod_Reg_Intermed)

# Carregar shapefile para regiões intermediárias
brasil_intermed <- geobr::read_intermediate_region(year = 2020)

# Mesclar com dados geográficos para intermediárias
brasil_intermed <- brasil_intermed %>%
  mutate(code_intermediate = as.numeric(code_intermediate)) %>%
  left_join(df_intermed, by = "code_intermediate")

# Criar mapas por regiões intermediárias
for (i in 1:4) {
  mapa <- criar_mapa_cluster(brasil_intermed, i, paste("Distribuição Geográfica do Cluster", i, " - Regiões Intermediárias"))
  ggsave(paste0("mapa_intermed_cluster_", i, ".png"), mapa, width = 10, height = 8, dpi = 300)  # Aumentar dimensões
}

# Mapa consolidado para regiões intermediárias
mapa_consolidado_intermed <- criar_mapa_consolidado(brasil_intermed, "Distribuição Geográfica de Todos os Clusters - Regiões Intermediárias")
ggsave("mapa_consolidado_intermed.png", mapa_consolidado_intermed, width = 10, height = 8, dpi = 300)  # Aumentar dimensões

# --- Mapas por Regiões Imediatas ---

# Agregar para regiões imediatas
df_imediata <- df_amostra %>%
  group_by(Cluster, Cod_Reg_Imediata) %>%
  summarise(n_cooperativas = n(), .groups = "drop") %>%
  rename(code_immediate = Cod_Reg_Imediata)

# Carregar shapefile para regiões imediatas
brasil_imediata <- geobr::read_immediate_region(year = 2020)

# Mesclar com dados geográficos para imediatas
brasil_imediata <- brasil_imediata %>%
  mutate(code_immediate = as.numeric(code_immediate)) %>%
  left_join(df_imediata, by = "code_immediate")

# Criar mapas por regiões imediatas
for (i in 1:4) {
  mapa <- criar_mapa_cluster(brasil_imediata, i, paste("Distribuição Geográfica do Cluster", i, " - Regiões Imediatas"))
  ggsave(paste0("mapa_imediata_cluster_", i, ".png"), mapa, width = 10, height = 8, dpi = 300)  # Aumentar dimensões
}

# Mapa consolidado para regiões imediatas
mapa_consolidado_imediata <- criar_mapa_consolidado(brasil_imediata, "Distribuição Geográfica de Todos os Clusters - Regiões Imediatas")
ggsave("mapa_consolidado_imediata.png", mapa_consolidado_imediata, width = 10, height = 8, dpi = 300)  # Aumentar dimensões

# --- Mapas por Município, separados por UF ---

# Agregar por cluster, Cod_Munic e UF
df_munic <- df_amostra %>%
  group_by(Cluster, Cod_Munic, UF) %>%
  summarise(n_cooperativas = n(), .groups = "drop") %>%
  rename(code_muni = Cod_Munic)

# Obter lista única de UFs presentes nos dados
ufs_unicas <- unique(df_amostra$UF)

# Loop por cada UF única
for (uf in ufs_unicas) {
  # Carregar shapefile de municípios para o estado específico
  code_state <- uf_to_ibge$code_state[uf_to_ibge$UF == uf]
  if (length(code_state) == 0) next  # Pular se UF não encontrado
  shapefile_uf <- tryCatch({
    geobr::read_municipality(code_muni = paste0("^", code_state, "\\d{5}$"), year = 2020)
  }, error = function(e) {
    warning(paste("Erro ao carregar municípios para UF", uf, ": ", e$message))
    return(NULL)
  })
  if (is.null(shapefile_uf)) next  # Pular se erro
  
  # Filtrar df_munic para a UF atual
  df_munic_uf <- df_munic %>% filter(UF == uf)
  
  # Verificar se Cod_Munic é um código IBGE de 7 dígitos
  if (!all(grepl("^\\d{7}$", df_munic_uf$code_muni))) {
    warning(paste("Códigos de município em UF", uf, "não são 7 dígitos. Verifique o formato de Cod_Munic."))
    next
  }
  
  # Mesclar com dados geográficos
  shapefile_uf <- shapefile_uf %>%
    mutate(code_muni = as.numeric(code_muni)) %>%
    left_join(df_munic_uf, by = "code_muni")
  
  # Mapa consolidado por UF
  if (nrow(shapefile_uf) > 0) {
    mapa_consolidado_uf_munic <- criar_mapa_consolidado(shapefile_uf, 
                                                        paste("Distribuição Geográfica de Todos os Clusters - Municípios do Estado", uf))
    ggsave(paste0("mapa_consolidado_municipios_", uf, ".png"), mapa_consolidado_uf_munic, width = 10, height = 8, dpi = 300)
    
    # Mapas por cluster na UF
    for (i in 1:4) {
      mapa <- criar_mapa_cluster(shapefile_uf, i, 
                                 paste("Distribuição Geográfica do Cluster", i, "- Municípios do Estado", uf))
      ggsave(paste0("mapa_municipios_cluster_", i, "_", uf, ".png"), mapa, width = 10, height = 8, dpi = 300)
    }
  }
}

# Exibir exemplos de mapas consolidados (opcional)
print(mapa_consolidado_uf)
print(mapa_consolidado_intermed)
print(mapa_consolidado_imediata)



####OUTRO FORMATO PARA OS MAPAS COM AS % dentro

# ============================================================
# MAPAS POR UF, REGIÃO INTERMEDIÁRIA E IMEDIATA
# - Sem municípios
# - Com rótulo: % do cluster dominante dentro de cada unidade
# - Mapas por cluster: fill = % daquele cluster na unidade
# ============================================================

# Pacotes
libs <- c("geobr","ggplot2","dplyr","sf","ggrepel","scales","tidyr","stringr")
for (p in libs) if (!require(p, character.only = TRUE)) install.packages(p); sapply(libs, require, character.only = TRUE)

options(scipen = 999)
set.seed(20250820)

# ------------------------------------------------------------
# 1) Ler bases e preparar amostra
# ------------------------------------------------------------
df_clusters <- read.csv("df_final_com_clusters.csv") |>
  mutate(CNPJ = as.character(CNPJ))

df_original <- read.csv("df_clusterOriginal.csv") |>
  select(CNPJ, UF, Cod_Reg_Intermed, Cod_Reg_Imediata) |>
  distinct(CNPJ, .keep_all = TRUE) |>
  mutate(CNPJ = as.character(CNPJ))

df_amostra <- df_clusters |>
  left_join(df_original, by = "CNPJ") |>
  filter(!is.na(UF), !is.na(Cod_Reg_Intermed), !is.na(Cod_Reg_Imediata))

# Paleta
cores_clusters <- c("1"="#FF9999","2"="#66CC99","3"="#FFCC66","4"="#9999FF")

# ------------------------------------------------------------
# 2) Helpers genéricos
# ------------------------------------------------------------

# 2.1 Contagem por unidade + cluster (unit_id é o nome da coluna do código)
contar_por_unidade <- function(df, unit_id) {
  df |>
    count(Cluster, {{unit_id}}, name = "n") |>
    group_by({{unit_id}}) |>
    mutate(
      n_total = sum(n),
      perc_cluster = 100 * n / n_total
    ) |>
    ungroup()
}

# 2.2 Resumo do dominante por unidade
dominante_por_unidade <- function(df_counts, unit_id) {
  df_counts |>
    group_by({{unit_id}}) |>
    slice_max(n, n = 1, with_ties = FALSE) |>
    transmute(
      {{unit_id}},
      Cluster_Dom = Cluster,
      n_dom = n,
      n_total = n_total,
      perc_dom = 100 * n_dom / n_total
    ) |>
    ungroup()
}

# 2.3 Gera pontos internos (para rótulos) + texto formatado
# sf_polygons deve ter a coluna "perc" com o valor percent
pontos_rotulos <- function(sf_polygons, perc_col = "perc", accuracy = 1) {
  if (!perc_col %in% names(sf_polygons)) return(data.frame())
  pts <- sf::st_point_on_surface(sf_polygons)
  crd <- sf::st_coordinates(pts)
  df  <- sf::st_drop_geometry(sf_polygons)
  df$lon <- crd[,1]; df$lat <- crd[,2]
  df$label <- paste0(scales::number(df[[perc_col]], accuracy = accuracy), "%")
  df[, c("lon","lat","label")]
}

# 2.4 Mapas consolidados (fill = cluster dominante; label = % dominante)
mapa_consolidado <- function(sf_join, id_nome, titulo) {
  # sf_join precisa ter Cluster_Dom (factor) e perc_dom
  labs_df <- sf_join |>
    filter(!is.na(Cluster_Dom)) |>
    rename(perc = perc_dom) |>
    pontos_rotulos(perc_col = "perc", accuracy = 1)
  
  ggplot() +
    geom_sf(data = sf_join, aes(fill = Cluster_Dom), color = "black", linewidth = 0.1, na.rm = FALSE) +
    geom_text_repel(
      data = labs_df,
      aes(x = lon, y = lat, label = label),
      size = 2.4, color = "grey15",
      max.overlaps = Inf, segment.size = 0.1, box.padding = 0.15, point.padding = 0.15
    ) +
    scale_fill_manual(values = cores_clusters, na.value = "grey90", name = "Cluster Dominante") +
    coord_sf(expand = FALSE, datum = NA) +
    theme_minimal() +
    labs(title = titulo, subtitle = "(2005 a 2016)") +
    theme(legend.position = "bottom",
          plot.title = element_text(size = 11, hjust = 0.5),
          legend.title = element_text(size = 9), legend.text = element_text(size = 8))
}

# 2.5 Mapas por cluster (fill = % daquele cluster; label = % daquele cluster)
mapa_por_cluster <- function(sf_share, cluster_id, id_nome, titulo) {
  sf_i <- sf_share |>
    filter(Cluster == cluster_id)
  
  labs_df <- sf_i |>
    rename(perc = perc_cluster) |>
    pontos_rotulos(perc_col = "perc", accuracy = 1)
  
  ggplot(sf_i) +
    geom_sf(aes(fill = perc_cluster), color = "black", linewidth = 0.1, na.rm = FALSE) +
    geom_text_repel(
      data = labs_df,
      aes(x = lon, y = lat, label = label),
      size = 2.2, color = "grey15",
      max.overlaps = Inf, segment.size = 0.1, box.padding = 0.15, point.padding = 0.15
    ) +
    scale_fill_gradient(
      low = "white", high = cores_clusters[as.character(cluster_id)],
      na.value = "grey90", name = "% do Cluster"
    ) +
    coord_sf(expand = FALSE, datum = NA) +
    theme_minimal() +
    labs(title = titulo, subtitle = "(2005 a 2016)") +
    theme(legend.position = "bottom",
          plot.title = element_text(size = 11, hjust = 0.5),
          legend.title = element_text(size = 9), legend.text = element_text(size = 8))
}

# ------------------------------------------------------------
# 3) UF (Estados)
# ------------------------------------------------------------
uf_to_ibge <- tibble::tribble(
  ~UF, ~code_state,
  "AC",12,"AL",27,"AM",13,"AP",16,"BA",29,"CE",23,"DF",53,"ES",32,"GO",52,"MA",21,
  "MG",31,"MS",50,"MT",51,"PA",15,"PB",25,"PE",26,"PI",22,"PR",41,"RJ",33,"RN",24,
  "RO",11,"RR",14,"RS",43,"SC",42,"SE",28,"SP",35,"TO",17
)

df_uf_counts <- df_amostra |>
  mutate(UF = as.character(UF)) |>
  left_join(uf_to_ibge, by = "UF") |>
  filter(!is.na(code_state)) |>
  contar_por_unidade(code_state)

df_uf_dom <- dominante_por_unidade(df_uf_counts, code_state)

# Shapefile
br_uf <- geobr::read_state(year = 2020) |>
  mutate(code_state = as.numeric(code_state)) |>
  st_transform(4674)

# Join (consolidado e share)
br_uf_consol <- br_uf |>
  left_join(df_uf_dom, by = "code_state") |>
  mutate(Cluster_Dom = factor(Cluster_Dom, levels = 1:4))

br_uf_share <- br_uf |>
  left_join(df_uf_counts, by = "code_state") |>
  mutate(Cluster = factor(Cluster, levels = 1:4))

# Mapas UF
dir.create("mapas_clusters", showWarnings = FALSE)

p_uf_consol <- mapa_consolidado(br_uf_consol, "UF", "Distribuição Geográfica — Estados (Cluster Dominante)")
ggsave(file.path("mapas_clusters","mapa_uf_consolidado.png"), p_uf_consol, width = 11, height = 8, dpi = 320)

for (i in 1:4) {
  p <- mapa_por_cluster(br_uf_share, i, "UF", paste0("Estados — % do Cluster ", i))
  ggsave(file.path("mapas_clusters", sprintf("mapa_uf_cluster_%d.png", i)), p, width = 11, height = 8, dpi = 320)
}

# ------------------------------------------------------------
# 4) Regiões INTERMEDIÁRIAS
# ------------------------------------------------------------
df_inter_counts <- df_amostra |>
  rename(code_intermediate = Cod_Reg_Intermed) |>
  contar_por_unidade(code_intermediate)

df_inter_dom <- dominante_por_unidade(df_inter_counts, code_intermediate)

br_inter <- geobr::read_intermediate_region(year = 2020) |>
  mutate(code_intermediate = as.numeric(code_intermediate)) |>
  st_transform(4674)

br_inter_consol <- br_inter |>
  left_join(df_inter_dom, by = "code_intermediate") |>
  mutate(Cluster_Dom = factor(Cluster_Dom, levels = 1:4))

br_inter_share <- br_inter |>
  left_join(df_inter_counts, by = "code_intermediate") |>
  mutate(Cluster = factor(Cluster, levels = 1:4))

p_inter_consol <- mapa_consolidado(br_inter_consol, "Região Intermediária", "Distribuição Geográfica — Regiões Intermediárias (Cluster Dominante)")
ggsave(file.path("mapas_clusters","mapa_intermediaria_consolidado.png"), p_inter_consol, width = 11, height = 8, dpi = 320)

for (i in 1:4) {
  p <- mapa_por_cluster(br_inter_share, i, "Região Intermediária", paste0("Regiões Intermediárias — % do Cluster ", i))
  ggsave(file.path("mapas_clusters", sprintf("mapa_intermediaria_cluster_%d.png", i)), p, width = 11, height = 8, dpi = 320)
}

# ------------------------------------------------------------
# 5) Regiões IMEDIATAS
# ------------------------------------------------------------
df_imed_counts <- df_amostra |>
  rename(code_immediate = Cod_Reg_Imediata) |>
  contar_por_unidade(code_immediate)

df_imed_dom <- dominante_por_unidade(df_imed_counts, code_immediate)

br_imed <- geobr::read_immediate_region(year = 2020) |>
  mutate(code_immediate = as.numeric(code_immediate)) |>
  st_transform(4674)

br_imed_consol <- br_imed |>
  left_join(df_imed_dom, by = "code_immediate") |>
  mutate(Cluster_Dom = factor(Cluster_Dom, levels = 1:4))

br_imed_share <- br_imed |>
  left_join(df_imed_counts, by = "code_immediate") |>
  mutate(Cluster = factor(Cluster, levels = 1:4))

p_imed_consol <- mapa_consolidado(br_imed_consol, "Região Imediata", "Distribuição Geográfica — Regiões Imediatas (Cluster Dominante)")
ggsave(file.path("mapas_clusters","mapa_imediata_consolidado.png"), p_imed_consol, width = 11, height = 8, dpi = 320)

for (i in 1:4) {
  p <- mapa_por_cluster(br_imed_share, i, "Região Imediata", paste0("Regiões Imediatas — % do Cluster ", i))
  ggsave(file.path("mapas_clusters", sprintf("mapa_imediata_cluster_%d.png", i)), p, width = 11, height = 8, dpi = 320)
}

message("Concluído. Mapas em: ", normalizePath("mapas_clusters"))





###GERANDO RELATORIO DOS CLUSTERS POR ESTADO
# Carregar pacotes necessários

# ============================================================
# Mapas por UF / Reg. Intermediária / Reg. Imediata
# - Fill = cluster dominante | Label = % dominante
# - Corrigido para clusters com n = 0 (grade completa)
# ============================================================

libs <- c("geobr","ggplot2","dplyr","sf","ggrepel","scales","tidyr","tibble","rlang")
for (p in libs) { if (!require(p, character.only=TRUE)) install.packages(p); library(p, character.only=TRUE) }
options(scipen = 999)

# --------------------- Dados ---------------------
df_clusters <- read.csv("df_final_com_clusters.csv") |>
  mutate(
    CNPJ   = as.character(CNPJ),
    Cluster = as.integer(gsub("\\s+", "", as.character(Cluster)))  # garante 1..4 como inteiros
  ) |>
  distinct(CNPJ, .keep_all = TRUE)

df_original <- read.csv("df_clusterOriginal.csv") |>
  select(CNPJ, UF, Cod_Reg_Intermed, Cod_Reg_Imediata) |>
  mutate(CNPJ = as.character(CNPJ)) |>
  distinct(CNPJ, .keep_all = TRUE)

cores_clusters <- c("1"="#FF9999","2"="#66CC99","3"="#FFCC66","4"="#9999FF")
dir.create("mapas_clusters", showWarnings = FALSE)

# --------------------- Helpers ---------------------
# Conta por unidade usando grade completa (Cluster 1:4 x todas as unidades)
contar_por_unidade <- function(df, unit_id) {
  uid <- as_label(enquo(unit_id))
  
  df1 <- df |>
    filter(!is.na({{unit_id}})) |>
    mutate(Cluster = as.integer(Cluster)) |>
    filter(Cluster %in% 1:4)
  
  units_tbl <- df1 |> distinct({{unit_id}})                    # todas as unidades presentes
  grid <- tidyr::crossing(Cluster = 1:4, units_tbl)            # grade completa 4 x U
  
  counts <- df1 |>
    count(Cluster, {{unit_id}}, name = "n")
  
  full <- grid |>
    left_join(counts, by = c("Cluster", uid)) |>
    mutate(n = coalesce(n, 0L)) |>
    group_by({{unit_id}}) |>
    mutate(n_total = sum(n), perc_cluster = if_else(n_total > 0, 100 * n / n_total, NA_real_)) |>
    ungroup()
  
  full
}

dominante_por_unidade <- function(df_counts, unit_id) {
  df_counts |>
    group_by({{unit_id}}) |>
    slice_max(n, n = 1, with_ties = FALSE) |>
    transmute(
      {{unit_id}},
      Cluster_Dom = Cluster,
      n_dom = n,
      n_total = n_total,
      perc_dom = 100 * n_dom / n_total
    ) |>
    ungroup()
}

pontos_rotulos <- function(sf_polygons, perc_col = "perc") {
  if (!perc_col %in% names(sf_polygons)) return(data.frame())
  pts <- sf::st_point_on_surface(sf_polygons)
  crd <- sf::st_coordinates(pts)
  df  <- sf::st_drop_geometry(sf_polygons)
  df$lon <- crd[,1]; df$lat <- crd[,2]
  df$label <- paste0(scales::number(df[[perc_col]], accuracy = 1), "%")
  df[, c("lon","lat","label")]
}

mapa_consolidado <- function(sf_join, titulo) {
  labs_df <- sf_join |>
    filter(!is.na(Cluster_Dom)) |>
    rename(perc = perc_dom) |>
    pontos_rotulos("perc")
  
  ggplot() +
    geom_sf(data = sf_join, aes(fill = factor(Cluster_Dom, levels = 1:4)),
            color = "black", linewidth = 0.1) +
    geom_text_repel(
      data = labs_df,
      aes(x = lon, y = lat, label = label),
      size = 2.4, color = "grey15",
      max.overlaps = Inf, segment.size = 0.1, box.padding = 0.15, point.padding = 0.15
    ) +
    scale_fill_manual(values = cores_clusters, na.value = "grey90", name = "Cluster Dominante") +
    coord_sf(expand = FALSE, datum = NA) + theme_minimal() +
    labs(title = titulo, subtitle = "(2005–2016)") +
    theme(legend.position = "bottom",
          plot.title = element_text(size = 11, hjust = 0.5),
          legend.title = element_text(size = 9), legend.text = element_text(size = 8))
}

# --------------------- UF ---------------------
uf_to_ibge <- tribble(
  ~UF,~code_state,
  "AC",12,"AL",27,"AM",13,"AP",16,"BA",29,"CE",23,"DF",53,"ES",32,"GO",52,"MA",21,
  "MG",31,"MS",50,"MT",51,"PA",15,"PB",25,"PE",26,"PI",22,"PR",41,"RJ",33,"RN",24,
  "RO",11,"RR",14,"RS",43,"SC",42,"SE",28,"SP",35,"TO",17
)

df_amostra_uf <- df_clusters |>
  left_join(df_original |> select(CNPJ, UF), by = "CNPJ") |>
  filter(!is.na(UF)) |>
  left_join(uf_to_ibge, by = "UF")

df_uf_counts <- contar_por_unidade(df_amostra_uf, code_state)

# Checagem São Paulo → 4 linhas: 1:0, 2:13, 3:141, 4:53  (68,1% no 3)
sp_share <- df_uf_counts |>
  filter(code_state == 35) |>
  arrange(Cluster) |>
  mutate(p = round(perc_cluster, 1))
print(sp_share)

df_uf_dom <- dominante_por_unidade(df_uf_counts, code_state)

br_uf <- geobr::read_state(2020) |>
  mutate(code_state = as.numeric(code_state)) |>
  sf::st_transform(4674)

br_uf_consol <- br_uf |>
  left_join(df_uf_dom, by = "code_state")

p_uf_consol <- mapa_consolidado(br_uf_consol, "Estados — Cluster Dominante (com %)")
ggsave(file.path("mapas_clusters","mapa_uf_consolidado.png"),
       p_uf_consol, width = 11, height = 8, dpi = 320)

# --------------------- Regiões INTERMEDIÁRIAS ---------------------
df_amostra_inter <- df_clusters |>
  left_join(df_original |> select(CNPJ, Cod_Reg_Intermed), by = "CNPJ") |>
  rename(code_intermediate = Cod_Reg_Intermed)

df_inter_counts <- contar_por_unidade(df_amostra_inter, code_intermediate)
df_inter_dom    <- dominante_por_unidade(df_inter_counts,  code_intermediate)

br_inter <- geobr::read_intermediate_region(2020) |>
  mutate(code_intermediate = as.numeric(code_intermediate)) |>
  sf::st_transform(4674)

br_inter_consol <- br_inter |>
  left_join(df_inter_dom, by = "code_intermediate")

p_inter_consol <- mapa_consolidado(br_inter_consol, "Regiões Intermediárias — Cluster Dominante (com %)")
ggsave(file.path("mapas_clusters","mapa_intermediaria_consolidado.png"),
       p_inter_consol, width = 11, height = 8, dpi = 320)

# --------------------- Regiões IMEDIATAS ---------------------
df_amostra_imed <- df_clusters |>
  left_join(df_original |> select(CNPJ, Cod_Reg_Imediata), by = "CNPJ") |>
  rename(code_immediate = Cod_Reg_Imediata)

df_imed_counts <- contar_por_unidade(df_amostra_imed, code_immediate)
df_imed_dom    <- dominante_por_unidade(df_imed_counts,  code_immediate)

br_imed <- geobr::read_immediate_region(2020) |>
  mutate(code_immediate = as.numeric(code_immediate)) |>
  sf::st_transform(4674)

br_imed_consol <- br_imed |>
  left_join(df_imed_dom, by = "code_immediate")

p_imed_consol <- mapa_consolidado(br_imed_consol, "Regiões Imediatas — Cluster Dominante (com %)")
ggsave(file.path("mapas_clusters","mapa_imediata_consolidado.png"),
       p_imed_consol, width = 11, height = 8, dpi = 320)

message("Concluído. Mapas salvos em: ", normalizePath("mapas_clusters"))




###GERANDO TABELA COM QUANTIDADE DE COOP POR UNIDADES

# ============================================================
# Tabelas: Nº de cooperativas por cluster
# (Cidade, Reg. Imediata, Reg. Intermediária, UF)
# ============================================================

# Pacotes
libs <- c("dplyr","tidyr","openxlsx","readr","tibble")
for (p in libs) if (!require(p, character.only=TRUE)) install.packages(p)
invisible(lapply(libs, library, character.only=TRUE))
options(scipen = 999)

# ---------------------- 1) Ler bases ------------------------
df_clusters <- read_csv("df_final_com_clusters.csv", show_col_types = FALSE) |>
  mutate(
    CNPJ    = as.character(CNPJ),
    Cluster = suppressWarnings(as.integer(as.character(Cluster)))
  ) |>
  distinct(CNPJ, .keep_all = TRUE)  # 1 linha por CNPJ

df_orig_raw <- read_csv("df_clusterOriginal.csv", show_col_types = FALSE) |>
  mutate(CNPJ = as.character(CNPJ))

# ---------------------- 2) Moda por CNPJ --------------------
pick_mode <- function(x) {
  x <- x[!is.na(x)]
  if (length(x) == 0) return(NA)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

df_original <- df_orig_raw |>
  group_by(CNPJ) |>
  summarise(
    UF               = pick_mode(UF),
    Cod_Munic        = suppressWarnings(as.integer(pick_mode(Cod_Munic))),
    Cod_Reg_Imediata = suppressWarnings(as.integer(pick_mode(Cod_Reg_Imediata))),
    Cod_Reg_Intermed = suppressWarnings(as.integer(pick_mode(Cod_Reg_Intermed))),
    .groups = "drop"
  )

# ---------------------- 3) Corrigir codificação de Cluster --------------------
uniqC <- sort(unique(na.omit(df_clusters$Cluster)))
if (identical(uniqC, 0:3)) {
  message("Detectado Cluster 0..3. Reetiquetando para 1..4 (+1).")
  df_clusters <- df_clusters |> mutate(Cluster = Cluster + 1L)
}
if (!setequal(sort(unique(na.omit(df_clusters$Cluster))), 1:4)) {
  message("Clusters fora de 1..4. Remapeando ordenadamente para 1..4.")
  levs <- sort(unique(na.omit(df_clusters$Cluster)))
  df_clusters <- df_clusters |>
    mutate(Cluster = as.integer(factor(Cluster, levels = levs)))
}

# ---------------------- 4) Base unificada -------------------
df_base <- df_clusters |> left_join(df_original, by = "CNPJ")

# ---------------------- 5) Helper robusto -------------------
# Gera tabela larga por unidade com colunas Cluster_1..Cluster_4 e Total.
# unit_cols: vetor de nomes das colunas que definem a unidade (ex. c("UF","Cod_Munic"))
tabela_por_unidade <- function(df, unit_cols) {
  stopifnot(all(unit_cols %in% names(df)))
  
  # Mantém apenas linhas com identificadores completos p/ essa unidade
  df_use <- df |>
    dplyr::filter(dplyr::if_all(dplyr::all_of(unit_cols), ~ !is.na(.x))) |>
    dplyr::mutate(Cluster = as.integer(Cluster))   # garante 1..4 inteiros
  
  # grade completa: (todas as unidades) x (Cluster = 1:4)
  units_tbl <- df_use |> dplyr::distinct(dplyr::across(dplyr::all_of(unit_cols)))
  grid <- tidyr::crossing(units_tbl, tibble::tibble(Cluster = 1:4))
  
  # contagem real
  counts <- df_use |>
    dplyr::count(dplyr::across(dplyr::all_of(unit_cols)), Cluster, name = "n")
  
  # completa com zeros e monta tabela larga
  full <- grid |>
    dplyr::left_join(counts, by = c(unit_cols, "Cluster")) |>
    dplyr::mutate(n = dplyr::coalesce(n, 0L))
  
  full |>
    tidyr::pivot_wider(names_from = Cluster, values_from = n,
                       names_prefix = "Cluster_", values_fill = 0) |>
    dplyr::mutate(Total = rowSums(dplyr::across(starts_with("Cluster_")))) |>
    dplyr::arrange(dplyr::across(dplyr::all_of(unit_cols)))
}

# ---------------------- 6) Tabelas --------------------------
# 6.1 Cidade (UF + Cod_Munic)
tabela_cidade <- tabela_por_unidade(df_base, c("UF","Cod_Munic"))

# 6.2 Região Imediata
tabela_imediata <- tabela_por_unidade(df_base, "Cod_Reg_Imediata")

# 6.3 Região Intermediária
tabela_intermediaria <- tabela_por_unidade(df_base, "Cod_Reg_Intermed")

# 6.4 UF
tabela_uf <- tabela_por_unidade(df_base, "UF")

# ---------------------- 7) Checagem rápida (opcional) ----------------------
cat("\nUF = SP (esperado: Cluster_1=0, Cluster_2=13, Cluster_3=141, Cluster_4=53, Total=207)\n")
print(dplyr::filter(tabela_uf, UF == "SP"))

cat("\nReg. Imediata: linhas =", nrow(tabela_imediata),
    " | Reg. Intermediária: linhas =", nrow(tabela_intermediaria),
    " | Cidade: linhas =", nrow(tabela_cidade), "\n")

# ---------------------- 8) Exportar Excel -------------------
wb <- createWorkbook()
addWorksheet(wb, "Por_Cidade")
addWorksheet(wb, "Por_Reg_Imediata")
addWorksheet(wb, "Por_Reg_Intermediaria")
addWorksheet(wb, "Por_UF")

writeDataTable(wb, "Por_Cidade",            tabela_cidade)
writeDataTable(wb, "Por_Reg_Imediata",      tabela_imediata)
writeDataTable(wb, "Por_Reg_Intermediaria", tabela_intermediaria)
writeDataTable(wb, "Por_UF",                tabela_uf)

setColWidths(wb, "Por_Cidade",            1:ncol(tabela_cidade), widths = "auto")
setColWidths(wb, "Por_Reg_Imediata",      1:ncol(tabela_imediata), widths = "auto")
setColWidths(wb, "Por_Reg_Intermediaria", 1:ncol(tabela_intermediaria), widths = "auto")
setColWidths(wb, "Por_UF",                1:ncol(tabela_uf), widths = "auto")

saveWorkbook(wb, "tabelas_clusters_por_unidade.xlsx", overwrite = TRUE)
message("Pronto! Arquivo salvo: tabelas_clusters_por_unidade.xlsx")



###VALIDANDO OS NUMEROS DE COOP POR CLUSTERS
# ============================================================
# Validação das contagens por unidade (UF / Intermediária / Imediata / Cidade)
# - Compara dois métodos de atribuição por CNPJ: MODA vs ÚLTIMO ANO não-NA
# - Gera diffs por unidade e por cluster
# - Faz checagens de integridade e exporta Excel
# ============================================================

libs <- c("dplyr","tidyr","readr","openxlsx","tibble","stringr")
for (p in libs) if (!require(p, character.only=TRUE)) install.packages(p)
invisible(lapply(libs, library, character.only=TRUE))
options(scipen = 999)

# ---------------------- 1) Ler bases ------------------------
df_clusters <- read_csv("df_final_com_clusters.csv", show_col_types = FALSE) %>%
  mutate(
    CNPJ    = as.character(CNPJ),
    Cluster = suppressWarnings(as.integer(as.character(Cluster)))
  ) %>%
  distinct(CNPJ, .keep_all = TRUE)  # 1 linha por CNPJ

df_orig_raw <- read_csv("df_clusterOriginal.csv", show_col_types = FALSE) %>%
  mutate(
    CNPJ = as.character(CNPJ),
    ANO  = suppressWarnings(as.integer(ANO))
  )

# ---------------------- 2) Normalizar Cluster 1..4 ------------------------
uniqC <- sort(unique(na.omit(df_clusters$Cluster)))
if (identical(uniqC, 0:3)) {
  message("Clusters codificados como 0..3 → normalizando para 1..4 (+1).")
  df_clusters <- df_clusters %>% mutate(Cluster = Cluster + 1L)
}
if (!setequal(sort(unique(na.omit(df_clusters$Cluster))), 1:4)) {
  message("Clusters fora de 1..4 → remapeando ordenadamente para 1..4.")
  levs <- sort(unique(na.omit(df_clusters$Cluster)))
  df_clusters <- df_clusters %>%
    mutate(Cluster = as.integer(factor(Cluster, levels = levs)))
}

# ---------------------- 3) Helpers --------------------------
pick_mode <- function(x) {
  x <- x[!is.na(x)]
  if (length(x) == 0) return(NA)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Atribuição por CNPJ via MODA (valor mais frequente nos anos)
collapse_by_mode <- function(df) {
  df %>%
    group_by(CNPJ) %>%
    summarise(
      UF               = pick_mode(UF),
      Cod_Munic        = suppressWarnings(as.integer(pick_mode(Cod_Munic))),
      Cod_Reg_Imediata = suppressWarnings(as.integer(pick_mode(Cod_Reg_Imediata))),
      Cod_Reg_Intermed = suppressWarnings(as.integer(pick_mode(Cod_Reg_Intermed))),
      .groups = "drop"
    )
}

# Atribuição por CNPJ via ÚLTIMO ANO não-NA (prioriza anos mais recentes)
collapse_by_last <- function(df) {
  # ordena por ano crescente para poder pegar o último não-NA com dplyr::last
  df2 <- df %>% arrange(CNPJ, ANO)
  last_non_na <- function(x) {
    y <- x[!is.na(x)]
    if (length(y) == 0) return(NA)
    y[length(y)]
  }
  df2 %>%
    group_by(CNPJ) %>%
    summarise(
      UF               = last_non_na(UF),
      Cod_Munic        = suppressWarnings(as.integer(last_non_na(Cod_Munic))),
      Cod_Reg_Imediata = suppressWarnings(as.integer(last_non_na(Cod_Reg_Imediata))),
      Cod_Reg_Intermed = suppressWarnings(as.integer(last_non_na(Cod_Reg_Intermed))),
      .groups = "drop"
    )
}

# Contagem por unidade garantindo níveis 1..4 e preenchendo zeros
count_by_unit <- function(assign_df, unit_cols, df_clusters) {
  stopifnot(all(unit_cols %in% names(assign_df)))
  base <- df_clusters %>%
    select(CNPJ, Cluster) %>%
    inner_join(assign_df, by = "CNPJ") %>%
    filter(if_all(all_of(unit_cols), ~ !is.na(.x))) %>%
    mutate(Cluster = as.integer(Cluster))
  
  # grade completa (todas as unidades x 1..4)
  units_tbl <- base %>% distinct(across(all_of(unit_cols)))
  grid <- tidyr::crossing(units_tbl, tibble(Cluster = 1:4))
  
  counts <- base %>%
    count(across(all_of(unit_cols)), Cluster, name = "n")
  
  grid %>%
    left_join(counts, by = c(unit_cols, "Cluster")) %>%
    mutate(n = coalesce(n, 0L))
}

wide_table <- function(counts_tbl, unit_cols) {
  counts_tbl %>%
    pivot_wider(names_from = Cluster, values_from = n,
                names_prefix = "Cluster_", values_fill = 0) %>%
    mutate(Total = rowSums(across(starts_with("Cluster_")))) %>%
    arrange(across(all_of(unit_cols)))
}

# compara dois métodos e mostra diferenças por unidade x cluster
compare_methods <- function(counts_A, counts_B, unit_cols, tagA="MODA", tagB="ULTIMO") {
  counts_A %>%
    rename(n_A = n) %>%
    full_join(counts_B %>% rename(n_B = n),
              by = c(unit_cols, "Cluster")) %>%
    mutate(
      n_A = coalesce(n_A, 0L),
      n_B = coalesce(n_B, 0L),
      diff = n_A - n_B
    ) %>%
    arrange(across(all_of(unit_cols)), Cluster)
}

# ---------------------- 4) Construir atribuições --------------------------
assign_mode <- collapse_by_mode(df_orig_raw)
assign_last <- collapse_by_last(df_orig_raw)

# Diagnóstico de “instabilidade” (CNPJ com mais de 1 valor ao longo do tempo)
instab <- df_orig_raw %>%
  group_by(CNPJ) %>%
  summarise(
    n_UF   = n_distinct(UF, na.rm=TRUE),
    n_IMED = n_distinct(Cod_Reg_Imediata, na.rm=TRUE),
    n_INTER= n_distinct(Cod_Reg_Intermed, na.rm=TRUE),
    n_MUN  = n_distinct(Cod_Munic, na.rm=TRUE),
    .groups="drop"
  )
cat("\nCNPJs com >1 UF ao longo do tempo:", sum(instab$n_UF   > 1), "\n")
cat("CNPJs com >1 Reg. Imediata:",       sum(instab$n_IMED > 1), "\n")
cat("CNPJs com >1 Reg. Intermediária:",  sum(instab$n_INTER> 1), "\n")
cat("CNPJs com >1 Município:",           sum(instab$n_MUN  > 1), "\n")

# ---------------------- 5) Contagens dos dois métodos ----------------------
# Listas de níveis
units_list <- list(
  UF            = c("UF"),
  Intermediaria = c("Cod_Reg_Intermed"),
  Imediata      = c("Cod_Reg_Imediata"),
  Cidade        = c("UF","Cod_Munic")
)

# Contagens
counts_mode  <- lapply(units_list, function(cols) count_by_unit(assign_mode, cols, df_clusters))
counts_last  <- lapply(units_list, function(cols) count_by_unit(assign_last, cols, df_clusters))

# Tabelas largas (método MODA) para inspecionar
tabela_uf_moda   <- wide_table(counts_mode$UF,            units_list$UF)
tabela_inter_moda<- wide_table(counts_mode$Intermediaria, units_list$Intermediaria)
tabela_imed_moda <- wide_table(counts_mode$Imediata,      units_list$Imediata)
tabela_cidade_m  <- wide_table(counts_mode$Cidade,        units_list$Cidade)

# Checagem SP (método MODA)
cat("\n[CHECK] UF=SP (MODA):\n")
print(tabela_uf_moda %>% filter(UF=="SP"))

# Diferenças entre métodos (deve ser tudo zero se não há ambiguidade)
diff_uf   <- compare_methods(counts_mode$UF,            counts_last$UF,            units_list$UF)
diff_inter<- compare_methods(counts_mode$Intermediaria, counts_last$Intermediaria, units_list$Intermediaria)
diff_imed <- compare_methods(counts_mode$Imediata,      counts_last$Imediata,      units_list$Imediata)
diff_city <- compare_methods(counts_mode$Cidade,        counts_last$Cidade,        units_list$Cidade)

cat("\nLinhas com diferenças UF:",          sum(diff_uf$diff!=0),   "\n")
cat("Diferenças Intermediária:",            sum(diff_inter$diff!=0),"\n")
cat("Diferenças Imediata:",                 sum(diff_imed$diff!=0), "\n")
cat("Diferenças Cidade:",                   sum(diff_city$diff!=0), "\n")

# Mostra as 10 maiores diferenças (se houver)
print(head(diff_uf %>% filter(diff!=0) %>% arrange(desc(abs(diff))), 10))

# ---------------------- 6) Reconciliações globais --------------------------
total_cnpjs <- nrow(df_clusters)
soma_uf_moda <- sum(tabela_uf_moda$Total)
stopifnot(soma_uf_moda == total_cnpjs)  # cada CNPJ deve entrar em exatamente 1 UF
cat("\n[OK] Soma por UF (MODA) == total de CNPJs:", soma_uf_moda, "\n")

somas_clusters_uf <- counts_mode$UF %>% group_by(Cluster) %>% summarise(n=sum(n), .groups="drop")
cat("\nDistribuição global por Cluster (MODA):\n"); print(somas_clusters_uf)

# ---------------------- 7) Exportar Excel --------------------------
wb <- createWorkbook()
addWorksheet(wb, "UF_moda")
addWorksheet(wb, "Intermediaria_moda")
addWorksheet(wb, "Imediata_moda")
addWorksheet(wb, "Cidade_moda")
addWorksheet(wb, "Diff_UF_moda_vs_last")
addWorksheet(wb, "Diff_Inter_moda_vs_last")
addWorksheet(wb, "Diff_Imed_moda_vs_last")
addWorksheet(wb, "Diff_Cidade_moda_vs_last")

writeDataTable(wb, "UF_moda",            tabela_uf_moda)
writeDataTable(wb, "Intermediaria_moda", tabela_inter_moda)
writeDataTable(wb, "Imediata_moda",      tabela_imed_moda)
writeDataTable(wb, "Cidade_moda",        tabela_cidade_m)

writeDataTable(wb, "Diff_UF_moda_vs_last",   diff_uf)
writeDataTable(wb, "Diff_Inter_moda_vs_last",diff_inter)
writeDataTable(wb, "Diff_Imed_moda_vs_last", diff_imed)
writeDataTable(wb, "Diff_Cidade_moda_vs_last", diff_city)

setColWidths(wb, 1:length(names(wb$worksheets)), cols = 1:50, widths = "auto")
saveWorkbook(wb, "VALIDACAO_contagens_clusters.xlsx", overwrite = TRUE)
message("\nRelatório salvo: VALIDACAO_contagens_clusters.xlsx")



##### GERANDO NOVAMENTE OS MAPAS

# ============================================================
# MAPAS validados (MODA) — UF / Reg. Intermediária / Reg. Imediata
# + mapas municipais por UF com cluster dominante por município
# ============================================================

# Pacotes
libs <- c("geobr","ggplot2","dplyr","sf","ggrepel","scales","tidyr","tibble","readr")
for (p in libs) if (!require(p, character.only=TRUE)) install.packages(p)
invisible(lapply(libs, library, character.only=TRUE))
options(scipen = 999)

# ---------------------- 1) Ler bases ------------------------
df_clusters <- readr::read_csv("df_final_com_clusters.csv", show_col_types = FALSE) |>
  dplyr::mutate(
    CNPJ    = as.character(CNPJ),
    Cluster = suppressWarnings(as.integer(as.character(Cluster)))
  ) |>
  dplyr::distinct(CNPJ, .keep_all = TRUE)

df_orig_raw <- readr::read_csv("df_clusterOriginal.csv", show_col_types = FALSE) |>
  dplyr::mutate(
    CNPJ = as.character(CNPJ),
    ANO  = suppressWarnings(as.integer(ANO))
  )

# ---------------------- 2) Normalizar Cluster 1..4 ------------------------
uniqC <- sort(unique(stats::na.omit(df_clusters$Cluster)))
if (identical(uniqC, 0:3)) {
  message("Clusters 0..3 detectados. Reetiquetando para 1..4 (+1).")
  df_clusters <- df_clusters |> dplyr::mutate(Cluster = Cluster + 1L)
}
if (!setequal(sort(unique(stats::na.omit(df_clusters$Cluster))), 1:4)) {
  message("Clusters fora de 1..4 detectados. Remapeando ordenadamente para 1..4.")
  levs <- sort(unique(stats::na.omit(df_clusters$Cluster)))
  df_clusters <- df_clusters |> dplyr::mutate(Cluster = as.integer(factor(Cluster, levels = levs)))
}

# ---------------------- 3) Atribuição por MODA ----------------------------
pick_mode <- function(x) {
  x <- x[!is.na(x)]
  if (length(x) == 0) return(NA)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

assign_mode <- df_orig_raw |>
  dplyr::group_by(CNPJ) |>
  dplyr::summarise(
    UF               = pick_mode(UF),
    Cod_Munic        = suppressWarnings(as.integer(pick_mode(Cod_Munic))),
    Cod_Reg_Imediata = suppressWarnings(as.integer(pick_mode(Cod_Reg_Imediata))),
    Cod_Reg_Intermed = suppressWarnings(as.integer(pick_mode(Cod_Reg_Intermed))),
    .groups = "drop"
  )

# ---------------------- 4) Helpers de contagem / dominante -----------------
# Conta por unidade preservando clusters 1..4 (grade completa) e calcula % por unidade
count_by_unit <- function(assign_df, unit_cols, df_clusters) {
  stopifnot(all(unit_cols %in% names(assign_df)))
  base <- df_clusters |>
    dplyr::select(CNPJ, Cluster) |>
    dplyr::inner_join(assign_df, by = "CNPJ") |>
    dplyr::filter(dplyr::if_all(dplyr::all_of(unit_cols), ~ !is.na(.x))) |>
    dplyr::mutate(Cluster = as.integer(Cluster))
  
  units_tbl <- base |> dplyr::distinct(dplyr::across(dplyr::all_of(unit_cols)))
  grid <- tidyr::crossing(units_tbl, tibble::tibble(Cluster = 1:4))
  
  counts <- base |>
    dplyr::count(dplyr::across(dplyr::all_of(unit_cols)), Cluster, name = "n")
  
  grid |>
    dplyr::left_join(counts, by = c(unit_cols, "Cluster")) |>
    dplyr::mutate(n = dplyr::coalesce(n, 0L)) |>
    dplyr::group_by(dplyr::across(dplyr::all_of(unit_cols))) |>
    dplyr::mutate(n_total = sum(n),
                  perc_cluster = dplyr::if_else(n_total > 0, 100 * n / n_total, NA_real_)) |>
    dplyr::ungroup()
}

# Dominante com tidy-eval (passe a coluna da unidade com {{ }})
dominant_simple <- function(counts_tbl, unit_col) {
  counts_tbl |>
    dplyr::group_by({{ unit_col }}) |>
    dplyr::slice_max(n, n = 1, with_ties = FALSE) |>
    dplyr::ungroup() |>
    dplyr::transmute(
      {{ unit_col }},
      Cluster_Dom = Cluster,
      n_dom   = n,
      n_total = n_total,
      perc_dom = 100 * n_dom / n_total
    )
}

# Centróides internos para rótulos “xx%”
point_labels <- function(sf_polygons, perc_col = "perc") {
  if (!perc_col %in% names(sf_polygons)) return(data.frame())
  pts <- sf::st_point_on_surface(sf_polygons)
  crd <- sf::st_coordinates(pts)
  df  <- sf::st_drop_geometry(sf_polygons)
  df$lon <- crd[,1]; df$lat <- crd[,2]
  df$label <- paste0(scales::number(df[[perc_col]], accuracy = 1), "%")
  df[, c("lon","lat","label")]
}

# Paleta e tema
cores_clusters <- c("1"="#FF9999","2"="#66CC99","3"="#FFCC66","4"="#9999FF")
theme_map <- ggplot2::theme_minimal(base_size = 10) +
  ggplot2::theme(legend.position = "bottom",
                 plot.title = element_text(hjust = 0.5, face = "bold"),
                 legend.title = element_text(size = 9),
                 legend.text  = element_text(size = 8))

# Plot consolidado (fill = Cluster_Dom; label = % dominante)
plot_consolidado <- function(sf_join, titulo) {
  labs_df <- sf_join |>
    dplyr::filter(!is.na(Cluster_Dom)) |>
    dplyr::rename(perc = perc_dom) |>
    point_labels("perc")
  
  ggplot2::ggplot() +
    ggplot2::geom_sf(data = sf_join,
                     aes(fill = factor(Cluster_Dom, levels = 1:4)),
                     color = "black", linewidth = 0.1) +
    ggrepel::geom_text_repel(
      data = labs_df,
      aes(x = lon, y = lat, label = label),
      size = 2.6, color = "grey15",
      max.overlaps = Inf, segment.size = 0.1, box.padding = 0.15, point.padding = 0.15
    ) +
    ggplot2::scale_fill_manual(values = cores_clusters, na.value = "grey90",
                               name = "Cluster Dominante",
                               labels = c("1","2","3","4")) +
    ggplot2::coord_sf(expand = FALSE, datum = NA) +
    ggplot2::labs(title = titulo, subtitle = "(2005–2016)") +
    theme_map
}

dir.create("mapas_validado", showWarnings = FALSE)

# ---------------------- 5) UF (consolidado) ----------------------
uf_counts <- count_by_unit(assign_mode, "UF", df_clusters)
uf_dom    <- dominant_simple(uf_counts, UF)

uf_to_ibge <- tibble::tribble(
  ~UF,~code_state,
  "AC",12,"AL",27,"AM",13,"AP",16,"BA",29,"CE",23,"DF",53,"ES",32,"GO",52,"MA",21,
  "MG",31,"MS",50,"MT",51,"PA",15,"PB",25,"PE",26,"PI",22,"PR",41,"RJ",33,"RN",24,
  "RO",11,"RR",14,"RS",43,"SC",42,"SE",28,"SP",35,"TO",17
)
uf_dom <- uf_dom |> dplyr::left_join(uf_to_ibge, by = "UF")

br_uf <- geobr::read_state(year = 2020) |>
  dplyr::mutate(code_state = as.numeric(code_state)) |>
  sf::st_transform(4674)

br_uf_consol <- br_uf |> dplyr::left_join(uf_dom, by = "code_state")

p_uf <- plot_consolidado(br_uf_consol, "Estados — Cluster Dominante (com %)")
ggsave(file.path("mapas_validado","01_mapa_UF_consolidado.png"),
       p_uf, width = 11, height = 8, dpi = 320)

# ---------------------- 6) Região Intermediária (consolidado) --------------
inter_counts <- count_by_unit(assign_mode, "Cod_Reg_Intermed", df_clusters)
inter_dom    <- dominant_simple(inter_counts, Cod_Reg_Intermed)

br_inter <- geobr::read_intermediate_region(year = 2020) |>
  dplyr::mutate(code_intermediate = as.numeric(code_intermediate)) |>
  sf::st_transform(4674)

# join por código (convertendo tipo para numérico)
inter_dom2 <- inter_dom |> dplyr::mutate(Cod_Reg_Intermed = as.numeric(Cod_Reg_Intermed))
br_inter_consol <- br_inter |>
  dplyr::left_join(inter_dom2, by = c("code_intermediate" = "Cod_Reg_Intermed"))

p_inter <- plot_consolidado(br_inter_consol, "Regiões Intermediárias — Cluster Dominante (com %)")
ggsave(file.path("mapas_validado","02_mapa_RegIntermediaria_consolidado.png"),
       p_inter, width = 11, height = 8, dpi = 320)

# ---------------------- 7) Região Imediata (consolidado) -------------------
imed_counts <- count_by_unit(assign_mode, "Cod_Reg_Imediata", df_clusters)
imed_dom    <- dominant_simple(imed_counts, Cod_Reg_Imediata)

br_imed <- geobr::read_immediate_region(year = 2020) |>
  dplyr::mutate(code_immediate = as.numeric(code_immediate)) |>
  sf::st_transform(4674)

imed_dom2 <- imed_dom |> dplyr::mutate(Cod_Reg_Imediata = as.numeric(Cod_Reg_Imediata))
br_imed_consol <- br_imed |>
  dplyr::left_join(imed_dom2, by = c("code_immediate" = "Cod_Reg_Imediata"))

p_imed <- plot_consolidado(br_imed_consol, "Regiões Imediatas — Cluster Dominante (com %)")
ggsave(file.path("mapas_validado","03_mapa_RegImediata_consolidado.png"),
       p_imed, width = 11, height = 8, dpi = 320)

# ---------------------- 8) Mapas municipais por UF -------------------------
# Converter Cod_Munic (6 dígitos) para code_muni (7 dígitos com DV) quando preciso
calc_code_muni7 <- function(x) {
  sapply(x, function(code) {
    cs <- suppressWarnings(as.character(code))
    if (is.na(cs) || cs == "NA") return(NA_real_)
    cs <- gsub("\\D", "", cs)
    if (nchar(cs) == 7) return(as.numeric(cs))
    if (nchar(cs) != 6) return(NA_real_)
    digits <- as.numeric(strsplit(cs, "")[[1]])
    weights <- c(1,2,1,2,1,2)
    prod <- digits * weights
    red  <- ifelse(prod > 9, (prod %/% 10) + (prod %% 10), prod)
    dv   <- (10 - (sum(red) %% 10)) %% 10
    as.numeric(paste0(cs, dv))
  })
}

assign_mode_muni <- assign_mode |>
  dplyr::mutate(code_muni = calc_code_muni7(Cod_Munic))

# cluster dominante por município dentro de cada UF
muni_counts <- df_clusters |>
  dplyr::select(CNPJ, Cluster) |>
  dplyr::inner_join(assign_mode_muni |> dplyr::select(CNPJ, UF, code_muni), by = "CNPJ") |>
  dplyr::filter(!is.na(UF), !is.na(code_muni)) |>
  dplyr::group_by(UF, code_muni, Cluster) |>
  dplyr::summarise(n = dplyr::n(), .groups = "drop") |>
  dplyr::group_by(UF, code_muni) |>
  dplyr::mutate(n_total = sum(n)) |>
  dplyr::ungroup()

muni_dom <- muni_counts |>
  dplyr::group_by(UF, code_muni) |>
  dplyr::slice_max(n, n = 1, with_ties = FALSE) |>
  dplyr::ungroup() |>
  dplyr::transmute(UF, code_muni, Cluster_Dom = Cluster, n_dom = n, n_total = n_total,
                   perc_dom = 100 * n_dom / n_total)

# mapeamento UF -> code_state (para ler municípios de cada UF)
uf_to_ibge <- tibble::tribble(
  ~UF,~code_state,
  "AC",12,"AL",27,"AM",13,"AP",16,"BA",29,"CE",23,"DF",53,"ES",32,"GO",52,"MA",21,
  "MG",31,"MS",50,"MT",51,"PA",15,"PB",25,"PE",26,"PI",22,"PR",41,"RJ",33,"RN",24,
  "RO",11,"RR",14,"RS",43,"SC",42,"SE",28,"SP",35,"TO",17
)

ufs <- muni_dom |> dplyr::distinct(UF) |> dplyr::pull(UF)

for (uf in ufs) {
  message("Gerando mapa municipal para UF: ", uf)
  code_state <- uf_to_ibge$code_state[uf_to_ibge$UF == uf][1]
  
  muni_all <- tryCatch({
    geobr::read_municipality(code_muni = code_state, year = 2020, showProgress = FALSE)
  }, error = function(e) NULL)
  
  if (is.null(muni_all) || nrow(muni_all) == 0) next
  
  muni_all <- muni_all |>
    dplyr::mutate(code_muni = as.numeric(code_muni)) |>
    sf::st_transform(4674)
  
  muni_dom_uf <- muni_dom |> dplyr::filter(UF == uf)
  
  muni_join <- muni_all |>
    dplyr::left_join(muni_dom_uf, by = "code_muni")
  
  # --- dentro do loop for (uf in ufs) { ... } ---
  
  # Define a área de foco: só municípios com dado (sem NA)
  muni_focus <- dplyr::filter(muni_join, !is.na(Cluster_Dom))
  
  # Se houver municípios com coops, usa o bbox deles para o zoom;
  # caso contrário, cai no bbox de toda a UF
  if (nrow(muni_focus) > 0) {
    bb <- sf::st_bbox(muni_focus)
  } else {
    bb <- sf::st_bbox(muni_all)
  }
  
  # Margem de 3% para não cortar bordas
  xpad <- 0.03 * (bb$xmax - bb$xmin)
  ypad <- 0.03 * (bb$ymax - bb$ymin)
  
  p_muni <- ggplot2::ggplot() +
    # bordas de TODOS os municípios (continua desenhando tudo)
    ggplot2::geom_sf(data = muni_all, fill = "grey98", color = "grey70", size = 0.2) +
    # municípios com cooperativas: cor do cluster dominante
    ggplot2::geom_sf(data = muni_focus,
                     aes(fill = factor(Cluster_Dom, levels = 1:4)),
                     color = NA, alpha = 0.98) +
    ggplot2::scale_fill_manual(values = cores_clusters, name = "Cluster Dominante",
                               na.value = "grey90", labels = c("1","2","3","4")) +
    ggplot2::coord_sf(
      xlim = c(bb$xmin - xpad, bb$xmax + xpad),
      ylim = c(bb$ymin - ypad, bb$ymax + ypad),
      datum = NA, expand = FALSE
    ) +
    ggplot2::labs(title = paste0("Municípios — Cluster Dominante | UF ", uf),
                  subtitle = "(2005–2016)") +
    theme_map
  
  ggplot2::ggsave(file.path("mapas_validado", paste0("04_mapa_Municipios_", uf, ".png")),
                  p_muni, width = 11, height = 8, dpi = 320)
}

message("Concluído. Mapas em: ", normalizePath("mapas_validado"))



###SOMENTE REG. INTER
# ============================================================
# Regerar "03_mapa_RegImediata_consolidado" SEM rótulos de %
# ============================================================

# Pacotes
libs <- c("geobr","ggplot2","dplyr","sf","scales","tidyr","tibble","readr")
for (p in libs) if (!require(p, character.only=TRUE)) install.packages(p)
invisible(lapply(libs, library, character.only=TRUE))
options(scipen = 999)

# ---------- 1) Ler bases ----------
df_clusters <- readr::read_csv("df_final_com_clusters.csv", show_col_types = FALSE) |>
  dplyr::mutate(
    CNPJ    = as.character(CNPJ),
    Cluster = suppressWarnings(as.integer(as.character(Cluster)))
  ) |>
  dplyr::distinct(CNPJ, .keep_all = TRUE)

df_orig_raw <- readr::read_csv("df_clusterOriginal.csv", show_col_types = FALSE) |>
  dplyr::mutate(
    CNPJ = as.character(CNPJ),
    ANO  = suppressWarnings(as.integer(ANO))
  )

# ---------- 2) Normalizar Cluster p/ 1..4 ----------
uniqC <- sort(unique(stats::na.omit(df_clusters$Cluster)))
if (identical(uniqC, 0:3)) {
  df_clusters <- df_clusters |> dplyr::mutate(Cluster = Cluster + 1L)
}
if (!setequal(sort(unique(stats::na.omit(df_clusters$Cluster))), 1:4)) {
  levs <- sort(unique(stats::na.omit(df_clusters$Cluster)))
  df_clusters <- df_clusters |> dplyr::mutate(Cluster = as.integer(factor(Cluster, levels = levs)))
}

# ---------- 3) Atribuição por MODA ----------
pick_mode <- function(x) {
  x <- x[!is.na(x)]
  if (length(x) == 0) return(NA)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

assign_mode <- df_orig_raw |>
  dplyr::group_by(CNPJ) |>
  dplyr::summarise(
    Cod_Reg_Imediata = suppressWarnings(as.integer(pick_mode(Cod_Reg_Imediata))),
    .groups = "drop"
  )

# ---------- 4) Helpers: contagem e dominante ----------
count_by_unit <- function(assign_df, unit_cols, df_clusters) {
  stopifnot(all(unit_cols %in% names(assign_df)))
  base <- df_clusters |>
    dplyr::select(CNPJ, Cluster) |>
    dplyr::inner_join(assign_df, by = "CNPJ") |>
    dplyr::filter(dplyr::if_all(dplyr::all_of(unit_cols), ~ !is.na(.x))) |>
    dplyr::mutate(Cluster = as.integer(Cluster))
  
  units_tbl <- base |> dplyr::distinct(dplyr::across(dplyr::all_of(unit_cols)))
  grid <- tidyr::crossing(units_tbl, tibble::tibble(Cluster = 1:4))
  
  counts <- base |>
    dplyr::count(dplyr::across(dplyr::all_of(unit_cols)), Cluster, name = "n")
  
  grid |>
    dplyr::left_join(counts, by = c(unit_cols, "Cluster")) |>
    dplyr::mutate(n = dplyr::coalesce(n, 0L)) |>
    dplyr::group_by(dplyr::across(dplyr::all_of(unit_cols))) |>
    dplyr::mutate(n_total = sum(n),
                  perc_cluster = dplyr::if_else(n_total > 0, 100 * n / n_total, NA_real_)) |>
    dplyr::ungroup()
}

dominant_simple <- function(counts_tbl, unit_col) {
  counts_tbl |>
    dplyr::group_by({{ unit_col }}) |>
    dplyr::slice_max(n, n = 1, with_ties = FALSE) |>
    dplyr::ungroup() |>
    dplyr::transmute(
      {{ unit_col }},
      Cluster_Dom = Cluster,
      n_dom   = n,
      n_total = n_total,
      perc_dom = 100 * n_dom / n_total
    )
}

# ---------- 5) Cores e tema ----------
cores_clusters <- c("1"="#FF9999","2"="#66CC99","3"="#FFCC66","4"="#9999FF")
theme_map <- ggplot2::theme_minimal(base_size = 10) +
  ggplot2::theme(legend.position = "bottom",
                 plot.title = element_text(hjust = 0.5, face = "bold"),
                 legend.title = element_text(size = 9),
                 legend.text  = element_text(size = 8))

# ---------- 6) Dados da Região Imediata ----------
imed_counts <- count_by_unit(assign_mode, "Cod_Reg_Imediata", df_clusters)
imed_dom    <- dominant_simple(imed_counts, Cod_Reg_Imediata)

# Shapes (atenção: argumentos nomeados!)
br_imed <- geobr::read_immediate_region(year = 2020) |>
  dplyr::mutate(code_immediate = as.numeric(code_immediate)) |>
  sf::st_transform(4674)

imed_dom2 <- imed_dom |> dplyr::mutate(Cod_Reg_Imediata = as.numeric(Cod_Reg_Imediata))
br_imed_consol <- br_imed |>
  dplyr::left_join(imed_dom2, by = c("code_immediate" = "Cod_Reg_Imediata"))

# ---------- 7) Plot SEM labels de % ----------
p_imed_no_pct <- ggplot2::ggplot() +
  ggplot2::geom_sf(data = br_imed_consol,
                   aes(fill = factor(Cluster_Dom, levels = 1:4)),
                   color = "black", linewidth = 0.1) +
  ggplot2::scale_fill_manual(values = cores_clusters, na.value = "grey90",
                             name = "Cluster Dominante",
                             labels = c("1","2","3","4")) +
  ggplot2::coord_sf(expand = FALSE, datum = NA) +
  ggplot2::labs(title = "Regiões Imediatas — Cluster Dominante",
                subtitle = "(2005–2016)") +
  theme_map

dir.create("mapas_validado", showWarnings = FALSE)
ggplot2::ggsave(file.path("mapas_validado","03_mapa_RegImediata_consolidado.png"),
                p_imed_no_pct, width = 11, height = 8, dpi = 320)

message("Mapa atualizado (sem %) salvo em: mapas_validado/03_mapa_RegImediata_consolidado.png")



###MAPAS POR CLUSTER

# ============================================================
# Mapas por CLUSTER (UF) – share_in_uf e share_in_cluster
# ============================================================

libs <- c("geobr","ggplot2","dplyr","sf","scales","tidyr","tibble","readr","ggrepel")
for (p in libs) if (!require(p, character.only=TRUE)) install.packages(p)
invisible(lapply(libs, library, character.only=TRUE))
options(scipen = 999)

# ---------------------- 1) Bases ----------------------
df_clusters <- readr::read_csv("df_final_com_clusters.csv", show_col_types = FALSE) |>
  mutate(CNPJ = as.character(CNPJ),
         Cluster = suppressWarnings(as.integer(as.character(Cluster)))) |>
  distinct(CNPJ, .keep_all = TRUE)

df_orig_raw <- readr::read_csv("df_clusterOriginal.csv", show_col_types = FALSE) |>
  mutate(CNPJ = as.character(CNPJ),
         ANO  = suppressWarnings(as.integer(ANO)))

# Normaliza cluster 1..4
uniqC <- sort(unique(na.omit(df_clusters$Cluster)))
if (identical(uniqC, 0:3)) df_clusters <- df_clusters |> mutate(Cluster = Cluster + 1L)
if (!setequal(sort(unique(na.omit(df_clusters$Cluster))), 1:4)) {
  levs <- sort(unique(na.omit(df_clusters$Cluster)))
  df_clusters <- df_clusters |> mutate(Cluster = as.integer(factor(Cluster, levels = levs)))
}

# Atribui UF por MODA (uma UF por CNPJ)
pick_mode <- function(x){x<-x[!is.na(x)]; if(!length(x)) return(NA); ux<-unique(x); ux[which.max(tabulate(match(x,ux)))]}
assign_mode_uf <- df_orig_raw |>
  group_by(CNPJ) |>
  summarise(UF = pick_mode(UF), .groups="drop")

# ---------------------- 2) Agregações ----------------------
# Contagem por UF x Cluster
uf_counts <- df_clusters |>
  select(CNPJ, Cluster) |>
  inner_join(assign_mode_uf, by="CNPJ") |>
  filter(!is.na(UF)) |>
  count(UF, Cluster, name="n") |>
  group_by(UF) |>
  mutate(n_total_uf = sum(n),
         share_in_uf = 100*n/n_total_uf) |>
  ungroup() |>
  group_by(Cluster) |>
  mutate(n_total_cluster = sum(n),
         share_in_cluster = 100*n/n_total_cluster) |>
  ungroup()

# Paleta
cores_clusters <- c("1"="#FF9999","2"="#66CC99","3"="#FFCC66","4"="#9999FF")

# Shapes UF (use argumentos nomeados!)
br_uf <- geobr::read_state(year = 2020) |>
  mutate(code_state = as.numeric(code_state)) |>
  st_transform(4674)

uf_to_ibge <- tibble::tribble(
  ~UF,~code_state,
  "AC",12,"AL",27,"AM",13,"AP",16,"BA",29,"CE",23,"DF",53,"ES",32,"GO",52,"MA",21,
  "MG",31,"MS",50,"MT",51,"PA",15,"PB",25,"PE",26,"PI",22,"PR",41,"RJ",33,"RN",24,
  "RO",11,"RR",14,"RS",43,"SC",42,"SE",28,"SP",35,"TO",17
)

# Base SF longa: uma linha por UF-Cluster + geometria
sf_uf_long <- br_uf |>
  left_join(uf_to_ibge, by="code_state") |>
  left_join(uf_counts, by="UF")

# ---------------------- 3) Funções de plot ----------------------
theme_map <- theme_minimal(base_size = 12) +
  theme(legend.position = "bottom",
        plot.title = element_text(hjust = 0.5, face="bold", size=16),
        plot.subtitle = element_text(size=12),
        legend.title = element_text(size=11),
        legend.text  = element_text(size=10))

# Mapa de um cluster e uma métrica (share_in_uf OU share_in_cluster)
plot_cluster_uf <- function(cluster_id,
                            metric = c("share_in_uf","share_in_cluster"),
                            add_labels = TRUE) {
  metric <- match.arg(metric)
  
  # filtra o cluster desejado (mantém classe sf)
  dat <- sf_uf_long |> dplyr::filter(Cluster == cluster_id)
  
  # rótulos só onde há dado para a métrica
  labs <- dat |> dplyr::filter(!is.na(.data[[metric]]))
  
  if (nrow(labs) > 0) {
    # usa st_geometry() (independe se a coluna chama 'geom' ou 'geometry')
    pts   <- sf::st_point_on_surface(sf::st_geometry(labs))
    coords <- sf::st_coordinates(pts)
    labs$lon <- coords[,1]
    labs$lat <- coords[,2]
    labs$lab <- paste0(scales::number(labs[[metric]], accuracy = 1), "%")
  }
  
  p <- ggplot2::ggplot() +
    ggplot2::geom_sf(data = dat,
                     aes(fill = .data[[metric]]),
                     color = "black", size = 0.1) +
    ggplot2::scale_fill_gradient(
      low = "white",
      high = cores_clusters[as.character(cluster_id)],
      limits = c(0,100), breaks = c(0,25,50,75,100),
      labels = function(x) paste0(x, "%"),
      name = if (metric == "share_in_uf")
        "% na UF (dentro da UF)" else "% do cluster (no país)"
    ) +
    ggplot2::coord_sf(expand = FALSE, datum = NA) +
    ggplot2::labs(
      title = paste0("Cluster ", cluster_id, " — Distribuição por UF"),
      subtitle = if (metric == "share_in_uf")
        "Percentual do cluster dentro de cada UF (base: total da UF)"
      else
        "Percentual do cluster nacional localizado em cada UF (base: total do cluster)"
    ) +
    theme_map
  
  if (add_labels && nrow(labs) > 0) {
    p <- p + ggrepel::geom_text_repel(
      data = labs, aes(x = lon, y = lat, label = lab),
      size = 3.4, color = "grey15",
      max.overlaps = Inf, segment.size = 0.1,
      box.padding = 0.15, point.padding = 0.15
    )
  }
  
  p
}


# Small-multiples (4 painéis) para uma métrica
plot_facets_uf <- function(metric = c("share_in_uf","share_in_cluster")) {
  metric <- match.arg(metric)
  dat <- sf_uf_long |> filter(!is.na(.data[[metric]]))
  ggplot(dat) +
    geom_sf(aes(fill = .data[[metric]]), color = "black", size = 0.1) +
    scale_fill_gradient(limits=c(0,100), low="white", high="#8888FF",
                        breaks = c(0,25,50,75,100),
                        labels = function(x) paste0(x, "%"),
                        name = if (metric=="share_in_uf") "% na UF" else "% do cluster") +
    facet_wrap(~ Cluster, ncol = 2,
               labeller = as_labeller(c(`1`="Cluster 1",`2`="Cluster 2",
                                        `3`="Cluster 3",`4`="Cluster 4"))) +
    coord_sf(expand = FALSE, datum = NA) +
    labs(title = "Distribuição por UF — Small multiples",
         subtitle = if (metric=="share_in_uf")
           "Percentual do cluster dentro de cada UF"
         else
           "Percentual do cluster nacional em cada UF") +
    theme_map
}

# ---------------------- 4) Exportar mapas ----------------------
dir.create("mapas_clusters_uf", showWarnings = FALSE)

# Um PNG por cluster, para as DUAS métricas
for (c in 1:4) {
  p1 <- plot_cluster_uf(c, metric = "share_in_uf", add_labels = TRUE)
  ggsave(file.path("mapas_clusters_uf", paste0("UF_cluster_", c, "_share_in_uf.png")),
         p1, width = 11, height = 8, dpi = 320)
  
  p2 <- plot_cluster_uf(c, metric = "share_in_cluster", add_labels = TRUE)
  ggsave(file.path("mapas_clusters_uf", paste0("UF_cluster_", c, "_share_in_cluster.png")),
         p2, width = 11, height = 8, dpi = 320)
}

# Versões small-multiples (4 painéis) – 2 arquivos
pf1 <- plot_facets_uf("share_in_uf")
ggsave(file.path("mapas_clusters_uf","UF_small_multiples_share_in_uf.png"),
       pf1, width = 12, height = 9, dpi = 320)

pf2 <- plot_facets_uf("share_in_cluster")
ggsave(file.path("mapas_clusters_uf","UF_small_multiples_share_in_cluster.png"),
       pf2, width = 12, height = 9, dpi = 320)



# ===========================================
# QUADRO-RESUMO por UF (Top-5) para cada cluster
#  - % do cluster (share_in_cluster)
#  - % na UF (share_in_uf)
# Salva em: Quadro_Resumo_Clusters.xlsx
# ===========================================

libs <- c("dplyr","readr","tidyr","tibble","scales","gt","openxlsx")
for (p in libs) if (!require(p, character.only=TRUE)) install.packages(p)
invisible(lapply(libs, library, character.only=TRUE))
options(scipen = 999)

# --- 1) Ler bases e normalizar cluster 1..4 ---
df_clusters <- read_csv("df_final_com_clusters.csv", show_col_types = FALSE) |>
  mutate(CNPJ = as.character(CNPJ),
         Cluster = suppressWarnings(as.integer(as.character(Cluster)))) |>
  distinct(CNPJ, .keep_all = TRUE)

uniqC <- sort(unique(na.omit(df_clusters$Cluster)))
if (identical(uniqC, 0:3)) df_clusters <- df_clusters |> mutate(Cluster = Cluster + 1L)
if (!setequal(sort(unique(na.omit(df_clusters$Cluster))), 1:4)) {
  levs <- sort(unique(na.omit(df_clusters$Cluster)))
  df_clusters <- df_clusters |> mutate(Cluster = as.integer(factor(Cluster, levels = levs)))
}

df_orig <- read_csv("df_clusterOriginal.csv", show_col_types = FALSE) |>
  mutate(CNPJ = as.character(CNPJ), ANO = suppressWarnings(as.integer(ANO)))

# Moda temporal para UF por CNPJ
pick_mode <- function(x){x<-x[!is.na(x)]; if(!length(x)) return(NA); ux<-unique(x); ux[which.max(tabulate(match(x,ux)))]}
assign_uf <- df_orig |>
  group_by(CNPJ) |>
  summarise(UF = pick_mode(UF), .groups = "drop")

# --- 2) Contagens e percentuais por UF x Cluster ---
uf_counts <- df_clusters |>
  select(CNPJ, Cluster) |>
  inner_join(assign_uf, by="CNPJ") |>
  filter(!is.na(UF)) |>
  count(UF, Cluster, name="n") |>
  group_by(UF) |>
  mutate(n_total_uf = sum(n),
         share_in_uf = 100 * n / n_total_uf) |>
  ungroup() |>
  group_by(Cluster) |>
  mutate(n_total_cluster = sum(n),
         share_in_cluster = 100 * n / n_total_cluster) |>
  ungroup()

# --- 3) Função utilitária p/ Top-5 com empates ---
top5_by <- function(df, group_var, metric){
  df |>
    group_by({{group_var}}) |>
    arrange(desc(.data[[metric]]), .by_group = TRUE) |>
    # mantém empates na 5ª posição (se houver)
    mutate(rank = min_rank(desc(.data[[metric]]))) |>
    filter(rank <= 5) |>
    ungroup() |>
    select(Cluster, UF, n,
           `_%_na_UF` = share_in_uf,
           `_%_do_cluster` = share_in_cluster) |>
    mutate(
      `_%_na_UF` = number(`_%_na_UF`, accuracy = 0.1),
      `_%_do_cluster` = number(`_%_do_cluster`, accuracy = 0.1)
    )
}

# --- 4) Tabelas Top-5 por cluster ---
top5_share_in_cluster <- top5_by(uf_counts, Cluster, "share_in_cluster")
top5_share_in_uf      <- top5_by(uf_counts, Cluster, "share_in_uf")

# Mostra no R (uma tabelinha por métrica)
cat("\n=== TOP-5 UFs por Cluster – % do CLUSTER (onde o cluster está) ===\n")
top5_share_in_cluster |>
  arrange(Cluster, desc(`_%_do_cluster`)) |>
  gt(rowname_col = NULL) |>
  tab_options(table.font.size = "small") |>
  cols_label(UF="UF", n="N", `_%_na_UF`="% na UF", `_%_do_cluster`="% do cluster") |>
  print()

cat("\n=== TOP-5 UFs por Cluster – % na UF (composição interna) ===\n")
top5_share_in_uf |>
  arrange(Cluster, desc(`_%_na_UF`)) |>
  gt() |>
  tab_options(table.font.size = "small") |>
  cols_label(UF="UF", n="N", `_%_na_UF`="% na UF", `_%_do_cluster`="% do cluster") |>
  print()

# --- 5) (Opcional) versão “wide” por cluster p/ colar no Word ---
# --- NOVA função: gera tabela wide Top-5 a partir de uf_counts (numéricos) ---
mk_wide_from_counts <- function(uf_counts, metric = c("share_in_cluster","share_in_uf")) {
  metric <- match.arg(metric)
  
  uf_counts |>
    dplyr::group_by(Cluster) |>
    dplyr::slice_max(.data[[metric]], n = 5, with_ties = TRUE) |>
    dplyr::arrange(Cluster, dplyr::desc(.data[[metric]])) |>
    dplyr::mutate(
      ord = dplyr::row_number(),
      txt = paste0(
        UF, " (",
        scales::number(.data[[metric]], accuracy = 0.1), "%; n=", n, ")"
      )
    ) |>
    dplyr::ungroup() |>
    dplyr::select(Cluster, ord, txt) |>
    tidyr::pivot_wider(
      names_from = ord, values_from = txt, names_prefix = "Top_"
    )
}

# --- USE ASSIM (substitui as antigas linhas do mk_wide) ---
wide_cluster <- mk_wide_from_counts(uf_counts, "share_in_cluster")
wide_naUF    <- mk_wide_from_counts(uf_counts, "share_in_uf")

# --- 6) Exporta tudo para Excel ---
wb <- createWorkbook()
addWorksheet(wb, "Top5_%_do_cluster")
addWorksheet(wb, "Top5_%_na_UF")
addWorksheet(wb, "Top5_wide_%_cluster")
addWorksheet(wb, "Top5_wide_%_na_UF")

writeData(wb, "Top5_%_do_cluster", top5_share_in_cluster)
writeData(wb, "Top5_%_na_UF",      top5_share_in_uf)
writeData(wb, "Top5_wide_%_cluster", wide_cluster)
writeData(wb, "Top5_wide_%_na_UF",   wide_naUF)

saveWorkbook(wb, "Quadro_Resumo_Clusters.xlsx", overwrite = TRUE)
cat("\nArquivo salvo: Quadro_Resumo_Clusters.xlsx\n")


###MAIS DADOS 21.08

# ============================================================
# VISUAIS COMPLEMENTARES POR CLUSTER (UF)
# 1) Barras Top-5: % do cluster / % na UF
# 2) Cartograma de bolhas (Dorling): n do cluster por UF
# 3) Tile grid (geofacet): % do cluster / % na UF
# ============================================================

libs <- c("dplyr","readr","tidyr","tibble","scales","ggplot2",
          "geobr","sf","cartogram","geofacet")
for (p in libs) if (!require(p, character.only=TRUE)) install.packages(p)
invisible(lapply(libs, library, character.only=TRUE))

if (!require(tidytext)) install.packages("tidytext")
library(tidytext)

options(scipen = 999)

# ------------------ 0) Paleta e tema ------------------
cores_clusters <- c("1"="#FF9999","2"="#66CC99","3"="#FFCC66","4"="#9999FF")
theme_pub <- theme_minimal(base_size = 12) +
  theme(plot.title = element_text(hjust=0.5, face="bold", size=16),
        plot.subtitle = element_text(size=11),
        legend.position = "bottom")

# ------------------ 1) Recompõe uf_counts (se necessário) ------------------
need_counts <- !exists("uf_counts")

if (need_counts) {
  df_clusters <- read_csv("df_final_com_clusters.csv", show_col_types = FALSE) |>
    mutate(CNPJ = as.character(CNPJ),
           Cluster = suppressWarnings(as.integer(as.character(Cluster)))) |>
    distinct(CNPJ, .keep_all = TRUE)
  
  # normaliza clusters para 1..4
  uniqC <- sort(unique(na.omit(df_clusters$Cluster)))
  if (identical(uniqC, 0:3)) df_clusters <- df_clusters |> mutate(Cluster = Cluster + 1L)
  if (!setequal(sort(unique(na.omit(df_clusters$Cluster))), 1:4)) {
    levs <- sort(unique(na.omit(df_clusters$Cluster)))
    df_clusters <- df_clusters |> mutate(Cluster = as.integer(factor(Cluster, levels = levs)))
  }
  
  df_orig <- read_csv("df_clusterOriginal.csv", show_col_types = FALSE) |>
    mutate(CNPJ = as.character(CNPJ))
  
  pick_mode <- function(x){x<-x[!is.na(x)]; if(!length(x)) return(NA); ux<-unique(x); ux[which.max(tabulate(match(x,ux)))]}
  assign_uf <- df_orig |>
    group_by(CNPJ) |>
    summarise(UF = pick_mode(UF), .groups = "drop")
  
  uf_counts <- df_clusters |>
    select(CNPJ, Cluster) |>
    inner_join(assign_uf, by="CNPJ") |>
    filter(!is.na(UF)) |>
    count(UF, Cluster, name="n") |>
    group_by(UF) |>
    mutate(n_total_uf = sum(n),
           share_in_uf = 100*n/n_total_uf) |>
    ungroup() |>
    group_by(Cluster) |>
    mutate(n_total_cluster = sum(n),
           share_in_cluster = 100*n/n_total_cluster) |>
    ungroup()
}

# Mapeamento UF ↔ código
uf_to_ibge <- tibble::tribble(
  ~UF,~code_state,
  "AC",12,"AL",27,"AM",13,"AP",16,"BA",29,"CE",23,"DF",53,"ES",32,"GO",52,"MA",21,
  "MG",31,"MS",50,"MT",51,"PA",15,"PB",25,"PE",26,"PI",22,"PR",41,"RJ",33,"RN",24,
  "RO",11,"RR",14,"RS",43,"SC",42,"SE",28,"SP",35,"TO",17
)

# ------------------ 2) BARRAS TOP-5 ------------------
dir.create("fig_top5_barras", showWarnings = FALSE)

make_top5 <- function(metric = c("share_in_cluster","share_in_uf")) {
  metric <- match.arg(metric)
  uf_counts |>
    group_by(Cluster) |>
    slice_max(.data[[metric]], n = 5, with_ties = TRUE) |>
    arrange(Cluster, desc(.data[[metric]])) |>
    ungroup()
}

plot_top5 <- function(df_top5, metric, titulo, subtitulo) {
  # ordena por cluster e valor
  df_top5 <- df_top5 |>
    mutate(Cluster = factor(Cluster, levels = 1:4),
           UF = reorder_within(UF, .data[[metric]], Cluster))
  ggplot(df_top5, aes(x = UF, y = .data[[metric]], fill = Cluster)) +
    geom_col(width = 0.75, show.legend = FALSE) +
    geom_text(aes(label = paste0(scales::number(.data[[metric]], accuracy=0.1), "%")),
              hjust = -0.1, size = 3.4) +
    scale_x_reordered() +
    scale_y_continuous(labels = \(x) paste0(x, "%"), expand = expansion(mult = c(0, .1))) +
    scale_fill_manual(values = cores_clusters) +
    coord_flip() +
    facet_wrap(~Cluster, ncol = 2,
               labeller = as_labeller(c(`1`="Cluster 1",`2`="Cluster 2",
                                        `3`="Cluster 3",`4`="Cluster 4"))) +
    labs(title = titulo, subtitle = subtitulo, x = NULL, y = NULL) +
    theme_pub
}

# % do cluster (onde o cluster "mora")
top5_cluster <- make_top5("share_in_cluster")
p1 <- plot_top5(top5_cluster, "share_in_cluster",
                "Top-5 UFs por Cluster — % do cluster",
                "Parcela do cluster nacional localizada em cada UF")
ggsave("fig_top5_barras/top5_%_do_cluster.png", p1, width = 11, height = 8, dpi = 320)

# % na UF (peso do cluster na composição da UF)
top5_naUF <- make_top5("share_in_uf")
p2 <- plot_top5(top5_naUF, "share_in_uf",
                "Top-5 UFs por Cluster — % na UF",
                "Peso do cluster na composição interna de cada UF")
ggsave("fig_top5_barras/top5_%_na_UF.png", p2, width = 11, height = 8, dpi = 320)

# ------------------ 3) CARTOGRAMA DE BOLHAS (Dorling) ------------------
dir.create("fig_cartograma", showWarnings = FALSE)

br_uf <- geobr::read_state(year = 2020) |>
  dplyr::mutate(code_state = as.numeric(code_state)) |>
  dplyr::left_join(uf_to_ibge, by = "code_state")

# 2) Crie uma VERSÃO PROJETADA (use um CRS em metros, ex.: EPSG:3857)
crs_proj <- 3857
br_uf_proj <- sf::st_transform(br_uf, crs_proj)

# 3) Base para o cartograma (n por UF e cluster), usando a geometria PROJETADA
base_cart_proj <- br_uf_proj |>
  dplyr::left_join(uf_counts, by = "UF") |>
  dplyr::mutate(n = dplyr::coalesce(n, 0L))

# 4) Loop por cluster com Dorling em CRS projetado
dir.create("fig_cartograma", showWarnings = FALSE)

for (c in 1:4) {
  dat <- base_cart_proj |> dplyr::filter(Cluster == c, n > 0)  # evita círculos de n=0
  
  if (nrow(dat) == 0) next
  
  # Dorling: requer CRS projetado
  dor <- cartogram::cartogram_dorling(dat, weight = "n", k = 1, m_weight = 1)
  
  # (opcional) quebras de tamanho legíveis
  brks <- pretty(range(dat$n), n = 4)
  
  p_d <- ggplot2::ggplot() +
    ggplot2::geom_sf(data = br_uf_proj, fill = "grey95", color = "grey80", size = 0.2) +
    ggplot2::geom_sf(data = dor,
                     ggplot2::aes(size = n),
                     fill  = cores_clusters[as.character(c)],
                     color = "grey30", alpha = 0.9, show.legend = TRUE) +
    ggplot2::scale_size_area(max_size = 20, breaks = brks, name = "N do cluster") +
    ggplot2::coord_sf(datum = NA) +
    ggplot2::labs(
      title = paste0("Cartograma de bolhas (Dorling) — Cluster ", c),
      subtitle = "Círculos com área proporcional ao número de cooperativas do cluster por UF"
    ) +
    theme_pub
  
  ggplot2::ggsave(file.path("fig_cartograma", paste0("cartograma_cluster_", c, ".png")),
                  p_d, width = 11, height = 8, dpi = 320)
}

# ------------------ 4) TILE GRID (geofacet) ------------------
# ------------------ TILE GRID (geofacet) — CORREÇÃO ------------------
if (!require(geofacet)) install.packages("geofacet"); library(geofacet)

dir.create("fig_tilegrid", showWarnings = FALSE)

# Base com as métricas já calculadas: grid_base deve ter UF, Cluster,
# share_in_cluster e share_in_uf (como no script anterior)
stopifnot(all(c("UF","Cluster","share_in_cluster","share_in_uf") %in% names(grid_base)))

make_tilegrid <- function(df, metric = c("share_in_cluster","share_in_uf"),
                          title, subtitle, filename_prefix) {
  metric <- match.arg(metric)
  for (c in 1:4) {
    dat <- df |>
      dplyr::filter(Cluster == c) |>
      dplyr::mutate(val = .data[[metric]]) |>
      dplyr::filter(!is.na(val))
    
    # cor por métrica (opcional)
    fill_col <- if (metric == "share_in_cluster") "#7AA6FF" else "#00BFA6"
    
    p <- ggplot2::ggplot(dat, ggplot2::aes(x = 1, y = val)) +
      ggplot2::geom_col(fill = fill_col) +
      geofacet::facet_geo(~ UF, grid = "br_states_grid1") +
      ggplot2::scale_y_continuous(
        labels = function(x) paste0(x, "%"),
        expand = ggplot2::expansion(mult = c(0, 0.05))
      ) +
      ggplot2::coord_cartesian(ylim = c(0, max(dat$val, na.rm = TRUE) * 1.05)) +
      ggplot2::labs(
        title = paste0(title, " — Cluster ", c),
        subtitle = subtitle,
        x = NULL, y = NULL
      ) +
      theme_pub +
      ggplot2::theme(
        axis.text.x = ggplot2::element_blank(),
        strip.text  = ggplot2::element_text(size = 8)
      )
    
    ggplot2::ggsave(
      file.path("fig_tilegrid", sprintf("%s_cluster_%d.png", filename_prefix, c)),
      p, width = 12, height = 9, dpi = 320
    )
  }
}

# % do cluster (onde o cluster "mora" no país)
make_tilegrid(
  grid_base, "share_in_cluster",
  title = "Tile grid — % do cluster por UF",
  subtitle = "Cada célula é uma UF; altura do retângulo = % do cluster nacional naquela UF",
  filename_prefix = "tilegrid_pct_do_cluster"
)

# % na UF (peso do cluster dentro da UF)
make_tilegrid(
  grid_base, "share_in_uf",
  title = "Tile grid — % na UF por cluster",
  subtitle = "Cada célula é uma UF; altura do retângulo = % do cluster na composição da UF",
  filename_prefix = "tilegrid_pct_na_uf"
)


# ============================================================
# CONTAGENS COMPLETAS POR UF (Anexo III)
# - Tabela longa: UF x Cluster com N, % na UF, % do cluster
# - Tabela wide: contagens por UF (Cluster_1..Cluster_4 + Total)
# - Tabela wide: % na UF por cluster (Pct_1..Pct_4)
# - Cluster dominante por UF
# - Exporta: AnexoIII_UF_contagens_completas.xlsx
# ============================================================

libs <- c("dplyr","tidyr","readr","tibble","openxlsx")
for (p in libs) if (!require(p, character.only = TRUE)) install.packages(p)
invisible(lapply(libs, library, character.only = TRUE))
options(scipen = 999)

# -------- 1) Ler bases --------
df_clusters <- readr::read_csv("df_final_com_clusters.csv", show_col_types = FALSE) |>
  dplyr::mutate(CNPJ = as.character(CNPJ),
                Cluster = suppressWarnings(as.integer(as.character(Cluster)))) |>
  dplyr::distinct(CNPJ, .keep_all = TRUE)

df_orig <- readr::read_csv("df_clusterOriginal.csv", show_col_types = FALSE) |>
  dplyr::mutate(CNPJ = as.character(CNPJ))

# Normalizar clusters para 1..4 (cobre casos 0..3 ou níveis fora de ordem)
uniqC <- sort(unique(stats::na.omit(df_clusters$Cluster)))
if (identical(uniqC, 0:3)) df_clusters <- df_clusters |> dplyr::mutate(Cluster = Cluster + 1L)
if (!setequal(sort(unique(stats::na.omit(df_clusters$Cluster))), 1:4)) {
  levs <- sort(unique(stats::na.omit(df_clusters$Cluster)))
  df_clusters <- df_clusters |> dplyr::mutate(Cluster = as.integer(factor(Cluster, levels = levs)))
}

# -------- 2) Atribuir UF por MODA temporal (uma UF por CNPJ) --------
pick_mode <- function(x) {
  x <- x[!is.na(x)]
  if (!length(x)) return(NA)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
assign_uf <- df_orig |>
  dplyr::group_by(CNPJ) |>
  dplyr::summarise(UF = pick_mode(UF), .groups = "drop")

# Base unificada CNPJ–Cluster–UF
base_uf <- df_clusters |>
  dplyr::select(CNPJ, Cluster) |>
  dplyr::inner_join(assign_uf, by = "CNPJ") |>
  dplyr::filter(!is.na(UF)) |>
  dplyr::mutate(Cluster = as.integer(Cluster))

# -------- 3) CONTAGENS LONGAS (UF x Cluster) + percentuais --------
uf_counts_long <- base_uf |>
  dplyr::count(UF, Cluster, name = "N") |>
  tidyr::complete(UF, Cluster = 1:4, fill = list(N = 0L)) |>
  dplyr::group_by(UF) |>
  dplyr::mutate(Total = sum(N),
                `% na UF` = 100 * N / Total) |>
  dplyr::ungroup() |>
  dplyr::group_by(Cluster) |>
  dplyr::mutate(`% do cluster` = 100 * N / sum(N)) |>
  dplyr::ungroup()

# -------- 4) WIDE: contagens e percentuais por UF --------
uf_counts_wide <- uf_counts_long |>
  dplyr::select(UF, Cluster, N) |>
  tidyr::pivot_wider(names_from = Cluster, values_from = N,
                     names_prefix = "Cluster_", values_fill = 0L) |>
  dplyr::mutate(Total = Cluster_1 + Cluster_2 + Cluster_3 + Cluster_4) |>
  dplyr::arrange(UF)

uf_percent_wide <- uf_counts_long |>
  dplyr::select(UF, Cluster, `% na UF`) |>
  tidyr::pivot_wider(names_from = Cluster, values_from = `% na UF`,
                     names_prefix = "Pct_", values_fill = 0) |>
  dplyr::mutate(Total = rowSums(across(starts_with("Pct_")))) |>
  dplyr::arrange(UF)
# (Total ~ 100; pequenas diferenças podem ocorrer por arredondamento)

# -------- 5) Cluster dominante por UF --------
uf_dominante <- uf_counts_long |>
  dplyr::group_by(UF) |>
  dplyr::slice_max(N, n = 1, with_ties = FALSE) |>
  dplyr::transmute(
    UF,
    Cluster_Dominante = Cluster,
    N_dominante = N,
    Total,
    Perc_dominante = 100 * N / Total
  ) |>
  dplyr::arrange(UF)

# -------- 6) Checagens de consistência --------
n_cnpjs <- nrow(df_clusters)
stopifnot(sum(uf_counts_long$N) == n_cnpjs)   # total de linhas = total de CNPJs
stopifnot(all(uf_counts_wide$Total ==
                uf_counts_wide$Cluster_1 + uf_counts_wide$Cluster_2 +
                uf_counts_wide$Cluster_3 + uf_counts_wide$Cluster_4))

message("OK: Totais conferem (", n_cnpjs, " CNPJs no consolidado).")

# -------- 7) Exportar para Excel --------
wb <- openxlsx::createWorkbook()
openxlsx::addWorksheet(wb, "UF_long (N e %)")
openxlsx::addWorksheet(wb, "UF_wide_contagens")
openxlsx::addWorksheet(wb, "UF_wide_%_na_UF")
openxlsx::addWorksheet(wb, "UF_cluster_dominante")

openxlsx::writeData(wb, "UF_long (N e %)", uf_counts_long)
openxlsx::writeData(wb, "UF_wide_contagens", uf_counts_wide)
openxlsx::writeData(wb, "UF_wide_%_na_UF", uf_percent_wide)
openxlsx::writeData(wb, "UF_cluster_dominante", uf_dominante)

openxlsx::saveWorkbook(wb, "AnexoIII_UF_contagens_completas.xlsx", overwrite = TRUE)
message("Arquivo salvo: AnexoIII_UF_contagens_completas.xlsx")

save.image("c:/Aula3/docs/novo_22_08_25_.RData")





# #### OUTRO MODELO DE MAPAPOR MUNIC 
# 
# # ============================================================
# # MAPAS POR UF: bordas de todos os municípios + fill só nos com cluster
# # Com rótulos = % do cluster dominante por município
# # ============================================================
# 
# # Pacotes
# libs <- c("geobr","ggplot2","dplyr","sf","ggrepel","scales")
# for (p in libs) if (!require(p, character.only = TRUE)) install.packages(p); sapply(libs, require, character.only = TRUE)
# 
# options(scipen = 999) # evita notação científica em code_muni
# set.seed(20250820)
# 
# # ------------------------------------------------------------
# # 1) Ler bases e preparar amostra municipal
# # ------------------------------------------------------------
# df_clusters <- read.csv("df_final_com_clusters.csv") %>%
#   mutate(CNPJ = as.character(CNPJ))           # CNPJ + Cluster
# 
# df_original <- read.csv("df_clusterOriginal.csv") %>%  # CNPJ + UF + Cod_Munic (6 dígitos)
#   select(CNPJ, UF, Cod_Munic) %>%
#   distinct(CNPJ, .keep_all = TRUE) %>%
#   mutate(CNPJ = as.character(CNPJ))
# 
# # Join para obter UF e Cod_Munic junto do cluster
# df_amostra <- df_clusters %>%
#   left_join(df_original, by = "CNPJ") %>%
#   filter(!is.na(UF) & !is.na(Cod_Munic))
# 
# # ------------------------------------------------------------
# # 2) Converter Cod_Munic (6 dígitos) -> code_muni (7 dígitos IBGE com DV)
# # ------------------------------------------------------------
# calculate_dv_vector <- function(codes) {
#   sapply(codes, function(code) {
#     code_str <- as.character(code)
#     if (nchar(code_str) != 6) return(suppressWarnings(as.numeric(code_str)))  # mantém como está se não for 6 dígitos
#     digits <- as.numeric(strsplit(code_str, "")[[1]])
#     weights <- c(1,2,1,2,1,2)
#     products <- digits * weights
#     reduced <- ifelse(products > 9, (products %/% 10) + (products %% 10), products)
#     sum_prod <- sum(reduced)
#     mod <- sum_prod %% 10
#     dv <- if (mod == 0) 0 else 10 - mod
#     as.numeric(paste0(code_str, dv))
#   })
# }
# 
# df_amostra <- df_amostra %>%
#   mutate(code_muni = calculate_dv_vector(Cod_Munic))
# 
# # ------------------------------------------------------------
# # 3) Consolidar por município:
# #    - Cluster_Predominante (vencedor)
# #    - n_dom (nº de coops do vencedor)
# #    - n_total (total no município)
# #    - perc_dom (100 * n_dom / n_total)
# #    - Num_Clusters (quantos clusters distintos existem no município)
# # ------------------------------------------------------------
# df_munic_pred <- df_amostra %>%
#   group_by(UF, code_muni, Cluster) %>%
#   summarise(n_cooperativas = n(), .groups = "drop_last") %>%
#   summarise(
#     Cluster_Predominante = Cluster[which.max(n_cooperativas)],
#     n_dom   = max(n_cooperativas),
#     n_total = sum(n_cooperativas),
#     perc_dom = 100 * n_dom / n_total,
#     Num_Clusters = n_distinct(Cluster),
#     .groups = "drop"
#   )
# 
# # UFs com pelo menos 1 município com dados
# ufs_com_dados <- df_munic_pred %>%
#   group_by(UF) %>% summarise(total = sum(n_total), .groups="drop") %>%
#   filter(total > 0) %>% pull(UF)
# 
# message("UFs com dados: ", paste(ufs_com_dados, collapse = ", "))
# 
# # ------------------------------------------------------------
# # 4) Paleta para clusters e diretório de saída
# # ------------------------------------------------------------
# cores_clusters <- c("1"="#FF9999","2"="#66CC99","3"="#FFCC66","4"="#9999FF")
# dir.create("mapas_clusters", showWarnings = FALSE)
# 
# # ------------------------------------------------------------
# # 5) Fun auxiliar: gerar DF de rótulos (pontos dentro do polígono)
# # ------------------------------------------------------------
# # Recebe o sf de polígonos com colunas perc_dom e Cluster_Predominante
# # Retorna data.frame com lon/lat e label
# extrair_centroides_labels <- function(sf_polygons) {
#   if (nrow(sf_polygons) == 0) return(data.frame())
#   pts <- sf::st_point_on_surface(sf_polygons)     # garante ponto dentro do polígono
#   crd <- sf::st_coordinates(pts)
#   dados <- sf::st_drop_geometry(sf_polygons)
#   dados$lon <- crd[,1]; dados$lat <- crd[,2]
#   # Formata a porcentagem (sem casas decimais; ajuste se quiser 1 casa com accuracy = 0.1)
#   dados$label <- paste0(scales::number(dados$perc_dom, accuracy = 1), "%")
#   # Retorna só o essencial + cluster para filtrar depois
#   dados[, c("lon","lat","label","Cluster_Predominante","perc_dom")]
# }
# 
# # ------------------------------------------------------------
# # 6) Loop por UF: ler malha completa e plotar
# # ------------------------------------------------------------
# for (uf in ufs_com_dados) {
#   message("Processando UF: ", uf)
#   
#   # (A) Malha completa de municípios da UF (camada base de bordas)
#   muni_all <- tryCatch({
#     geobr::read_municipality(code_muni = uf, year = 2020, showProgress = FALSE)
#   }, error = function(e) {
#     warning(paste("Erro ao carregar municípios para", uf, ":", e$message))
#     return(NULL)
#   })
#   if (is.null(muni_all) || nrow(muni_all) == 0) next
#   
#   muni_all <- muni_all %>%
#     mutate(code_muni = as.numeric(code_muni)) %>%
#     st_transform(4674)  # SIRGAS2000 (opcional, padronização)
#   
#   # (B) Info por município para essa UF
#   muni_info <- df_munic_pred %>% filter(UF == uf)
#   
#   # (C) Join mantendo TODOS os municípios da UF (para bordas)
#   muni_join <- muni_all %>%
#     left_join(muni_info, by = "code_muni") %>%
#     mutate(Cluster_Predominante = factor(Cluster_Predominante, levels = 1:4))
#   
#   # Rótulos para todos os municípios com cluster dominante
#   labels_all <- muni_join %>% filter(!is.na(Cluster_Predominante)) %>% extrair_centroides_labels()
#   
#   # ----------------------------------------------------------
#   # Mapa 1 — Consolidado (preenche apenas os municípios com cluster)
#   # + rótulos da % do cluster dominante
#   # ----------------------------------------------------------
#   p_consolidado <- ggplot() +
#     # Bordas de TODOS os municípios
#     geom_sf(data = muni_all, fill = NA, color = "grey70", linewidth = 0.2) +
#     # Preenchimento só dos que têm cluster dominante
#     geom_sf(
#       data = dplyr::filter(muni_join, !is.na(Cluster_Predominante)),
#       aes(fill = Cluster_Predominante),
#       color = NA, alpha = 0.95
#     ) +
#     # Rótulos (% do dominante)
#     geom_text_repel(
#       data = labels_all,
#       aes(x = lon, y = lat, label = label),
#       size = 2.2, max.overlaps = Inf, min.segment.length = 0,
#       segment.size = 0.1, color = "grey15",
#       box.padding = 0.15, point.padding = 0.15
#     ) +
#     scale_fill_manual(values = cores_clusters, name = "Cluster") +
#     coord_sf(datum = NA) + theme_void() +
#     labs(title = paste("Distribuição Geográfica dos Clusters — Municípios de", uf))
#   
#   ggsave(file.path("mapas_clusters", paste0("mapa_consolidado_municipios_", uf, ".png")),
#          p_consolidado, width = 10, height = 8, dpi = 320)
#   
#   # ----------------------------------------------------------
#   # Mapas 2 — Um arquivo por cluster
#   # (rótulos só dos municípios cujo dominante = i)
#   # ----------------------------------------------------------
#   for (i in 1:4) {
#     muni_i   <- dplyr::filter(muni_join, Cluster_Predominante == i)
#     if (nrow(muni_i) == 0) next
#     labels_i <- labels_all %>% dplyr::filter(Cluster_Predominante == i)
#     
#     p_cluster <- ggplot() +
#       geom_sf(data = muni_all, fill = NA, color = "grey70", linewidth = 0.2) + # bordas de todos
#       geom_sf(data = muni_i, fill = cores_clusters[as.character(i)], color = NA, alpha = 0.95) +
#       geom_text_repel(
#         data = labels_i,
#         aes(x = lon, y = lat, label = label),
#         size = 2.2, max.overlaps = Inf, min.segment.length = 0,
#         segment.size = 0.1, color = "grey15",
#         box.padding = 0.15, point.padding = 0.15
#       ) +
#       coord_sf(datum = NA) + theme_void() +
#       labs(title = paste("Cluster", i, "— Municípios de", uf))
#     
#     ggsave(file.path("mapas_clusters", paste0("mapa_municipios_cluster_", i, "_", uf, ".png")),
#            p_cluster, width = 10, height = 8, dpi = 320)
#   }
#   
#   # ----------------------------------------------------------
#   # Mapa 3 — Diversidade (nº de clusters distintos por município) + rótulos
#   # (rótulos aqui continuam sendo a % do dominante)
#   # ----------------------------------------------------------
#   muni_div <- dplyr::filter(muni_join, !is.na(Num_Clusters))
#   if (nrow(muni_div) > 0) {
#     labels_div <- labels_all  # mesma base de labels (poderia mudar, mantemos % do dominante)
#     
#     p_diversidade <- ggplot() +
#       geom_sf(data = muni_all, fill = NA, color = "grey70", linewidth = 0.2) + # bordas de todos
#       geom_sf(data = muni_div, aes(fill = Num_Clusters), color = NA) +
#       geom_text_repel(
#         data = labels_div,
#         aes(x = lon, y = lat, label = label),
#         size = 2.0, max.overlaps = Inf, min.segment.length = 0,
#         segment.size = 0.1, color = "grey15",
#         box.padding = 0.15, point.padding = 0.15
#       ) +
#       scale_fill_viridis_c(name = "Nº de Clusters\n(distintos)") +
#       coord_sf(datum = NA) + theme_void() +
#       labs(title = paste("Diversidade de Clusters por Município —", uf))
#     
#     ggsave(file.path("mapas_clusters", paste0("mapa_contagem_clusters_", uf, ".png")),
#            p_diversidade, width = 10, height = 8, dpi = 320)
#   }
# }
# 
# message("Concluído. Arquivos salvos em: ", normalizePath("mapas_clusters"))
# 
# 
# 



getwd()
  #load("c:/Aula3/docs/novo_18_11_24_.RData")
save.image("c:/Aula3/docs/novo_20_08_25_.RData")
#######load("c:/Aula3/docs/novo_11_08_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")







#####PREPARACAO PARA GERAR O MAPA COM OS CLUSTERS

# Carregar o mapa de municípios e estados
mapa <- geobr::read_municipality(year = 2020)
estados <- geobr::read_state(year = 2020)

# Criar df unindo os clusters
df_mapa <- df_principal %>%
  select(CNPJ, `MUNICIPIO IBGE`, MUNICÍPIO, UF, CEP) %>%
  inner_join(
    df_cluster3_agg %>% select(CNPJ, cluster),
    by = "CNPJ"
  ) %>%
  mutate(`MUNICIPIO IBGE` = as.numeric(`MUNICIPIO IBGE`))

# Unir com o mapa
mapa_cluster <- mapa %>%
  left_join(df_mapa, by = c("code_muni" = "MUNICIPIO IBGE"))

# Remover geometrias vazias
mapa_cluster <- mapa_cluster %>% filter(!st_is_empty(geom))

# Plotar
ggplot() +
  # Camada de preenchimento por cluster
  geom_sf(data = mapa_cluster, aes(fill = as.factor(cluster)), color = NA) +
  # Camada do contorno dos estados
  geom_sf(data = estados, fill = NA, color = "black", size = 0.3) +
  scale_fill_brewer(palette = "Set1", name = "Cluster") +
  labs(
    title = "Distribuição das Cooperativas por Cluster",
    subtitle = "Classificação por características socioeconômicas e desempenho",
    caption = "Fonte: geobr & dados da pesquisa"
  ) +
  theme_minimal()


#####analisando a quantidade por clusters POR estado
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)

# 1) garantir que CNPJ é único e cluster é texto (preserva "NA" como categoria)
base_contagem <- df_mapa %>%
  select(CNPJ, UF, cluster) %>%
  distinct() %>%
  mutate(cluster = ifelse(is.na(cluster), "NA", as.character(cluster)))

# 2) contagem por UF x cluster
cont_uf_cluster <- base_contagem %>%
  count(UF, cluster, name = "n")

# 3) totais por UF
totais_uf <- cont_uf_cluster %>%
  group_by(UF) %>%
  summarise(total = sum(n), .groups = "drop")

# 4) tabela larga (colunas para cada cluster) + total
tabela_uf <- cont_uf_cluster %>%
  mutate(cluster = factor(cluster, levels = c("1","2","3","4","NA"))) %>%  # ordena colunas
  tidyr::pivot_wider(names_from = cluster, values_from = n, values_fill = 0) %>%
  arrange(UF) %>%
  left_join(totais_uf, by = "UF")

tabela_uf
# opcional: salvar CSV
write_csv(tabela_uf, "cooperativas_por_UF_e_cluster.csv")

# para ordenar UF pelo total
ordem_uf <- totais_uf %>% arrange(desc(total)) %>% pull(UF)

ggplot(cont_uf_cluster %>% left_join(totais_uf, by="UF"),
       aes(x = factor(UF, levels = ordem_uf), y = n, fill = factor(cluster))) +
  geom_col() +
  labs(x = "UF", y = "Quantidade de cooperativas (CNPJ)",
       fill = "Cluster",
       title = "Cooperativas por UF e Cluster",
       subtitle = "Contagem de CNPJs únicos por estado",
       caption = "Fonte: dados da pesquisa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#----
  ggplot(cont_uf_cluster %>% left_join(totais_uf, by="UF"),
         aes(x = factor(UF, levels = ordem_uf),
             y = n/total, fill = factor(cluster))) +
  geom_col() +
  scale_y_continuous(labels = scales::percent) +
  labs(x = "UF", y = "Participação no estado",
       fill = "Cluster",
       title = "Distribuição percentual dos Clusters por UF",
       caption = "Fonte: dados da pesquisa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

###---
library(geobr)
library(sf)

# cluster predominante por UF
predominante_uf <- cont_uf_cluster %>%
  group_by(UF) %>% slice_max(n, n=1, with_ties = FALSE) %>% ungroup()

# mapa dos estados
estados <- geobr::read_state(year = 2020) %>%
  mutate(abbrev_state = as.character(abbrev_state))

mapa_pred <- estados %>%
  left_join(predominante_uf, by = c("abbrev_state" = "UF"))

ggplot() +
  geom_sf(data = mapa_pred, aes(fill = factor(cluster)), color = "grey40", size = 0.2) +
  labs(title = "Cluster predominante por Estado",
       fill = "Cluster",
       caption = "Fonte: geobr & dados da pesquisa") +
  theme_minimal()


####--- NOVO MAPA
library(dplyr)
library(geobr)
library(sf)
library(ggplot2)

# --- contagens por UF ---
cont_uf_cluster <- df_mapa %>%
  transmute(CNPJ = as.character(CNPJ),
            UF = toupper(as.character(UF)),
            cluster = as.character(cluster)) %>%
  distinct() %>%
  count(UF, cluster, name = "n")

totais_uf <- cont_uf_cluster %>%
  group_by(UF) %>% summarise(total = sum(n), .groups = "drop")

predominante_uf <- cont_uf_cluster %>%
  group_by(UF) %>% slice_max(n, n = 1, with_ties = FALSE) %>%
  ungroup() %>%
  left_join(totais_uf, by = "UF")

# --- mapas ---
estados <- geobr::read_state(year = 2020) %>%
  mutate(abbrev_state = toupper(as.character(abbrev_state)))

mapa_pred <- estados %>%
  left_join(predominante_uf, by = c("abbrev_state" = "UF"))

# Somente estados com total válido para pontos/labels
mapa_pred_valid <- mapa_pred %>% filter(!is.na(total) & total > 0)

# Centróides em CRS projetado (evita warning) e volta ao geográfico
mapa_proj <- st_transform(mapa_pred_valid, 5880)          # SIRGAS 2000 / Brazil Polyconic
centros_proj <- st_point_on_surface(mapa_proj)
centros <- st_transform(centros_proj, 4674)               # volta para SIRGAS 2000 (lat/long)

# Extrair coordenadas p/ usar com geom_point/geom_text (não-sf)
labels_df <- cbind(
  st_drop_geometry(mapa_pred_valid),
  st_coordinates(centros)
) %>%
  mutate(total_lab = as.integer(total))

# --- plot ---
ggplot() +
  # estados coloridos pelo cluster predominante (todos os estados, inclusive sem dados)
  geom_sf(data = mapa_pred, aes(fill = factor(cluster)),
          color = "grey40", size = 0.2) +
  # pontos nos estados com dados
  geom_point(data = labels_df, aes(x = X, y = Y, size = total),
             shape = 21, fill = "white", alpha = 0.7, stroke = 0) +
  # rótulos com a quantidade
  geom_text(data = labels_df, aes(x = X, y = Y, label = total_lab),
            size = 3) +
  scale_fill_brewer(palette = "Set1", name = "Cluster predominante", na.value = "grey85") +
  scale_size_continuous(name = "Qtde de cooperativas", range = c(2, 10)) +
  guides(size = guide_legend(order = 2), fill = guide_legend(order = 1)) +
  labs(
    title = "Cluster predominante por Estado",
    subtitle = "Cores = cluster mais frequente; número/tamanho = quantidade total de cooperativas",
    caption = "Fonte: geobr & dados da pesquisa"
  ) +
  theme_minimal() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

###---- NOVO ----

library(dplyr)
library(tidyr)
library(ggplot2)
library(forcats)
library(scales)

# ==== Parâmetros ====
TOP_N <- 5  # quantas cidades por cluster

# Base mínima (um CNPJ por município e cluster)
base_mun <- df_mapa %>%
  select(CNPJ, `MUNICIPIO IBGE`, MUNICÍPIO, UF, cluster) %>%
  distinct() %>%
  mutate(cluster = as.character(cluster),
         UF = toupper(as.character(UF)))

# Contagem por município dentro de cada cluster
mun_counts <- base_mun %>%
  count(cluster, `MUNICIPIO IBGE`, MUNICÍPIO, UF, name = "n")

# Total por cluster (para calcular %)
tot_cluster <- mun_counts %>%
  group_by(cluster) %>% summarise(total_cluster = sum(n), .groups = "drop")

# Top-N por cluster + % no cluster
top_mun <- mun_counts %>%
  group_by(cluster) %>%
  slice_max(n, n = TOP_N, with_ties = FALSE) %>%
  ungroup() %>%
  left_join(tot_cluster, by = "cluster") %>%
  mutate(pct = n / total_cluster)

# Ordenação dentro de cada facet (maior no topo)
top_mun <- top_mun %>%
  group_by(cluster) %>%
  mutate(label_mun = paste0(MUNICÍPIO, "/", UF),
         label_mun = fct_reorder(label_mun, n, .desc = TRUE)) %>%
  ungroup()

# Gráfico: barras horizontais facetas por cluster
ggplot(top_mun, aes(x = label_mun, y = n, fill = cluster)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = paste0(n, " (", percent(pct, accuracy = 0.1), ")")),
            hjust = -0.05, size = 3) +
  coord_flip(clip = "off") +
  facet_wrap(~ cluster, scales = "free_y") +
  scale_y_continuous(expand = expansion(mult = c(0.02, 0.15))) +
  scale_fill_brewer(palette = "Set1") +
  labs(
    title = paste0("Principais cidades por cluster (Top ", TOP_N, ")"),
    subtitle = "Barras mostram quantidade de CNPJs únicos por município; rótulo exibe contagem e % no cluster",
    x = "Município/UF", y = "Quantidade de cooperativas (CNPJ)",
    caption = "Fonte: dados da pesquisa"
  ) +
  theme_minimal(base_size = 11) +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold"),
    plot.margin = margin(10, 30, 10, 10)
  )

###ATUALIZADO
# =========================
# Top 5 cidades por cluster (critério: MAIOR VAB)
# =========================

library(dplyr)
library(ggplot2)
library(forcats)
library(scales)
library(stringr)

# ---- Parâmetros ----
TOP_N    <- 5
VAB_COL  <- "VAB"     # troque para "VAB_pad" se for o padronizado no df_cluster3_agg
AGREG_VAB <- "sum"    # "sum" (tamanho econômico) ou "mean" (média por CNPJ)

# Define a função de agregação (AGREG_VAB)
agg_fun <- if (AGREG_VAB == "mean") {
  function(x) mean(x, na.rm = TRUE)
} else {
  function(x) sum(x, na.rm = TRUE)
}

# ---- 1) Bases mínimas ----
pri <- df_principal %>%
  transmute(
    CNPJ      = as.character(CNPJ),
    cod_ibge  = suppressWarnings(as.numeric(`MUNICIPIO IBGE`)),
    municipio = trimws(as.character(MUNICÍPIO)),
    UF        = toupper(as.character(UF))
  ) %>%
  distinct(CNPJ, .keep_all = TRUE)

clu <- df_cluster3_agg %>%
  transmute(
    CNPJ   = as.character(CNPJ),
    cluster= as.character(cluster),
    vab    = .data[[VAB_COL]]
  )

# ---- 2) Unir e consolidar por município × cluster ----
base <- pri %>%
  inner_join(clu, by = "CNPJ") %>%
  distinct(CNPJ, cod_ibge, cluster, .keep_all = TRUE)

# Agregar por município dentro do cluster
mun_cluster <- base %>%
  group_by(cluster, cod_ibge, municipio, UF) %>%
  summarise(
    n_cnpjs = n(),
    vab_mun = agg_fun(vab),
    .groups = "drop"
  )

# ---- 3) Selecionar Top-N por VAB dentro de cada cluster ----
top_vab <- mun_cluster %>%
  group_by(cluster) %>%
  slice_max(order_by = vab_mun, n = TOP_N, with_ties = FALSE) %>%
  ungroup() %>%
  mutate(
    mun_label = paste0(municipio, "/", UF),
    mun_label = fct_reorder(mun_label, vab_mun, .desc = TRUE),
    cluster_label = dplyr::case_when(
      cluster == "1" ~ "1 — Regiões Menos Desenvolvidas",
      cluster == "2" ~ "2 — Regiões Ricas",
      cluster == "3" ~ "3 — Intermediárias Desenvolvidas",
      cluster == "4" ~ "4 — Interm. c/ Baixa Educação",
      TRUE ~ cluster
    )
  )

# ---- 4) Gráfico ----
ggplot(top_vab, aes(x = mun_label, y = vab_mun, fill = cluster)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = paste0(
    "CNPJs: ", n_cnpjs, "  •  VAB: ",
    if (VAB_COL == "VAB")
      scales::label_number(scale_cut = scales::cut_si(""))(vab_mun)
    else
      format(round(vab_mun, 2), big.mark = ".", decimal.mark = ",")
  )), hjust = -0.05, size = 3) +
  coord_flip(clip = "off") +
  facet_wrap(~ cluster_label, scales = "free_y") +
  scale_y_continuous(
    expand = expansion(mult = c(0.02, 0.18)),
    labels = if (VAB_COL == "VAB")
      scales::label_number(scale_cut = scales::cut_si(""))
    else
      waiver(),
    name   = if (VAB_COL == "VAB")
      "VAB do município (escala SI)"
    else
      "VAB do município (padronizado)"
  ) +
  scale_fill_brewer(palette = "Set1") +
  labs(
    title    = paste0("Top ", TOP_N, " cidades por cluster — ranqueadas por VAB (", toupper(AGREG_VAB), ")"),
    subtitle = "VAB agregado por município dentro do cluster (sem regra de maioria)",
    x        = "Município/UF",
    caption  = "Fonte: dados da pesquisa"
  ) +
  theme_minimal(base_size = 11) +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold", size = 11),
    strip.background = element_rect(fill = "grey95", color = NA),
    plot.margin = margin(10, 40, 10, 10)
  )


####VER OUTROAS
library(dplyr)
library(stringr)
library(readr)

# --- base mínima (garante 1 linha por CNPJ e padroniza nomes) ---
base <- df_mapa %>%
  transmute(
    CNPJ     = as.character(CNPJ),
    cod_ibge = suppressWarnings(as.numeric(`MUNICIPIO IBGE`)),
    municipio= str_squish(as.character(MUNICÍPIO)),
    UF       = toupper(as.character(UF)),
    cluster  = as.character(cluster)
  ) %>%
  distinct(CNPJ, .keep_all = TRUE)

# --- contagem por município dentro do cluster ---
counts <- base %>%
  count(cluster, cod_ibge, municipio, UF, name = "n_cnpjs")

# --- top 10 por cluster (por nº de CNPJs) ---
top10_por_cluster <- counts %>%
  group_by(cluster) %>%
  arrange(desc(n_cnpjs), municipio, .by_group = TRUE) %>%
  slice_head(n = 10) %>%
  mutate(rank = row_number()) %>%
  ungroup() %>%
  select(cluster, rank, municipio, UF, n_cnpjs)

top10_por_cluster
# Salvar CSV
write_csv(top10_por_cluster, "top10_cidades_por_cluster_por_cnpjs.csv")

###MAPA ESTADO SP
# =========================
# Mapa do Estado de SP por Cluster (município = cluster dominante)
# =========================

library(dplyr)
library(ggplot2)
library(geobr)
library(sf)

# 1) Filtrar base só de SP e preparar chaves
sp_base <- df_mapa %>%
  transmute(
    CNPJ     = as.character(CNPJ),
    UF       = toupper(as.character(UF)),
    muni_ibge= suppressWarnings(as.numeric(`MUNICIPIO IBGE`)),
    cluster  = as.character(cluster)
  ) %>%
  filter(UF == "SP") %>%
  distinct(CNPJ, .keep_all = TRUE)              # 1 linha por CNPJ

# 2) Contagem por município x cluster e definir cluster dominante por município
sp_counts <- sp_base %>%
  count(muni_ibge, cluster, name = "n")

sp_dom <- sp_counts %>%
  group_by(muni_ibge) %>%
  slice_max(n, n = 1, with_ties = FALSE) %>%    # pega o cluster com mais CNPJs no muni
  ungroup()

# 3) Shapes: municípios de SP + contorno do estado
# Municípios de SP
muni_sp <- geobr::read_municipality(code_muni = 35, year = 2020) %>%
  mutate(code_muni = as.numeric(code_muni))

# Contorno do estado de SP
uf_sp <- geobr::read_state(code_state = 35, year = 2020)

# 4) Juntar clusters dominantes aos shapes
mapa_sp <- muni_sp %>%
  left_join(sp_dom, by = c("code_muni" = "muni_ibge"))

# 5) Paleta fixa (opcional) para manter consistência em toda a tese
cores_clusters <- c(
  "1" = "#E41A1C",  # vermelho
  "2" = "#377EB8",  # azul
  "3" = "#4DAF4A",  # verde
  "4" = "#984EA3"   # roxo
)

# 6) Plot
ggplot() +
  # Base: todos os municípios de SP em cinza claro
  geom_sf(data = muni_sp, fill = "grey95", color = "white", size = 0.1) +
  # Preenchimento: municípios com cooperativas coloridos pelo cluster dominante
  geom_sf(data = mapa_sp, aes(fill = factor(cluster)), color = "white", size = 0.1) +
  # Contorno do estado
  geom_sf(data = uf_sp, fill = NA, color = "grey20", size = 0.4) +
  scale_fill_manual(values = cores_clusters, na.value = "grey95",
                    name = "Cluster") +
  labs(
    title = "Estado de São Paulo — Cluster dominante por município",
    subtitle = "Municípios com cooperativas coloridos segundo o cluster com maior nº de CNPJs",
    caption = "Fonte: geobr & dados da pesquisa"
  ) +
  theme_minimal() +
  theme(
    legend.position = "right",
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )

###MAPA das 5 regioes
# ===============================
# Mapas das 5 regiões do Brasil por cluster (município = cluster dominante)
# ===============================

library(dplyr)
library(ggplot2)
library(geobr)
library(sf)

# 1) Preparar base de dados (CNPJ, município e cluster)
base <- df_mapa %>%
  transmute(
    CNPJ      = as.character(CNPJ),
    code_muni = suppressWarnings(as.numeric(`MUNICIPIO IBGE`)),
    UF        = toupper(as.character(UF)),
    cluster   = as.character(cluster)
  ) %>%
  distinct(CNPJ, .keep_all = TRUE) %>%
  filter(!is.na(code_muni), !is.na(cluster))

# 2) Cluster dominante por município
dom_muni <- base %>%
  count(code_muni, cluster, name = "n") %>%
  group_by(code_muni) %>%
  slice_max(n, n = 1, with_ties = FALSE) %>%
  ungroup()

# 3) Shapes e junção
muni_br <- geobr::read_municipality(year = 2020) %>%
  mutate(code_muni = as.numeric(code_muni),
         UF = toupper(as.character(abbrev_state)))

states_br <- geobr::read_state(year = 2020)

mapa <- muni_br %>%
  left_join(dom_muni, by = "code_muni")

# 4) Tabela de regiões
ufs_regiao <- tibble::tribble(
  ~UF, ~regiao,
  "AC","Norte","AP","Norte","AM","Norte","PA","Norte","RO","Norte","RR","Norte","TO","Norte",
  "AL","Nordeste","BA","Nordeste","CE","Nordeste","MA","Nordeste","PB","Nordeste",
  "PE","Nordeste","PI","Nordeste","RN","Nordeste","SE","Nordeste",
  "DF","Centro-Oeste","GO","Centro-Oeste","MT","Centro-Oeste","MS","Centro-Oeste",
  "ES","Sudeste","MG","Sudeste","RJ","Sudeste","SP","Sudeste",
  "PR","Sul","RS","Sul","SC","Sul"
)

mapa <- mapa %>%
  left_join(ufs_regiao, by = "UF")

# 5) Cores para os clusters
cores_clusters <- c(
  "1" = "#E41A1C",  # vermelho
  "2" = "#377EB8",  # azul
  "3" = "#4DAF4A",  # verde
  "4" = "#984EA3"   # roxo
)

# 6) Função para plotar uma região
plot_regiao <- function(regiao_nome) {
  ggplot() +
    geom_sf(data = filter(mapa, regiao == regiao_nome), aes(fill = factor(cluster)), color = NA) +
    geom_sf(data = filter(states_br, abbrev_state %in% filter(ufs_regiao, regiao == regiao_nome)$UF),
            fill = NA, color = "white", size = 0.2) +
    scale_fill_manual(
      values = cores_clusters,
      na.value = "grey85",
      name = "Cluster",
      breaks = c("1","2","3","4"),
      labels = c("1 – Menos Desenvolvidas",
                 "2 – Ricas",
                 "3 – Intermediárias Desenvolvidas",
                 "4 – Interm. c/ Baixa Educação")
    ) +
    labs(
      title = paste("Clusters por Município – Região", regiao_nome),
      subtitle = "Município colorido pelo cluster dominante",
      caption = "Fonte: geobr & dados da pesquisa"
    ) +
    theme_minimal() +
    theme(
      legend.position = "right",
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )
}

# 7) Gerar um mapa por vez
print(plot_regiao("Norte"))
print(plot_regiao("Nordeste"))
print(plot_regiao("Centro-Oeste"))
print(plot_regiao("Sudeste"))
print(plot_regiao("Sul"))



# Supondo que df_cluster3_agg tenha as colunas: MUNICIPIO_IBGE, MUNICIPIO, UF, cluster

# 1️⃣ Contar quantos clusters diferentes cada município tem
library(dplyr)
library(stringr)

# 1) Seleciona só o que precisa em cada base
clu_min <- df_cluster3_agg %>%
  transmute(CNPJ = as.character(CNPJ),
            cluster = as.character(cluster))

geo_min <- df_principal %>%
  transmute(
    CNPJ = as.character(CNPJ),
    cod_ibge  = suppressWarnings(as.numeric(`MUNICIPIO IBGE`)),
    municipio = str_squish(as.character(`MUNICÍPIO`)),
    UF        = toupper(as.character(UF))
  )

# 2) Une pelas chaves (CNPJ) e garante 1 linha por CNPJ
df_join <- clu_min %>%
  inner_join(geo_min, by = "CNPJ") %>%
  distinct(CNPJ, .keep_all = TRUE)

# 3) (Opcional) checar se tem CNPJs sem município/UF
sem_geo <- df_join %>% filter(is.na(cod_ibge) | is.na(municipio) | is.na(UF))
nrow(sem_geo)  # se > 0, vale investigar esses CNPJs

# 4) Contagem de clusters por município
municipios_multicluster <- df_join %>%
  group_by(cod_ibge, municipio, UF) %>%
  summarise(
    n_coops = n(),                                # nº de CNPJs naquele município
    clusters_distintos = n_distinct(cluster),     # quantos clusters diferentes
    lista_clusters = paste(sort(unique(cluster)), collapse = ", ")
  ) %>%
  ungroup() %>%
  filter(clusters_distintos > 1) %>%
  arrange(desc(clusters_distintos), desc(n_coops))

# 5) Resumo rápido
total_munis   <- df_join %>% distinct(cod_ibge, municipio, UF) %>% nrow()
munis_prob    <- nrow(municipios_multicluster)
pct_prob      <- round(100 * munis_prob / total_munis, 1)

cat("Municípios (total):", total_munis, "\n")
cat("Municípios com >1 cluster:", munis_prob, "(", pct_prob, "% )\n")

# 6) (Opcional) ver distribuição detalhada por município x cluster
detalhe_muni_cluster <- df_join %>%
  count(cod_ibge, municipio, UF, cluster, name = "n_cnpjs") %>%
  arrange(municipio, UF, cluster)

# 7) (Opcional) para cada município 'problemático', mostrar qual cluster é dominante
dominante_por_muni <- detalhe_muni_cluster %>%
  group_by(cod_ibge, municipio, UF) %>%
  slice_max(n_cnpjs, n = 1, with_ties = FALSE) %>%
  ungroup() %>%
  rename(cluster_dominante = cluster)

# Exemplo: juntar a info de dominante aos problemáticos
municipios_multicluster_dom <- municipios_multicluster %>%
  left_join(dominante_por_muni, by = c("cod_ibge", "municipio", "UF"))

# 8) (Opcional) imprimir as 10 primeiras linhas para inspeção
head(municipios_multicluster, 10)
head(municipios_multicluster_dom, 10)
head(detalhe_muni_cluster, 15)



library(dplyr)
library(stringr)

# Filtra cooperativas do Cluster 2
coops_cluster2 <- df_cluster3_agg %>%
  filter(cluster == 2) %>%
  transmute(CNPJ = as.character(CNPJ), cluster)

# Une com df_principal para trazer informações de localização
coops_cluster2_info <- coops_cluster2 %>%
  left_join(
    df_principal %>%
      transmute(
        CNPJ = as.character(CNPJ),
        municipio = str_squish(as.character(`MUNICÍPIO`)),
        UF = toupper(as.character(UF)),
        cod_ibge = suppressWarnings(as.numeric(`MUNICIPIO IBGE`))
      ),
    by = "CNPJ"
  ) %>%
  arrange(UF, municipio)

# Visualiza as primeiras linhas
head(coops_cluster2_info, 20)

# Quantidade total
nrow(coops_cluster2_info)


library(dplyr)
library(stringr)

# Junta os dois dataframes para ter município e UF no df de clusters
df_clusters_info <- df_cluster3_agg %>%
  left_join(
    df_principal %>%
      transmute(
        CNPJ = as.character(CNPJ),
        municipio = str_squish(as.character(`MUNICÍPIO`)),
        UF = toupper(as.character(UF))
      ),
    by = "CNPJ"
  )

# Conta cidades únicas por cluster
cidades_por_cluster <- df_clusters_info %>%
  group_by(cluster) %>%
  summarise(
    cidades_unicas = n_distinct(municipio),
    .groups = "drop"
  )

cidades_por_cluster

library(dplyr)
library(stringr)

# Junta para ter município e UF
df_clusters_info <- df_cluster3_agg %>%
  left_join(
    df_principal %>%
      transmute(
        CNPJ = as.character(CNPJ),
        municipio = str_squish(as.character(`MUNICÍPIO`)),
        UF = toupper(as.character(UF))
      ),
    by = "CNPJ"
  )

# Verifica cidades que aparecem em mais de um cluster
cidades_multicluster <- df_clusters_info %>%
  distinct(municipio, UF, cluster) %>%  # garante que não há duplicatas exatas
  group_by(municipio, UF) %>%
  summarise(qtd_clusters = n_distinct(cluster),
            clusters_presentes = paste(sort(unique(cluster)), collapse = ", "),
            .groups = "drop") %>%
  filter(qtd_clusters > 1) %>%
  arrange(desc(qtd_clusters), municipio)

cidades_multicluster



# # (Opcional) Salvar
# ggsave("top5_cidades_por_cluster_por_VAB.png", width = 13, height = 8, dpi = 300)

# ---- 5) (Opcional) Salvar ----
# ggsave("top5_cidades_por_cluster_por_VAB.png", width = 13, height = 8, dpi = 300)




# # Opcional: salvar
# ggsave("top_cidades_por_cluster_facets.png", width = 13, height = 8, dpi = 300)


# (Opcional) Salvar em alta resolução
# ggsave("top_cidades_por_cluster.png", width = 12, height = 8, dpi = 300)


save.image("c:/Aula3/docs/novo_08_08_25_.RData")

#load("c:/Aula3/docs/novo_18_11_24_.RData")
#save.image("c:/Aula3/docs/novo_22_02_25_.RData")
save.image("c:/Aula3/docs/novo_07_08_25_.RData")

#load("c:/Aula3/docs/novo_15_01_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData") 

packageVersion("rmarkdown")
rmarkdown::render("tabelaCluster.Rmd", output_format = "html_document")

# Instalar e carregar o pacote flexclust (se ainda não instalado)
# Instalar e carregar o pacote flexclust (certifique-se de usar a versão mais recente)
# Instalar e carregar o pacote flexclust (certifique-se de usar a versão mais recente)
install.packages("flexclust")
library(flexclust)
library(flexclust)

# Cria a família "kmedians" (Manhattan)
fam <- kccaFamily("kmedians")


# Exemplo assumindo que df_cluster3_agg já está carregado
# e que você quer padronizar algumas variáveis
dados <- scale(df_cluster3_agg[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])


# stepFlexclust permite rodar várias inicializações (nrep = 25)
set.seed(123)
kmeans_manhattan <- stepFlexclust(
  dados,
  k = 4,           # quantidade de clusters
  nrep = 25,       # número de inicializações aleatórias
  FUN = "kcca", 
  family = fam
)

# Extrair cluster final do melhor modelo
df_cluster3_agg$cluster_manhattan <- clusters(kmeans_manhattan)

# Comparar com outro cluster que já existia
table(df_cluster3_agg$cluster, df_cluster3_agg$cluster_manhattan)

# Agregar algumas variáveis, para cada cluster
aggregate(
  df_cluster3_agg[, c("ROA_yeo", "CPLA_yeo", "ATIVOS_VERDADEIROS_log")],
  by = list(df_cluster3_agg$cluster_manhattan),
  mean
)

# Visualização simples
plot(
  dados, 
  col = df_cluster3_agg$cluster_manhattan, 
  pch = 20,
  main = "Clusters (k-medians) - Distância Manhattan"
)

####com medida minkowsk
# 1) Padronizar as variáveis de interesse
dados <- scale(df_cluster3_agg[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])
library(cluster)

## --- Distância Minkowski (exemplo p=3) ---------------
dist_mink <- dist(dados, method = "minkowski", p = 3)
pam_mink  <- pam(dist_mink, k = 4) 
df_cluster3_agg$cluster_mink <- pam_mink$clustering

## --- Distância Chebyshev (maximum) --------------------
dist_cheb <- dist(dados, method = "maximum")   # "maximum" é Chebyshev
pam_cheb  <- pam(dist_cheb, k = 4) 
df_cluster3_agg$cluster_cheb <- pam_cheb$clustering

## --- Distância Canberra -------------------------------
dist_canb <- dist(dados, method = "canberra")
pam_canb  <- pam(dist_canb, k = 4)
df_cluster3_agg$cluster_canb <- pam_canb$clustering


# Médias para Minkowski
aggregate(df_cluster3_agg[, c("ROA_yeo", "CPLA_yeo", "ATIVOS_VERDADEIROS_log")], 
          by = list(df_cluster3_agg$cluster_mink), mean)

# Médias para Chebyshev
aggregate(df_cluster3_agg[, c("ROA_yeo", "CPLA_yeo", "ATIVOS_VERDADEIROS_log")], 
          by = list(df_cluster3_agg$cluster_cheb), mean)

# Médias para Canberra
aggregate(df_cluster3_agg[, c("ROA_yeo", "CPLA_yeo", "ATIVOS_VERDADEIROS_log")], 
          by = list(df_cluster3_agg$cluster_canb), mean)


# Número de observações por cluster em Minkowski
table(df_cluster3_agg$cluster_mink)

# Número de observações por cluster em Chebyshev
table(df_cluster3_agg$cluster_cheb)

# Número de observações por cluster em Canberra
table(df_cluster3_agg$cluster_canb)

# Comparar com o Euclidiano
table(df_cluster3_agg$cluster, df_cluster3_agg$cluster_mink)
table(df_cluster3_agg$cluster, df_cluster3_agg$cluster_cheb)
table(df_cluster3_agg$cluster, df_cluster3_agg$cluster_canb)

###graficos
# Carregar pacotes necessários
library(cluster)  # Já usado para pam

# Dados padronizados (assumindo já definidos)
dados <- scale(df_cluster3_agg[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])

# Definir cores para os clusters (1 a 4)
cores <- c("red", "blue", "green", "purple")

# 1. Gráfico para Clusters Euclidianos
plot(dados[, 1:2], col = cores[df_cluster3_agg$cluster], pch = 20, 
     main = "Clusters - Distância Euclidiana (K-means)", 
     xlab = "IFDM Emprego & Renda (Padronizado)", 
     ylab = "IFDM Educação (Padronizado)")
legend("topright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"), 
       col = cores, pch = 20, cex = 0.8)

# 2. Gráfico para Clusters Manhattan
plot(dados[, 1:2], col = cores[df_cluster3_agg$cluster_manhattan], pch = 20, 
     main = "Clusters - Distância Manhattan (PAM)", 
     xlab = "IFDM Emprego & Renda (Padronizado)", 
     ylab = "IFDM Educação (Padronizado)")
legend("topright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"), 
       col = cores, pch = 20, cex = 0.8)

# 3. Gráfico para Clusters Minkowski (p = 3)
plot(dados[, 1:2], col = cores[df_cluster3_agg$cluster_mink], pch = 20, 
     main = "Clusters - Distância Minkowski (p=3, PAM)", 
     xlab = "IFDM Emprego & Renda (Padronizado)", 
     ylab = "IFDM Educação (Padronizado)")
legend("topright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"), 
       col = cores, pch = 20, cex = 0.8)

# 4. Gráfico para Clusters Chebyshev
plot(dados[, 1:2], col = cores[df_cluster3_agg$cluster_cheb], pch = 20, 
     main = "Clusters - Distância Chebyshev (PAM)", 
     xlab = "IFDM Emprego & Renda (Padronizado)", 
     ylab = "IFDM Educação (Padronizado)")
legend("topright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"), 
       col = cores, pch = 20, cex = 0.8)

# 5. Gráfico para Clusters Canberra
plot(dados[, 1:2], col = cores[df_cluster3_agg$cluster_canb], pch = 20, 
     main = "Clusters - Distância Canberra (PAM)", 
     xlab = "IFDM Emprego & Renda (Padronizado)", 
     ylab = "IFDM Educação (Padronizado)")
legend("topright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"), 
       col = cores, pch = 20, cex = 0.8)

library(stats)
pca <- prcomp(dados, scale. = TRUE)
plot(pca$x[, 1:2], col = cores[df_cluster3_agg$cluster], pch = 20, 
     main = "Clusters - Distância Euclidiana (PCA)", 
     xlab = "PC1", ylab = "PC2")


# Carregar pacotes necessários
library(stats)
library(cluster)  # Para garantir compatibilidade com pam

# Dados padronizados (assumindo já definidos)
dados <- scale(df_cluster3_agg[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])

# Realizar PCA
pca <- prcomp(dados, scale. = TRUE)
summary_pca <- summary(pca)$importance

# Verificar a variância explicada por PC1 e PC2
cat("Variância explicada por PC1:", round(summary_pca[2, 1] * 100, 2), "%\n")
cat("Variância explicada por PC2:", round(summary_pca[2, 2] * 100, 2), "%\n")
cat("Variância explicada por PC3:", round(summary_pca[2, 3] * 100, 2), "%\n")
cat("Variância total explicada por PC1 + PC2:", round((summary_pca[2, 1] + summary_pca[2, 2]) * 100, 2), "%\n")

# Carregar pacote (se não estiver carregado)
library(ggplot2)

# Carregar pacote (se não estiver carregado)
library(ggplot2)

# Definir cores específicas
cores <- c("#FF0000", "#0000FF", "#00FF00", "#800080")

# Definir nomes dos clusters (baseado na Tabela X)
cluster_labels <- c("Cluster 1: Regiões Menos Desenvolvidas", 
                    "Cluster 2: Regiões Ricas", 
                    "Cluster 3: Regiões Intermediárias Desenvolvidas", 
                    "Cluster 4: Regiões Intermediárias com Baixa Educação")

# Função para criar e salvar gráficos
create_cluster_plot <- function(cluster_data, title, filename, pca_data, summary_pca, df, var_edu, var_vab, var_emp_renda, var_roa, var_cpla, var_ativos) {
  # Verificar número de linhas
  if (length(cluster_data) != nrow(pca_data$x)) {
    stop("Erro: O número de linhas em cluster_data (", length(cluster_data), 
         ") não corresponde ao número de linhas em pca_data$x (", nrow(pca_data$x), ").")
  }
  
  # Mapear clusters para corresponder à Tabela X
  mapped_clusters <- map_clusters(cluster_data, df, var_edu, var_vab)
  
  # Criar data frame com os dados de PCA e clusters mapeados
  pca_df <- data.frame(
    PC1 = pca_data$x[, 1],
    PC2 = pca_data$x[, 2],
    Cluster = factor(mapped_clusters, 
                     levels = 1:max(mapped_clusters),  # Ajustado para suportar 3 ou 4 clusters
                     labels = if(max(mapped_clusters) == 4) {
                       c("Cluster 1: Regiões Menos Desenvolvidas", 
                         "Cluster 2: Regiões Ricas", 
                         "Cluster 3: Regiões Intermediárias Desenvolvidas", 
                         "Cluster 4: Regiões Intermediárias com Baixa Educação")
                     } else {
                       c("Cluster 1: Regiões Ricas", 
                         "Cluster 2: Regiões Menos Desenvolvidas", 
                         "Cluster 3: Regiões Intermediárias")
                     })
  )
  
  # Criar gráfico
  p <- ggplot(pca_df, aes(x = PC1, y = PC2, color = Cluster)) +
    geom_point(size = 2, alpha = 0.6) +
    labs(title = title, 
         x = paste("PC1 (", round(summary_pca[2, 1] * 100, 2), "% da variância)"), 
         y = paste("PC2 (", round(summary_pca[2, 2] * 100, 2), "% da variância)"), 
         color = "Clusters (ver Tabela X, Artigo 3)") +
    scale_color_manual(values = if(max(mapped_clusters) == 4) {
      c("#FF0000", "#0000FF", "#00FF00", "#800080")  # Cores para 4 clusters
    } else {
      c("#FF0000", "#0000FF", "#00FF00")  # Cores para 3 clusters
    }) +
    theme_minimal() +
    theme(plot.title = element_text(size = 14, face = "bold"),
          axis.title = element_text(size = 12),
          legend.title = element_text(size = 10),
          legend.text = element_text(size = 8),
          legend.position = "top",
          legend.box = "horizontal",
          legend.background = element_rect(fill = "transparent")) +
    guides(color = guide_legend(nrow = 2, byrow = TRUE))
  
  # Salvar gráfico
  ggsave(filename, p, width = 10, height = 6, dpi = 300, limitsize = FALSE)
  
  return(p)
}

# Gerar os cinco gráficos
# 1. Clusters Euclidianos (K-means)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster,
  title = "Clusters - Distância Euclidiana (PCA)",
  filename = "cluster_euclidiana_pca.png",
  pca_data = pca,
  summary_pca = summary_pca
)

# 2. Clusters Manhattan (PAM)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_manhattan,
  title = "Clusters - Distância Manhattan (PAM, PCA)",
  filename = "cluster_manhattan_pca.png",
  pca_data = pca,
  summary_pca = summary_pca
)

# 3. Clusters Minkowski (p = 3, PAM)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_mink,
  title = "Clusters - Distância Minkowski (p=3, PAM, PCA)",
  filename = "cluster_minkowski_pca.png",
  pca_data = pca,
  summary_pca = summary_pca
)

# 4. Clusters Chebyshev (PAM)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_cheb,
  title = "Clusters - Distância Chebyshev (PAM, PCA)",
  filename = "cluster_chebyshev_pca.png",
  pca_data = pca,
  summary_pca = summary_pca
)

# 5. Clusters Canberra (PAM)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_canb,
  title = "Clusters - Distância Canberra (PAM, PCA)",
  filename = "cluster_canberra_pca.png",
  pca_data = pca,
  summary_pca = summary_pca
)

# Carregar pacotes
library(ggplot2)
library(dplyr)

# Definir cores específicas
cores <- c("#FF0000", "#0000FF", "#00FF00", "#800080")

# Definir nomes dos clusters (baseado na Tabela X)
cluster_labels <- c("Cluster 1: Regiões Menos Desenvolvidas", 
                    "Cluster 2: Regiões Ricas", 
                    "Cluster 3: Regiões Intermediárias Desenvolvidas", 
                    "Cluster 4: Regiões Intermediárias com Baixa Educação")

# Função para mapear clusters com base nas médias de IFDM Educação e VAB
# Ajustar map_clusters para 3 clusters
map_clusters <- function(cluster_data, df, var_edu, var_vab, weight_vab = 0.8) {
  # Verificar se cluster_data contém NA
  if (any(is.na(cluster_data))) {
    stop("Erro: cluster_data contém valores NA.")
  }
  
  # Criar data frame com clusters e variáveis
  df_clusters <- data.frame(
    Cluster = cluster_data,
    IFDM_Edu = df[[var_edu]],
    VAB = df[[var_vab]]
  )
  
  # Verificar se há NA nas variáveis
  if (any(is.na(df_clusters$IFDM_Edu)) || any(is.na(df_clusters$VAB))) {
    stop("Erro: As variáveis IFDM_Edu ou VAB contêm valores NA.")
  }
  
  # Calcular médias por cluster
  cluster_means <- df_clusters %>%
    group_by(Cluster) %>%
    summarise(mean_edu = mean(IFDM_Edu, na.rm = TRUE),
              mean_vab = mean(VAB, na.rm = TRUE)) %>%
    mutate(rank_edu = rank(-mean_edu),
           rank_vab = rank(-mean_vab),
           vab_penalty = abs(mean_vab - 3.92) / sd(df[[var_vab]], na.rm = TRUE))
  
  # Combinar rankings com peso maior para VAB e penalidade
  cluster_means <- cluster_means %>%
    mutate(combined_rank = (rank_edu * (1 - weight_vab)) + (rank_vab * weight_vab) + vab_penalty) %>%
    arrange(combined_rank)
  
  # Determinar o número de clusters
  num_clusters <- length(unique(cluster_data))
  
  # Mapear clusters
  mapping <- rep(NA, length(cluster_data))
  if (num_clusters == 4) {
    mapping[cluster_data == cluster_means$Cluster[4]] <- 1  # Menor desenvolvimento
    mapping[cluster_data == cluster_means$Cluster[1]] <- 2  # Maior desenvolvimento (Regiões Ricas)
    mapping[cluster_data == cluster_means$Cluster[3]] <- 3  # Intermediário Desenvolvido
    mapping[cluster_data == cluster_means$Cluster[2]] <- 4  # Intermediário Baixa Educação
  } else if (num_clusters == 3) {
    # Identificar o cluster com maior desenvolvimento (Regiões Ricas)
    richest_cluster <- cluster_means$Cluster[which.max(cluster_means$mean_vab)]  # Priorizar VAB
    poorest_cluster <- cluster_means$Cluster[which.min(cluster_means$mean_vab)]  # Menor desenvolvimento
    intermediate_cluster <- setdiff(cluster_means$Cluster, c(richest_cluster, poorest_cluster))
    
    mapping[cluster_data == richest_cluster] <- 1  # Regiões Ricas
    mapping[cluster_data == poorest_cluster] <- 2  # Menor desenvolvimento
    mapping[cluster_data == intermediate_cluster] <- 3  # Intermediário
  } else {
    stop("Erro: Número de clusters não suportado (esperado 3 ou 4).")
  }
  
  return(mapping)
}
# Função ajustada para criar e salvar gráficos
create_cluster_plot <- function(cluster_data, title, filename, pca_data, summary_pca, df, var_edu, var_vab, var_emp_renda, var_roa, var_cpla, var_ativos) {
  # Verificar número de linhas
  if (length(cluster_data) != nrow(pca_data$x)) {
    stop("Erro: O número de linhas em cluster_data (", length(cluster_data), 
         ") não corresponde ao número de linhas em pca_data$x (", nrow(pca_data$x), ").")
  }
  
  # Mapear clusters para corresponder à Tabela X
  mapped_clusters <- map_clusters(cluster_data, df, var_edu, var_vab)
  
  # Verificar se mapped_clusters contém NA
  if (any(is.na(mapped_clusters))) {
    stop("Erro: mapped_clusters contém valores NA após o mapeamento.")
  }
  
  # Determinar o número de clusters
  num_clusters <- length(unique(mapped_clusters))
  
  # Criar data frame com os dados de PCA e clusters mapeados
  pca_df <- data.frame(
    PC1 = pca_data$x[, 1],
    PC2 = pca_data$x[, 2],
    Cluster = factor(mapped_clusters, 
                     levels = 1:num_clusters,  # Ajustado para usar num_clusters
                     labels = if(num_clusters == 4) {
                       c("Cluster 1: Regiões Menos Desenvolvidas", 
                         "Cluster 2: Regiões Ricas", 
                         "Cluster 3: Regiões Intermediárias Desenvolvidas", 
                         "Cluster 4: Regiões Intermediárias com Baixa Educação")
                     } else {
                       c("Cluster 1: Regiões Ricas", 
                         "Cluster 2: Regiões Menos Desenvolvidas", 
                         "Cluster 3: Regiões Intermediárias")
                     })
  )
  
  # Criar gráfico
  p <- ggplot(pca_df, aes(x = PC1, y = PC2, color = Cluster)) +
    geom_point(size = 2, alpha = 0.6) +
    labs(title = title, 
         x = paste("PC1 (", round(summary_pca[2, 1] * 100, 2), "% da variância)"), 
         y = paste("PC2 (", round(summary_pca[2, 2] * 100, 2), "% da variância)"), 
         color = "Clusters (ver Tabela X, Artigo 3)") +
    scale_color_manual(values = if(num_clusters == 4) {
      c("#FF0000", "#0000FF", "#00FF00", "#800080")  # Cores para 4 clusters
    } else {
      c("#FF0000", "#0000FF", "#00FF00")  # Cores para 3 clusters
    }) +
    theme_minimal() +
    theme(plot.title = element_text(size = 14, face = "bold"),
          axis.title = element_text(size = 12),
          legend.title = element_text(size = 10),
          legend.text = element_text(size = 8),
          legend.position = "top",
          legend.box = "horizontal",
          legend.background = element_rect(fill = "transparent")) +
    guides(color = guide_legend(nrow = 2, byrow = TRUE))
  
  # Salvar gráfico
  ggsave(filename, p, width = 10, height = 6, dpi = 300, limitsize = FALSE)
  
  return(p)
}
# Gerar os cinco gráficos
# 1. Clusters Euclidianos (K-means)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster,
  title = "Clusters - Distância Euclidiana (PCA)",
  filename = "cluster_euclidiana_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",  # Ajuste para o nome correto da coluna
  var_vab = "VAB"        # Ajuste para o nome correto da coluna
)

# 2. Clusters Manhattan (PAM)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_manhattan,
  title = "Clusters - Distância Manhattan (PAM, PCA)",
  filename = "cluster_manhattan_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB"
)

# 3. Clusters Minkowski (p = 3, PAM)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_mink,
  title = "Clusters - Distância Minkowski (p=3, PAM, PCA)",
  filename = "cluster_minkowski_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB"
)

# 4. Clusters Chebyshev (PAM)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_cheb,
  title = "Clusters - Distância Chebyshev (PAM, PCA)",
  filename = "cluster_chebyshev_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB"
)

# 5. Clusters Canberra (PAM)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_canb,
  title = "Clusters - Distância Canberra (PAM, PCA)",
  filename = "cluster_canberra_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB"
)

####Compare as médias de IFDM Educação e VAB em cada cluster após o mapeamento:
df_cluster3_agg %>%
  mutate(mapped_cluster = map_clusters(cluster_canb, df_cluster3_agg, "IFDM_Edu", "VAB")) %>%
  group_by(mapped_cluster) %>%
  summarise(mean_edu = mean(IFDM_Edu, na.rm = TRUE),
            mean_vab = mean(VAB, na.rm = TRUE))

df_cluster3_agg %>%
  mutate(mapped_cluster = map_clusters(cluster_cheb, df_cluster3_agg, "IFDM_Edu", "VAB")) %>%
  group_by(mapped_cluster) %>%
  summarise(mean_edu = mean(IFDM_Edu, na.rm = TRUE),
            mean_vab = mean(VAB, na.rm = TRUE))
df_cluster3_agg %>%
  mutate(mapped_cluster = map_clusters(cluster_mink, df_cluster3_agg, "IFDM_Edu", "VAB")) %>%
  group_by(mapped_cluster) %>%
  summarise(mean_edu = mean(IFDM_Edu, na.rm = TRUE),
            mean_vab = mean(VAB, na.rm = TRUE))
df_cluster3_agg %>%
  mutate(mapped_cluster = map_clusters(cluster_manhattan, df_cluster3_agg, "IFDM_Edu", "VAB")) %>%
  group_by(mapped_cluster) %>%
  summarise(mean_edu = mean(IFDM_Edu, na.rm = TRUE),
            mean_vab = mean(VAB, na.rm = TRUE))



# # Carregar pacotes
# library(ggplot2)
# library(dplyr)
# 
# # Definir cores específicas
# cores <- c("#FF0000", "#0000FF", "#00FF00", "#800080")
# 
# # Definir nomes dos clusters (baseado na Tabela X)
# cluster_labels <- c("Cluster 1: Regiões Menos Desenvolvidas", 
#                     "Cluster 2: Regiões Ricas", 
#                     "Cluster 3: Regiões Intermediárias Desenvolvidas", 
#                     "Cluster 4: Regiões Intermediárias com Baixa Educação")
# 
# # Função para mapear clusters com base nas médias de IFDM Educação e VAB
# map_clusters <- function(cluster_data, df, var_edu, var_vab) {
#   # Criar data frame com clusters e variáveis
#   df_clusters <- data.frame(
#     Cluster = cluster_data,
#     IFDM_Edu = df[[var_edu]],
#     VAB = df[[var_vab]]
#   )
#   
#   # Calcular médias por cluster
#   cluster_means <- df_clusters %>%
#     group_by(Cluster) %>%
#     summarise(mean_edu = mean(IFDM_Edu, na.rm = TRUE),
#               mean_vab = mean(VAB, na.rm = TRUE)) %>%
#     mutate(rank_edu = rank(mean_edu),  # Ordem crescente de IFDM Educação
#            rank_vab = rank(mean_vab))  # Ordem crescente de VAB
#   
#   # Combinar rankings (média ponderada para ordenar)
#   cluster_means <- cluster_means %>%
#     mutate(combined_rank = (rank_edu + rank_vab) / 2) %>%
#     arrange(combined_rank)
#   
#   # Mapear clusters para corresponder à Tabela X
#   # Cluster 1 (Menor IFDM Educação e VAB) -> Regiões Menos Desenvolvidas
#   # Cluster 2 (Maior IFDM Educação e VAB) -> Regiões Ricas
#   mapping <- rep(NA, length(cluster_data))
#   mapping[cluster_data == cluster_means$Cluster[1]] <- 1  # Regiões Menos Desenvolvidas
#   mapping[cluster_data == cluster_means$Cluster[4]] <- 2  # Regiões Ricas
#   mapping[cluster_data == cluster_means$Cluster[3]] <- 3  # Regiões Intermediárias Desenvolvidas
#   mapping[cluster_data == cluster_means$Cluster[2]] <- 4  # Regiões Intermediárias com Baixa Educação
#   
#   return(mapping)
# }
# 
# # Função ajustada para criar e salvar gráficos
# create_cluster_plot <- function(cluster_data, title, filename, pca_data, summary_pca, df, var_edu, var_vab) {
#   # Verificar número de linhas
#   if (length(cluster_data) != nrow(pca_data$x)) {
#     stop("Erro: O número de linhas em cluster_data (", length(cluster_data), 
#          ") não corresponde ao número de linhas em pca_data$x (", nrow(pca_data$x), ").")
#   }
#   
#   # Mapear clusters para corresponder à Tabela X
#   mapped_clusters <- map_clusters(cluster_data, df, var_edu, var_vab)
#   
#   # Criar data frame com os dados de PCA e clusters mapeados
#   pca_df <- data.frame(
#     PC1 = pca_data$x[, 1],
#     PC2 = pca_data$x[, 2],
#     Cluster = factor(mapped_clusters, 
#                      levels = 1:4, 
#                      labels = cluster_labels)
#   )
#   
#   # Criar gráfico
#   p <- ggplot(pca_df, aes(x = PC1, y = PC2, color = Cluster)) +
#     geom_point(size = 2, alpha = 0.6) +
#     labs(title = title, 
#          x = paste("PC1 (", round(summary_pca[2, 1] * 100, 2), "% da variância)"), 
#          y = paste("PC2 (", round(summary_pca[2, 2] * 100, 2), "% da variância)"), 
#          color = "Clusters (ver Tabela X, Artigo 3)") +
#     scale_color_manual(values = cores) +
#     theme_minimal() +
#     theme(plot.title = element_text(size = 14, face = "bold"),
#           axis.title = element_text(size = 12),
#           legend.title = element_text(size = 10),
#           legend.text = element_text(size = 8),
#           legend.position = "top",
#           legend.box = "horizontal",
#           legend.background = element_rect(fill = "transparent")) +
#     guides(color = guide_legend(nrow = 2))
#   
#   # Salvar gráfico
#   ggsave(filename, p, width = 10, height = 6, dpi = 300)
#   
#   return(p)
# }
# 
# # Gerar os cinco gráficos
# # 1. Clusters Euclidianos (K-means)
# create_cluster_plot(
#   cluster_data = df_cluster3_agg$cluster,
#   title = "Clusters - Distância Euclidiana (PCA)",
#   filename = "cluster_euclidiana_pca.png",
#   pca_data = pca,
#   summary_pca = summary_pca,
#   df = df_cluster3_agg,
#   var_edu = "IFDM_Edu",  # Ajuste para o nome correto da coluna
#   var_vab = "VAB"        # Ajuste para o nome correto da coluna
# )
# 
# # 2. Clusters Manhattan (PAM)
# create_cluster_plot(
#   cluster_data = df_cluster3_agg$cluster_manhattan,
#   title = "Clusters - Distância Manhattan (PAM, PCA)",
#   filename = "cluster_manhattan_pca.png",
#   pca_data = pca,
#   summary_pca = summary_pca,
#   df = df_cluster3_agg,
#   var_edu = "IFDM_Edu",
#   var_vab = "VAB"
# )
# 
# # 3. Clusters Minkowski (p = 3, PAM)
# create_cluster_plot(
#   cluster_data = df_cluster3_agg$cluster_mink,
#   title = "Clusters - Distância Minkowski (p=3, PAM, PCA)",
#   filename = "cluster_minkowski_pca.png",
#   pca_data = pca,
#   summary_pca = summary_pca,
#   df = df_cluster3_agg,
#   var_edu = "IFDM_Edu",
#   var_vab = "VAB"
# )
# 
# # 4. Clusters Chebyshev (PAM)
# create_cluster_plot(
#   cluster_data = df_cluster3_agg$cluster_cheb,
#   title = "Clusters - Distância Chebyshev (PAM, PCA)",
#   filename = "cluster_chebyshev_pca.png",
#   pca_data = pca,
#   summary_pca = summary_pca,
#   df = df_cluster3_agg,
#   var_edu = "IFDM_Edu",
#   var_vab = "VAB"
# )
# 
# # 5. Clusters Canberra (PAM)
# create_cluster_plot(
#   cluster_data = df_cluster3_agg$cluster_canb,
#   title = "Clusters - Distância Canberra (PAM, PCA)",
#   filename = "cluster_canberra_pca.png",
#   pca_data = pca,
#   summary_pca = summary_pca,
#   df = df_cluster3_agg,
#   var_edu = "IFDM_Edu",
#   var_vab = "VAB"
# )
# 
# # Verificar os loadings de PC1 e PC2
# print(pca$rotation[, 1:2])
# 
# 
# df_cluster3_agg %>%
#   group_by(cluster_canb) %>%
#   summarise(mean_edu = mean(IFDM_Edu, na.rm = TRUE),
#             mean_vab = mean(VAB, na.rm = TRUE))
# 
# 
# ###Gaficos 3D para capturar a Variância explicada por PC3: 22.88 %



# Carregar pacotes necessários
install.packages("plotly")
library(plotly)
library(cluster)

# Dados padronizados originais
dados <- scale(df_cluster3_agg[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])

# Renomear colunas para clareza nos gráficos (opcional, para labels)
colnames(dados) <- c("IFDM_Emprego_Renda", "IFDM_Educacao", "VAB")

# Converter para data frame (se necessário)
dados_df <- as.data.frame(dados)

# Adicionar colunas de clusters ao data frame
dados_df$cluster <- df_cluster3_agg$cluster
dados_df$cluster_manhattan <- df_cluster3_agg$cluster_manhattan
dados_df$cluster_mink <- df_cluster3_agg$cluster_mink
dados_df$cluster_cheb <- df_cluster3_agg$cluster_cheb
dados_df$cluster_canb <- df_cluster3_agg$cluster_canb

# Definir cores para os clusters (1 a 4)
cores <- c("red", "blue", "green", "purple")

# Gráficos 3D dinâmicos para cada método de distância, exibidos no RStudio

# 1. Clusters Euclidianos (K-means)
p_euclidean <- plot_ly(data = dados_df, x = ~IFDM_Emprego_Renda, y = ~IFDM_Educacao, z = ~VAB, 
                       color = ~factor(cluster), 
                       colors = cores, 
                       type = "scatter3d", mode = "markers", 
                       marker = list(size = 3, opacity = 0.8),
                       text = ~paste("Cluster:", cluster, 
                                     "<br>IFDM Emprego & Renda:", round(IFDM_Emprego_Renda, 2), 
                                     "<br>IFDM Educação:", round(IFDM_Educacao, 2), 
                                     "<br>VAB:", round(VAB, 2))) %>%
  layout(scene = list(xaxis = list(title = "IFDM Emprego & Renda (Padronizado)"),
                      yaxis = list(title = "IFDM Educação (Padronizado)"),
                      zaxis = list(title = "VAB (Padronizado)")),
         title = "Clusters - Distância Euclidiana (3D Dinâmico, Dados Originais)")

# Exibir no RStudio
p_euclidean

# 2. Clusters Manhattan (PAM)
p_manhattan <- plot_ly(data = dados_df, x = ~IFDM_Emprego_Renda, y = ~IFDM_Educacao, z = ~VAB, 
                       color = ~factor(cluster_manhattan), 
                       colors = cores, 
                       type = "scatter3d", mode = "markers", 
                       marker = list(size = 3, opacity = 0.8),
                       text = ~paste("Cluster:", cluster_manhattan, 
                                     "<br>IFDM Emprego & Renda:", round(IFDM_Emprego_Renda, 2), 
                                     "<br>IFDM Educação:", round(IFDM_Educacao, 2), 
                                     "<br>VAB:", round(VAB, 2))) %>%
  layout(scene = list(xaxis = list(title = "IFDM Emprego & Renda (Padronizado)"),
                      yaxis = list(title = "IFDM Educação (Padronizado)"),
                      zaxis = list(title = "VAB (Padronizado)")),
         title = "Clusters - Distância Manhattan (PAM, 3D Dinâmico, Dados Originais)")

# Exibir no RStudio
p_manhattan

# 3. Clusters Minkowski (p = 3, PAM)
p_minkowski <- plot_ly(data = dados_df, x = ~IFDM_Emprego_Renda, y = ~IFDM_Educacao, z = ~VAB, 
                       color = ~factor(cluster_mink), 
                       colors = cores, 
                       type = "scatter3d", mode = "markers", 
                       marker = list(size = 3, opacity = 0.8),
                       text = ~paste("Cluster:", cluster_mink, 
                                     "<br>IFDM Emprego & Renda:", round(IFDM_Emprego_Renda, 2), 
                                     "<br>IFDM Educação:", round(IFDM_Educacao, 2), 
                                     "<br>VAB:", round(VAB, 2))) %>%
  layout(scene = list(xaxis = list(title = "IFDM Emprego & Renda (Padronizado)"),
                      yaxis = list(title = "IFDM Educação (Padronizado)"),
                      zaxis = list(title = "VAB (Padronizado)")),
         title = "Clusters - Distância Minkowski (p=3, PAM, 3D Dinâmico, Dados Originais)")

# Exibir no RStudio
p_minkowski

# 4. Clusters Chebyshev (PAM)
p_chebyshev <- plot_ly(data = dados_df, x = ~IFDM_Emprego_Renda, y = ~IFDM_Educacao, z = ~VAB, 
                       color = ~factor(cluster_cheb), 
                       colors = cores, 
                       type = "scatter3d", mode = "markers", 
                       marker = list(size = 3, opacity = 0.8),
                       text = ~paste("Cluster:", cluster_cheb, 
                                     "<br>IFDM Emprego & Renda:", round(IFDM_Emprego_Renda, 2), 
                                     "<br>IFDM Educação:", round(IFDM_Educacao, 2), 
                                     "<br>VAB:", round(VAB, 2))) %>%
  layout(scene = list(xaxis = list(title = "IFDM Emprego & Renda (Padronizado)"),
                      yaxis = list(title = "IFDM Educação (Padronizado)"),
                      zaxis = list(title = "VAB (Padronizado)")),
         title = "Clusters - Distância Chebyshev (PAM, 3D Dinâmico, Dados Originais)")

# Exibir no RStudio
p_chebyshev

# 5. Clusters Canberra (PAM)
p_canberra <- plot_ly(data = dados_df, x = ~IFDM_Emprego_Renda, y = ~IFDM_Educacao, z = ~VAB, 
                      color = ~factor(cluster_canb), 
                      colors = cores, 
                      type = "scatter3d", mode = "markers", 
                      marker = list(size = 3, opacity = 0.8),
                      text = ~paste("Cluster:", cluster_canb, 
                                    "<br>IFDM Emprego & Renda:", round(IFDM_Emprego_Renda, 2), 
                                    "<br>IFDM Educação:", round(IFDM_Educacao, 2), 
                                    "<br>VAB:", round(VAB, 2))) %>%
  layout(scene = list(xaxis = list(title = "IFDM Emprego & Renda (Padronizado)"),
                      yaxis = list(title = "IFDM Educação (Padronizado)"),
                      zaxis = list(title = "VAB (Padronizado)")),
         title = "Clusters - Distância Canberra (PAM, 3D Dinâmico, Dados Originais)")

# Exibir no RStudio
p_canberra

library(ggplot2)
pca_df <- data.frame(PC1 = pca$x[,1], PC2 = pca$x[,2], cluster = factor(clusters))
cores <- c("#FF0000", "#0000FF", "#00FF00", "#800080")
p_euclidean <- ggplot(pca_df, aes(x = PC1, y = PC2, color = cluster)) +
  geom_point(size = 2, alpha = 0.6) +
  labs(title = "Clusters - Distância Euclidiana (PCA 2D)",
       x = "PC1 (49.21% da variância)", y = "PC2 (27.91% da variância)",
       color = "Cluster") +
  scale_color_manual(values = cores, labels = c("Cluster 1: Regiões Menos Desenvolvidas",
                                                "Cluster 2: Regiões Ricas",
                                                "Cluster 3: Regiões Intermediárias Desenvolvidas",
                                                "Cluster 4: Regiões Intermediárias com Baixa Educação")) +
  theme_minimal()
ggsave("cluster_euclidean_pca.png", p_euclidean, width = 10, height = 6, dpi = 300)

# Opção para salvar os gráficos em HTML (opcional, para Anexo II)
htmlwidgets::saveWidget(p_euclidean, "C:/Users/cmarl/OneDrive - Fundacao Getulio Vargas - FGV/DOUTORADO EAESP/Artigos em Seleção/Modelo_Projeto/Clusters/cluster_euclidean_3d.html")
htmlwidgets::saveWidget(p_manhattan, "C:/Users/cmarl/OneDrive - Fundacao Getulio Vargas - FGV/DOUTORADO EAESP/Artigos em Seleção/Modelo_Projeto/Clusters/cluster_manhattan_3d.html")
htmlwidgets::saveWidget(p_minkowski, "C:/Users/cmarl/OneDrive - Fundacao Getulio Vargas - FGV/DOUTORADO EAESP/Artigos em Seleção/Modelo_Projeto/Clusters/cluster_minkowski_3d.html")
htmlwidgets::saveWidget(p_chebyshev, "C:/Users/cmarl/OneDrive - Fundacao Getulio Vargas - FGV/DOUTORADO EAESP/Artigos em Seleção/Modelo_Projeto/Clusters/cluster_chebyshev_3d.html")
htmlwidgets::saveWidget(p_canberra, "C:/Users/cmarl/OneDrive - Fundacao Getulio Vargas - FGV/DOUTORADO EAESP/Artigos em Seleção/Modelo_Projeto/Clusters/cluster_canberra_3d.html")

#load("c:/Aula3/docs/novo_18_11_24_.RData")
#save.image("c:/Aula3/docs/novo_011_03_25_.RData")
#load("c:/Aula3/docs/novo_01_03_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData") 


# Carregar pacotes
library(ggplot2)
library(dplyr)

# Definir cores específicas
cores <- c("#FF0000", "#0000FF", "#00FF00", "#800080")

# Definir nomes dos clusters (baseado na Tabela X)
cluster_labels <- c("Cluster 1: Regiões Menos Desenvolvidas", 
                    "Cluster 2: Regiões Ricas", 
                    "Cluster 3: Regiões Intermediárias Desenvolvidas", 
                    "Cluster 4: Regiões Intermediárias com Baixa Educação")

# Função para mapear clusters com base nas médias de IFDM Educação e VAB
map_clusters <- function(cluster_data, df, var_edu, var_vab, weight_vab = 0.8) {
  df_clusters <- data.frame(
    Cluster = cluster_data,
    IFDM_Edu = df[[var_edu]],
    VAB = df[[var_vab]]
  )
  
  cluster_means <- df_clusters %>%
    group_by(Cluster) %>%
    summarise(mean_edu = mean(IFDM_Edu, na.rm = TRUE),
              mean_vab = mean(VAB, na.rm = TRUE)) %>%
    mutate(rank_edu = rank(-mean_edu),
           rank_vab = rank(-mean_vab),
           vab_penalty = abs(mean_vab - 3.92) / sd(df[[var_vab]], na.rm = TRUE))
  
  cluster_means <- cluster_means %>%
    mutate(combined_rank = (rank_edu * (1 - weight_vab)) + (rank_vab * weight_vab) + vab_penalty) %>%
    arrange(combined_rank)
  
  mapping <- rep(NA, length(cluster_data))
  mapping[cluster_data == cluster_means$Cluster[4]] <- 1
  mapping[cluster_data == cluster_means$Cluster[1]] <- 2
  mapping[cluster_data == cluster_means$Cluster[3]] <- 3
  mapping[cluster_data == cluster_means$Cluster[2]] <- 4
  
  return(mapping)
}

# Função ajustada para calcular médias
calculate_cluster_means <- function(cluster_data, df, var_emp_renda, var_edu, var_vab, var_roa, var_cpla, var_ativos) {
  if (length(cluster_data) == 0 || all(is.na(cluster_data))) {
    stop("Erro: cluster_data está vazio ou contém apenas NA.")
  }
  
  if (length(cluster_data) != nrow(df)) {
    stop("Erro: O número de linhas em cluster_data (", length(cluster_data), 
         ") não corresponde ao número de linhas em df (", nrow(df), ").")
  }
  
  mapped_clusters <- map_clusters(cluster_data, df, var_edu, var_vab)
  
  df_clusters <- data.frame(
    Cluster = mapped_clusters,
    IFDM_Emp_Renda = df[[var_emp_renda]],
    IFDM_Edu = df[[var_edu]],
    VAB = df[[var_vab]],
    ROA = df[[var_roa]],
    CPLA = df[[var_cpla]],
    Ativos = df[[var_ativos]]
  )
  
  cluster_means <- df_clusters %>%
    group_by(Cluster) %>%
    summarise(mean_emp_renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
              mean_edu = mean(IFDM_Edu, na.rm = TRUE),
              mean_vab = mean(VAB, na.rm = TRUE),
              mean_roa = mean(ROA, na.rm = TRUE),
              mean_cpla = mean(CPLA, na.rm = TRUE),
              mean_ativos = mean(Ativos, na.rm = TRUE))
  
  return(cluster_means)
}

# Calcular e exibir médias para validação
means_canberra <- calculate_cluster_means(
  cluster_data = df_cluster3_agg$cluster_canb,
  df = df_cluster3_agg,
  var_emp_renda = "IFDM_Emp_Renda",
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)
print("Canberra:")
print(means_canberra)

means_chebyshev <- calculate_cluster_means(
  cluster_data = df_cluster3_agg$cluster_cheb,
  df = df_cluster3_agg,
  var_emp_renda = "IFDM_Emp_Renda",
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)
print("Chebyshev:")
print(means_chebyshev)

means_minkowski <- calculate_cluster_means(
  cluster_data = df_cluster3_agg$cluster_mink,
  df = df_cluster3_agg,
  var_emp_renda = "IFDM_Emp_Renda",
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)
print("Minkowski:")
print(means_minkowski)

means_manhattan <- calculate_cluster_means(
  cluster_data = df_cluster3_agg$cluster_manhattan,
  df = df_cluster3_agg,
  var_emp_renda = "IFDM_Emp_Renda",
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)
print("Manhattan:")
print(means_manhattan)

# Função ajustada para criar e salvar gráficos
create_cluster_plot <- function(cluster_data, title, filename, pca_data, summary_pca, df, var_edu, var_vab, var_emp_renda, var_roa, var_cpla, var_ativos) {
  if (length(cluster_data) != nrow(pca_data$x)) {
    stop("Erro: O número de linhas em cluster_data (", length(cluster_data), 
         ") não corresponde ao número de linhas em pca_data$x (", nrow(pca_data$x), ").")
  }
  
  mapped_clusters <- map_clusters(cluster_data, df, var_edu, var_vab)
  
  pca_df <- data.frame(
    PC1 = pca_data$x[, 1],
    PC2 = pca_data$x[, 2],
    Cluster = factor(mapped_clusters, 
                     levels = 1:4, 
                     labels = cluster_labels)
  )
  
  p <- ggplot(pca_df, aes(x = PC1, y = PC2, color = Cluster)) +
    geom_point(size = 2, alpha = 0.6) +
    labs(title = title, 
         x = paste("PC1 (", round(summary_pca[2, 1] * 100, 2), "% da variância)"), 
         y = paste("PC2 (", round(summary_pca[2, 2] * 100, 2), "% da variância)"), 
         color = "Clusters (ver Tabela X, Artigo 3)") +
    scale_color_manual(values = cores) +
    theme_minimal() +
    theme(plot.title = element_text(size = 14, face = "bold"),
          axis.title = element_text(size = 12),
          legend.title = element_text(size = 10),
          legend.text = element_text(size = 8),
          legend.position = "top",
          legend.box = "horizontal",
          legend.background = element_rect(fill = "transparent"),
          plot.margin = unit(c(1, 1, 1, 1), "cm")) +
    guides(color = guide_legend(nrow = 2, byrow = TRUE))
  
  ggsave(filename, p, width = 10, height = 6, dpi = 300, limitsize = FALSE)
  
  return(p)
}

# Gerar os cinco gráficos
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster,
  title = "Clusters - Distância Euclidiana (PCA)",
  filename = "cluster_euclidiana_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_emp_renda = "IFDM_Emp_Renda",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)

create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_manhattan,
  title = "Clusters - Distância Manhattan (PAM, PCA)",
  filename = "cluster_manhattan_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_emp_renda = "IFDM_Emp_Renda",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)

create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_mink,
  title = "Clusters - Distância Minkowski (p=3, PAM, PCA)",
  filename = "cluster_minkowski_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_emp_renda = "IFDM_Emp_Renda",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)

create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_cheb,
  title = "Clusters - Distância Chebyshev (PAM, PCA)",
  filename = "cluster_chebyshev_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_emp_renda = "IFDM_Emp_Renda",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)

create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_canb,
  title = "Clusters - Distância Canberra (PAM, PCA)",
  filename = "cluster_canberra_pca.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_emp_renda = "IFDM_Emp_Renda",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)

#load("c:/Aula3/docs/novo_18_11_24_.RData")
#save.image("c:/Aula3/docs/novo_12_03_25_.RData")
load("c:/Aula3/docs/novo_12_03_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")

###TESTANDO COM 3 CLUSTER
library(cluster)
library(factoextra)

# Preparar dados padronizados
data_for_clustering <- scale(df_cluster3_agg[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB")])

# Método Elbow
set.seed(123) # Para reproducibilidade
fviz_nbclust(data_for_clustering, kmeans, method = "wss", k.max = 10) +
  labs(title = "Método Elbow para Número de Clusters", x = "Número de Clusters", y = "Soma de Quadrados Dentro dos Clusters")

# Método Silhouette
fviz_nbclust(data_for_clustering, kmeans, method = "silhouette", k.max = 10) +
  labs(title = "Método Silhouette para Número de Clusters", x = "Número de Clusters", y = "Coeficiente de Silhouette")

# Executar K-means com 3 clusters
kmeans_3 <- kmeans(data_for_clustering, centers = 3, nstart = 25)
df_cluster3_agg$cluster_3 <- kmeans_3$cluster

# (Opcional) Executar PAM com 3 clusters para outras métricas
pam_manhattan_3 <- pam(dist(data_for_clustering, method = "manhattan"), k = 3)
df_cluster3_agg$cluster_manhattan_3 <- pam_manhattan_3$clustering

pam_minkowski_3 <- pam(dist(data_for_clustering, method = "minkowski", p = 3), k = 3)
df_cluster3_agg$cluster_mink_3 <- pam_minkowski_3$clustering

pam_chebyshev_3 <- pam(dist(data_for_clustering, method = "maximum"), k = 3)
df_cluster3_agg$cluster_cheb_3 <- pam_chebyshev_3$clustering

pam_canberra_3 <- pam(dist(data_for_clustering, method = "canberra"), k = 3)
df_cluster3_agg$cluster_canb_3 <- pam_canberra_3$clustering

##test
# Examine os gráficos gerados pelo fviz_nbclust para o Elbow (queda na soma de quadrados dentro dos clusters) 
# e Silhouette (pico no coeficiente, idealmente > 0,3). Se o coeficiente de Silhouette for próximo ou superior 
# a 0,3 para 3 clusters (comparado a ~0,4 para 4), isso pode justificar a escolha.
# Compare as médias das variáveis (IFDM Emprego & Renda, IFDM Educação, VAB, ROA, CPLA, Ativos Totais) para os 3 
# clusters com os 4 anteriores usando a função calculate_cluster_means ajusta

calculate_cluster_means <- function(cluster_data, df, var_emp_renda, var_edu, var_vab, var_roa, var_cpla, var_ativos) {
  if (length(cluster_data) == 0 || all(is.na(cluster_data))) {
    stop("Erro: cluster_data está vazio ou contém apenas NA.")
  }
  if (length(cluster_data) != nrow(df)) {
    stop("Erro: O número de linhas em cluster_data (", length(cluster_data), 
         ") não corresponde ao número de linhas em df (", nrow(df), ").")
  }
  mapped_clusters <- map_clusters(cluster_data, df, var_edu, var_vab)
  df_clusters <- data.frame(
    Cluster = mapped_clusters,
    IFDM_Emp_Renda = df[[var_emp_renda]],
    IFDM_Edu = df[[var_edu]],
    VAB = df[[var_vab]],
    ROA = df[[var_roa]],
    CPLA = df[[var_cpla]],
    Ativos = df[[var_ativos]]
  )
  cluster_means <- df_clusters %>%
    group_by(Cluster) %>%
    summarise(mean_emp_renda = mean(IFDM_Emp_Renda, na.rm = TRUE),
              mean_edu = mean(IFDM_Edu, na.rm = TRUE),
              mean_vab = mean(VAB, na.rm = TRUE),
              mean_roa = mean(ROA, na.rm = TRUE),
              mean_cpla = mean(CPLA, na.rm = TRUE),
              mean_ativos = mean(Ativos, na.rm = TRUE))
  return(cluster_means)
}

# Calcular médias para K-means com 3 clusters
means_kmeans_3 <- calculate_cluster_means(
  cluster_data = df_cluster3_agg$cluster_3,
  df = df_cluster3_agg,
  var_emp_renda = "IFDM_Emp_Renda",
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)
print("Médias K-means com 3 clusters:")
print(means_kmeans_3)

# (Opcional) Calcular médias para PAM com 3 clusters
means_manhattan_3 <- calculate_cluster_means(
  cluster_data = df_cluster3_agg$cluster_manhattan_3,
  df = df_cluster3_agg,
  var_emp_renda = "IFDM_Emp_Renda",
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)
print("Médias Manhattan com 3 clusters:")
print(means_manhattan_3)

# Gerar gráfico para 3 clusters (K-means)
create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_3,
  title = "Clusters - Distância Euclidiana (PCA, 3 Clusters)",
  filename = "cluster_euclidiana_pca_3clusters.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_emp_renda = "IFDM_Emp_Renda",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)

##########################################################################################
# Carregar pacotes necessários
library(ggplot2)
library(ggpubr)

# Gerar o gráfico para 4 clusters (Figura 1)
plot_4clusters <- create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster,
  title = "Clusters - Distância Euclidiana (PCA, 4 Clusters)",
  filename = "cluster_euclidiana_pca_4clusters.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_emp_renda = "IFDM_Emp_Renda",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)

# Gerar o gráfico para 3 clusters (Figura 6)
plot_3clusters <- create_cluster_plot(
  cluster_data = df_cluster3_agg$cluster_3,
  title = "Clusters - Distância Euclidiana (PCA, 3 Clusters)",
  filename = "cluster_euclidiana_pca_3clusters.png",
  pca_data = pca,
  summary_pca = summary_pca,
  df = df_cluster3_agg,
  var_edu = "IFDM_Edu",
  var_vab = "VAB",
  var_emp_renda = "IFDM_Emp_Renda",
  var_roa = "ROA_yeo",
  var_cpla = "CPLA_yeo",
  var_ativos = "ATIVOS_VERDADEIROS_log"
)

# Combinar os gráficos lado a lado
combined_plot <- ggarrange(
  plot_4clusters, plot_3clusters,
  labels = c("A", "B"),
  ncol = 2, nrow = 1,
  common.legend = FALSE,  # Legendas separadas para cada gráfico
  legend = "top"
)

# Salvar a figura composta
ggsave("combined_clusters_4_and_3.png", combined_plot, width = 12, height = 6, dpi = 300)

# Exibir o gráfico
print(combined_plot)

# Contar elementos em cada cluster (4 clusters)
cluster_counts_4 <- table(df_cluster3_agg$cluster)
print("Número de elementos em cada cluster (4 clusters):")
print(cluster_counts_4)

# Mapear os clusters para os nomes correspondentes
mapped_clusters_4 <- map_clusters(df_cluster3_agg$cluster, df_cluster3_agg, "IFDM_Edu", "VAB")
cluster_counts_mapped_4 <- table(factor(mapped_clusters_4, 
                                        levels = 1:4, 
                                        labels = c("Cluster 1: Regiões Menos Desenvolvidas", 
                                                   "Cluster 2: Regiões Ricas", 
                                                   "Cluster 3: Regiões Intermediárias Desenvolvidas", 
                                                   "Cluster 4: Regiões Intermediárias com Baixa Educação")))
print("Número de elementos em cada cluster mapeado (4 clusters):")
print(cluster_counts_mapped_4)

# Mapear os clusters para 3 clusters
mapped_clusters_3 <- map_clusters(df_cluster3_agg$cluster_3, df_cluster3_agg, "IFDM_Edu", "VAB")
cluster_counts_mapped_3 <- table(factor(mapped_clusters_3, 
                                        levels = 1:3, 
                                        labels = c("Cluster 1: Regiões Ricas", 
                                                   "Cluster 2: Regiões Menos Desenvolvidas", 
                                                   "Cluster 3: Regiões Intermediárias")))
print("Número de elementos em cada cluster mapeado (3 clusters, ajustado):")
print(cluster_counts_mapped_3)

#load("c:/Aula3/docs/novo_18_11_24_.RData")
#save.image("c:/Aula3/docs/novo_12_03_25_.RData")
load("c:/Aula3/docs/novo_12_03_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")

###TESTE NOVO

library(dplyr)
library(cluster)
library(factoextra)

# 1. Unir os dados com a informação de município
df_cluster_teste <- df_cluster3_agg %>%
  left_join(df_principal %>% 
              select(CNPJ, `MUNICIPIO IBGE`, MUNICÍPIO, UF),
            by = "CNPJ")

# 2. Agregar as variáveis de clusterização por município
df_municipio <- df_cluster_teste %>%
  group_by(`MUNICIPIO IBGE`, MUNICÍPIO, UF) %>%
  summarise(
    ROA = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    CPLA = mean(CPLA, na.rm = TRUE),
    ATIVOS = mean(ATIVOS_VERDADEIROS, na.rm = TRUE),
    VAB = mean(VAB, na.rm = TRUE),
    IFDM_EmpregoRenda = mean(IFDM_Emp_Renda, na.rm = TRUE),
    IFDM_Educacao = mean(IFDM_Edu, na.rm = TRUE)
  ) %>%
  ungroup()

# 3. Padronizar as variáveis
df_scaled <- scale(df_municipio %>% 
                     select(ROA, CPLA, ATIVOS, VAB, IFDM_EmpregoRenda, IFDM_Educacao))

# 4. Definir número de clusters (ex: 4)
set.seed(123)
km_res <- kmeans(df_scaled, centers = 4, nstart = 25)

# 5. Anexar resultado
df_municipio$cluster <- km_res$cluster

# 6. Visualizar resumo
table(df_municipio$cluster)

# 7. (Opcional) Visualizar no mapa
fviz_cluster(km_res, data = df_scaled)


#####
library(tidyverse)
library(gt) # ou kableExtra

df <- tribble(
  ~escala,               ~UE_media, ~Loc_media, ~Loc_min, ~Loc_max,
  "Municipal",             47.47,      5.48,      0.38,    11.10,
  "Região Imediata",       45.20,      6.93,      0.00,    15.80,
  "Região Intermediária",  43.43,     10.00,      4.10,    17.80,
  "Estadual",              43.85,      8.20,      3.30,    11.90
)

library(gt)
library(dplyr)

# Tabela
df %>%
  mutate(
    UE_media = round(UE_media, 1),
    Loc_media = round(Loc_media, 1),
    amplitude = sprintf("%.1f–%.1f", Loc_min, Loc_max)
  ) %>%
  select(escala, UE_media, Loc_media, amplitude) %>%
  gt() %>%
  cols_label(
    escala = "Escala espacial",
    UE_media = "Unidade de Negócio – média (%)",
    Loc_media = "Localização – média (%)",
    amplitude = "Localização – min–máx (%)"
  )


load("c:/Aula3/docs/novo_13_10_25_.RData")

# Forest plot da Localização (ponto = média; barra = min–máx)
ggplot(df, aes(x = Loc_media, y = fct_rev(escala))) +
  geom_errorbarh(aes(xmin = Loc_min, xmax = Loc_max), height = 0.2) +
  geom_point(size = 3) +
  # marcador vazado para a média da UE
  geom_point(aes(x = UE_media, y = fct_rev(escala)), shape = 21, fill = NA, size = 2.8) +
  labs(x = "Contribuição (%)", y = NULL,
       caption = "Ponto cheio: Localização (média). Barra: min–máx entre janelas. Círculo vazado: média da Unidade de Negócio.") +
  theme_minimal(base_size = 12)



### INGLES

ggplot(df, aes(x = Loc_media, y = fct_rev(escala))) +
  geom_errorbarh(aes(xmin = Loc_min, xmax = Loc_max), height = 0.2) +
  geom_point(size = 3) +
  geom_point(aes(x = UE_media, y = fct_rev(escala)), shape = 21, fill = NA, size = 2.8) +
  labs(x = "Contribution (%)", y = NULL,
       caption = "Filled dot: Location (average). Bar: min–max range. Hollow circle: Business Unit average.") +
  scale_y_discrete(
    labels = c(
      "Estadual" = "State",
      "Municipal" = "Municipal", 
      "Região Imediata" = "Immediate Region",
      "Região Intermediária" = "Intermediate Region"
    )
  ) +
  theme_minimal(base_size = 12)


################################################################
#####ATUALIZACAO PARA O ARTIGO 1 INCLUINDO OS ANOS DE 23 E 24
################################################################
################################################################
################################################################
################################################################


library(dplyr); library(stringr); library(purrr); library(readr); library(tibble)

# 1) Função para "canonizar" nomes: tira acentos, vira MAIÚSCULO e remove tudo que não seja A-Z/0-9
canonize_names <- function(x) {
  nm <- names(x)
  nm <- iconv(nm, to = "ASCII//TRANSLIT")      # remove acentos
  nm <- toupper(nm)
  nm <- gsub("[^A-Z0-9]", "", nm)               # remove espaços, _, -, /
  names(x) <- nm
  x
}

# 2) Dicionário de nomes destino (MESMO formato "canonizado")
cols_canon <- c(
  "NOMEINSTITUICAO","CNPJ","OPERACOESDECREDITO","PATRIMONIOLIQUIDO",
  "RESERVASDELUCROS","SOBRASOUPERDASACUMULADAS","RECEITASOPERACIONAIS",
  "OUTRASRECEITASOPERACIONAIS","RECEITASNAOOPERACIONAIS",
  "RENDASDEPRESTACAODESERVICOS","RENDASDEOPERACOESDECREDITO",
  "SOBRASBRUTAS","ATIVOSVERDADEIROS","SOBRASBRUTAPORPL","SOBRASPORATIVO",
  "ANO"
)

# 3) Sinônimos que podem aparecer (todos já "canonizados")
syn_map <- list(
  ATIVOSVERDADEIROS = c("ATIVOS","ATIVOSTOTAIS","ATIVOSTOTAL"),
  SOBRASBRUTAS      = c("SOBRAS","RESULTADOBRUTO"),
  RENDASDEPRESTACAODESERVICOS = c("RECEITASDESERVICOS","RENDASDESERVICOS"),
  RENDASDEOPERACOESDECREDITO  = c("RECEITASDEOPERACOESDECREDITO"),
  SOBRASOUPERDASACUMULADAS    = c("LUCROSPERDASACUMULADAS","RESULTADOSACUMULADOS")
)

# 4) Padronizador por ano
padroniza_ano <- function(df, ano_label) {
  if (is.null(df)) return(NULL)
  
  df <- as_tibble(df)
  # remove linhas 100% vazias e strings em branco
  df <- df %>%
    mutate(across(where(is.character), ~na_if(str_squish(.), ""))) %>%
    filter(!if_all(everything(), ~ is.na(.)))
  
  # Nomes canônicos
  df <- canonize_names(df)
  
  # Garante ANO
  if (!"ANO" %in% names(df)) df$ANO <- ano_label
  df$ANO <- as.integer(df$ANO)
  
  # Preenche sinônimos -> cria a coluna destino se ela não existir mas houver alguma alternativa
  for (dest in names(syn_map)) {
    alts <- syn_map[[dest]]
    if (!(dest %in% names(df))) {
      alt_ok <- alts[alts %in% names(df)]
      if (length(alt_ok)) df[[dest]] <- df[[alt_ok[1]]]
    }
  }
  
  # Mantém só as colunas de interesse (as que existirem)
  df <- select(df, any_of(cols_canon))
  
  # Cria as que faltarem como NA
  falt <- setdiff(cols_canon, names(df))
  if (length(falt)) df[falt] <- NA
  
  # Limpa e valida CNPJ (obrigatório)
  df <- df %>%
    mutate(
      CNPJ = str_replace_all(as.character(CNPJ), "[^0-9]", ""),
      CNPJ = na_if(CNPJ, ""),
      CNPJ = ifelse(!is.na(CNPJ), str_pad(CNPJ, 14, pad = "0"), NA_character_)
    ) %>%
    filter(!is.na(CNPJ) & str_detect(CNPJ, "^\\d{14}$"))
  
  # Parse numérico seguro
  num_cols <- c("OPERACOESDECREDITO","PATRIMONIOLIQUIDO","RESERVASDELUCROS",
                "SOBRASOUPERDASACUMULADAS","RECEITASOPERACIONAIS",
                "OUTRASRECEITASOPERACIONAIS","RECEITASNAOOPERACIONAIS",
                "RENDASDEPRESTACAODESERVICOS","RENDASDEOPERACOESDECREDITO",
                "SOBRASBRUTAS","ATIVOSVERDADEIROS","SOBRASBRUTAPORPL","SOBRASPORATIVO")
  
  df <- df %>% mutate(across(all_of(num_cols),
                             ~ suppressWarnings(parse_number(as.character(.),
                                                             locale = locale(decimal_mark = ",", grouping_mark = ".")))))
  df
}

# 5) Aplique a todos os anos existentes no ambiente
anos <- 1994:2024
lst_raw <- mget(paste0("Dados_pivotados_", anos), ifnotfound = list(NULL), inherits = TRUE)
lst_limpos <- map2(lst_raw, anos, padroniza_ano)
total_dados_limposArti1 <- bind_rows(lst_limpos)

# 6) Checagens
message("Linhas totais: ", nrow(total_dados_limposArti1))
print(head(names(total_dados_limposArti1)))
print(total_dados_limposArti1 %>% count(ANO) %>% arrange(ANO) %>% as.data.frame())


# Para uma visão geral rápida
summary(total_dados_limposArti1)
library(openxlsx)
write.xlsx(total_dados_limposArti1, "c:/Aula3/dados_exportados.xlsx")
write.csv(total_dados_limposArti1, "c:/Aula3/dados_exportados1.csv", row.names = FALSE)

# Para uma visão mais detalhada (instale com install.packages("skimr"))
install.packages("skimr")
library(skimr)
skimr::skim(total_dados_limposArti1)


library(ggplot2)
library(dplyr)
library(scales) # Para formatar os eixos dos gráficos

# Agregando os dados por ano
dados_agregados <- total_dados_limposArti1 %>%
  group_by(ANO) %>%
  summarise(
    NUM_COOPERATIVAS = n(),
    TOTAL_ATIVOS = sum(ATIVOSVERDADEIROS, na.rm = TRUE),
    TOTAL_CREDITO = sum(OPERACOESDECREDITO, na.rm = TRUE),
    TOTAL_PL = sum(PATRIMONIOLIQUIDO, na.rm = TRUE)
  ) %>%
  filter(ANO >= 1994) # Filtrar se necessário

# Gráfico da Evolução do Número de Cooperativas
ggplot(dados_agregados, aes(x = ANO, y = NUM_COOPERATIVAS)) +
  geom_line(color = "#007A33", size = 1.2) +
  geom_point(color = "#007A33", size = 2) +
  labs(
    title = "Evolução do Número de Sedes de Cooperativas de Crédito no Brasil",
    subtitle = "Observa-se uma tendência de consolidação (fusões e incorporações) nos últimos anos.",
    x = "Ano",
    y = "Número de Cooperativas"
  ) +
  theme_minimal()


######################### NOVO SEDES 13.10.25

library(ggplot2)
library(dplyr)
library(scales)
library(showtext)
library(ggtext)

# --- Configuração de Fonte ---
font_add_google("Roboto Condensed", "roboto_condensed")
showtext_auto()

# Agregando os dados por ano
dados_agregados <- total_dados_limposArti1 %>%
  group_by(ANO) %>%
  summarise(
    NUM_COOPERATIVAS = n(),
    TOTAL_ATIVOS = sum(ATIVOSVERDADEIROS, na.rm = TRUE),
    TOTAL_CREDITO = sum(OPERACOESDECREDITO, na.rm = TRUE),
    TOTAL_PL = sum(PATRIMONIOLIQUIDO, na.rm = TRUE)
  ) %>%
  filter(ANO >= 1994) # Filtrar se necessário

# --- Cores e parâmetros padrão ---
cor_principal <- "#005A9C"  # Azul consistente com o padrão
cor_texto <- "#2C3E50"

# Gráfico da Evolução do Número de Cooperativas
ggplot(dados_agregados, aes(x = ANO, y = NUM_COOPERATIVAS)) +
  geom_line(color = cor_principal, linewidth = 1.2) +
  geom_point(color = cor_principal, size = 2.5) +
  
  # Escalas
  scale_x_continuous(
    breaks = seq(1994, 2024, by = 2),
    expand = expansion(mult = c(0.01, 0.05))
  ) +
  scale_y_continuous(
    labels = number_format(big.mark = ".", decimal.mark = ",")
  ) +
  
  # Títulos e Tema
  labs(
    title = "Evolução do Número de Sedes de Cooperativas de Crédito no Brasil",
    subtitle = "Observa-se uma tendência de consolidação (fusões e incorporações) nos últimos anos.",
    x = NULL,
    y = "Número de Cooperativas"
  ) +
  theme_minimal(base_family = "roboto_condensed", base_size = 14) +
  theme(
    # Títulos - alinhamento à esquerda
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 18, margin = margin(b = 5)),
    plot.subtitle = element_text(size = 12, color = "grey40", margin = margin(b = 15)),
    plot.caption = element_text(color = "grey50", hjust = 0, size = 9, margin = margin(t = 15)),
    
    # Eixos
    axis.title.y = element_text(size = 11, face = "bold", color = cor_texto),
    axis.text.x = element_text(angle = 45, hjust = 1, color = "grey30"),
    axis.text.y = element_text(color = "grey30"),
    
    # Grid e fundo
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(color = "grey90", linewidth = 0.3),
    
    # Margens
    plot.margin = margin(20, 20, 20, 20)
  )

save.image("c:/Aula3/docs/novo_13_10_25_.RData")
# #load("c:/Aula3/docs/novo_30_1_09_25_.RData")

# Gráfico da Evolução dos Ativos Totais
ggplot(dados_agregados, aes(x = ANO, y = TOTAL_ATIVOS)) +
  geom_line(color = "#0033A0", size = 1.2) +
  geom_point(color = "#0033A0", size = 2) +
  scale_y_continuous(labels = label_number(prefix = "R$ ", scale = 1e-9, suffix = " Bi")) +
  labs(
    title = "Evolução dos Ativos Totais do SNCC",
    subtitle = "Crescimento exponencial a partir de meados dos anos 2000.",
    x = "Ano",
    y = "Ativos Totais (em R$ Bilhões)"
  ) +
  theme_minimal()

# Você pode criar gráficos similares para TOTAL_CREDITO e TOTAL_PL

# Boxplot da distribuição de ativos ao longo dos anos
# Usaremos uma escala logarítmica para melhor visualização devido à assimetria
ggplot(total_dados_limposArti1, aes(x = as.factor(ANO), y = ATIVOSVERDADEIROS)) +
  geom_boxplot(fill = "lightblue", outlier.shape = NA) + # outlier.shape = NA para não poluir
  scale_y_log10(labels = label_number(prefix = "R$ ", big.mark = ".")) +
  coord_cartesian(ylim = c(1e6, 1e11)) + # Ajuste o limite para focar na maior parte dos dados
  labs(
    title = "Distribuição do Tamanho dos Ativos por Cooperativa (Escala Log)",
    subtitle = "A mediana (linha central) e a dispersão (tamanho da caixa) cresceram ao longo do tempo.",
    x = "Ano",
    y = "Ativos por Cooperativa (R$)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))


# Criando os indicadores
dados_kpis <- total_dados_limposArti1 %>%
  filter(PATRIMONIOLIQUIDO > 0, ATIVOSVERDADEIROS > 0) %>% # Evitar divisões por zero ou PL negativo
  mutate(
    ALAVANCAGEM = ATIVOSVERDADEIROS / PATRIMONIOLIQUIDO,
    PROP_CREDITO_ATIVOS = OPERACOESDECREDITO / ATIVOSVERDADEIROS,
    ROA_PROXY = SOBRASBRUTAS / ATIVOSVERDADEIROS,
    ROE_PROXY = SOBRASBRUTAS / PATRIMONIOLIQUIDO
  )

# Agregando a MEDIANA dos indicadores por ano (mediana é mais robusta a outliers)
kpis_medianos_ano <- dados_kpis %>%
  group_by(ANO) %>%
  summarise(
    MEDIANA_ALAVANCAGEM = median(ALAVANCAGEM, na.rm = TRUE),
    MEDIANA_ROA = median(ROA_PROXY, na.rm = TRUE),
    MEDIANA_ROE = median(ROE_PROXY, na.rm = TRUE)
  )

# Gráfico da evolução da Alavancagem Mediana
ggplot(kpis_medianos_ano, aes(x = ANO, y = MEDIANA_ALAVANCAGEM)) +
  geom_line(size = 1.2, color = "darkred") +
  labs(
    title = "Evolução da Alavancagem Mediana das Cooperativas",
    subtitle = "Um aumento indica maior uso de recursos de terceiros em relação ao capital próprio.",
    x = "Ano",
    y = "Mediana (Ativos / Patrimônio Líquido)"
  ) +
  theme_minimal()


# install.packages("tsibble")
# install.packages("feasts")
library(tsibble)
install.packages("feasts")
library(feasts)

# Converter o data.frame agregado para um objeto tsibble
dados_ts <- dados_agregados %>%
  filter(ANO <= 2024) %>% # Usar dados até o último ano completo
  as_tsibble(index = ANO)


# Decompondo a série de Ativos Totais
# Usaremos o método STL (Seasonal-Trend decomposition using Loess)
decomposicao_ativos <- dados_ts %>%
  model(STL(TOTAL_ATIVOS)) %>%
  components()

# Visualizando a decomposição
autoplot(decomposicao_ativos) +
  labs(title = "Decomposição da Série Temporal de Ativos Totais do SNCC")


install.packages("fable")
library(fable)

# Criando e treinando um modelo de previsão
# O modelo ETS (Error, Trend, Season) é robusto e automático
modelo_previsao <- dados_ts %>%
  model(ETS(TOTAL_ATIVOS))

# Gerando a previsão para os próximos 5 anos
previsao <- modelo_previsao %>%
  forecast(h = 5)

# Visualizando a previsão
previsao %>%
  autoplot(dados_ts) +
  labs(
    title = "Previsão de Ativos Totais para os Próximos 5 Anos",
    subtitle = "Baseado no modelo ETS ajustado aos dados históricos.",
    y = "Ativos Totais (R$)"
  ) +
  scale_y_continuous(labels = label_number(prefix = "R$ ", scale = 1e-9, suffix = " Bi")) +
  theme_minimal()


####GPT helping

library(dplyr); library(tidyr); library(ggplot2); library(scales)

df <- total_dados_limposArti1

ag_ano <- df %>%
  group_by(ANO) %>%
  summarise(
    n_coops  = n_distinct(CNPJ),
    ativos   = sum(ATIVOSVERDADEIROS, na.rm=TRUE),
    credito  = sum(OPERACOESDECREDITO, na.rm=TRUE),
    pl       = sum(PATRIMONIOLIQUIDO, na.rm=TRUE),
    sobras   = sum(SOBRASBRUTAS, na.rm=TRUE),
    med_sobra_ativo = median(SOBRASPORATIVO, na.rm=TRUE),
    .groups="drop"
  ) %>%
  mutate(loan_to_assets = ifelse(ativos>0, credito/ativos, NA_real_))


ipca_raw <- readxl::read_excel("C:/Aula3/DadosCoopBrasil/IPCA/IPCA_1994_2024.xlsx")

# 2) Normalizar nomes e tipos
ipca <- ipca_raw %>%
  rename_with(toupper) %>%                    # ANO, IPCA
  mutate(
    ANO = as.integer(ANO),
    IPCA = readr::parse_number(as.character(IPCA),
                               locale = locale(decimal_mark = ",", grouping_mark = "."))
  ) %>%
  filter(!is.na(ANO), !is.na(IPCA)) %>%
  arrange(ANO)

# 3) Detectar se "IPCA" é índice ou variação anual (%)
tipo_ipca <- if (max(ipca$IPCA, na.rm = TRUE) <= 50) "percent" else "index"

if (tipo_ipca == "percent") {
  # IPCA = variação anual em %  -> construir índice acumulado
  ipca <- ipca %>%
    mutate(indice = 100 * cumprod(1 + IPCA/100))
} else {
  # IPCA já é índice de preços (nível)
  ipca <- ipca %>% transmute(ANO, indice = IPCA)
}

# 4) Rebase para 2024 = 100
stopifnot(2024 %in% ipca$ANO)
base_2024 <- ipca$indice[ipca$ANO == 2024][1]
ipca <- ipca %>% mutate(indice = 100 * indice / base_2024)

# 5) Juntar ao seu agregado anual e deflacionar
ag_ano <- ag_ano %>%
  left_join(ipca, by = "ANO") %>%
  mutate(
    deflator = 100 / indice,          # 2024 = 1
    ativos_r  = ativos  * deflator,
    credito_r = credito * deflator,
    pl_r      = pl      * deflator,
    sobras_r  = sobras  * deflator
  )

# 6) Checagens rápidas
stopifnot(all(c("ativos_r","credito_r","pl_r","sobras_r") %in% names(ag_ano)))
print(ag_ano %>% select(ANO, ativos, ativos_r, indice) %>% head())

####Índices (1994 = 100) com valores reais (se quiser em seguida)

base_1994 <- ag_ano %>% filter(ANO == 1994)
ag_ano <- ag_ano %>%
  mutate(
    idx_ativos  = 100 * ativos_r  / base_1994$ativos_r,
    idx_credito = 100 * credito_r / base_1994$credito_r,
    idx_pl      = 100 * pl_r      / base_1994$pl_r
  )


###KPI
library(dplyr); library(tidyr); library(scales)

# ag_ano já deve conter: ANO, n_coops, ativos, credito, pl, sobras,
# med_sobra_ativo, loan_to_assets, e também ativos_r, credito_r, pl_r, sobras_r (deflacionados)

tabela_kpi_anual <- ag_ano %>%
  transmute(
    ANO,
    `Nº cooperativas` = n_coops,
    `Ativos (R$ de 2024)`   = round(ativos_r, 0),
    `Crédito (R$ de 2024)`  = round(credito_r, 0),
    `PL (R$ de 2024)`       = round(pl_r, 0),
    `Sobras (R$ de 2024)`   = round(sobras_r, 0),
    `Crédito/Ativos (%)`    = percent(loan_to_assets, accuracy = 0.1),
    `Mediana Sobra/Ativo (%)` = percent(med_sobra_ativo, accuracy = 0.01)
  )
readr::write_csv(tabela_kpi_anual, "C:/Aula3/DadosCoopBrasil/Artigo1/Tabela_A_KPI_Anual_1994_2024.csv")

##Crescimento: YoY, CAGR 30 anos e CAGR 10 anos
library(slider)

ag_ano <- ag_ano %>%
  arrange(ANO) %>%
  mutate(
    g_ativos_yoy  = ativos_r/lag(ativos_r) - 1,
    g_credito_yoy = credito_r/lag(credito_r) - 1,
    g_pl_yoy      = pl_r/lag(pl_r) - 1
  )

cagr_30 <- (ag_ano$ativos_r[ag_ano$ANO==2024] / ag_ano$ativos_r[ag_ano$ANO==1994])^(1/30) - 1
cagr_10 <- (ag_ano$ativos_r[ag_ano$ANO==2024] / ag_ano$ativos_r[ag_ano$ANO==2014])^(1/10) - 1

tabela_cagr <- tibble::tibble(
  Horizonte = c("1994–2024 (30 anos)","2014–2024 (10 anos)"),
  `CAGR Ativos`  = percent(c(cagr_30, cagr_10), 0.01),
  `CAGR Crédito` = percent(c(
    (ag_ano$credito_r[ag_ano$ANO==2024]/ag_ano$credito_r[ag_ano$ANO==1994])^(1/30)-1,
    (ag_ano$credito_r[ag_ano$ANO==2024]/ag_ano$credito_r[ag_ano$ANO==2014])^(1/10)-1
  ), 0.01),
  `CAGR PL`      = percent(c(
    (ag_ano$pl_r[ag_ano$ANO==2024]/ag_ano$pl_r[ag_ano$ANO==1994])^(1/30)-1,
    (ag_ano$pl_r[ag_ano$ANO==2024]/ag_ano$pl_r[ag_ano$ANO==2014])^(1/10)-1
  ), 0.01)
)


# desvio-padrão do crescimento dos ativos (janela móvel de 5 anos)
ag_ano <- ag_ano %>%
  mutate(vol_g_ativos_5a = slide_dbl(g_ativos_yoy, sd, .before = 4, .complete = TRUE))

# opcional: testes simples de quebra e tendência
install.packages(c("strucchange","trend"))
library(strucchange); library(trend)
bp <- breakpoints(ativos_r ~ 1, data = ag_ano); breakdates(bp)
mk.test(ag_ano$ativos_r)

#####Gráficos executivos (limpos e legíveis)
library(ggplot2)

# G1 — Nº de cooperativas
ggplot(ag_ano, aes(ANO, n_coops)) +
  geom_line() + geom_point(size=1.4) +
  labs(x=NULL, y="Nº de cooperativas", title="Evolução do número de cooperativas (1994–2024)") +
  theme_minimal(base_size=12)

# Índices reais (1994=100)
base_1994 <- ag_ano %>% filter(ANO==1994)
ag_ano <- ag_ano %>%
  mutate(
    idx_ativos  = 100*ativos_r/base_1994$ativos_r,
    idx_credito = 100*credito_r/base_1994$credito_r,
    idx_pl      = 100*pl_r/base_1994$pl_r
  )
idx_long <- ag_ano %>%
  select(ANO, idx_ativos, idx_credito, idx_pl) %>%
  tidyr::pivot_longer(-ANO, names_to="serie", values_to="indice") %>%
  dplyr::mutate(serie = dplyr::recode(serie,
                                      idx_ativos="Ativos", idx_credito="Crédito", idx_pl="Patrimônio Líquido"))

# G2 — Índices reais 1994=100
ggplot(idx_long, aes(ANO, indice, linetype=serie)) +
  geom_line() + geom_point(size=1) +
  geom_hline(yintercept=100, linewidth=0.3) +
  labs(x=NULL, y="Índice (1994 = 100)", linetype=NULL,
       title="Crescimento relativo — valores reais (1994–2024)") +
  theme_minimal(base_size=12)

# G3 — Crescimento YoY dos ativos (barra) + LOESS

# ag_plot <- ag_ano %>% filter(ANO >= 1996)
# ===== 1) Crescimento YoY dos ativos reais =====
dados_growth <- ag_ano %>%
  arrange(ANO) %>%
  mutate(
    g_ativos_yoy = ativos_r / lag(ativos_r) - 1  # variação anual
  )

# ===== 2) Remover o primeiro delta (1995/1994) para evitar o pico por efeito-base =====
dados_growth_clean <- dados_growth %>%
  filter(ANO >= 1996)   # comece em 1996 (primeiro YoY "saudável")

# ===== 3) Gráfico executivo (barras + LOESS), com zoom do eixo Y =====
p_growth <- ggplot(dados_growth_clean, aes(ANO, g_ativos_yoy)) +
  geom_col() +
  geom_smooth(method = "loess", se = FALSE, span = 0.4) +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  coord_cartesian(ylim = c(-0.5, 0.5)) +  # mostra de -50% a +50% (ajuste se quiser)
  labs(
    x = NULL, y = "Crescimento YoY (ativos reais)",
    title = "Crescimento anual dos ativos e suavização (LOESS)"
  ) +
  theme_minimal(base_size = 12)

p_growth


###TESTE
# pacotes
# install.packages("patchwork") # se ainda não tiver
library(dplyr)
library(ggplot2)
library(scales)
library(patchwork)

# 1) crescimento em diferença de log (≈ var.%)
growth <- ag_ano %>%
  arrange(ANO) %>%
  mutate(g_log = log(ativos_r) - log(lag(ativos_r))) %>%
  filter(!is.na(g_log))  # remove o primeiro NA

# 2) função base (barras + LOESS)
base_plot <- function(data){
  ggplot(data, aes(ANO, g_log)) +
    geom_col(width = 0.8) +
    geom_smooth(method = "loess", se = FALSE, span = 0.4) +
    scale_y_continuous(labels = percent_format(accuracy = 1)) +
    labs(x = NULL, y = "Crescimento (dif. log de ativos reais)") +
    theme_minimal(base_size = 12)
}

# 3) versões
p_full <- base_plot(growth) +
  labs(title = "Versão completa")

p_zoom <- base_plot(growth) +
  coord_cartesian(ylim = c(-0.5, 0.5)) +  # zoom –50% a +50% (ajuste se quiser)
  labs(title = "Zoom (–50% a +50%)")

# 4) lado a lado + nota
p_combo <- p_full + p_zoom + 
  plot_annotation(
    title   = "Crescimento anual dos ativos (dif. log) — completo vs. zoom",
    caption = "Nota: o primeiro ganho é atípico por efeito-base (nível de 1994 muito baixo)."
  )

p_combo

# 5) salvar em alta
ggsave("c:/Aula3/G_crescimento_completo_zoom.png", p_combo, width = 12, height = 4.8, dpi = 300)



##SUMARIO EXECUTIVO
library(glue)

linha_1994 <- ag_ano %>% filter(ANO==1994)
linha_2014 <- ag_ano %>% filter(ANO==2014)
linha_2024 <- ag_ano %>% filter(ANO==2024)

bullets <- c(
  glue("O sistema encerrou 2024 com **{comma(linha_2024$n_coops)}** cooperativas (1994: {comma(linha_1994$n_coops)})."),
  glue("Em valores reais, os **ativos** cresceram a **{percent(cagr_30, 0.1)} a.a.** (30 anos) e **{percent(cagr_10, 0.1)} a.a.** na última década."),
  glue("O **crédito** e o **PL** avançaram de forma consistente (CAGR 30a: {tabela_cagr$`CAGR Crédito`[1]}, {tabela_cagr$`CAGR PL`[1]})."),
  glue("A **rentabilidade mediana** (Sobra/Ativo) permaneceu positiva em todo o período; em 2024 foi {percent(linha_2024$med_sobra_ativo, 0.1)}."),
  glue("A **intensidade de crédito** (Crédito/Ativos) em 2024 foi {percent(linha_2024$loan_to_assets, 0.1)}, com ciclos de crescimento visíveis e volatilidade moderada.")
)
cat(paste0("- ", bullets, collapse = "\n"))


#####IPCA AJUSTES
################################
library(readr); library(dplyr)

# Leia sua planilha ANO, IPCA (em %)
ipca_raw <- read_csv("IPCA_1994_2024.csv",
                     locale = locale(decimal_mark = ",", grouping_mark = "."))

ipca <- ipca_raw %>%
  transmute(
    ANO = as.integer(ANO),
    ipca_pct = parse_number(as.character(IPCA),
                            locale = locale(decimal_mark=",", grouping_mark=".")) / 100  # 22,41 -> 0,2241
  ) %>%
  arrange(ANO) %>%
  mutate(
    # nível de preços acumulado (começa em 1 e vai multiplicando)
    nivel = cumprod(1 + ipca_pct),
    # índice com base 2024 = 100 (para deflator)
    indice_2024 = 100 * nivel / nivel[ANO == 2024],
    deflator = 100 / indice_2024
  )


library(ggplot2); library(scales)

# junção com a mediana Sobra/Ativo por ano (ag_med) que você já calculou
plot_df <- ag_med %>%
  left_join(ipca %>% select(ANO, ipca_pct), by = "ANO") %>%
  filter(ANO != 1994)  # excluir 1994 apenas do IPCA

# fator do eixo secundário (robusto a outliers)
sf <- quantile(plot_df$med_sobra_ativo, 0.95, na.rm=TRUE) /
  quantile(plot_df$ipca_pct,       0.95, na.rm=TRUE)

ggplot(plot_df, aes(ANO)) +
  geom_line(aes(y = med_sobra_ativo, colour = "Mediana Sobra/Ativo"), linewidth = 1) +
  geom_point(aes(y = med_sobra_ativo, colour = "Mediana Sobra/Ativo"), size = 1.1) +
  geom_line(aes(y = ipca_pct * sf, colour = "IPCA (% no ano)"),
            linewidth = 0.9, alpha = .95, na.rm = TRUE) +
  scale_y_continuous(
    name = "Sobra/Ativo (mediana, %)", labels = percent,
    sec.axis = sec_axis(~ . / sf, name = "IPCA (% no ano)", labels = percent_format(accuracy = 0.1))
  ) +
  scale_color_manual(values = c("Mediana Sobra/Ativo"="black","IPCA (% no ano)"="red"),
                     guide = guide_legend(title = NULL)) +
  labs(title="Rentabilidade mediana vs. IPCA", subtitle="IPCA anual em %, 1995–2024") +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom")


range(ipca$ipca_pct*100, na.rm=TRUE)  # deve dar ~[0; 22.41] (com 1994=916,46 se não filtrar)
all(diff(ipca$indice_2024) >= 0)      # TRUE: índice deve ser não decrescente


library(readr); library(dplyr)

ipca_chk <- ipca %>%
  transmute(ANO,
            ipca_raw = readr::parse_number(as.character(IPCA),
                                           locale = locale(decimal_mark = ",", grouping_mark = "."))
  )

summary(ipca_chk$ipca_raw)               # deve dar ~ [4 ; 22] (e 916 em 1994)
ipca_chk %>% filter(ANO %in% c(1995, 2015, 2021, 2024))



####VERIFICANDO O GRAFICO ROA - IPCA


# Carregar a biblioteca dplyr, caso ainda não esteja carregada
library(dplyr)

# Calcular a mediana da coluna SOBRASPORATIVO para todo o período
mediana_geral <- total_dados_limpos %>%
  summarise(
    mediana_sobras_por_ativo = median(SOBRAS_POR_ATIVO, na.rm = TRUE)
  )

# Exibir o resultado
print(mediana_geral)


# Carregar a biblioteca dplyr, caso ainda não esteja carregada
library(dplyr)

# Agrupar os dados por ano e calcular a mediana de SOBRASPORATIVO
mediana_anual <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(
    mediana_sobras_por_ativo = median(SOBRAS_POR_ATIVO, na.rm = TRUE)
  ) %>%
  arrange(ANO) # Garante que a tabela esteja ordenada por ano

# Exibir a tabela com os resultados ano a ano
print(mediana_anual, n = nrow(mediana_anual)) # O 'n' garante que todas as linhas sejam impressas


library(dplyr)
library(ggplot2)
library(scales)
library(ggtext)
library(showtext)
library(glue)

# --- Configuração de Fonte ---
font_add_google("Roboto Condensed", "roboto_condensed")
showtext_auto()

# --- Dados Atualizados ---
anos <- seq(1994, 2024, by = 1)

# IPCA values with 1994 set to NA and 1995 = 22.41%
ipca_values <- c(
  NA, 22.41, 9.56, 5.22, 1.65, 8.94, 5.97, 7.67, 12.53, 9.30,  # 1994–2003
  7.60, 5.69, 3.14, 4.46, 5.90, 4.31, 5.91, 6.50, 5.84, 5.91,  # 2004–2013
  6.41, 10.67, 6.29, 2.95, 3.75, 4.31, 4.52, 10.06, 5.79, 4.62, 4.83  # 2014–2024
)

# --- Calcular mediana de SOBRAS_POR_ATIVO por ano ---
# Substitua 'total_dados_limpos' pelo seu data frame real
# Exemplo: total_dados_limpos <- data.frame(ANO = ..., SOBRAS_POR_ATIVO = ...)
mediana_anual <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(
    mediana_sobras_por_ativo = median(SOBRAS_POR_ATIVO, na.rm = TRUE)
  ) %>%
  arrange(ANO) # Garante que a tabela esteja ordenada por ano

# Criar lst_limpos com os valores reais
lst_limpos <- list(
  med_sobra_ativo = mediana_anual$mediana_sobras_por_ativo
)

# Verificar se todos os anos de 1994 a 2024 estão presentes
missing_years <- setdiff(anos, mediana_anual$ANO)
if (length(missing_years) > 0) {
  warning(paste("Anos faltando em total_dados_limpos:", paste(missing_years, collapse = ", ")))
  # Completar com NA para anos ausentes
  mediana_anual <- mediana_anual %>%
    right_join(data.frame(ANO = anos), by = "ANO") %>%
    arrange(ANO)
  lst_limpos$med_sobra_ativo <- mediana_anual$mediana_sobras_por_ativo
}

# Converter SOBRAS_POR_ATIVO para percentual, se necessário (exemplo: de 0.052 para 5.2)
# Comente a linha abaixo se os dados já estiverem em percentual
lst_limpos$med_sobra_ativo <- lst_limpos$med_sobra_ativo * 100

# Create plot_df combining ANO, med_sobra_ativo from lst_limpos, and ipca_pct
plot_df <- data.frame(
  ANO = anos,
  med_sobra_ativo = lst_limpos$med_sobra_ativo,  # Sourcing from mediana_anual
  ipca_pct = ipca_values  # IPCA with 1994 = NA, 1995 = 22.41%
)

sf <- 1  # Scaling factor (ajuste conforme necessário)

# 1) Dados das linhas
df_lines <- plot_df %>%
  arrange(ANO) %>%
  mutate(ipca_scaled = ipca_pct * sf)  # Using ipca_pct from plot_df

# 2) Dados do sombreado
df_shade <- df_lines %>%
  filter(!is.na(med_sobra_ativo), !is.na(ipca_scaled)) %>%
  mutate(
    who_above = if_else(med_sobra_ativo >= ipca_scaled, "Rentabilidade Real Positiva", "Rentabilidade Real Negativa"),
    run = cumsum(dplyr::lag(who_above, default = first(who_above)) != who_above),
    ymin = pmin(med_sobra_ativo, ipca_scaled),
    ymax = pmax(med_sobra_ativo, ipca_scaled)
  )

# 3) Dados para os rótulos diretos no final das linhas
df_labels <- df_lines %>%
  filter(ANO == max(ANO))

# 4) Dados para as anotações de eventos macroeconômicos
df_annotations <- tibble::tribble(
  ~ANO, ~y_label, ~label, ~curvature,
  1996, 25, "Plano Real:\nInflação \ncontrolada", -0.3,
  2002, 20, "Crise cambial", 0.3,
  2015, 20, "Recessão\neconômica", 0.3,
  2021, 20, "Impacto COVID", 0.3
) %>%
  left_join(df_lines %>% select(ANO, ipca_scaled), by = "ANO")

# --- Gráfico Final ---
cor_sobra <- "#005A9C"
cor_ipca <- "#D4352C"
cor_fill_pos <- "#A8D5BA"
cor_fill_neg <- "#F5B2B0"

ggplot(data = df_lines, aes(x = ANO)) +
  # Camada de Sombreamento
  geom_ribbon(
    data = df_shade,
    aes(ymin = ymin, ymax = ymax, fill = who_above, group = run),
    alpha = 0.4
  ) +
  # Linha de referência no zero
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey50", linewidth = 0.6) +
  # Linhas principais
  geom_line(aes(y = med_sobra_ativo), color = cor_sobra, linewidth = 1.2, na.rm = TRUE) +
  geom_line(aes(y = ipca_scaled), color = cor_ipca, linewidth = 1.0, na.rm = TRUE) +
  # Pontos para marcar os anos
  geom_point(aes(y = med_sobra_ativo), color = cor_sobra, size = 1.5, na.rm = TRUE) +
  geom_point(aes(y = ipca_scaled), color = cor_ipca, size = 1.5, na.rm = TRUE) +
  # Rótulos diretos no final das linhas
  geom_richtext(
    data = df_labels,
    aes(y = med_sobra_ativo, label = glue::glue("<b style='color:{cor_sobra}'>ROA</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  geom_richtext(
    data = df_labels,
    aes(y = ipca_scaled, label = glue::glue("<b style='color:{cor_ipca}'>IPCA</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  # ANOTAÇÕES DE EVENTOS COM SETAS
  geom_text(
    data = df_annotations,
    aes(y = y_label, label = label),
    family = "roboto_condensed", size = 3.8, color = "grey20", lineheight = 0.9
  ) +
  geom_curve(
    data = df_annotations,
    aes(xend = ANO, y = y_label, yend = ipca_scaled + 0.5, curvature = curvature),
    arrow = arrow(length = unit(0.06, "inches")),
    color = "grey40", linewidth = 0.4
  ) +
  # Escalas
  scale_y_continuous(
    name = "Mediana ROA",
    breaks = seq(floor(min(c(df_lines$med_sobra_ativo, df_lines$ipca_scaled), na.rm = TRUE)),
                 ceiling(max(c(df_lines$med_sobra_ativo, df_lines$ipca_scaled), na.rm = TRUE)),
                 by = 2),  # Linhas de grade a cada 2 unidades
    labels = scales::label_number(suffix = "%", accuracy = 1),
    sec.axis = sec_axis(
      ~. / sf,
      name = "IPCA (% a.a.)",
      breaks = seq(floor(min(df_lines$ipca_scaled, na.rm = TRUE) / sf),
                   ceiling(max(df_lines$ipca_scaled, na.rm = TRUE) / sf),
                   by = 2),  # Linhas correspondentes no eixo secundário
      labels = scales::label_number(suffix = "%", accuracy = 1)
    )
  ) +
  scale_x_continuous(
    breaks = seq(1994, 2024, by = 2),
    expand = expansion(mult = c(0.01, 0.15))
  ) +
  scale_fill_manual(
    name = NULL,
    values = c("Rentabilidade Real Positiva" = cor_fill_pos, "Rentabilidade Real Negativa" = cor_fill_neg)
  ) +
  # Títulos e Tema
  labs(
    title = "Desempenho Real das Cooperativas de Crédito Frente à Inflação",
    subtitle = "A área sombreada indica períodos de ganho <span style='color:#006400;'><b>real positivo</b></span> ou <span style='color:#C41E3A;'><b>real negativo</b></span>.",
    x = NULL
  ) +
  theme_minimal(base_family = "roboto_condensed", base_size = 14) +
  theme(
    legend.position = "none",
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 18, margin = margin(b = 5)),
    plot.subtitle = element_markdown(size = 12, color = "grey40", margin = margin(b = 15)),
    plot.caption = element_text(color = "grey50", hjust = 0, size = 9, margin = margin(t = 15)),
    axis.title.y = element_text(size = 11, face = "bold", color = cor_sobra),
    axis.title.y.right = element_text(size = 11, face = "bold", color = cor_ipca),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.margin = margin(20, 20, 20, 20)
  )

#####grafico ROA - PIB

library(dplyr)
library(ggplot2)
library(scales)
library(ggtext)
library(showtext)
library(glue)

# --- Configuração de Fonte ---
font_add_google("Roboto Condensed", "roboto_condensed")
showtext_auto()

# --- Dados Atualizados ---
anos <- seq(1994, 2024, by = 1)

# PIB values de 1994 a 2024 (extraídos do arquivo ipeadata.xls)
pib_values <- c(
  5.33, 4.42, 2.21, 3.40, 0.34, 0.47, 4.39, 1.39, 3.05, 1.14,  # 1994–2003
  5.76, 3.20, 3.96, 6.07, 5.09, -0.13, 7.53, 3.97, 1.92, 3.01,  # 2004–2013
  0.50, -3.55, -3.28, 1.32, 1.78, 1.22, -3.28, 4.76, 3.02, 3.24, 3.40  # 2014–2024
)

# --- Calcular mediana de SOBRAS_POR_ATIVO por ano ---
# Substitua 'total_dados_limpos' pelo seu data frame real
# Exemplo: total_dados_limpos <- data.frame(ANO = ..., SOBRAS_POR_ATIVO = ...)
mediana_anual <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(
    mediana_sobras_por_ativo = median(SOBRAS_POR_ATIVO, na.rm = TRUE)
  ) %>%
  arrange(ANO) # Garante que a tabela esteja ordenada por ano

# Criar lst_limpos com os valores reais
lst_limpos <- list(
  med_sobra_ativo = mediana_anual$mediana_sobras_por_ativo
)

# Verificar se todos os anos de 1994 a 2024 estão presentes
missing_years <- setdiff(anos, mediana_anual$ANO)
if (length(missing_years) > 0) {
  warning(paste("Anos faltando em total_dados_limpos:", paste(missing_years, collapse = ", ")))
  # Completar com NA para anos ausentes
  mediana_anual <- mediana_anual %>%
    right_join(data.frame(ANO = anos), by = "ANO") %>%
    arrange(ANO)
  lst_limpos$med_sobra_ativo <- mediana_anual$mediana_sobras_por_ativo
}

# Converter SOBRAS_POR_ATIVO para percentual, se necessário (exemplo: de 0.052 para 5.2)
# Comente a linha abaixo se os dados já estiverem em percentual
lst_limpos$med_sobra_ativo <- lst_limpos$med_sobra_ativo * 100

# Create plot_df combining ANO, med_sobra_ativo from lst_limpos, and pib_pct
plot_df <- data.frame(
  ANO = anos,
  med_sobra_ativo = lst_limpos$med_sobra_ativo,  # Sourcing from mediana_anual
  pib_pct = pib_values  # PIB from ipeadata.xls
)

sf <- 1  # Scaling factor (ajuste conforme necessário)

# 1) Dados das linhas
df_lines <- plot_df %>%
  arrange(ANO) %>%
  mutate(pib_scaled = pib_pct * sf)  # Using pib_pct from plot_df

# 2) Dados do sombreado
df_shade <- df_lines %>%
  filter(!is.na(med_sobra_ativo), !is.na(pib_scaled)) %>%
  mutate(
    who_above = if_else(med_sobra_ativo >= pib_scaled, "Rentabilidade Real Positiva", "Rentabilidade Real Negativa"),
    run = cumsum(dplyr::lag(who_above, default = first(who_above)) != who_above),
    ymin = pmin(med_sobra_ativo, pib_scaled),
    ymax = pmax(med_sobra_ativo, pib_scaled)
  )

# 3) Dados para os rótulos diretos no final das linhas
df_labels <- df_lines %>%
  filter(ANO == max(ANO))

# 4) Dados para as anotações de eventos macroeconômicos
df_annotations <- tibble::tribble(
  ~ANO, ~y_label, ~label, ~curvature,
  1996, 12, "Plano Real:\nEstabilização \neconômica", -0.3,
  2002, 12, "Crise cambial", 0.3,
  2015, 12, "Recessão \neconômica", 0.3,
  2021, 12, "Recuperação \npós-COVID", 0.3
) %>%
  left_join(df_lines %>% select(ANO, pib_scaled), by = "ANO")

# --- Gráfico Final ---
cor_sobra <- "#005A9C"
cor_pib <- "#D4352C"
cor_fill_pos <- "#A8D5BA"
cor_fill_neg <- "#F5B2B0"

ggplot(data = df_lines, aes(x = ANO)) +
  # Camada de Sombreamento
  geom_ribbon(
    data = df_shade,
    aes(ymin = ymin, ymax = ymax, fill = who_above, group = run),
    alpha = 0.4
  ) +
  # Linha de referência no zero
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey50", linewidth = 0.6) +
  # Linhas principais
  geom_line(aes(y = med_sobra_ativo), color = cor_sobra, linewidth = 1.2, na.rm = TRUE) +
  geom_line(aes(y = pib_scaled), color = cor_pib, linewidth = 1.0, na.rm = TRUE) +
  # Pontos para marcar os anos
  geom_point(aes(y = med_sobra_ativo), color = cor_sobra, size = 1.5, na.rm = TRUE) +
  geom_point(aes(y = pib_scaled), color = cor_pib, size = 1.5, na.rm = TRUE) +
  # Rótulos diretos no final das linhas
  geom_richtext(
    data = df_labels,
    aes(y = med_sobra_ativo, label = glue::glue("<b style='color:{cor_sobra}'>ROA</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  geom_richtext(
    data = df_labels,
    aes(y = pib_scaled, label = glue::glue("<b style='color:{cor_pib}'>PIB Anual</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  # ANOTAÇÕES DE EVENTOS COM SETAS
  geom_text(
    data = df_annotations,
    aes(y = y_label, label = label),
    family = "roboto_condensed", size = 3.8, color = "grey20", lineheight = 0.9
  ) +
  geom_curve(
    data = df_annotations,
    aes(xend = ANO, y = y_label, yend = pib_scaled + 0.5, curvature = curvature),
    arrow = arrow(length = unit(0.06, "inches")),
    color = "grey40", linewidth = 0.4
  ) +
  # Escalas
  scale_y_continuous(
    name = "Mediana ROA",
    breaks = seq(floor(min(c(df_lines$med_sobra_ativo, df_lines$pib_scaled), na.rm = TRUE)),
                 ceiling(max(c(df_lines$med_sobra_ativo, df_lines$pib_scaled), na.rm = TRUE)),
                 by = 2),  # Linhas de grade a cada 2 unidades
    labels = scales::label_number(suffix = "%", accuracy = 1),
    sec.axis = sec_axis(
      ~. / sf,
      name = "PIB (% a.a.)",
      breaks = seq(floor(min(df_lines$pib_scaled, na.rm = TRUE) / sf),
                   ceiling(max(df_lines$pib_scaled, na.rm = TRUE) / sf),
                   by = 2),  # Linhas correspondentes no eixo secundário
      labels = scales::label_number(suffix = "%", accuracy = 1)
    )
  ) +
  scale_x_continuous(
    breaks = seq(1994, 2024, by = 2),
    expand = expansion(mult = c(0.01, 0.15))
  ) +
  scale_fill_manual(
    name = NULL,
    values = c("Rentabilidade Real Positiva" = cor_fill_pos, "Rentabilidade Real Negativa" = cor_fill_neg)
  ) +
  # Títulos e Tema
  labs(
    title = "Desempenho Real das Cooperativas de Crédito Frente ao PIB",
    subtitle = "A área sombreada indica períodos de ganho <span style='color:#006400;'><b>real positivo</b></span> ou <span style='color:#C41E3A;'><b>real negativo</b></span>.",
    x = NULL
  ) +
  theme_minimal(base_family = "roboto_condensed", base_size = 14) +
  theme(
    legend.position = "none",
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 18, margin = margin(b = 5)),
    plot.subtitle = element_markdown(size = 12, color = "grey40", margin = margin(b = 15)),
    plot.caption = element_text(color = "grey50", hjust = 0, size = 9, margin = margin(t = 15)),
    axis.title.y = element_text(size = 11, face = "bold", color = cor_sobra),
    axis.title.y.right = element_text(size = 11, face = "bold", color = cor_pib),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.margin = margin(20, 20, 20, 20)
  )

#load("c:/Aula3/docs/novo_18_11_24_.RData")
save.image("c:/Aula3/docs/novo_28_08_25_.RData")
#load("c:/Aula3/docs/novo_28_08_25_.RData")
file.exists("c:/Aula3/docs/novo_18_11_24_.RData")


###GRAFICO SOBRAS - SELIC EFETIVA

library(dplyr)
library(ggplot2)
library(scales)
library(ggtext)
library(showtext)
library(glue)

# --- Configuração de Fonte ---
font_add_google("Roboto Condensed", "roboto_condensed")
showtext_auto()

# --- Dados Atualizados ---
anos <- seq(1994, 2024, by = 1)

# SELIC Efetiva Anual values de 1994 a 2024 (extraídos do arquivo SELIC_EFETIVA.xlsx), com 1994 e 1995 como NA
selic_values <- c(
  NA, NA, 27.41, 24.77, 28.79, 25.59, 17.45, 17.32, 19.16, 23.33,  # 1994–2003
  16.24, 19.04, 15.08, 11.85, 12.48, 9.92, 9.78, 11.62, 8.48, 8.21,  # 2004–2013
  10.91, 13.29, 14.03, 9.96, 6.42, 5.95, 2.75, 4.44, 12.38, 13.03, 10.89  # 2014–2024
)

# --- Calcular mediana de SOBRAS_POR_ATIVO por ano ---
# Substitua 'total_dados_limpos' pelo seu data frame real
# Exemplo: total_dados_limpos <- data.frame(ANO = ..., SOBRAS_POR_ATIVO = ...)
mediana_anual <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(
    mediana_sobras_por_ativo = median(SOBRAS_POR_ATIVO, na.rm = TRUE)
  ) %>%
  arrange(ANO) # Garante que a tabela esteja ordenada por ano

# Criar lst_limpos com os valores reais
lst_limpos <- list(
  med_sobra_ativo = mediana_anual$mediana_sobras_por_ativo
)

# Verificar se todos os anos de 1994 a 2024 estão presentes
missing_years <- setdiff(anos, mediana_anual$ANO)
if (length(missing_years) > 0) {
  warning(paste("Anos faltando em total_dados_limpos:", paste(missing_years, collapse = ", ")))
  # Completar com NA para anos ausentes
  mediana_anual <- mediana_anual %>%
    right_join(data.frame(ANO = anos), by = "ANO") %>%
    arrange(ANO)
  lst_limpos$med_sobra_ativo <- mediana_anual$mediana_sobras_por_ativo
}

# Converter SOBRAS_POR_ATIVO para percentual, se necessário (exemplo: de 0.052 para 5.2)
# Comente a linha abaixo se os dados já estiverem em percentual
lst_limpos$med_sobra_ativo <- lst_limpos$med_sobra_ativo * 100

# Create plot_df combining ANO, med_sobra_ativo from lst_limpos, and selic_pct
plot_df <- data.frame(
  ANO = anos,
  med_sobra_ativo = lst_limpos$med_sobra_ativo,  # Sourcing from mediana_anual
  selic_pct = selic_values  # SELIC with 1994 and 1995 as NA
)

sf <- 1  # Scaling factor (ajuste conforme necessário)

# 1) Dados das linhas
df_lines <- plot_df %>%
  arrange(ANO) %>%
  mutate(selic_scaled = selic_pct * sf)  # Using selic_pct from plot_df

# 2) Dados do sombreado
df_shade <- df_lines %>%
  filter(!is.na(med_sobra_ativo), !is.na(selic_scaled)) %>%
  mutate(
    who_above = if_else(med_sobra_ativo >= selic_scaled, "Rentabilidade Real Positiva", "Rentabilidade Real Negativa"),
    run = cumsum(dplyr::lag(who_above, default = first(who_above)) != who_above),
    ymin = pmin(med_sobra_ativo, selic_scaled),
    ymax = pmax(med_sobra_ativo, selic_scaled)
  )

# 3) Dados para os rótulos diretos no final das linhas
df_labels <- df_lines %>%
  filter(ANO == max(ANO))

# 4) Dados para as anotações de eventos macroeconômicos
df_annotations <- tibble::tribble(
  ~ANO, ~y_label, ~label, ~curvature,
  1996, 25, "Plano Real:\nEstabilização \neconômica", -0.3,
  2002, 25, "Crise cambial", 0.3,
  2015, 25, "Recessão \neconômica", 0.3,
  2021, 25, "Recuperação \npós-COVID", 0.3
) %>%
  left_join(df_lines %>% select(ANO, selic_scaled), by = "ANO")

# --- Gráfico Final ---
cor_sobra <- "#005A9C"
cor_selic <- "#D4352C"
cor_fill_pos <- "#A8D5BA"
cor_fill_neg <- "#F5B2B0"

ggplot(data = df_lines, aes(x = ANO)) +
  # Camada de Sombreamento
  geom_ribbon(
    data = df_shade,
    aes(ymin = ymin, ymax = ymax, fill = who_above, group = run),
    alpha = 0.4
  ) +
  # Linha de referência no zero
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey50", linewidth = 0.6) +
  # Linhas principais
  geom_line(aes(y = med_sobra_ativo), color = cor_sobra, linewidth = 1.2, na.rm = TRUE) +
  geom_line(aes(y = selic_scaled), color = cor_selic, linewidth = 1.0, na.rm = TRUE) +
  # Pontos para marcar os anos
  geom_point(aes(y = med_sobra_ativo), color = cor_sobra, size = 1.5, na.rm = TRUE) +
  geom_point(aes(y = selic_scaled), color = cor_selic, size = 1.5, na.rm = TRUE) +
  # Rótulos diretos no final das linhas
  geom_richtext(
    data = df_labels,
    aes(y = med_sobra_ativo, label = glue::glue("<b style='color:{cor_sobra}'>ROA</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  geom_richtext(
    data = df_labels,
    aes(y = selic_scaled, label = glue::glue("<b style='color:{cor_selic}'>SELIC</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  # ANOTAÇÕES DE EVENTOS COM SETAS
  geom_text(
    data = df_annotations,
    aes(y = y_label, label = label),
    family = "roboto_condensed", size = 3.8, color = "grey20", lineheight = 0.9
  ) +
  geom_curve(
    data = df_annotations,
    aes(xend = ANO, y = y_label, yend = selic_scaled + 0.5, curvature = curvature),
    arrow = arrow(length = unit(0.06, "inches")),
    color = "grey40", linewidth = 0.4
  ) +
  # Escalas
  scale_y_continuous(
    name = "Mediana ROA",
    breaks = seq(floor(min(c(df_lines$med_sobra_ativo, df_lines$selic_scaled), na.rm = TRUE)),
                 ceiling(max(c(df_lines$med_sobra_ativo, df_lines$selic_scaled), na.rm = TRUE)),
                 by = 2),  # Linhas de grade a cada 2 unidades
    labels = scales::label_number(suffix = "%", accuracy = 1),
    sec.axis = sec_axis(
      ~. / sf,
      name = "SELIC Efetiva (% a.a.)",
      breaks = seq(floor(min(df_lines$selic_scaled, na.rm = TRUE) / sf),
                   ceiling(max(df_lines$selic_scaled, na.rm = TRUE) / sf),
                   by = 2),  # Linhas correspondentes no eixo secundário
      labels = scales::label_number(suffix = "%", accuracy = 1)
    )
  ) +
  scale_x_continuous(
    breaks = seq(1994, 2024, by = 2),
    expand = expansion(mult = c(0.01, 0.15))
  ) +
  scale_fill_manual(
    name = NULL,
    values = c("Rentabilidade Real Positiva" = cor_fill_pos, "Rentabilidade Real Negativa" = cor_fill_neg)
  ) +
  # Títulos e Tema
  labs(
    title = "Desempenho Real das Cooperativas de Crédito Frente à SELIC Efetiva",
    subtitle = "A área sombreada indica períodos de ganho <span style='color:#006400;'><b>real positivo</b></span> ou <span style='color:#C41E3A;'><b>real negativo</b></span>.",
    x = NULL
  ) +
  theme_minimal(base_family = "roboto_condensed", base_size = 14) +
  theme(
    legend.position = "none",
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 18, margin = margin(b = 5)),
    plot.subtitle = element_markdown(size = 12, color = "grey40", margin = margin(b = 15)),
    plot.caption = element_text(color = "grey50", hjust = 0, size = 9, margin = margin(t = 15)),
    axis.title.y = element_text(size = 11, face = "bold", color = cor_sobra),
    axis.title.y.right = element_text(size = 11, face = "bold", color = cor_selic),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.margin = margin(20, 20, 20, 20)
  )



###### GRAFICO ROA TEMPORAL

# Carregar bibliotecas necessárias
library(dplyr)
library(ggplot2)
library(scales)
library(showtext)

# --- Configuração de Fonte (Opcional) ---
font_add_google("Roboto Condensed", "roboto_condensed")
showtext_auto()

# --- 1. Preparar os dados ---
# Calcule a mediana anual a partir do seu dataframe histórico completo
# Substitua 'total_dados_limpos' pelo nome do seu dataframe
mediana_anual <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(
    mediana_roa = median(SOBRAS_POR_ATIVO, na.rm = TRUE)
  )

# --- 2. Criar o gráfico ---
cor_roa <- "#005A9C" # Azul para a linha do ROA

ggplot(mediana_anual, aes(x = ANO, y = mediana_roa)) +
  # Linha e pontos
  geom_line(color = cor_roa, linewidth = 1.2) +
  geom_point(color = cor_roa, size = 2.5) +
  
  # Linha de referência no zero
  geom_hline(yintercept = 0.01, linetype = "dashed", color = "grey50") +
  
  # Escalas
  scale_y_continuous(
    labels = scales::percent_format(accuracy = 0.1),
    breaks = seq(0.01, 0.08, by = 0.005) # Escala de 0% a 8%, com passos de 0.5%
  ) +
  scale_x_continuous(
    breaks = seq(1994, 2024, by = 2) # Marcadores de ano a cada 2 anos
  ) +
  
  # Títulos e Tema
  labs(
    title = "Evolução da Rentabilidade Mediana (ROA) do SNCC",
    subtitle = "Período de 1994 a 2024",
    x = "Ano",
    y = "ROA Mediano"
  ) +
  theme_minimal(base_family = "roboto_condensed", base_size = 14) +
  theme(
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(size = 12, color = "grey40", hjust = 0.5, margin = margin(b = 15)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.minor = element_blank(),
    plot.margin = margin(20, 20, 20, 20)
  )

################### NOVO NO PADRAO 13.10.25

# Carregar bibliotecas necessárias
library(dplyr)
library(ggplot2)
library(scales)
library(showtext)
library(ggtext)

# --- Configuração de Fonte ---
font_add_google("Roboto Condensed", "roboto_condensed")
showtext_auto()

# --- 1. Preparar os dados ---
# Calcule a mediana anual a partir do seu dataframe histórico completo
# Substitua 'total_dados_limpos' pelo nome do seu dataframe
mediana_anual <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(
    mediana_roa = median(SOBRAS_POR_ATIVO, na.rm = TRUE)
  )

# --- 2. Criar o gráfico ---
cor_roa <- "#005A9C" # Azul consistente com o padrão
cor_texto <- "#2C3E50"

ggplot(mediana_anual, aes(x = ANO, y = mediana_roa)) +
  # Linha e pontos
  geom_line(color = cor_roa, linewidth = 1.2) +
  geom_point(color = cor_roa, size = 2.5) +
  
  # Linha de referência no zero
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey50", linewidth = 0.6) +
  
  # Escalas
  scale_y_continuous(
    labels = scales::percent_format(accuracy = 0.1),
    breaks = seq(-0.02, 0.08, by = 0.01) # Escala mais ampla incluindo negativos
  ) +
  scale_x_continuous(
    breaks = seq(1994, 2024, by = 2), # Marcadores de ano a cada 2 anos
    expand = expansion(mult = c(0.01, 0.05))
  ) +
  
  # Títulos e Tema
  labs(
    title = "Evolução da Rentabilidade Mediana (ROA) do SNCC",
    subtitle = "Período de 1994 a 2024",
    x = NULL,
    y = "ROA Mediano"
  ) +
  theme_minimal(base_family = "roboto_condensed", base_size = 14) +
  theme(
    # Títulos - alinhamento à esquerda como padrão
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 18, margin = margin(b = 5)),
    plot.subtitle = element_text(size = 12, color = "grey40", margin = margin(b = 15)),
    plot.caption = element_text(color = "grey50", hjust = 0, size = 9, margin = margin(t = 15)),
    
    # Eixos
    axis.title.y = element_text(size = 11, face = "bold", color = cor_texto),
    axis.text.x = element_text(angle = 45, hjust = 1, color = "grey30"),
    axis.text.y = element_text(color = "grey30"),
    
    # Grid e fundo
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(color = "grey90", linewidth = 0.3),
    
    # Margens
    plot.margin = margin(20, 20, 20, 20)
  )




  ####GRAFICO COM TODOS INDICADORES
library(dplyr)
library(ggplot2)
library(scales)
library(ggtext)
library(showtext)
library(glue)

# --- Configuração de Fonte ---
font_add_google("Roboto Condensed", "roboto_condensed")
showtext_auto()

# --- Dados Atualizados ---
anos <- seq(1994, 2024, by = 1)

# IPCA values (1994 = NA, 1995 = 22.41%)
ipca_values <- c(
  NA, 22.41, 9.56, 5.22, 1.65, 8.94, 5.97, 7.67, 12.53, 9.30,  # 1994–2003 
  7.60, 5.69, 3.14, 4.46, 5.90, 4.31, 5.91, 6.50, 5.84, 5.91,  # 2004–2013
  6.41, 10.67, 6.29, 2.95, 3.75, 4.31, 4.52, 10.06, 5.79, 4.62, 4.83  # 2014–2024
)

# PIB values (ipeadata.xls)
pib_values <- c(
  5.33, 4.42, 2.21, 3.40, 0.34, 0.47, 4.39, 1.39, 3.05, 1.14,  # 1994–2003
  5.76, 3.20, 3.96, 6.07, 5.09, -0.13, 7.53, 3.97, 1.92, 3.01,  # 2004–2013
  0.50, -3.55, -3.28, 1.32, 1.78, 1.22, -3.28, 4.76, 3.02, 3.24, 3.40  # 2014–2024
)

# SELIC values (1994 e 1995 = NA)
selic_values <- c(
  NA, NA, 27.41, 24.77, 28.79, 25.59, 17.45, 17.32, 19.16, 23.33,  # 1994–2003
  16.24, 19.04, 15.08, 11.85, 12.48, 9.92, 9.78, 11.62, 8.48, 8.21,  # 2004–2013
  10.91, 13.29, 14.03, 9.96, 6.42, 5.95, 2.75, 4.44, 12.38, 13.03, 10.89  # 2014–2024
)

# --- Calcular mediana de SOBRAS_POR_ATIVO por ano ---
# Substitua 'total_dados_limpos' pelo seu data frame real
# Exemplo: total_dados_limpos <- data.frame(ANO = ..., SOBRAS_POR_ATIVO = ...)
#####mediana_anual <- total_dados_limpos %>%
mediana_anual <- df_Art3_5 %>%
  group_by(ANO) %>%
  summarise(
    mediana_sobras_por_ativo = median(ROA, na.rm = TRUE)
  ) %>%
  arrange(ANO) # Garante que a tabela esteja ordenada por ano

# Criar lst_limpos com os valores reais
lst_limpos <- list(
  med_sobras_ativo = mediana_anual$mediana_sobras_por_ativo
)

# Verificar se todos os anos de 1994 a 2024 estão presentes
missing_years <- setdiff(anos, mediana_anual$ANO)
if (length(missing_years) > 0) {
  warning(paste("Anos faltando em total_dados_limpos:", paste(missing_years, collapse = ", ")))
  mediana_anual <- mediana_anual %>%
    right_join(data.frame(ANO = anos), by = "ANO") %>%
    arrange(ANO)
  lst_limpos$med_sobras_ativo <- mediana_anual$mediana_sobras_por_ativo
}

# Converter SOBRAS_POR_ATIVO para percentual, se necessário (exemplo: de 0.052 para 5.2)
# Comente a linha abaixo se os dados já estiverem em percentual
lst_limpos$med_sobras_ativo <- lst_limpos$med_sobras_ativo * 100

# Create plot_df combining ANO, med_sobras_ativo, ipca_pct, pib_pct, and selic_pct
plot_df <- data.frame(
  ANO = anos,
  med_sobras_ativo = lst_limpos$med_sobras_ativo,
  ipca_pct = ipca_values,
  pib_pct = pib_values,
  selic_pct = selic_values
)

sf <- 1  # Scaling factor (ajuste conforme necessário)

# 1) Dados das linhas
df_lines <- plot_df %>%
  arrange(ANO) %>%
  mutate(
    ipca_scaled = ipca_pct * sf,
    pib_scaled = pib_pct * sf,
    selic_scaled = selic_pct * sf
  )

# 2) Dados para os rótulos diretos no final das linhas
df_labels <- df_lines %>%
  filter(ANO == max(ANO))

# 3) Dados para as anotações de eventos macroeconômicos
df_annotations <- tibble::tribble(
  ~ANO, ~y_label, ~label, ~curvature,
  1996, 25, "Plano Real:\nEstabilização", -0.3,
  2002, 25, "Crise Cambial", 0.3,
  2015, 25, "Recessão Econômica", 0.3,
  2021, 25, "Recuperação pós-COVID", 0.3
) %>%
  left_join(df_lines %>% select(ANO, selic_scaled), by = "ANO")

# --- Gráfico Final ---
cor_sobra <- "#005A9C"  # Azul escuro para destaque
cor_ipca <- "#D4352C"   # Vermelho
cor_pib <- "#006400"    # Verde escuro
cor_selic <- "#6A1B9A"  # Roxo

ggplot(data = df_lines, aes(x = ANO)) +
  # Linha de referência no zero
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey50", linewidth = 0.6) +
  # Linhas principais
  geom_line(aes(y = med_sobra_ativo, color = "Sobra/Ativo"), linetype = "dashed", linewidth = 2, na.rm = TRUE) +  # Linha tracejada com destaque
  geom_line(aes(y = ipca_scaled, color = "IPCA"), linewidth = 1, na.rm = TRUE) +
  geom_line(aes(y = pib_scaled, color = "PIB"), linewidth = 1, na.rm = TRUE) +
  geom_line(aes(y = selic_scaled, color = "SELIC"), linewidth = 1, na.rm = TRUE) +
  # Pontos para marcar os anos
  geom_point(aes(y = med_sobra_ativo, color = "Sobra/Ativo"), size = 2, na.rm = TRUE) +
  geom_point(aes(y = ipca_scaled, color = "IPCA"), size = 1.5, na.rm = TRUE) +
  geom_point(aes(y = pib_scaled, color = "PIB"), size = 1.5, na.rm = TRUE) +
  geom_point(aes(y = selic_scaled, color = "SELIC"), size = 1.5, na.rm = TRUE) +
  # Rótulos diretos no final das linhas
  geom_richtext(
    data = df_labels,
    aes(y = med_sobra_ativo, label = glue::glue("<b style='color:{cor_sobra}'>Sobra/Ativo</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4.5,
    fill = NA, label.color = NA
  ) +
  geom_richtext(
    data = df_labels,
    aes(y = ipca_scaled, label = glue::glue("<b style='color:{cor_ipca}'>IPCA</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  geom_richtext(
    data = df_labels,
    aes(y = pib_scaled, label = glue::glue("<b style='color:{cor_pib}'>PIB</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  geom_richtext(
    data = df_labels,
    aes(y = selic_scaled, label = glue::glue("<b style='color:{cor_selic}'>SELIC</b>")),
    nudge_x = 0.5, hjust = 0, family = "roboto_condensed", size = 4,
    fill = NA, label.color = NA
  ) +
  # ANOTAÇÕES DE EVENTOS COM SETAS
  geom_text(
    data = df_annotations,
    aes(y = y_label, label = label),
    family = "roboto_condensed", size = 3.8, color = "grey20", lineheight = 0.9
  ) +
  geom_curve(
    data = df_annotations,
    aes(xend = ANO, y = y_label, yend = selic_scaled + 0.5, curvature = curvature),
    arrow = arrow(length = unit(0.06, "inches")),
    color = "grey40", linewidth = 0.4
  ) +
  # Escalas
  scale_y_continuous(
    name = NULL,
    breaks = seq(floor(min(c(df_lines$med_sobra_ativo, df_lines$ipca_scaled, df_lines$pib_scaled, df_lines$selic_scaled), na.rm = TRUE)),
                 ceiling(max(c(df_lines$med_sobra_ativo, df_lines$ipca_scaled, df_lines$pib_scaled, df_lines$selic_scaled), na.rm = TRUE)),
                 by = 2),  # Linhas de grade a cada 2 unidades
    labels = scales::label_number(suffix = "%", accuracy = 1),
    sec.axis = sec_axis(
      ~. / sf,
      name = NULL,
      breaks = seq(floor(min(c(df_lines$ipca_scaled, df_lines$pib_scaled, df_lines$selic_scaled), na.rm = TRUE) / sf),
                   ceiling(max(c(df_lines$ipca_scaled, df_lines$pib_scaled, df_lines$selic_scaled), na.rm = TRUE) / sf),
                   by = 2),
      labels = scales::label_number(suffix = "%", accuracy = 1)
    )
  ) +
  scale_x_continuous(
    breaks = seq(1994, 2024, by = 2),
    expand = expansion(mult = c(0.01, 0.15))
  ) +
  scale_color_manual(
    name = NULL,
    values = c("Sobra/Ativo" = cor_sobra, "IPCA" = cor_ipca, "PIB" = cor_pib, "SELIC" = cor_selic),
    labels = c("Mediana Sobra/Ativo", "IPCA", "PIB", "SELIC")
  ) +
  # Títulos e Tema
  labs(
    title = "Desempenho das Cooperativas de Crédito: 1994–2024",
    subtitle = "Comparativo da rentabilidade mediana (Sobra/Ativo) com IPCA, PIB e SELIC anual.",
    x = NULL,
    caption = "Fonte: Elaboração própria com dados do Banco Central do Brasil e FMI/WEO. Nota: IPCA de 1994 (916.46%) e SELIC de 1994 (1153.60%) e 1995 (53.08%) excluídos devido a valores extremos."
  ) +
  theme_minimal(base_family = "roboto_condensed", base_size = 14) +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    legend.text = element_text(size = 10),
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 20, margin = margin(b = 5)),
    plot.subtitle = element_markdown(size = 14, color = "grey40", margin = margin(b = 15)),
    plot.caption = element_text(color = "grey50", hjust = 0, size = 9, margin = margin(t = 15)),
    axis.title.y = element_text(size = 11, face = "bold", color = cor_sobra),
    axis.title.y.right = element_text(size = 11, face = "bold", color = "grey20"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.margin = margin(20, 20, 20, 20)
  )



####DIA 13.10.25

# Instalar e carregar as bibliotecas necessárias
# Se você ainda não as tiver instalado, remova o '#' da linha abaixo e execute.
# install.packages(c("dplyr", "ggplot2", "scales"))

library(dplyr)
library(ggplot2)
library(scales)

# 1. Preparar os dados
# Agrupar o dataframe por ano e calcular a mediana do ROA para cada ano.
roa_temporal <- df_Art3_5 %>%
  group_by(ANO) %>%
  summarise(ROA_mediano = median(ROA, na.rm = TRUE)) # na.rm = TRUE remove valores NA do cálculo

# 2. Criar o gráfico
# --- CÓDIGO DO GRÁFICO AJUSTADO ---
ggplot(roa_temporal, aes(x = ANO, y = ROA_mediano)) +
  geom_line(color = "#0072B2", linewidth = 1) +
  geom_point(color = "#0072B2", size = 2) +
  
  # --- LINHA MODIFICADA ---
  # Adicionamos 'breaks = seq(0, 0.04, by = 0.002)' para criar a escala de 0,2% em 0,2%
  scale_y_continuous(
    labels = scales::percent_format(accuracy = 0.1), 
    breaks = seq(0, 0.04, by = 0.002) # Define os marcadores: 0%, 0.2%, 0.4%, etc.
  ) +
  
  scale_x_continuous(breaks = seq(min(roa_temporal$ANO), max(roa_temporal$ANO), by = 2)) +
  labs(
    title = "Evolução da Rentabilidade Mediana (ROA) do SNCC",
    subtitle = "Período de 1994 a 2024",
    x = "Ano",
    y = "ROA Mediano"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

###REXECUTANDO REGRACAO PARA O ARTIGO 1
# --- 1. Definição dos Vetores de Dados ---

# --- PARTE 1: CÁLCULO DA MEDIANA ANUAL A PARTIR DOS SEUS DADOS ---

# Certifique-se de que o pacote dplyr está instalado e carregado
# install.packages("dplyr") # Execute esta linha se você não tiver o pacote
library(dplyr)

# Este passo assume que seu dataframe 'total_dados_limpos' já está carregado no R
# com as colunas 'ANO' e 'SOBRAS_POR_ATIVO'.

# Agrupa os dados por ano e calcula a mediana para cada ano
mediana_sobra_anual <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(Mediana_Sobra = median(SOBRAS_POR_ATIVO, na.rm = TRUE)) %>%
  ungroup() # Desagrupa para o dataframe voltar ao normal

print("Série Histórica da Mediana das Sobras calculada com sucesso:")
print(mediana_sobra_anual)


# --- PARTE 2: PREPARAÇÃO DO DATAFRAME COMPLETO PARA ANÁLISE ---

# Definição dos vetores macroeconômicos (1994-2024)
anos <- 1994:2024

ipca_values <- c(
  NA, 22.41, 9.56, 5.22, 1.65, 8.94, 5.97, 7.67, 12.53, 9.30,
  7.60, 5.69, 3.14, 4.46, 5.90, 4.31, 5.91, 6.50, 5.84, 5.91,
  6.41, 10.67, 6.29, 2.95, 3.75, 4.31, 4.52, 10.06, 5.79, 4.62, 4.83
)

pib_values <- c(
  5.33, 4.42, 2.21, 3.40, 0.34, 0.47, 4.39, 1.39, 3.05, 1.14,
  5.76, 3.20, 3.96, 6.07, 5.09, -0.13, 7.53, 3.97, 1.92, 3.01,
  0.50, -3.55, -3.28, 1.32, 1.78, 1.22, -3.28, 4.76, 3.02, 3.24, 3.40
)

selic_values <- c(
  NA, NA, 27.41, 24.77, 28.79, 25.59, 17.45, 17.32, 19.16, 23.33,
  16.24, 19.04, 15.08, 11.85, 12.48, 9.92, 9.78, 11.62, 8.48, 8.21,
  10.91, 13.29, 14.03, 9.96, 6.42, 5.95, 2.75, 4.44, 12.38, 13.03, 10.89
)

# Cria um dataframe com os dados macroeconômicos
dados_macro <- data.frame(
  ANO = anos,
  IPCA = ipca_values,
  PIB = pib_values,
  SELIC = selic_values
)

# Une a mediana calculada com os dados macroeconômicos
# A função 'left_join' une os dois dataframes pela coluna 'ANO'
dados_completos <- left_join(mediana_sobra_anual, dados_macro, by = "ANO")

# Remove linhas onde qualquer um dos valores seja NA (importante para a regressão)
dados_finais_para_regressao <- na.omit(dados_completos)

print("Dados finais que serão utilizados no modelo de regressão:")
print(dados_finais_para_regressao)


# --- PARTE 3: EXECUÇÃO DO MODELO DE REGRESSÃO E ANÁLISE DOS RESULTADOS ---

# Cria o modelo de regressão linear múltipla
modelo_final <- lm(Mediana_Sobra ~ IPCA + PIB + SELIC, data = dados_finais_para_regressao)

# Exibe o sumário completo com os resultados detalhados
resultados_finais <- summary(modelo_final)

print("--- RESULTADOS FINAIS DA REGRESSÃO LINEAR MÚLTIPLA ---")
print(resultados_finais)

view(total_dados_limpos)

###REGRESSAO POR PORTE
#####################################

# --- PARTE 1: PREPARAÇÃO E CLASSIFICAÇÃO DOS DADOS POR PORTE ---

# Certifique-se de que o pacote dplyr está instalado e carregado
# install.packages("dplyr") # Execute esta linha se você não tiver o pacote
library(dplyr)

# Este passo assume que seu dataframe 'total_dados_limpos' já está carregado
# com as colunas 'ANO', 'SOBRAS_POR_ATIVO', e 'ATIVOS_VERDADEIROS'.

# Calcula os limites (tercis) para cada ano
limites_anuais <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(
    limite_pequena = quantile(ATIVOS_VERDADEIROS, probs = 0.33, na.rm = TRUE),
    limite_media = quantile(ATIVOS_VERDADEIROS, probs = 0.66, na.rm = TRUE)
  )

# Une os limites anuais de volta ao dataframe principal
total_dados_com_limites <- left_join(total_dados_limpos, limites_anuais, by = "ANO")

# Classifica cada cooperativa em 'Pequena', 'Média' ou 'Grande' para cada ano
total_dados_classificados <- total_dados_com_limites %>%
  mutate(PORTE = case_when(
    ATIVOS_VERDADEIROS <= limite_pequena ~ "Pequena",
    ATIVOS_VERDADEIROS > limite_pequena & ATIVOS_VERDADEIROS <= limite_media ~ "Média",
    ATIVOS_VERDADEIROS > limite_media ~ "Grande"
  ))


# --- PARTE 2: CÁLCULO DAS MEDIANAS ANUAIS PARA CADA SEGMENTO ---

# Calcula a mediana da rentabilidade para cada porte, para cada ano
mediana_por_porte <- total_dados_classificados %>%
  group_by(ANO, PORTE) %>%
  summarise(Mediana_Sobra = median(SOBRAS_POR_ATIVO, na.rm = TRUE)) %>%
  ungroup()

print("Série Histórica da Mediana das Sobras por Porte:")
print(mediana_por_porte)


# --- PARTE 3: PREPARAÇÃO DOS DADOS MACRO E EXECUÇÃO DAS REGRESSÕES ---

# Definição dos vetores macroeconômicos (1994-2024) que já tínhamos
anos <- 1994:2024
ipca_values <- c(NA, 22.41, 9.56, 5.22, 1.65, 8.94, 5.97, 7.67, 12.53, 9.30, 7.60, 5.69, 3.14, 4.46, 5.90, 4.31, 5.91, 6.50, 5.84, 5.91, 6.41, 10.67, 6.29, 2.95, 3.75, 4.31, 4.52, 10.06, 5.79, 4.62, 4.83)
pib_values <- c(5.33, 4.42, 2.21, 3.40, 0.34, 0.47, 4.39, 1.39, 3.05, 1.14, 5.76, 3.20, 3.96, 6.07, 5.09, -0.13, 7.53, 3.97, 1.92, 3.01, 0.50, -3.55, -3.28, 1.32, 1.78, 1.22, -3.28, 4.76, 3.02, 3.24, 3.40)
selic_values <- c(NA, NA, 27.41, 24.77, 28.79, 25.59, 17.45, 17.32, 19.16, 23.33, 16.24, 19.04, 15.08, 11.85, 12.48, 9.92, 9.78, 11.62, 8.48, 8.21, 10.91, 13.29, 14.03, 9.96, 6.42, 5.95, 2.75, 4.44, 12.38, 13.03, 10.89)

dados_macro <- data.frame(ANO = anos, IPCA = ipca_values, PIB = pib_values, SELIC = selic_values)

# Une os dados macroeconômicos com as medianas por porte
dados_completos_segmentados <- left_join(mediana_por_porte, dados_macro, by = "ANO")

# --- Execução dos modelos para cada porte ---

# Modelo para Cooperativas PEQUENAS
dados_pequenas <- na.omit(filter(dados_completos_segmentados, PORTE == "Pequena"))
modelo_pequenas <- lm(Mediana_Sobra ~ IPCA + PIB + SELIC, data = dados_pequenas)

# Modelo para Cooperativas MÉDIAS
dados_medias <- na.omit(filter(dados_completos_segmentados, PORTE == "Média"))
modelo_medias <- lm(Mediana_Sobra ~ IPCA + PIB + SELIC, data = dados_medias)

# Modelo para Cooperativas GRANDES
dados_grandes <- na.omit(filter(dados_completos_segmentados, PORTE == "Grande"))
modelo_grandes <- lm(Mediana_Sobra ~ IPCA + PIB + SELIC, data = dados_grandes)


# --- PARTE 4: ANÁLISE COMPARATIVA DOS RESULTADOS ---

print("--- RESULTADO DA REGRESSÃO PARA COOPERATIVAS PEQUENAS ---")
summary(modelo_pequenas)

print("--- RESULTADO DA REGRESSÃO PARA COOPERATIVAS MÉDIAS ---")
summary(modelo_medias)

print("--- RESULTADO DA REGRESSÃO PARA COOPERATIVAS GRANDES ---")
summary(modelo_grandes)

# (Opcional) Para uma visualização profissional em tabela, use o pacote 'modelsummary'
# install.packages("modelsummary")
# library(modelsummary)
# # modelsummary(list("Pequenas" = modelo_pequenas, "Médias" = modelo_medias, "Grandes" = modelo_grandes), stars = TRUE)

###NOVA SUBSECAO ARTIGO 1
##############################
# --- PARTE 1: CLASSIFICAÇÃO (sem alterações) ---

library(dplyr)

mediana_rentabilidade_anual <- total_dados_limpos %>%
  group_by(ANO) %>%
  summarise(Mediana_Ano = median(SOBRAS_POR_ATIVO, na.rm = TRUE))

total_dados_com_mediana <- left_join(total_dados_limpos, mediana_rentabilidade_anual, by = "ANO")

total_dados_performance <- total_dados_com_mediana %>%
  mutate(PERFORMANCE = ifelse(SOBRAS_POR_ATIVO >= Mediana_Ano, 
                              "Acima da Mediana", 
                              "Abaixo da Mediana"))


# --- PARTE 2: ANÁLISE DE PERFIL CORRIGIDA ---

# CORREÇÃO 1: Remover as linhas onde a performance não pôde ser calculada (NA)
total_dados_performance_filtrado <- total_dados_performance %>%
  filter(!is.na(PERFORMANCE))

# CORREÇÃO 2: Usar median() em vez de mean() para o porte
perfil_por_performance_corrigido <- total_dados_performance_filtrado %>%
  group_by(ANO, PERFORMANCE) %>%
  summarise(
    Numero_de_Coops = n(),
    Porte_MEDIANO_Ativos = median(ATIVOS_VERDADEIROS, na.rm = TRUE) # MUDANÇA PRINCIPAL AQUI
  ) %>%
  ungroup()

print("--- Análise de Perfil CORRIGIDA: Porte MEDIANO (Ativos) por Grupo de Performance ---")
print(as.data.frame(perfil_por_performance_corrigido))


###GRAFICO
# install.packages("ggplot2") # Execute se necessário
# install.packages("scales")    # Para formatar os números no eixo y
library(ggplot2)
library(scales)

ggplot(perfil_por_performance_corrigido, aes(x = ANO, y = Porte_MEDIANO_Ativos, color = PERFORMANCE, group = PERFORMANCE)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 2.5) +
  
  # --- LINHA CORRIGIDA AQUI ---
  scale_y_continuous(labels = label_number(accuracy = 0.1, scale_cut = cut_si(""))) + 
  
  labs(
    title = "Evolução do Porte Mediano por Grupo de Performance (1994-2024)",
    subtitle = "Comparação do porte mediano (ativos) de cooperativas com rentabilidade acima e abaixo da mediana anual",
    x = "Ano",
    y = "Porte Mediano dos Ativos (R$)",
    color = "Grupo de Performance"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom",
        plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(size = 12))




# --- CÓDIGO PARA O GRÁFICO DE PERCENTUAL DE COOPERATIVAS COM RESULTADO NEGATIVO ---

# Certifique-se de que os pacotes necessários estão carregados
library(dplyr)
library(ggplot2)
library(scales) # Para formatar o eixo Y como porcentagem

# Este código assume que 'total_dados_limpos' já está carregado no R

# 1. Calcular o total de cooperativas e o número com resultado negativo para cada ano
dados_saude_sistema <- total_dados_limpos %>%
  filter(!is.na(SOBRAS_POR_ATIVO)) %>%
  group_by(ANO) %>%
  summarise(
    Total_Coops = n(),
    Coops_Resultado_Negativo = sum(SOBRAS_POR_ATIVO < 0, na.rm = TRUE)
  ) %>%
  mutate(
    Percentual_Negativo = (Coops_Resultado_Negativo / Total_Coops)
  ) %>%
  ungroup()

print("Tabela de suporte para o gráfico:")
print(dados_saude_sistema)

# 2. Gerar o gráfico de barras
ggplot(dados_saude_sistema, aes(x = ANO, y = Percentual_Negativo)) +
  geom_col(fill = "#D55E00", width = 0.7) + # geom_col é um atalho para geom_bar(stat="identity")
  
  # Adiciona os rótulos de porcentagem em cima de cada barra
  geom_text(aes(label = paste0(sprintf("%.1f", Percentual_Negativo * 100), "%")), 
            vjust = -0.5, size = 3.5, fontface = "bold") +
  
  # Formata o eixo Y para mostrar porcentagens
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  scale_x_continuous(breaks = seq(min(dados_saude_sistema$ANO), max(dados_saude_sistema$ANO), by = 2)) +
  
  labs(
    title = "Evolução Temporal dos Resultados Negativos SNCC",
    subtitle = "Percentual de cooperativas com ROA negativa por ano",
    x = "Ano",
    y = "Percentual de Cooperativas com Resultado Negativo"
  ) +
  theme_minimal(base_size = 14) +
  # Adiciona um pouco de espaço no topo para os rótulos
  expand_limits(y = max(dados_saude_sistema$Percentual_Negativo) * 1.15)



#####NOVO GRADICO RESULTADOS NEGATIVOS 13.10.25

library(dplyr)
library(ggplot2)
library(scales)

# 1. Calcular o total de cooperativas e o número com resultado negativo para cada ano
dados_saude_sistema <- total_dados_limpos %>%
  filter(!is.na(SOBRAS_POR_ATIVO)) %>%
  group_by(ANO) %>%
  summarise(
    Total_Coops = n(),
    Coops_Resultado_Negativo = sum(SOBRAS_POR_ATIVO < 0, na.rm = TRUE)
  ) %>%
  mutate(
    Percentual_Negativo = (Coops_Resultado_Negativo / Total_Coops)
  ) %>%
  ungroup()

# 2. Gerar o gráfico com design aprimorado
ggplot(dados_saude_sistema, aes(x = ANO, y = Percentual_Negativo)) +
  geom_col(fill = "#1f77b4", alpha = 0.9, width = 0.7) +
  
  # Valores nas barras - rotacionados
  geom_text(aes(label = paste0(sprintf("%.1f", Percentual_Negativo * 100), "%")), 
            angle = 90, hjust = -0.1, size = 3.0, 
            color = "#2C3E50", fontface = "plain") +
  
  # Formatação dos eixos
  scale_y_continuous(
    labels = percent_format(accuracy = 1),
    expand = expansion(mult = c(0, 0.15))
  ) +
  scale_x_continuous(
    breaks = seq(min(dados_saude_sistema$ANO), max(dados_saude_sistema$ANO), by = 2)
  ) +
  
  # Títulos e labels
  labs(
    title = "Evolução Temporal dos Resultados Negativos no SNCC",
    subtitle = "Percentual de cooperativas com ROA negativa por ano de exercício",
    x = NULL,
    y = "Percentual de Cooperativas com Resultado Negativo",
    caption = "Fonte: Dados do Sistema Nacional de Crédito Cooperativo"
  ) +
  
  # TEMA AJUSTADO - apenas fonte, cores e espaçamento
  theme_minimal(base_size = 12) +
  theme(
    # TIPOGRAFIA - fontes mais clean como na imagem
    text = element_text(family = "sans", color = "#333333"),
    plot.title = element_text(face = "bold", size = 14, hjust = 0, 
                              margin = margin(b = 8)),
    plot.subtitle = element_text(size = 11, color = "#666666", hjust = 0,
                                 margin = margin(b = 15)),
    plot.caption = element_text(color = "#999999", size = 9, hjust = 1),
    
    # CORES DOS EIXOS
    axis.text.x = element_text(angle = 45, hjust = 1, color = "#555555", size = 10),
    axis.text.y = element_text(color = "#555555", size = 10),
    axis.title.y = element_text(color = "#555555", size = 11,
                                margin = margin(r = 10)),
    
    # ESPAÇAMENTO
    plot.margin = margin(15, 15, 15, 15),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(color = "#f0f0f0", linewidth = 0.4),
    panel.grid.minor.y = element_blank()
  )



################################################# NOVO TESTE
library(dplyr)
library(ggplot2)
library(scales)
library(ggtext)
library(showtext)
library(glue)

# --- Configuração de Fonte ---
font_add_google("Roboto Condensed", "roboto_condensed")
showtext_auto()

# 1. Calcular o total de cooperativas e o número com resultado negativo para cada ano
dados_saude_sistema <- total_dados_limpos %>%
  filter(!is.na(SOBRAS_POR_ATIVO)) %>%
  group_by(ANO) %>%
  summarise(
    Total_Coops = n(),
    Coops_Resultado_Negativo = sum(SOBRAS_POR_ATIVO < 0, na.rm = TRUE)
  ) %>%
  mutate(
    Percentual_Negativo = (Coops_Resultado_Negativo / Total_Coops)
  ) %>%
  ungroup()

# --- Cores e parâmetros consistentes com o outro gráfico ---
cor_principal <- "#005A9C"  # Azul consistente
cor_texto <- "#2C3E50"

# --- Gráfico Final com Layout Padronizado ---
ggplot(dados_saude_sistema, aes(x = ANO, y = Percentual_Negativo)) +
  # Barras
  geom_col(fill = cor_principal, alpha = 0.9, width = 0.7) +
  
  # Valores nas barras - rotacionados
  geom_text(aes(label = paste0(sprintf("%.1f", Percentual_Negativo * 100), "%")), 
            angle = 90, hjust = -0.1, size = 3.5, 
            color = cor_texto, family = "roboto_condensed") +
  
  # Formatação dos eixos
  scale_y_continuous(
    labels = percent_format(accuracy = 1),
    expand = expansion(mult = c(0, 0.15))
  ) +
  scale_x_continuous(
    breaks = seq(min(dados_saude_sistema$ANO), max(dados_saude_sistema$ANO), by = 2)
  ) +
  
  # Títulos e labels - estilo consistente
  labs(
    title = "Evolução Temporal dos Resultados Negativos no SNCC",
    subtitle = "Percentual de cooperativas com ROA negativa por ano de exercício",
    x = NULL,
    y = "Percentual de Cooperativas com Resultado Negativo"
    ) +
  
  # TEMA PADRONIZADO - mesmo do gráfico SOBRAS-SELIC
  theme_minimal(base_family = "roboto_condensed", base_size = 14) +
  theme(
    # Títulos
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 18, margin = margin(b = 5)),
    plot.subtitle = element_text(size = 12, color = "grey40", margin = margin(b = 15)),
    plot.caption = element_text(color = "grey50", hjust = 0, size = 9, margin = margin(t = 15)),
    
    # Eixos
    axis.title.y = element_text(size = 11, face = "bold", color = cor_texto),
    axis.text.x = element_text(angle = 45, hjust = 1, color = "grey30"),
    axis.text.y = element_text(color = "grey30"),
    
    # Grid e fundo
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(color = "grey90", linewidth = 0.3),
    
    # Margens
    plot.margin = margin(20, 20, 20, 20)
  )


######

# --- PARTE 1: PREPARAÇÃO DOS DADOS ---

# Certifique-se de que os pacotes necessários estão carregados
# --- CÓDIGO COMPLETO (CENÁRIO A) ---

# Certifique-se de que os pacotes necessários estão carregados
# --- CÓDIGO COMPLETO E FINAL PARA ANÁLISE REGIONAL ---

# Certifique-se de que os pacotes necessários estão carregados
# install.packages("dplyr")
# install.packages("tidyr")
# --- PARTE 1: PREPARAÇÃO E JUNÇÃO DOS DADOS (ORDEM CORRETA) ---

# Certifique-se de que os pacotes necessários estão carregados
# --- PARTE 1: PREPARAÇÃO E JUNÇÃO DOS DATAFRAMES CORRETOS ---

# Certifique-se de que os pacotes necessários estão carregados
library(dplyr)
library(tidyr)

# Para evitar colunas duplicadas e manter a junção limpa, 
# vamos selecionar apenas as colunas que precisamos de 'resultado_combinado'
# (Assumindo que a coluna de CNPJ aqui também se chama 'CNPJ_COMPLETO')
dados_de_localizacao_essenciais <- resultado_combinado %>%
  select(CNPJ, UF) %>%
  distinct() # distinct() garante que temos apenas uma linha por CNPJ


total_dados_limpos <- total_dados_limpos %>% 
  mutate(CNPJ = as.character(CNPJ))

resultado_combinado <- resultado_combinado %>% 
  mutate(CNPJ = as.character(CNPJ))

# 1. JUNTAR os dados financeiros com os dados de localização
# O dataframe principal agora terá a coluna 'UF'
dados_completos <- left_join(total_dados_limpos, dados_de_localizacao_essenciais, by = "CNPJ")

# 2. AGORA, com a coluna 'UF' presente, CRIAR a coluna 'Regiao'
mapa_regiao <- c(
  "AC" = "Norte", "AP" = "Norte", "AM" = "Norte", "PA" = "Norte", "RO" = "Norte", "RR" = "Norte", "TO" = "Norte",
  "AL" = "Nordeste", "BA" = "Nordeste", "CE" = "Nordeste", "MA" = "Nordeste", "PB" = "Nordeste", "PE" = "Nordeste", "PI" = "Nordeste", "RN" = "Nordeste", "SE" = "Nordeste",
  "DF" = "Centro-Oeste", "GO" = "Centro-Oeste", "MT" = "Centro-Oeste", "MS" = "Centro-Oeste",
  "ES" = "Sudeste", "MG" = "Sudeste", "RJ" = "Sudeste", "SP" = "Sudeste",
  "PR" = "Sul", "RS" = "Sul", "SC" = "Sul"
)

dados_completos <- dados_completos %>%
  mutate(Regiao = recode(UF, !!!mapa_regiao))


# --- PARTE 2: ANÁLISE REGIONAL ---

# 1. Calcular a mediana anual e identificar as cooperativas abaixo dela
coops_abaixo_mediana <- dados_completos %>%
  filter(!is.na(SOBRAS_POR_ATIVO) & !is.na(Regiao)) %>%
  group_by(ANO) %>%
  mutate(Mediana_Ano = median(SOBRAS_POR_ATIVO, na.rm = TRUE)) %>%
  ungroup() %>%
  filter(SOBRAS_POR_ATIVO < Mediana_Ano)

# 2. Contar o número de cooperativas de baixa performance por ano e região
resultado_regional <- coops_abaixo_mediana %>%
  group_by(ANO, Regiao) %>%
  summarise(Numero_Coops_Abaixo_Mediana = n(), .groups = 'drop')

# 3. Reformatar a tabela para melhor visualização
resultado_formatado <- resultado_regional %>%
  pivot_wider(names_from = Regiao, values_from = Numero_Coops_Abaixo_Mediana, values_fill = 0) %>%
  arrange(ANO)

print("--- Tabela Final: Número de Cooperativas com ROA Abaixo da Mediana por Ano e Região ---")
print(resultado_formatado)


####PREPARACAO DOS DECIS

# --- CÓDIGO PARA CRIAR O INSTRUMENTO DE BENCHMARK POR DECIL ---

# --- CÓDIGO PARA CRIAR O INSTRUMENTO DE BENCHMARK POR DECIL (2019-2024) ---

exists("total_dados_limpos")
View(total_dados_limpos)
library(dplyr)
library(knitr) # Para formatar a tabela

# Este código assume que 'total_dados_limpos' está carregado

# 1. Filtrar para o período de interesse e classificar cada cooperativa em um decil DENTRO DE CADA ANO
instrumento_multianual <- total_dados_limpos %>%
  filter(ANO >= 2019 & ANO <= 2024) %>%
  filter(!is.na(SOBRAS_POR_ATIVO)) %>%
  # Agrupar por ano é o passo crucial aqui.
  # O ntile() será calculado separadamente para cada ano.
  group_by(ANO) %>%
  mutate(DECIL = ntile(SOBRAS_POR_ATIVO, 10)) %>%
  ungroup() # Desagrupamos para o próximo passo

# 2. Agora, agrupar por ano e por decil para calcular as estatísticas de cada grupo
tabela_final_multianual <- instrumento_multianual %>%
  group_by(ANO, DECIL) %>%
  summarise(
    ROA_Minimo = min(SOBRAS_POR_ATIVO) * 100,
    ROA_Maximo = max(SOBRAS_POR_ATIVO) * 100,
    ROA_Mediano_do_Decil = median(SOBRAS_POR_ATIVO) * 100,
    .groups = 'drop' # Boa prática para remover o agrupamento ao final
  ) %>%
  arrange(ANO, DECIL) # Ordena a tabela para fácil visualização

# 3. Exibir a tabela final formatada
print("--- Instrumento: Tabela-Referência de Performance por Decil (ROA em %) para 2019-2024 ---")

kable(tabela_final_multianual, 
      digits = 2,
      caption = "Benchmark de Rentabilidade (ROA em %) por Decis - 2019 a 2024")






############## NOVO DECIS COM REGIOES 13.10.25
library(dplyr)

# 1. Selecionar o registro mais recente por CNPJ em df_final2
# Assumindo que df_final2 tem colunas como CNPJ, ANO, Cod_Munic, Cod_Reg_Imediata, Cod_Reg_Intermed
df_final2_recent <- df_final2 %>%
  # Converter CNPJ para character, se necessário (para compatibilidade)
  mutate(CNPJ = as.character(CNPJ)) %>%
  # Agrupar por CNPJ e selecionar o ano mais recente
  group_by(CNPJ) %>%
  slice_max(ANO, n = 1, with_ties = FALSE) %>%  # Pega o ANO máximo; se empate, pega o primeiro
  ungroup() %>%
  # Selecionar apenas as colunas de localização + CNPJ
  select(CNPJ, Cod_Munic, Cod_Reg_Imediata, Cod_Reg_Intermed)

# 2. Juntar com total_dados_limpos (left join: mantém todas as linhas de total_dados_limpos)
# Assumindo que total_dados_limpos tem CNPJ, ANO, SOBRAS_POR_ATIVO, etc.
dados_combinados <- total_dados_limpos %>%
  # Converter CNPJ para character, se necessário
  mutate(CNPJ = as.character(CNPJ)) %>%
  left_join(df_final2_recent, by = "CNPJ")

# 3. Verificar o resultado
print("=== Head dos Dados Combinados ===")
head(dados_combinados)

print("=== Colunas dos Dados Combinados ===")
colnames(dados_combinados)

# Agora, dados_combinados tem todas as colunas de total_dados_limpos + as de localização do ano mais recente de df_final2
library(dplyr)

# 1. Calcular os decís por ano, mantendo as colunas de localização
instrumento_multianual <- dados_combinados %>%
  filter(ANO >= 2019 & ANO <= 2024) %>%
  filter(!is.na(SOBRAS_POR_ATIVO)) %>%
  group_by(ANO) %>%
  mutate(DECIL = ntile(SOBRAS_POR_ATIVO, 10)) %>%
  ungroup()

# 2. Verificar o resultado
print("=== Head dos Dados com Decís ===")
head(instrumento_multianual)

print("=== Colunas dos Dados com Decís ===")
colnames(instrumento_multianual)



###MAPAS

library(dplyr)
library(ggplot2)
library(geobr)
library(viridis)

# 1. Carregar dados geográficos das regiões intermediárias
regioes_intermediarias <- read_intermediate_region(
  code_intermediate = "all",
  year = 2017,
  simplified = TRUE,
  showProgress = TRUE
)

# 2. Converter Cod_Reg_Intermed para character (compatibilidade com geobr)
instrumento_multianual <- instrumento_multianual %>%
  mutate(Cod_Reg_Intermed = as.character(Cod_Reg_Intermed))

# 3. Agregar dados por região intermediária, ano e decil
dados_mapas_regiao <- instrumento_multianual %>%
  filter(!is.na(Cod_Reg_Intermed)) %>%  # Remover NAs de localização
  group_by(ANO, Cod_Reg_Intermed, DECIL) %>%
  summarise(
    ROA_Medio = mean(SOBRAS_POR_ATIVO, na.rm = TRUE) * 100,
    n_cooperativas = n(),
    .groups = 'drop'
  ) %>%
  # Calcular a proporção de cooperativas em cada decil por região (opcional, para visualização)
  group_by(ANO, Cod_Reg_Intermed) %>%
  mutate(Proporcao_Decil = n_cooperativas / sum(n_cooperativas)) %>%
  ungroup()

# 4. Juntar os dados geográficos com os econômicos
mapa_dados <- regioes_intermediarias %>%
  left_join(dados_mapas_regiao, by = c("code_intermediate" = "Cod_Reg_Intermed"))

# 5. Mapa do DECIL mais comum por região (exemplo para 2024)
mapa_2024 <- mapa_dados %>%
  filter(ANO == 2024) %>%
  group_by(code_intermediate) %>%
  slice_max(Proporcao_Decil, n = 1, with_ties = FALSE) %>%  # Pegar o decil dominante
  ungroup()

# Verificar se há dados para 2024
print(paste("Número de regiões com dados para 2024:", nrow(mapa_2024)))

ggplot(data = mapa_2024) +
  geom_sf(aes(fill = factor(DECIL)), color = "white", size = 0.3) +
  scale_fill_viridis_d(
    name = "Decil Dominante",
    option = "plasma",
    direction = -1,
    na.value = "grey90"
  ) +
  labs(
    title = "Decil Dominante das Cooperativas por Região Intermediária (2024)",
    subtitle = "Distribuição baseada na Sobra por Ativo",
    caption = "Fonte: Dados das Cooperativas de Crédito | Geobr/IBGE"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    legend.position = "bottom"
  )

# 6. Mapa da proporção do decil mais comum (opcional)
ggplot(data = mapa_2024) +
  geom_sf(aes(fill = Proporcao_Decil), color = "white", size = 0.3) +
  scale_fill_viridis_c(
    name = "Proporção do Decil Dominante",
    option = "plasma",
    na.value = "grey90",
    direction = 1
  ) +
  labs(
    title = "Proporção do Decil Dominante por Região Intermediária (2024)",
    subtitle = "Distribuição das Cooperativas por Decil",
    caption = "Fonte: Dados das Cooperativas de Crédito | Geobr/IBGE"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    legend.position = "bottom"
  )




###MAPAS DECIS REGIOES ANIMADO
library(dplyr)
library(ggplot2)
library(geobr)
library(viridis)
library(gganimate)

# 1. Carregar dados geográficos das regiões intermediárias
regioes_intermediarias <- read_intermediate_region(
  code_intermediate = "all",
  year = 2017,
  simplified = TRUE,
  showProgress = TRUE
)

# 2. Converter Cod_Reg_Intermed para character (compatibilidade com geobr)
instrumento_multianual <- instrumento_multianual %>%
  mutate(Cod_Reg_Intermed = as.character(Cod_Reg_Intermed))

# 3. Agregar dados por região intermediária, ano e decil
dados_mapas_regiao <- instrumento_multianual %>%
  filter(!is.na(Cod_Reg_Intermed)) %>%  # Remover NAs de localização
  filter(ANO >= 2019 & ANO <= 2024) %>%  # Limitar a 2019-2024
  group_by(ANO, Cod_Reg_Intermed, DECIL) %>%
  summarise(
    ROA_Medio = mean(SOBRAS_POR_ATIVO, na.rm = TRUE) * 100,
    n_cooperativas = n(),
    .groups = 'drop'
  ) %>%
  group_by(ANO, Cod_Reg_Intermed) %>%
  mutate(Proporcao_Decil = n_cooperativas / sum(n_cooperativas)) %>%
  ungroup()

# 4. Juntar os dados geográficos com os econômicos
mapa_dados <- regioes_intermediarias %>%
  left_join(dados_mapas_regiao, by = c("code_intermediate" = "Cod_Reg_Intermed"))

# 5. Preparar dados para animação (decil dominante por região)
mapa_animacao <- mapa_dados %>%
  group_by(ANO, code_intermediate) %>%
  slice_max(Proporcao_Decil, n = 1, with_ties = FALSE) %>%  # Decil dominante
  ungroup()

# 6. Criar animação do decil dominante por ano
animacao_decis <- ggplot(data = mapa_animacao) +
  geom_sf(aes(fill = factor(DECIL)), color = "white", size = 0.3) +  # Removido geometry=geometry
  scale_fill_viridis_d(
    name = "Decil Dominante",
    option = "plasma",
    direction = -1,
    na.value = "grey90"
  ) +
  labs(
    title = "Decil Dominante das Cooperativas por Região Intermediária: {closest_state}",
    subtitle = "Ano: {closest_state}",
    caption = "Fonte: Dados das Cooperativas de Crédito | Geobr/IBGE"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    legend.position = "bottom"
  ) +
  transition_states(ANO, transition_length = 2, state_length = 1) +
  ease_aes('quadratic-in-out')

# 7. Renderizar a animação
print(animacao_decis)

# 8. (Opcional) Salvar a animação como GIF
anim_save("c:/Aula3/evolucao_decis_2019_2024.gif", animation = animacao_decis, width = 800, height = 600)

###### MAPAS SEPARADOS 13.10.25
library(dplyr)
library(ggplot2)
library(geobr)
library(viridis)

# 1. Carregar dados geográficos das regiões intermediárias
regioes_intermediarias <- read_intermediate_region(
  code_intermediate = "all",
  year = 2017,
  simplified = TRUE,
  showProgress = TRUE
)

# 2. Converter Cod_Reg_Intermed para character
instrumento_multianual <- instrumento_multianual %>%
  mutate(Cod_Reg_Intermed = as.character(Cod_Reg_Intermed))

# 3. Agregar dados por região intermediária, ano e decil
dados_mapas_regiao <- instrumento_multianual %>%
  filter(!is.na(Cod_Reg_Intermed)) %>%
  filter(ANO >= 2019 & ANO <= 2024) %>%
  group_by(ANO, Cod_Reg_Intermed, DECIL) %>%
  summarise(
    ROA_Medio = mean(SOBRAS_POR_ATIVO, na.rm = TRUE) * 100,
    n_cooperativas = n(),
    .groups = 'drop'
  ) %>%
  group_by(ANO, Cod_Reg_Intermed) %>%
  mutate(Proporcao_Decil = n_cooperativas / sum(n_cooperativas)) %>%
  ungroup()

# 4. Juntar os dados geográficos com os econômicos
mapa_dados <- regioes_intermediarias %>%
  left_join(dados_mapas_regiao, by = c("code_intermediate" = "Cod_Reg_Intermed"))

# 5. Preparar dados para cada ano e salvar mapas
anos <- unique(dados_mapas_regiao$ANO)

for (ano in anos) {
  mapa_ano <- mapa_dados %>%
    filter(ANO == ano) %>%
    group_by(code_intermediate) %>%
    slice_max(Proporcao_Decil, n = 1, with_ties = FALSE) %>%
    ungroup()
  
  # Mapa do decil dominante
  p <- ggplot(data = mapa_ano) +
    geom_sf(aes(fill = factor(DECIL)), color = "white", size = 0.3) +
    scale_fill_viridis_d(
      name = "Decil Dominante",
      option = "plasma",
      direction = -1,
      na.value = "grey90"
    ) +
    labs(
      title = paste("Decil Dominante das Cooperativas (", ano, ")"),
      subtitle = "Distribuição baseada na Sobra por Ativo",
      caption = "Fonte: Dados das Cooperativas de Crédito | Geobr/IBGE"
    ) +
    theme_void() +
    theme(
      plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
      plot.subtitle = element_text(size = 12, hjust = 0.5),
      legend.position = "bottom"
    )
  
  # Salvar como imagem
  ggsave(filename = paste0("c:/Aula3/mapa_decis_", ano, ".png"), plot = p, width = 10, height = 8, dpi = 300)
}

# (Opcional) Mapas da proporção do decil dominante
for (ano in anos) {
  mapa_ano <- mapa_dados %>%
    filter(ANO == ano) %>%
    group_by(code_intermediate) %>%
    slice_max(Proporcao_Decil, n = 1, with_ties = FALSE) %>%
    ungroup()
  
  p <- ggplot(data = mapa_ano) +
    geom_sf(aes(fill = Proporcao_Decil), color = "white", size = 0.3) +
    scale_fill_viridis_c(
      name = "Proporção do Decil Dominante",
      option = "plasma",
      na.value = "grey90",
      direction = 1
    ) +
    labs(
      title = paste("Proporção do Decil Dominante (", ano, ")"),
      subtitle = "Distribuição das Cooperativas por Decil",
      caption = "Fonte: Dados das Cooperativas de Crédito | Geobr/IBGE"
    ) +
    theme_void() +
    theme(
      plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
      plot.subtitle = element_text(size = 12, hjust = 0.5),
      legend.position = "bottom"
    )
  
  ggsave(filename = paste0("c:/Aula3/mapa_proporcao_", ano, ".png"), plot = p, width = 10, height = 8, dpi = 300)
}

###MAPA POR UF

library(dplyr)
library(ggplot2)
library(geobr)
library(viridis)

# 1. Verificar se UF existe em dados_combinados ou df_final2
print("Colunas em dados_combinados:")
colnames(dados_combinados)

print("Colunas em df_final2:")
colnames(df_final2)

# 2. Adicionar UF ao dados_combinados (caso não exista)
# Assumindo que df_final2 tem a coluna UF (verifique na sua imagem anterior)
if (!"UF" %in% colnames(dados_combinados)) {
  dados_combinados <- dados_combinados %>%
    left_join(select(df_final2, CNPJ, UF), by = "CNPJ") %>%
    # Garantir que UF seja character para compatibilidade
    mutate(UF = as.character(UF))
}

# 3. Recriar instrumento_multianual com UF
instrumento_multianual <- dados_combinados %>%
  filter(ANO >= 2019 & ANO <= 2024) %>%
  filter(!is.na(SOBRAS_POR_ATIVO)) %>%
  group_by(ANO) %>%
  mutate(DECIL = ntile(SOBRAS_POR_ATIVO, 10)) %>%
  ungroup()

# 4. Verificar se UF foi adicionada
print("Colunas em instrumento_multianual:")
colnames(instrumento_multianual)
print("UFs disponíveis:")
unique(instrumento_multianual$UF)

# 5. Carregar dados geográficos das Unidades da Federação
ufs <- read_state(
  year = 2019,
  simplified = TRUE,
  showProgress = TRUE
)

# 6. Agregar dados por UF, ano e decil
dados_mapas_regiao <- instrumento_multianual %>%
  filter(!is.na(UF)) %>%  # Remover NAs de UF
  group_by(ANO, UF, DECIL) %>%
  summarise(
    n_cooperativas = n(),
    .groups = 'drop'
  ) %>%
  group_by(ANO, UF) %>%
  mutate(Proporcao_Decil = n_cooperativas / sum(n_cooperativas)) %>%
  ungroup() %>%
  group_by(ANO, UF) %>%
  slice_max(Proporcao_Decil, n = 1, with_ties = FALSE) %>%  # Decil dominante
  ungroup()

# 7. Juntar os dados geográficos com os econômicos
mapa_dados <- ufs %>%
  left_join(dados_mapas_regiao, by = c("abbrev_state" = "UF"))

# 8. Criar grade de mapas
p_decis_uf <- ggplot(data = mapa_dados) +
  geom_sf(aes(fill = factor(DECIL)), color = "black", size = 0.1) +
  scale_fill_viridis_d(
    name = "Decil Dominante",
    option = "plasma",
    direction = -1,
    na.value = "grey90"
  ) +
  facet_wrap(~ ANO, ncol = 3) +
  labs(
    title = "Decil Dominante das Cooperativas por UF (2019-2024)",
    caption = "Fonte: Dados das Cooperativas de Crédito | Geobr/IBGE"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    legend.position = "bottom",
    strip.text = element_text(size = 12, face = "bold")
  )

# 9. Salvar
ggsave("c:/Aula3/mapa_decis_uf_2019_2024.png", plot = p_decis_uf, width = 14, height = 12, dpi = 300)

# 10. Mostrar o mapa
print(p_decis_uf)


#############SEM DAs

library(dplyr)
library(ggplot2)
library(geobr)
library(viridis)

# 1. Carregar dados geográficos das Unidades da Federação
ufs <- read_state(
  year = 2019,
  simplified = TRUE,
  showProgress = TRUE
)

# 2. Verificar e preparar instrumento_multianual (remover NAs)
print("Colunas em dados_combinados antes de adicionar UF:")
colnames(dados_combinados)

# Adicionar UF ao dados_combinados (se não existir)
if (!"UF" %in% colnames(dados_combinados)) {
  dados_combinados <- dados_combinados %>%
    left_join(select(df_final2, CNPJ, UF), by = "CNPJ") %>%
    mutate(UF = as.character(UF))
}

# Recriar instrumento_multianual removendo NAs
instrumento_multianual <- dados_combinados %>%
  filter(ANO >= 2019 & ANO <= 2024) %>%
  filter(!is.na(SOBRAS_POR_ATIVO), !is.na(UF)) %>%  # Remover NAs
  group_by(ANO) %>%
  mutate(DECIL = ntile(SOBRAS_POR_ATIVO, 10)) %>%
  ungroup()

# 3. Verificar a remoção de NAs
print("Colunas em instrumento_multianual:")
colnames(instrumento_multianual)
print("Número de linhas após remover NAs:")
nrow(instrumento_multianual)
print("UFs disponíveis após remover NAs:")
unique(instrumento_multianual$UF)

# 4. Agregar dados por UF, ano e decil
dados_mapas_regiao <- instrumento_multianual %>%
  group_by(ANO, UF, DECIL) %>%
  summarise(
    n_cooperativas = n(),
    .groups = 'drop'
  ) %>%
  group_by(ANO, UF) %>%
  mutate(Proporcao_Decil = n_cooperativas / sum(n_cooperativas)) %>%
  ungroup() %>%
  group_by(ANO, UF) %>%
  slice_max(Proporcao_Decil, n = 1, with_ties = FALSE) %>%  # Decil dominante
  ungroup()

# 5. Juntar os dados geográficos com os econômicos
mapa_dados <- ufs %>%
  left_join(dados_mapas_regiao, by = c("abbrev_state" = "UF"))

# 6. Criar grade de mapas
p_decis_uf <- ggplot(data = mapa_dados) +
  geom_sf(aes(fill = factor(DECIL)), color = "black", size = 0.1) +
  scale_fill_viridis_d(
    name = "Decil Dominante",
    option = "plasma",
    direction = -1,
    na.value = "grey90"
  ) +
  facet_wrap(~ ANO, ncol = 3) +
  labs(
    title = "Decil Dominante das Cooperativas por UF (2019-2024)",
    caption = "Fonte: Dados das Cooperativas de Crédito | Geobr/IBGE"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    legend.position = "bottom",
    strip.text = element_text(size = 12, face = "bold")
  )

# 7. Salvar e mostrar
ggsave("c:/Aula3/mapa_decis_uf_2019_2024NOVO.png", plot = p_decis_uf, width = 14, height = 12, dpi = 300)
print(p_decis_uf)


##TABELA 

library(dplyr)
library(knitr)
library(kableExtra)

# 1. Agregar dados para encontrar o decil dominante por UF e ano
dados_tabela <- instrumento_multianual %>%
  filter(ANO >= 2019 & ANO <= 2024) %>%  # Limitar a 2019-2024
  filter(!is.na(UF), !is.na(DECIL)) %>%  # Garantir sem NAs
  group_by(ANO, UF, DECIL) %>%
  summarise(
    n_cooperativas = n(),  # Contar cooperativas por decil
    .groups = 'drop'
  ) %>%
  group_by(ANO, UF) %>%
  mutate(Proporcao_Decil = n_cooperativas / sum(n_cooperativas)) %>%  # Proporção
  ungroup() %>%
  group_by(ANO, UF) %>%
  slice_max(Proporcao_Decil, n = 1, with_ties = FALSE) %>%  # Decil dominante
  ungroup() %>%
  select(ANO, UF, DECIL)  # Selecionar apenas colunas relevantes

# 2. Ordenar e formatar a tabela
tabela_final <- dados_tabela %>%
  arrange(ANO, UF) %>%  # Ordenar por ano e UF
  pivot_wider(
    names_from = ANO,
    values_from = DECIL,
    names_prefix = "Decil_",
    values_fill = NA  # Deixar NA se não houver dado
  )

# 3. Gerar a tabela formatada
kable(tabela_final, format = "html", caption = "Decil Dominante das Cooperativas por UF (2019-2024)") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = FALSE) %>%
  scroll_box(width = "100%", height = "400px")  # Adicionar rolagem se necessário

# 4. (Opcional) Exportar para LaTeX (para artigos em LaTeX)
# kable(tabela_final, format = "latex", booktabs = TRUE, caption = "Decil Dominante das Cooperativas por UF (2019-2024)") %>%
#   kable_styling(latex_options = c("striped", "hold_position"))

# 5. (Opcional) Salvar como CSV
write.csv(tabela_final, "tabela_decil_dominante_uf_2019_2024.csv", row.names = FALSE)



###TABELA QUANTIADDE

library(dplyr)
library(knitr)
library(kableExtra)

# 1. Agregar dados para contar a quantidade de cooperativas por UF e ano
dados_tabela <- instrumento_multianual %>%
  filter(ANO >= 2019 & ANO <= 2024) %>%  # Limitar a 2019-2024
  filter(!is.na(UF)) %>%  # Garantir sem NAs em UF
  group_by(ANO, UF) %>%
  summarise(
    n_cooperativas = n(),  # Contar o número de cooperativas
    .groups = 'drop'
  )

# 2. Criar uma tabela pivotada para melhor visualização
tabela_final <- dados_tabela %>%
  pivot_wider(
    names_from = ANO,
    values_from = n_cooperativas,
    values_fill = 0  # Preencher valores ausentes com 0
  ) %>%
  arrange(UF)  # Ordenar alfabeticamente por UF

# 3. Gerar a tabela formatada
kable(tabela_final, format = "html", caption = "Quantidade de Cooperativas por UF (2019-2024)") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = FALSE) %>%
  scroll_box(width = "100%", height = "400px")  # Adicionar rolagem se necessário

# 4. (Opcional) Exportar para LaTeX (para artigos em LaTeX)
# kable(tabela_final, format = "latex", booktabs = TRUE, caption = "Quantidade de Cooperativas por UF (2019-2024)") %>%
#   kable_styling(latex_options = c("striped", "hold_position"))

# 5. (Opcional) Salvar como CSV
write.csv(tabela_final, "tabela_cooperativas_uf_2019_2024.csv", row.names = FALSE)





#################TESTANDO A APLICAO

# --- CÓDIGO DO INSTRUMENTO "PAINEL DE DIAGNÓSTICO DE PERFORMANCE" ---
library(dplyr)

# 1. Primeiro, vamos transformar sua tabela de benchmark em um dataframe no R
benchmark_decis <- data.frame(
  ANO = rep(2019:2024, each = 10),
  DECIL = rep(1:10, 6),
  ROA_Minimo = c(-802.33, 0.00, 0.56, 1.08, 1.53, 1.96, 2.43, 3.01, 3.65, 4.60, -370.54, 0.00, 0.61, 1.18, 1.52, 1.93, 2.28, 2.70, 3.25, 4.68, -286.33, 0.01, 0.50, 1.06, 1.61, 1.94, 2.22, 2.56, 3.10, 3.93, -6828.53, -0.04, 0.32, 0.73, 1.13, 1.58, 2.08, 2.58, 3.21, 4.03, -218.83, 0.00, 0.46, 0.82, 1.20, 1.54, 1.99, 2.53, 3.24, 4.14, -1226.09, -0.05, 0.35, 0.73, 1.11, 1.45, 1.75, 2.27, 2.79, 3.82),
  ROA_Mediano_do_Decil = c(-4.22, 0.22, 0.80, 1.30, 1.75, 2.17, 2.72, 3.28, 4.06, 5.95, -3.58, 0.23, 0.91, 1.34, 1.69, 2.11, 2.51, 2.93, 3.76, 6.07, -3.22, 0.18, 0.79, 1.39, 1.78, 2.08, 2.39, 2.84, 3.41, 5.10, -2.42, 0.09, 0.54, 0.93, 1.36, 1.80, 2.33, 2.87, 3.59, 5.14, -2.35, 0.24, 0.62, 1.00, 1.37, 1.78, 2.21, 2.91, 3.61, 5.20, -2.09, 0.11, 0.55, 0.97, 1.26, 1.59, 1.96, 2.53, 3.27, 4.94),
  ROA_Maximo = c(-0.02, 0.56, 1.08, 1.52, 1.96, 2.42, 3.00, 3.64, 4.58, 22.23, -0.12, 0.60, 1.15, 1.52, 1.91, 2.28, 2.69, 3.23, 4.63, 48.81, 0.01, 0.50, 1.05, 1.60, 1.94, 2.21, 2.56, 3.10, 3.93, 26.63, -0.05, 0.32, 0.71, 1.13, 1.58, 2.08, 2.55, 3.20, 4.03, 21.00, 0.00, 0.45, 0.81, 1.20, 1.53, 1.99, 2.52, 3.23, 4.10, 19.97, -0.06, 0.34, 0.72, 1.10, 1.44, 1.75, 2.27, 2.78, 3.81, 22.21)
)

# 2. A função de diagnóstico
diagnostico_performance_coop <- function(nome_coop, roa_2019, roa_2020, roa_2021, roa_2022, roa_2023, roa_2024) {
  
  dados_coop <- data.frame(
    ANO = 2019:2024,
    ROA = c(roa_2019, roa_2020, roa_2021, roa_2022, roa_2023, roa_2024)
  )
  
  resultados <- list()
  posicoes_decil <- c()
  
  for (ano_analise in dados_coop$ANO) {
    roa_ano <- dados_coop$ROA[dados_coop$ANO == ano_analise]
    benchmark_ano <- benchmark_decis[benchmark_decis$ANO == ano_analise, ]
    
    posicao <- benchmark_ano$DECIL[roa_ano >= benchmark_ano$ROA_Minimo & roa_ano <= benchmark_ano$ROA_Maximo]
    # Caso especial para o valor mínimo do primeiro decil
    if (roa_ano <= benchmark_ano$ROA_Minimo[1]) {
      posicao <- 1
    }
    
    posicoes_decil <- c(posicoes_decil, posicao)
    resultados[[as.character(ano_analise)]] <- paste0("Em ", ano_analise, " (ROA de ", roa_ano, "%): Seu desempenho a posicionou no ", posicao, "º Decil.")
  }
  
  # Imprimir Relatório
  cat(paste("--- Relatório de Diagnóstico de Performance -", nome_coop, "---\n\n"))
  cat("1. Posicionamento Anual de Performance:\n")
  for (r in resultados) {
    cat(paste("-", r, "\n"))
  }
  
  cat("\n2. Análise de Trajetória (2019-2024):\n")
  if (mean(posicoes_decil) >= 7.5) {
    cat("- Consistência: Sua cooperativa demonstrou uma performance consistentemente alta, mantendo-se no quartil superior.\n")
  } else if (mean(posicoes_decil) <= 3.5) {
    cat("- Consistência: Sua cooperativa demonstrou uma performance consistentemente no quartil inferior.\n")
  } else {
    cat("- Consistência: Sua cooperativa demonstrou uma performance na média do sistema.\n")
  }
  
  tendencia <- round(cor(dados_coop$ANO, posicoes_decil), 2)
  if (tendencia >= 0.5) {
    cat("- Evolução: A trajetória é de clara evolução e melhoria competitiva.\n")
  } else if (tendencia <= -0.5) {
    cat("- Evolução: A trajetória é de declínio competitivo no período.\n")
  } else {
    cat("- Evolução: A trajetória de posicionamento se mostrou relativamente estável.\n")
  }
}

# --- COMO USAR O INSTRUMENTO: Exemplo da "Coop X" ---

diagnostico_performance_coop(
  nome_coop = "Coop X (Hipotética)",
  roa_2019 = 2.8,
  roa_2020 = 3.1,
  roa_2021 = 3.5,
  roa_2022 = 3.0,
  roa_2023 = 3.8,
  roa_2024 = 4.2
)

install.packages("shiny")
# Opcional: salvar em arquivos CSV
#save.image("novo_28.2_09_25_.RData")
#load("novo_28.2_09_25_.RData")

###TESTES AVANCADOS COM ECONOMETRIA


# --- ETAPA 1: INSTALAÇÃO E CARREGAMENTO DOS PACOTES ---
# O 'plm' é o pacote especializado em econometria de dados em painel.
# install.packages("plm")
# install.packages("lmtest") # Para testes de robustez
# install.packages("sandwich") # Para erros-padrão robustos

library(dplyr)
library(plm)
library(lmtest)
library(sandwich)

# --- ETAPA 2: PREPARAÇÃO DO DATAFRAME FINAL PARA O PAINEL ---
# (sem alterações)
dados_de_localizacao_essenciais <- resultado_combinado %>%
  select(CNPJ, UF) %>%
  mutate(CNPJ = as.character(CNPJ)) %>%
  distinct()

dados_financeiros <- total_dados_limpos %>%
  mutate(CNPJ = as.character(CNPJ))

dados_completos <- left_join(dados_financeiros, dados_de_localizacao_essenciais, by = "CNPJ")

dados_macro <- data.frame(
  ANO = 2019:2024,
  IPCA = c(4.31, 4.52, 10.06, 5.79, 4.62, 4.83),
  PIB = c(1.22, -3.28, 4.76, 3.02, 3.24, 3.40),
  SELIC = c(5.95, 2.75, 4.44, 12.38, 13.03, 10.89)
)

painel_df <- left_join(dados_completos, dados_macro, by = "ANO")

painel_limpo <- painel_df %>%
  select(CNPJ, ANO, SOBRAS_POR_ATIVO, IPCA, PIB, SELIC) %>%
  na.omit()

# --- ETAPA 3: ESTIMAÇÃO DO MODELO DE EFEITOS FIXOS ---
# (sem alterações)
painel_coops <- pdata.frame(painel_limpo, index = c("CNPJ", "ANO"))
modelo_efeitos_fixos <- plm(SOBRAS_POR_ATIVO ~ IPCA + PIB + SELIC,
                            data = painel_coops,
                            model = "within")

print("--- Resultado do Modelo de Efeitos Fixos (Padrão) ---")
summary(modelo_efeitos_fixos)

# --- ETAPA 4: TESTE DE ROBUSTEZ (COM COMANDO CORRIGIDO) ---
print("--- Resultado do Modelo com Erros-Padrão Robustos (Clusterizados por Cooperativa) ---")

# A CORREÇÃO ESTÁ NA LINHA ABAIXO: o argumento 'type' foi removido.
coeftest(modelo_efeitos_fixos, vcov = vcovHC(modelo_efeitos_fixos, cluster = "group"))


##ARTIGO RAE
library(xml2)
library(dplyr)
library(tsibble)
load("c:/Aula3/docs/novo_28_08_25_.RData")
ls()
packageVersion("xml2")


# Certifique-se de que a biblioteca dplyr está carregada
library(dplyr)

media_geral_ativos <- mean(df_final_com_clusters$ATIVOS, na.rm = TRUE)

# --- 2. Gerar a tabela de perfis com o novo índice de ativos ---
tabela_perfis_revisada <- df_final_com_clusters %>%
  group_by(Cluster) %>%
  summarise(
    N_Cooperativas = n(),
    IFDM_Emp_Renda = mean(IFDM_Emp_Renda),
    IFDM_Edu = mean(IFDM_Edu),
    VAB = mean(VAB),
    ATIVOS_Absoluto = mean(ATIVOS), # Mantemos o valor absoluto para referência
    ROA = mean(ROA),
    CPLA = mean(CPLA)
  ) %>%
  # Cria a nova coluna com o índice de ativos relativo
  mutate(
    ATIVOS_Relativo_Media = ATIVOS_Absoluto / media_geral_ativos
  ) %>%
  arrange(Cluster)


# --- 3. Imprimir a nova tabela ---
# Você pode formatar os números como quiser para a sua tese
print("--- Tabela de Perfis Revisada com Ativos Relativos ---")

# Seleciona e reordena as colunas para a tabela final
tabela_final_para_tese <- tabela_perfis_revisada %>%
  select(Cluster, N_Cooperativas, IFDM_Emp_Renda, IFDM_Edu, VAB, ATIVOS_Relativo_Media, ROA, CPLA)

print(as.data.frame(tabela_final_para_tese))




#### REFAZENDO ARTIGO 3 09.20.2025
######################################
# Certifique-se de que as bibliotecas e o dataframe agregado estão prontos
# Certifique-se de que as bibliotecas e o dataframe agregado estão prontos
library(dplyr)
library(cluster)

# Assumindo que 'df_agregado_por_media' está carregado.

# --- PARTE 1: FORMAÇÃO DOS CLUSTERS AMBIENTAIS (k=2) ---

# 1. Selecionar e Padronizar as 3 variáveis de agrupamento
df_agrupamento_3vars <- df_agregado_por_media %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB) %>%
  na.omit()

df_agrup_3vars_padronizado <- scale(df_agrupamento_3vars)

# 2. Executar o algoritmo PAM com k=2
k_final_orientador <- 2
resultado_pam_3vars <- pam(df_agrup_3vars_padronizado, k = k_final_orientador)

# 3. Adicionar a nova classificação de cluster ao dataframe principal
# Primeiro, garantimos que os dataframes tenham o mesmo número de linhas
df_agregado_filtrado <- df_agregado_por_media %>%
  filter(CNPJ %in% rownames(df_agrup_3vars_padronizado))

# AQUI ESTÁ A CORREÇÃO: Usamos ungroup() para remover a estrutura de grupo
df_final_novo <- df_agregado_filtrado %>%
  ungroup() %>%  # <--- CORREÇÃO ADICIONADA AQUI
  mutate(Cluster_Ambiental = resultado_pam_3vars$clustering)


# --- PARTE 2: ANÁLISE DE DESEMPENHO ENTRE OS CLUSTERS AMBIENTAIS ---

# 1. Criar a nova tabela de perfis (agora com todas as variáveis)
nova_tabela_perfis <- df_final_novo %>%
  group_by(Cluster_Ambiental) %>%
  summarise(
    N_Cooperativas = n(),
    IFDM_Renda_Medio = mean(IFDM_Emp_Renda),
    IFDM_Edu_Medio = mean(IFDM_Edu),
    VAB_Medio = mean(VAB),
    ATIVOS_Medio = mean(ATIVOS),
    ROA_Medio = mean(ROA),
    CPLA_Medio = mean(CPLA)
  )

print("--- Nova Tabela de Perfis (Clusters baseados em 3 variáveis) ---")
print(as.data.frame(nova_tabela_perfis))


# 2. Rodar testes estatísticos para comparar o DESEMPENHO entre os 2 clusters
variaveis_de_desempenho <- c("ATIVOS", "ROA", "CPLA")

print("--- Testes de Kruskal-Wallis para Variáveis de Desempenho ---")
for (variavel in variaveis_de_desempenho) {
  teste_kw <- kruskal.test(get(variavel) ~ as.factor(Cluster_Ambiental), data = df_final_novo)
  print(paste("Resultado para a variável:", variavel))
  print(teste_kw)
}

##### ALTERANDO AS VARIAVEIS E TESTANDO CORRELACOES
#################
# Instale o pacote 'corrplot' se ainda não o tiver
# install.packages("corrplot")

# Carregue as bibliotecas necessárias
library(corrplot)
library(dplyr)

# Assumindo que 'df_agregado_por_media' está carregado.

# --- ANÁLISE DE CORRELAÇÃO DAS VARIÁVEIS DE AGRUPAMENTO ORIGINAIS ---

# 1. Selecionar as 3 variáveis de interesse
df_para_correlacao <- df_agregado_por_media %>%
  select(IFDM_Emp_Renda, IFDM_Edu, VAB) %>%
  na.omit()

# 2. Calcular a matriz de correlação
matriz_cor <- cor(df_para_correlacao)

# 3. Imprimir a matriz de correlação no console
print("--- Matriz de Correlação ---")
print(round(matriz_cor, 2)) # Arredondando para 2 casas decimais

#######
#DEPOIS DE REFAZER O DATAFRAME df_Art3
#####


# 1. Carrega o arquivo
load("MEU_AMBIENTE_FINAL_LIMPO.RData", envir = .GlobalEnv)

# 2. Lista TODAS as variáveis que NÃO são do sf
variaveis_boas <- ls()
variaveis_boas <- variaveis_boas[!grepl("^sf|^\\.", variaveis_boas)]

# 3. Salva SÓ essas variáveis em um .RData LIMPO
save(list = variaveis_boas, file = "AMBIENTE_100_LIMPO_SÓ_VARIAVEIS.RData")

# 4. Limpa tudo
rm(list = ls())

install.packages("sf")
library(sf)

# 3. Testa
sf::sf_extSoftVersion()


## 1) Ver quais colunas são suspeitas (listas, kcca, kccaFamily)
is_list   <- vapply(df, is.list, logical(1))
has_kcca  <- vapply(df, function(x) inherits(x, "kcca") || inherits(x, "kccaFamily"), logical(1))

suspeitas <- names(which(is_list | has_kcca))
suspeitas

objs <- ls()
sapply(objs, function(x) class(get(x))[1])

sapply(objs, function(x) any(grepl("kcca|kccaFamily", capture.output(str(get(x), max.level = 1)))))

## mantém só colunas "planas": numeric, integer, character, logical, factor, Date, POSIXct
keep_col <- vapply(df, function(x)
  is.atomic(x) || inherits(x, c("Date","POSIXct","POSIXlt","difftime","factor")),
  logical(1)
)
df_export <- df[, keep_col, drop = FALSE]


rm(fam)
gc()
saveRDS(df, "dados_limpos.rds")

save.image(file = "MEU_AMBIENTE_SEGURO.RData")
load("c:/Aula3/docs/MEU_AMBIENTE_SEGURO.RData")

saveRDS(df_export, "dados_limpos.rds")  # deve salvar sem os avisos




renv::activate()
renv::remove(c("stringr", "stringi"))
renv::install(c("stringi", "stringr"))   # instala binários corretos p/ sua versão do R
renv::snapshot()
install.packages("yaml")
install.packages("remotes")
remotes::install_github("ricardo-bion/ggradar", dependencies = TRUE)
library(ggradar)


install.packages("fmsb")
library(fmsb)

# EXEMPLO: dados no intervalo [0,1] (ou padronize antes)
df_radar <- data.frame(
  IFDM_Emp_Renda_2014_2018 = 0.62,
  IFDM_Emp_Renda_2019_2023 = 0.71,
  IFDM_Edu_2014_2018       = 0.58,
  IFDM_Edu_2019_2023       = 0.66
)

# fmsb exige 2 linhas extras: máximos e mínimos
df_plot <- rbind(
  max = rep(1, ncol(df_radar)),
  min = rep(0, ncol(df_radar)),
  df_radar
)

radarchart(
  df_plot,
  seg = 5,            # número de anéis
  pcol = 1,           # cor da linha
  plwd = 3,           # espessura da linha
  pfcol = scales::alpha("grey70", 0.3),  # preenchimento translúcido
  cglcol = "grey80",  # cor da grade
  cglty = 1, cglwd = 0.8,
  axistype = 1
)

renv::settings$ignored.packages(
  unique(c(renv::settings$ignored.packages(), "ggradar"))
)
renv::snapshot()

install.packages("pkgbuild")

pkgbuild::has_build_tools(debug = TRUE)
install.packages("sparsevctrs", type = "binary")


# lista mínima com base nas mensagens
pkgs <- c(
  "lme4","Rcpp","ggplot2","ggpubr","purrr","factoextra",
  "ggrepel","scales","leaflet","plotly","patchwork",
  "flexclust","proxy","class","readxl"
)

# instala só os que faltam (com dependências) usando binários no Windows
to_install <- setdiff(pkgs, rownames(installed.packages()))
if(length(to_install)) install.packages(to_install, dependencies = TRUE, type = "binary")




setwd("C:/Aula3/docs")
tmp <- new.env(parent = emptyenv())
load("c:/Aula3/docs/novo_20_08_25_.RData")



saveRDS(df, "dados_limpos.rds")

library(dplyr)
library(readxl)
IFDM_Emp_Renda <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Emp_Renda_13_23.xlsx")
IFDM_Edu <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Educacao_13_23.xlsx")



library(dplyr)

# Verificar se há valores não numéricos nas colunas 2014–2023
IFDM_Emp_Renda %>% 
  select(`2014`:`2023`) %>% 
  summarise(across(everything(), ~sum(is.na(as.numeric(.))), .names = "NAs_{col}"))
IFDM_Edu %>% 
  select(`2014`:`2023`) %>% 
  summarise(across(everything(), ~sum(is.na(as.numeric(.))), .names = "NAs_{col}"))



IFDM_Edu %>% 
  select(`2014`:`2023`) %>% 
  summarise(
    across(everything(), 
           ~ sum(is.na(parse_number(as.character(.)))), .names = "Invalid_{col}")
  )



IFDM_Emp_Renda <- IFDM_Emp_Renda %>%
  mutate(across(`2014`:`2023`, ~as.numeric(gsub(",", ".", gsub("-", NA, trimws(.))))))

IFDM_Edu <- IFDM_Edu %>%
  mutate(across(`2014`:`2023`, ~as.numeric(gsub(",", ".", gsub("-", NA, trimws(.))))))



IFDM_Emp_Renda <- IFDM_Emp_Renda %>%
  mutate(across(`2014`:`2023`, ~as.numeric(.)))

IFDM_Edu <- IFDM_Edu %>%
  mutate(across(`2014`:`2023`, ~as.numeric(.)))


IFDM_Emp_Renda <- IFDM_Emp_Renda %>%
  mutate(
    media_2014_2018 = rowMeans(select(., `2014`:`2018`), na.rm = TRUE),
    media_2019_2023 = rowMeans(select(., `2019`:`2023`), na.rm = TRUE)
  )

IFDM_Edu <- IFDM_Edu %>%
  mutate(
    media_2014_2018 = rowMeans(select(., `2014`:`2018`), na.rm = TRUE),
    media_2019_2023 = rowMeans(select(., `2019`:`2023`), na.rm = TRUE)
  )





# 
# 
df_Art10 <- df_limpo[df_limpo$ANO %in% c(2014,2015,2016,2017, 2018, 2019, 2020, 2021, 2022, 2023 ), ]
# #df_Art3Cluster <- df_limpo[df_limpo$ANO %in% c(2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022), ]
# 
# 
# #O dígito verificador é um mecanismo que ajuda a evitar erros na digitação ou transmissão do código.
# df_Art3$Cod_Munic <- substr(df_Art3$Cod_Munic, 1, nchar(df_Art3$Cod_Munic)-1)
# #df_Art3Cluster$Cod_Munic <- substr(df_Art3Cluster$Cod_Munic, 1, nchar(df_Art3Cluster$Cod_Munic)-1)
# 
# IFDM_Emp_Renda <- IFDM_Emp_Renda [ , -c(2,3,4)]
# IFDM_Edu <- IFDM_Edu[,-c(2,3,4)]
# # Transforma a coluna Código e id_municipio para o mesmo formato
# IFDM_Emp_Renda$Código <- as.character(IFDM_Emp_Renda$Código)
# IFDM_Edu$Código <- as.character(IFDM_Edu$Código)
# 
# library(dplyr)
# library(tidyr)
# library(readr)
# 
# library(dplyr)
# library(tidyr)
# library(readr)  # para parse_number()
# 
# # ==================================================
# # 1) Padronizar nomes das chaves
# # ==================================================
IFDM_Emp_Renda <- IFDM_Emp_Renda %>%
  rename(Cod_Munic = `Código`) %>%
  mutate(Cod_Munic = as.character(Cod_Munic))

IFDM_Edu <- IFDM_Edu %>%
  rename(Cod_Munic = `Código`) %>%
  mutate(Cod_Munic = as.character(Cod_Munic))

df_Art3 <- df_Art3 %>%
  mutate(Cod_Munic = as.character(Cod_Munic))





tmp <- new.env()
load("c:/Aula3/docs/novo_21_09_25_.RData")


pkgs <- c("openxlsx","tidytext","officer","fable","fabletools","strucchange")
instalar <- setdiff(pkgs, rownames(installed.packages()))
if (length(instalar)) install.packages(instalar, dependencies = TRUE, type = "binary")

# ggradar não está no CRAN; use o GitHub (se já não tiver)
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes", type="binary")
remotes::install_github("ricardo-bion/ggradar", dependencies = TRUE)


renv::dependencies()

renv::status()

renv::snapshot()



# 2) Liste os objetos
objs <- ls(tmp, all.names = TRUE)

# 3) Função segura pra testar classes sem disparar format() / str()
is_bad <- function(nm) {
  tryCatch({
    cl <- class(get(nm, envir = tmp))           # só pega a classe
    any(grepl("kcca|kccaFamily", paste(cl, collapse = " ")))
  }, error = function(e) FALSE)
}

bad <- Filter(is_bad, objs)
bad           # veja os nomes problemáticos (kcca/kccaFamily, etc.)


# ainda com 'tmp' carregado
bad <- c("fam", "kmeans_manhattan")
rm(list = intersect(bad, ls(tmp)), envir = tmp)

# mantenha apenas objetos “simples/seguros”
is_simple <- function(x) {
  is.data.frame(x) || inherits(x, c("tbl_df","sf")) ||
    is.matrix(x) || is.numeric(x) || is.character(x) ||
    is.logical(x) || is.factor(x)
}

objs <- ls(tmp, all.names = TRUE)
ok_keep <- Filter(function(nm) {
  tryCatch(is_simple(get(nm, tmp)), error = function(e) FALSE)
}, objs)

# copie para o .GlobalEnv
for (nm in ok_keep) assign(nm, get(nm, tmp), envir = .GlobalEnv)

# salve um ambiente seguro
save(list = ok_keep, file = "c:/Aula3/docs/MEU_AMBIENTE_SEGURO.RData")







tem_flexclust <- function(env) {
  any(sapply(ls(envir = env), function(nm) {
    cl <- try(class(get(nm, envir = env)), silent = TRUE)
    if (inherits(cl, "try-error")) return(FALSE)
    grepl("kcca|kccaFamily", paste(cl, collapse = " "))
  }))
}

tem_flexclust(.GlobalEnv)  # deve retornar FALSE

restantes <- sapply(ls(.GlobalEnv), function(nm) {
  cl <- try(class(get(nm, envir = .GlobalEnv)), silent = TRUE)
  if (inherits(cl, "try-error")) return(NA)
  paste(cl, collapse = " ")
})

subset(restantes, grepl("kcca|kccaFamily", restantes))
rm(fam, kmeans_manhattan)
gc()
tem_flexclust(.GlobalEnv)
save.image("c:/Aula3/docs/AMBIENTE_LIMPO_28_1.10.25.RData")
load("c:/Aula3/docs/AMBIENTE_LIMPO_28.10.25.RData")


########## VOU MANTER A MESMA BASE PQ O TEMPO NAO PERMITE REFAZER

df_3 <- df

library(dplyr)

df_medias <- df_3 %>%
  # Filtra apenas os anos desejados
  filter(ANO %in% 2006:2016) %>%
  
  # Cria coluna de período
  mutate(
    periodo = case_when(
      ANO %in% 2006:2011 ~ "2006-2011",
      ANO %in% 2012:2016 ~ "2012-2016",
      TRUE ~ NA_character_
    )
  ) %>%
  
  # Remove anos fora (ex: 2005) e NAs
  filter(!is.na(periodo)) %>%
  
  # Agrupa por período e calcula média
  group_by(periodo) %>%
  summarise(
    across(
      c(IFDM_Emp_Renda, IFDM_Edu, Pib_agro, Pib_ind, Pib_serv, Pib_outros),
      ~ mean(., na.rm = TRUE),
      .names = "{.col}"
    ),
    .groups = "drop"
  ) %>%
  
  # Ordena períodos
  arrange(periodo)




library(dplyr)

df_medias_final <- df_3 %>%
  # 1. Filtra anos desejados
  filter(ANO %in% 2006:2016) %>%
  
  # 2. Cria coluna de período
  mutate(
    periodo = case_when(
      ANO %in% 2006:2011 ~ "2006-2011",
      ANO %in% 2012:2016 ~ "2012-2016",
      TRUE ~ NA_character_
    )
  ) %>%
  
  # 3. Remove anos fora do período
  filter(!is.na(periodo)) %>%
  
  # 4. Agrupa por CNPJ + colunas fixas + período
  group_by(
    CNPJ, UF, Cod_Munic, Cod_Reg_Imediata, Cod_Reg_Intermed, periodo
  ) %>%
  
  # 5. Calcula média das variáveis de desempenho
  summarise(
    across(
      c(IFDM_Emp_Renda, IFDM_Edu, Pib_agro, Pib_ind, Pib_serv, Pib_outros,
        ATIVOS, ROA, CPLA),
      ~ mean(., na.rm = TRUE),
      .names = "{.col}_media"
    ),
    .groups = "drop"
  ) %>%
  
  # 6. (Opcional) Arredonda
  mutate(across(where(is.numeric), ~ round(., 6))) %>%
  
  # 7. Ordena
  arrange(CNPJ, periodo)


###SEPARANDO

library(dplyr)

# === PERÍODO 1: 2006–2011 ===
periodo1 <- df_3 %>%
  filter(ANO %in% 2006:2011) %>%
  group_by(CNPJ, UF, Cod_Munic, Cod_Reg_Imediata, Cod_Reg_Intermed) %>%
  summarise(
    across(
      c(IFDM_Emp_Renda, IFDM_Edu, Pib_agro, Pib_ind, Pib_serv, Pib_outros,
        ATIVOS, ROA, CPLA),
      ~ mean(., na.rm = TRUE),
      .names = "{.col}_p1"
    ),
    .groups = "drop"
  ) %>%
  arrange(CNPJ)

# === PERÍODO 2: 2012–2016 ===
periodo2 <- df_3 %>%
  filter(ANO %in% 2012:2016) %>%
  group_by(CNPJ, UF, Cod_Munic, Cod_Reg_Imediata, Cod_Reg_Intermed) %>%
  summarise(
    across(
      c(IFDM_Emp_Renda, IFDM_Edu, Pib_agro, Pib_ind, Pib_serv, Pib_outros,
        ATIVOS, ROA, CPLA),
      ~ mean(., na.rm = TRUE),
      .names = "{.col}_p2"
    ),
    .groups = "drop"
  ) %>%
  arrange(CNPJ)



#### FASE 1
library(dplyr)
library(factoextra)
library(ggplot2)
library(writexl)
library(cluster)
library(NbClust)


# ==============================================================
# 1. DEFINIR VARIÁVEIS
# ==============================================================

# Variáveis de AGRUPAMENTO (para o cluster)
vars_agrup <- c("IFDM_Emp_Renda_p2", "IFDM_Edu_p2",
                "Pib_agro_p2", "Pib_ind_p2", "Pib_serv_p2", "Pib_outros_p2")

# Variáveis de DESEMPENHO (para interpretação)
vars_desemp <- c("ATIVOS_p2", "ROA_p2", "CPLA_p2")

# ==============================================================
# 2. PREPARAR DADOS (só agrupamento + IDs)
# ==============================================================

dados_cluster <- periodo2 %>%
  select(CNPJ, UF, Cod_Munic, Cod_Reg_Imediata, Cod_Reg_Intermed, 
         all_of(vars_agrup), all_of(vars_desemp)) %>%
  drop_na(all_of(vars_agrup))  # Remove NA apenas nas variáveis de cluster

# ==============================================================
# 3. ESCALAR APENAS AS VARIÁVEIS DE AGRUPAMENTO
# ==============================================================

dados_scaled <- dados_cluster %>%
  select(all_of(vars_agrup)) %>%
  scale() %>%
  as.data.frame()

# ==============================================================
# 4. ELBOW METHOD → ESCOLHER NÚMERO DE CLUSTERS
# ==============================================================

fviz_nbclust(dados_scaled, kmeans, method = "wss", k.max = 8) +
  geom_vline(xintercept = 3, linetype = 2, color = "red") +
  labs(title = "Elbow Method - Número Ideal de Clusters",
       subtitle = "Baseado nas 6 variáveis socioeconômicas (2012–2016)")



# ==============================================================
# 2. ELBOW METHOD
# ==============================================================

p1 <- fviz_nbclust(dados_scaled, kmeans, method = "wss", k.max = 8) +
  labs(title = "Elbow Method", subtitle = "Within-cluster Sum of Squares") +
  theme_minimal()

# ==============================================================
# 3. SILHOUETTE (MELHOR MÉTODO!)
# ==============================================================

p2 <- fviz_nbclust(dados_scaled, kmeans, method = "silhouette", k.max = 8) +
  labs(title = "Silhouette Method", subtitle = "Média da largura da silhueta") +
  theme_minimal()

# ==============================================================
# 4. GAP STATISTIC (BOOTSTRAP)
# ==============================================================

set.seed(123)
gap_stat <- clusGap(dados_scaled, FUN = kmeans, nstart = 25,
                    K.max = 8, B = 100)  # B = 100 para publicação

p3 <- fviz_gap_stat(gap_stat) +
  labs(title = "Gap Statistic", subtitle = "Comparação com dados nulos") +
  theme_minimal()

# ==============================================================
# 5. NBCLUST: 30 ÍNDICES (CONFIÁVEL PARA DOUTORADO)
# ==============================================================

set.seed(123)
nb <- NbClust(dados_scaled, distance = "euclidean",
              min.nc = 2, max.nc = 8, 
              method = "kmeans", index = "all")

library(ggplot2)

# Extrai os votos por k
votos <- as.data.frame(t(nb$Best.nc))
colnames(votos) <- c("Number_clusters", "Votes")
votos$Number_clusters <- as.integer(rownames(votos))

# Gráfico de barras
p_nbclust <- ggplot(votos, aes(x = factor(Number_clusters), y = Votes)) +
  geom_col(fill = "steelblue", alpha = 0.8) +
  geom_text(aes(label = Votes), vjust = -0.5, size = 4, fontface = "bold") +
  labs(
    title = "NbClust: Distribuição dos 23 índices de validação",
    subtitle = "Maioria (8 índices) sugere k = 3",
    x = "Número de Clusters (k)",
    y = "Número de Índices que Sugerem k"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    axis.title = element_text(face = "bold")
  )

print(p_nbclust)

# Extrai o k com mais votos
k_maioria <- as.integer(names(which.max(table(nb$Best.nc[1, ]))))
k_maioria
# [1] 3

library(patchwork)
(p1 | p2) / (p3 | p_nbclust)


library(ggplot2)

# Extrai votos corretamente
# ==============================================================
# EXTRAIR VOTOS DO NBCLUST
# ==============================================================

# Extrai os votos de cada k
votos_tabela <- table(nb$Best.nc[1, ])
votos <- data.frame(
  k = as.integer(names(votos_tabela)),
  votos = as.integer(votos_tabela)
) %>%
  filter(!is.na(k)) %>%
  arrange(k)

# Mostra no console
print(votos)

# Gráfico bonito
p_nbclust <- ggplot(votos, aes(x = factor(k), y = votos)) +
  geom_col(fill = "#2c7bb6", width = 0.6, alpha = 0.9) +
  geom_text(aes(label = votos), vjust = -0.8, size = 5, color = "black") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(
    title = "NbClust: Distribuição dos 23 Índices de Validação",
    subtitle = "Maioria (8 índices) sugere k = 3",
    x = "Número de Clusters (k)",
    y = "Número de Índices que Sugerem k"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    axis.title = element_text(face = "bold")
  )

print(p_nbclust)


p1 <- fviz_nbclust(dados_scaled, kmeans, method = "wss", k.max = 8) +
  geom_vline(xintercept = 3, linetype = "dashed", color = "blue", size = 0.5) +  # LINHA TRACEJADA
  labs(
    title = "Método do Cotovelo",
    subtitle = "Soma dos Quadrados Intra-Cluster",
    x = "Número de Clusters (k)",
    y = "Total Within Sum of Squares"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray30"),
    axis.title = element_text(face = "bold")
  )

p2 <- fviz_nbclust(dados_scaled, kmeans, method = "silhouette", k.max = 8) +
  labs(
    title = "Método da Silhueta",
    subtitle = "Média da Largura da Silhueta",
    x = "Número de Clusters (k)",
    y = "Largura Média da Silhueta"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray30"),
    axis.title = element_text(face = "bold")
  )
p3 <- fviz_gap_stat(gap_stat) +
  labs(
    title = "Estatística Gap",
    subtitle = "Comparação com Dados Nulos",
    x = "Número de Clusters (k)",
    y = "Gap Statistic (k)"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray30"),
    axis.title = element_text(face = "bold")
  )

p_nbclust <- ggplot(votos, aes(x = factor(k), y = votos)) +
  geom_col(fill = "#2c7bb6", width = 0.6, alpha = 0.9) +
  geom_text(aes(label = votos), vjust = -0.8, size = 5, fontface = "bold", color = "black") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(
    title = "NbClust: Distribuição dos 23 Índices de Validação",
    subtitle = "Maioria (8 índices) sugere k = 3",
    x = "Número de Clusters (k)",
    y = "Número de Índices que Sugerem k"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray30"),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank()
  )

library(patchwork)

(p1 | p2) / (p3 | p_nbclust) +
  plot_annotation(
    title = "Validação do Número Ótimo de Clusters (k)",
    subtitle = "Métodos: Cotovelo, Silhueta, Gap e NbClust",
    theme = theme(
      plot.title = element_text(size = 16, face = "bold"),
      plot.subtitle = element_text(size = 12, color = "gray30")
    )
  )
ggsave("c:/Aula3/docs/validacao_clusters_k3_destaque.png", width = 14, height = 9, dpi = 300)


#### UMA VEZ DEFINIDO k-3 agora. ...

library(dplyr)
library(factoextra)
library(ggplot2)
library(writexl)
library(patchwork)

# ==============================================================
# 1. K-MEANS FINAL (k = 3)
# ==============================================================

set.seed(123)
kmeans_final <- kmeans(dados_scaled, centers = 3, nstart = 50)

## ==============================================================
# 1. ADICIONAR CLUSTER
# ==============================================================

periodo2_final <- periodo2 %>%
  drop_na(all_of(vars_agrup)) %>%
  mutate(cluster = factor(kmeans_final$cluster))

# ==============================================================
# 2. INTERPRETAÇÃO: MÉDIAS POR CLUSTER
# ==============================================================

interpretacao <- periodo2_final %>%
  group_by(cluster) %>%
  summarise(
    n = n(),
    across(
      all_of(c(vars_agrup, vars_desemp)),
      ~ round(mean(., na.rm = TRUE), 4),
      .names = "{.col}_media"
    )
  ) %>%
  arrange(desc(n))

print(interpretacao)


periodo2_final <- periodo2_final %>%
  mutate(
    perfil = case_when(
      cluster == 1 ~ "Cooperativas com IFDM e VAB Baixo",
      cluster == 2 ~ "Cooperativas com Elevado IFDM e VAB",
      cluster == 3 ~ "Cooperativas com IFDM Alto e Bom VAB"
    )
  ) %>%
  mutate(perfil = factor(perfil, levels = c(
    "Cooperativas com IFDM e VAB Baixo",
    "Cooperativas com Elevado IFDM e VAB",
    "Cooperativas com IFDM Alto e Bom VAB"
  )))

tabela_resultados <- interpretacao %>%
  left_join(
    periodo2_final %>% distinct(cluster, perfil),
    by = "cluster"
  ) %>%
  select(perfil, n, everything(), -cluster) %>%
  arrange(desc(n))

print(tabela_resultados)


p_clusters <- fviz_cluster(kmeans_final, data = dados_scaled,
                           geom = "point", ellipse.type = "convex",
                           palette = c("#d73027", "#f46d43", "#1a9850"),
                           ggtheme = theme_minimal(base_size = 12)) +
  labs(
    title = "Tipologia de Cooperativas de Crédito (2012–2016)",
    subtitle = "k = 3 | Base: IFDM e Valor Adicionado Bruto (VAB)",
    caption = "Fonte: Elaboração própria"
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "gray30"),
    legend.position = "bottom"
  ) +
  guides(fill = guide_legend(title = "Perfil da Cooperativa"))

print(p_clusters)


write_xlsx(
  list(
    "Dados_com_Cluster" = periodo2_final,
    "Tabela_Interpretacao" = tabela_resultados
  ),
  "c:/Aula3/docs/resultados_cluster_VAB_IFDM.xlsx"
)

#### TESTANDO COM K=4

# ==============================================================
# 1. K-MEANS COM k = 4
# ==============================================================

set.seed(123)
kmeans_k4 <- kmeans(dados_scaled, centers = 4, nstart = 50)

# Adiciona cluster k=4
periodo2_k4 <- periodo2 %>%
  drop_na(all_of(vars_agrup)) %>%
  mutate(cluster_k4 = factor(kmeans_k4$cluster))

# ==============================================================
# 2. INTERPRETAÇÃO: MÉDIAS POR CLUSTER (k=4)
# ==============================================================

interpretacao_k4 <- periodo2_k4 %>%
  group_by(cluster_k4) %>%
  summarise(
    n = n(),
    across(
      all_of(c(vars_agrup, vars_desemp)),
      ~ round(mean(., na.rm = TRUE), 4),
      .names = "{.col}_media"
    )
  ) %>%
  arrange(desc(n))

print(interpretacao_k4)


p_clusters_k4 <- fviz_cluster(kmeans_k4, data = dados_scaled,
                              geom = "point", ellipse.type = "convex",
                              palette = c("#d73027", "#f46d43", "#fdae61", "#1a9850"),
                              ggtheme = theme_minimal(base_size = 12)) +
  labs(
    title = "Teste de Sensibilidade: k = 4 Clusters",
    subtitle = "Base: IFDM e VAB setorial (2012–2016)",
    caption = "Fonte: Elaboração própria"
  ) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray30"),
    legend.position = "bottom"
  ) +
  guides(fill = guide_legend(title = "Cluster (k=4)"))

print(p_clusters_k4)

library(patchwork)

p_clusters + p_clusters_k4 +
  plot_annotation(
    title = "Comparação: k = 3 vs k = 4",
    subtitle = "Análise de sensibilidade da clusterização",
    theme = theme(plot.title = element_text(face = "bold", size = 14))
  )

# Soma dos quadrados intra-cluster (menor = melhor)
cat("k=3: Within SS =", round(kmeans_final$tot.withinss, 2), "\n")
cat("k=4: Within SS =", round(kmeans_k4$tot.withinss, 2), "\n")

# Silhueta média
sil_k3 <- cluster::silhouette(kmeans_final$cluster, dist(dados_scaled))
sil_k4 <- cluster::silhouette(kmeans_k4$cluster, dist(dados_scaled))

cat("k=3: Silhueta média =", round(mean(sil_k3[, 3]), 3), "\n")
cat("k=4: Silhueta média =", round(mean(sil_k4[, 3]), 3), "\n")


# ANOVA: ROA ~ cluster
anova_roa <- aov(ROA_p2 ~ cluster, data = periodo2_final)
summary(anova_roa)
anova_cpla <- aov(CPLA_p2 ~ cluster, data = periodo2_final)
summary(anova_cpla)
anova_ativos <- aov(ATIVOS_p2 ~ cluster, data = periodo2_final)
summary(anova_ativos)

# Post-hoc
tukey <- TukeyHSD(anova_roa)
print(tukey)

library(ggplot2)

ggplot(periodo2_final, aes(x = perfil, y = ROA_p2, fill = perfil)) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("#d73027", "#f46d43", "#1a9850")) +
  labs(
    title = "Distribuição do ROA por Perfil de Cooperativa",
    subtitle = "Nenhuma diferença significativa (ANOVA, p = 0,267)",
    x = "Perfil (Cluster)",
    y = "ROA (média 2012–2016)",
    caption = "Fonte: Elaboração própria"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 15, hjust = 1),
    legend.position = "none"
  )


##### PARECE-ME Q OS RESULTADOS COM KMEANS NAO SAO BONS
### RODANDO COM PAM

library(cluster)

# ==============================================================
# 1. DISTÂNCIA EUCLIDIANA (após escala)
# ==============================================================

dist_matrix <- dist(dados_scaled)

# ==============================================================
# 2. PAM COM k = 3
# ==============================================================

set.seed(123)
pam_k3 <- pam(dist_matrix, k = 3, diss = TRUE)

# ==============================================================
# 3. ADICIONAR AO DATASET
# ==============================================================

periodo2_pam <- periodo2 %>%
  drop_na(all_of(vars_agrup)) %>%
  mutate(cluster_pam = factor(pam_k3$clustering))

interpretacao_pam <- periodo2_pam %>%
  group_by(cluster_pam) %>%
  summarise(
    n = n(),
    across(
      all_of(c(vars_agrup, vars_desemp)),
      ~ round(mean(., na.rm = TRUE), 4),
      .names = "{.col}_media"
    )
  ) %>%
  arrange(desc(n))

print(interpretacao_pam)


# ANOVA: ATIVOS ~ cluster_pam
anova_ativos_pam <- aov(ATIVOS_p2 ~ cluster_pam, data = periodo2_pam)
summary(anova_ativos_pam)

# ROA
anova_roa_pam <- aov(ROA_p2 ~ cluster_pam, data = periodo2_pam)
summary(anova_roa_pam)

anova_cpla_pam <- aov(CPLA_p2 ~ cluster_pam, data = periodo2_pam)
summary(anova_cpla_pam)

# ==============================================================
# 1. ADICIONAR CLUSTER E NOMEAR PERFIS (PAM)
# ==============================================================

periodo2_pam <- periodo2 %>%
  drop_na(all_of(vars_agrup)) %>%
  mutate(
    cluster_pam = factor(pam_k3$clustering),
    perfil = case_when(
      cluster_pam == 1 ~ "Cooperativas com IFDM e VAB Baixo",
      cluster_pam == 2 ~ "Cooperativas com Elevado IFDM e VAB",
      cluster_pam == 3 ~ "Cooperativas com IFDM Alto e Bom VAB"
    )
  ) %>%
  mutate(perfil = factor(perfil, levels = c(
    "Cooperativas com IFDM e VAB Baixo",
    "Cooperativas com Elevado IFDM e VAB",
    "Cooperativas com IFDM Alto e Bom VAB"
  )))

# ==============================================================
# 2. BOXPLOT DO ATIVOS (AGORA FUNCIONA!)
# ==============================================================

library(ggplot2)

ggplot(periodo2_pam, aes(x = perfil, y = ATIVOS_p2 / 1e6, fill = perfil)) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("#d73027", "#f46d43", "#1a9850")) +
  annotate("text", x = 2, y = max(periodo2_pam$ATIVOS_p2 / 1e6, na.rm = TRUE) * 0.95,
           label = "**p = 0,001", size = 5, fontface = "bold", color = "black") +
  labs(
    title = "Tamanho das Cooperativas por Perfil (PAM)",
    subtitle = "Diferença significativa (ANOVA, p = 0,001)",
    x = "Perfil Socioeconômico",
    y = "ATIVOS (milhões de R$)",
    caption = "Fonte: Elaboração própria"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 15, hjust = 1),
    legend.position = "none"
  )

###TESTAR PAM com K=4
library(cluster)

# ==============================================================
# 1. PAM COM k = 4
# ==============================================================

set.seed(123)
pam_k4 <- pam(dist(dados_scaled), k = 4, diss = TRUE)

# ==============================================================
# 2. ADICIONAR AO DATASET
# ==============================================================

periodo2_pam_k4 <- periodo2 %>%
  drop_na(all_of(vars_agrup)) %>%
  mutate(cluster_pam_k4 = factor(pam_k4$clustering))

# ==============================================================
# 3. INTERPRETAÇÃO: MÉDIAS POR CLUSTER (k=4)
# ==============================================================

interpretacao_pam_k4 <- periodo2_pam_k4 %>%
  group_by(cluster_pam_k4) %>%
  summarise(
    n = n(),
    across(
      all_of(c(vars_agrup, vars_desemp)),
      ~ round(mean(., na.rm = TRUE), 4),
      .names = "{.col}_media"
    )
  ) %>%
  arrange(desc(n))

print(interpretacao_pam_k4)

# ATIVOS
anova_ativos_k4 <- aov(ATIVOS_p2 ~ cluster_pam_k4, data = periodo2_pam_k4)
summary(anova_ativos_k4)

# ROA
anova_roa_k4 <- aov(ROA_p2 ~ cluster_pam_k4, data = periodo2_pam_k4)
summary(anova_roa_k4)

# CPLA
anova_cpla_k4 <- aov(CPLA_p2 ~ cluster_pam_k4, data = periodo2_pam_k4)
summary(anova_cpla_k4)


# Silhueta k=4
sil_pam_k4 <- silhouette(pam_k4$clustering, dist(dados_scaled))
cat("PAM k=4: Silhueta média =", round(mean(sil_pam_k4[, 3]), 3), "\n")

# Comparar com k=3
cat("PAM k=3: Silhueta média =", round(mean(sil_pam_k3[, 3]), 3), "\n")

p_pam_k4 <- fviz_cluster(pam_k4, data = dados_scaled,
                         geom = "point", ellipse.type = "convex",
                         palette = c("#d73027", "#f46d43", "#fdae61", "#1a9850"),
                         ggtheme = theme_minimal(base_size = 12)) +
  labs(
    title = "Teste de Sensibilidade: PAM com k = 4",
    subtitle = "Robusto a outliers | Base: IFDM e VAB setorial",
    caption = "Fonte: Elaboração própria"
  ) +
  theme(
    plot.title = element_text(face = "bold"),
    legend.position = "bottom"
  ) +
  guides(fill = guide_legend(title = "Cluster (PAM k=4)"))

print(p_pam_k4)


### pegando dados de 2017 a 2021 

library(readxl)
pibs <- read_excel("C:/Aula3/DadosCoopBrasil/IBGE/PIB_dos_Municipios_2010-2021.xlsx") %>%
  select(Código, Ano, Pib_agro, Pib_ind, Pib_serv, Pib_outros, VAB) %>%
  filter(Ano %in% 2017:2021)

library(readxl)
library(dplyr)
library(tidyr)

# ==============================================================
# 1. LER AS DUAS PLANILHAS
# ==============================================================

# IFDM Educação (2017–2021)
ifdm_edu <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Educacao_13_23.xlsx")  # ajuste o caminho
ifdm_emp_renda <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Emp_Renda_13_23.xlsx")  # ajuste o caminho



# PIBs (2017–2021)
#pibs <- read_excel("PIBs.xlsx")  # ajuste o caminho

pibs_clean <- pibs %>%
  mutate(
    Codigo = as.character(Código),
    Codigo = substr(Código, 1, nchar(Código) - 1),
    Codigo = as.numeric(Codigo)
  ) %>%
  select(
    Codigo, Ano,
    VAB_agro = Pib_agro,
    VAB_ind = Pib_ind,
    VAB_serv = Pib_serv,
    VAB_outros = Pib_outros
  )

ifdm_edu_long <- ifdm_edu %>%
  rename(Codigo = Código) %>%
  select(Codigo, `2017`, `2018`, `2019`, `2020`, `2021`) %>%
  mutate(Codigo = as.numeric(Codigo)) %>%
  pivot_longer(
    cols = `2017`:`2021`,
    names_to = "Ano",
    values_to = "IFDM_Educacao"
  ) %>%
  mutate(Ano = as.integer(Ano))


ifdm_emp_long <- ifdm_emp_renda %>%
  rename(Codigo = COD_MUNIC) %>%
  select(Codigo, `2017`, `2018`, `2019`, `2020`, `2021`) %>%
  mutate(
    Codigo = as.numeric(Codigo),
    across(`2017`:`2021`, as.numeric)  # <--- FORÇA TODAS PARA double
  ) %>%
  pivot_longer(
    cols = `2017`:`2021`,
    names_to = "Ano",
    values_to = "IFDM_Emprego_Renda"
  ) %>%
  mutate(Ano = as.integer(Ano))

df_completo_long <- ifdm_edu_long %>%
  left_join(ifdm_emp_long, by = c("Codigo", "Ano")) %>%
  left_join(pibs_clean, by = c("Codigo", "Ano")) %>%
  select(
    Codigo, Ano,
    IFDM_Educacao, IFDM_Emprego_Renda,
    VAB_agro, VAB_ind, VAB_serv, VAB_outros
  ) %>%
  drop_na(IFDM_Educacao, IFDM_Emprego_Renda, VAB_agro)

### AGORA PADRONIZAR OS DADOS

# ==============================================================
# 1. CONVERTER IFDM PARA NUMÉRICO (força coerção)
# ==============================================================

df_completo_long <- df_completo_long %>%
  mutate(
    IFDM_Educacao = as.numeric(as.character(IFDM_Educacao)),
    IFDM_Emprego_Renda = as.numeric(as.character(IFDM_Emprego_Renda))
  )

# Ou conte NAs
sum(is.na(df_cluster_novo$IFDM_Educacao))


library(dplyr)
library(cluster)
library(factoextra)


# ==============================================================
# FUNÇÃO WINSORIZE MANUAL (SEM DEPENDÊNCIAS)
# ==============================================================

winsorize <- function(x, lower = 0.01, upper = 0.99) {
  if (all(is.na(x))) return(x)
  quant <- quantile(x, probs = c(lower, upper), na.rm = TRUE)
  x[x < quant[1]] <- quant[1]
  x[x > quant[2]] <- quant[2]
  return(x)
}


library(dplyr)

# ==============================================================
# 1. MÉDIAS POR MUNICÍPIO
# ==============================================================

df_cluster_novo <- df_completo_long %>%
  group_by(Codigo) %>%
  summarise(
    IFDM_Educacao = mean(IFDM_Educacao, na.rm = TRUE),
    IFDM_Emprego_Renda = mean(IFDM_Emprego_Renda, na.rm = TRUE),
    VAB_agro = mean(VAB_agro, na.rm = TRUE),
    VAB_ind = mean(VAB_ind, na.rm = TRUE),
    VAB_serv = mean(VAB_serv, na.rm = TRUE),
    VAB_outros = mean(VAB_outros, na.rm = TRUE)
  ) %>%
  drop_na()

# ==============================================================
# 2. WINSORIZAR VAB BRUTO (COM FUNÇÃO MANUAL)
# ==============================================================

df_tratado <- df_cluster_novo %>%
  mutate(
    VAB_agro = winsorize(VAB_agro, 0.01, 0.99),
    VAB_ind = winsorize(VAB_ind, 0.01, 0.99),
    VAB_serv = winsorize(VAB_serv, 0.01, 0.99),
    VAB_outros = winsorize(VAB_outros, 0.01, 0.99)
  )

# ==============================================================
# 3. CALCULAR % DO VAB
# ==============================================================

df_vab_percent <- df_tratado %>%
  mutate(
    VAB_total = VAB_agro + VAB_ind + VAB_serv + VAB_outros,
    VAB_agro_pct = VAB_agro / VAB_total,
    VAB_ind_pct = VAB_ind / VAB_total,
    VAB_serv_pct = VAB_serv / VAB_total,
    VAB_outros_pct = VAB_outros / VAB_total
  ) %>%
  select(Codigo, IFDM_Educacao, IFDM_Emprego_Renda,
         VAB_agro_pct, VAB_ind_pct, VAB_serv_pct, VAB_outros_pct)

# ==============================================================
# 4. PADRONIZAR
# ==============================================================

dados_scaled <- df_vab_percent %>%
  select(-Codigo) %>%
  scale() %>%
  as.data.frame()

dados_scaled$Codigo <- df_vab_percent$Codigo


summary(dados_scaled)

# # ==============================================================
# # 1. CALCULAR MÉDIAS POR MUNICÍPIO (2017–2021)
# # ==============================================================
# 
# df_cluster_novo <- df_completo_long %>%
#   group_by(Codigo) %>%
#   summarise(
#     IFDM_Educacao = mean(IFDM_Educacao, na.rm = TRUE),
#     IFDM_Emprego_Renda = mean(IFDM_Emprego_Renda, na.rm = TRUE),
#     VAB_agro = mean(VAB_agro, na.rm = TRUE),
#     VAB_ind = mean(VAB_ind, na.rm = TRUE),
#     VAB_serv = mean(VAB_serv, na.rm = TRUE),
#     VAB_outros = mean(VAB_outros, na.rm = TRUE)
#   ) %>%
#   drop_na()  # Remove municípios sem dados completos
# 
# 
# # ==============================================================
# # 2. WINSORIZAR VAB BRUTO (ANTES DE %)
# # ==============================================================
# 
# df_tratado <- df_cluster_novo %>%
#   mutate(
#     across(
#       c(VAB_agro, VAB_ind, VAB_serv, VAB_outros),
#       ~ Winsorize(., probs = c(0.01, 0.99), na.rm = TRUE)
#     )
#   )
# 
# df_vab_percent <- df_cluster_novo %>%
#   mutate(
#     VAB_total = VAB_agro + VAB_ind + VAB_serv + VAB_outros,
#     VAB_agro_pct = VAB_agro / VAB_total,
#     VAB_ind_pct = VAB_ind / VAB_total,
#     VAB_serv_pct = VAB_serv / VAB_total,
#     VAB_outros_pct = VAB_outros / VAB_total
#   ) %>%
#   select(Codigo, IFDM_Educacao, IFDM_Emprego_Renda,
#          VAB_agro_pct, VAB_ind_pct, VAB_serv_pct, VAB_outros_pct)
# 
# 
# 
# 
# 
# dados_scaled_pct <- df_vab_percent %>%
#   select(-Codigo) %>%
#   scale() %>%
#   as.data.frame()

#dados_scaled_pct$Codigo <- df_vab_percent$Codigo


# 
# 
# variaveis_cluster <- c("IFDM_Educacao", "IFDM_Emprego_Renda",
#                        "VAB_agro", "VAB_ind", "VAB_serv", "VAB_outros")
# 
# dados_scaled_novo <- df_cluster_novo %>%
#   select(all_of(variaveis_cluster)) %>%
#   scale() %>%
#   as.data.frame()
# 
# # Adicionar Código para referência
# dados_scaled_novo$Codigo <- df_cluster_novo$Codigo



df_completo <- dados_do_banco

# Faz o merge apenas da coluna Cod_Munic do df_Art3 com base no CNPJ
df_completo <- merge(
  dados_do_banco,
  df_Art3[, c("CNPJ", "Cod_Munic")],
  by = "CNPJ",
  all.x = TRUE
)

df_completo_filtrado <- df_completo[df_completo$ANO >= 2017 & df_completo$ANO <= 2021, ]
df_completo_filtrado1 <- df_completo_filtrado[,c(1,2,12,13,15,16,17)]

df_completo_filtrado <- df_completo_filtrado1 %>%
  rename(
    SOBRAS = SOBRAS_BRUTAS,
    ATIVOS = ATIVOS_VERDADEIROS,
    ROA = SOBRAS_POR_ATIVO
  )



#########################################################################
###GERANDO CPLA => busquei os dados no Banco de Dados externo https://console.neon.tech/app/projects/rough-fire-80958542/branches/br-raspy-dew-adixrqsp/tables
library(dplyr)
dados_do_banco <- dados_do_banco %>%
  mutate(PL = round(SOBRAS_BRUTAS / SOBRAS_BRUTA_POR_PL, 2))

dados_do_banco <- dados_do_banco %>%
  arrange(CNPJ, ANO) %>% 
  group_by(CNPJ) %>%
  mutate(CPLA = (PL / lag(PL) - 1) * 100) %>%
  ungroup()

dados_do_banco <- dados_do_banco %>%
  rename(`CPLA_%` = CPLA)

names(dados_do_banco)

dados_do_banco_filtrado <- dados_do_banco %>%
  filter(ANO >= 2017 & ANO <= 2021)

df_completo_final <- df_completo_filtrado1 %>%
  left_join(
    dados_do_banco_filtrado %>% select(CNPJ, ANO, `CPLA_%`),
    by = c("CNPJ", "ANO")
  )

df_var_cluster <- dados_scaled_pct
df_var_desempenho <- df_completo_final  

# ==============================================================
# REMOVER O ÚLTIMO DÍGITO DO Cod_Munic (dígito verificador IBGE)
# ==============================================================

df_final_des_medias17_21 <- df_final_des_medias17_21 %>%
  mutate(
    Cod_Munic = as.character(Cod_Munic),                    # Converte para texto
    Cod_Munic = substr(Cod_Munic, 1, nchar(Cod_Munic) - 1), # Remove o último caractere
    Cod_Munic = as.numeric(Cod_Munic)                       # Volta para número
  )
df_var_cluster <- df_var_cluster %>%
  rename(Cod_Munic = Codigo)

df_var_desempenho <- df_completo_final %>%
  rename(
    SOBRAS = SOBRAS_BRUTAS,
    ATIVOS = ATIVOS_VERDADEIROS,
    ROA = SOBRAS_POR_ATIVO
  )

head(df_medias_cnpj)
summary(df_var_desempenho$ANO)  # Deve ser entre 1 e 5


library(dplyr)

# ==============================================================
# 1. ORDENAR POR ANO (descendente) → mais recente primeiro
# ==============================================================

df_ordenado <- df_var_desempenho %>%
  arrange(CNPJ, desc(ANO))

# ==============================================================
# 2. MÉDIAS DAS VARIÁVEIS + PEGAR ÚLTIMO VALOR DAS OUTRAS COLUNAS
# ==============================================================

df_medias_cnpj <- df_ordenado %>%
  group_by(CNPJ, NOME_INSTITUICAO) %>%
  summarise(
    # Médias
    ATIVOS_media = mean(ATIVOS, na.rm = TRUE),
    ROA_media = mean(ROA, na.rm = TRUE),
    SOBRAS_media = mean(SOBRAS, na.rm = TRUE),
    CPLA_media = mean(`CPLA_%`, na.rm = TRUE),
    
    # Último valor (ANO mais recente)
    Cod_Munic = last(Cod_Munic),
    
    # Se houver outras colunas, use last() ou first()
    # Ex: outra_coluna = last(outra_coluna),
    
    .groups = "drop"
  )


df_final_des_medias17_21 <- df_medias_cnpj
df_final_clu_medias17_21 <- df_var_cluster

###########winzorizacao e scela

library(dplyr)

# --- opções do tratamento ---
vars_winz <- c("ATIVOS_media", "ROA_media", "SOBRAS_media", "CPLA_media")
probs_wz  <- c(0.01, 0.99)   # 1% e 99% (ajuste se quiser)

# --- funções auxiliares (sem DescTools) ---
winsorize_vec <- function(x, probs = c(0.01, 0.99)) {
  if (all(is.na(x))) return(x)
  qs <- quantile(x, probs = probs, na.rm = TRUE, names = FALSE, type = 7)
  x <- pmax(pmin(x, qs[2]), qs[1])
  x
}

scale_safely <- function(x) {
  m <- mean(x, na.rm = TRUE)
  s <- sd(x,   na.rm = TRUE)
  if (is.na(s) || s == 0) return(ifelse(is.na(x), NA_real_, 0))  # sd=0 => tudo vira 0
  (x - m) / s
}

# --- pipeline: copia, winsoriza, padroniza, limpa ---
df_tratado <- df_final_des_medias17_21 %>%         # use seu nome de df origem
  # cria colunas winsorizadas com sufixo _wz
  mutate(across(all_of(vars_winz),
                \(x) winsorize_vec(x, probs_wz),
                .names = "{.col}_wz")) %>%
  # cria colunas padronizadas (z-score) a partir das _wz, com sufixo _z
  mutate(across(ends_with("_wz"),
                scale_safely,
                .names = "{.col}_z")) %>%
  # remove linhas com NA/Inf nas colunas padronizadas
  filter(if_all(ends_with("_wz_z"), ~ is.finite(.x)))

# --- checagem rápida ---
summary(df_tratado %>% select(ends_with("_wz"), ends_with("_wz_z")))


##AGORA df_tratado é o df com as variaveis de desempenho winso e padrinizadas


library(dplyr)

# ==============================================================
# 1. CONVERTER Cod_Munic PARA character NOS DOIS DATAFRAMES
# ==============================================================

df_final_des_medias17_21 <- df_final_des_medias17_21 %>%
  mutate(Cod_Munic = as.character(Cod_Munic))

df_final_clu_medias17_21 <- df_final_clu_medias17_21 %>%
  mutate(Cod_Munic = as.character(Cod_Munic))

# ==============================================================
# 2. JUNTAR OS DOIS DATAFRAMES (agora compatível!)
# ==============================================================

df_cluster_base <- df_final_clu_medias17_21 %>%
  left_join(df_final_des_medias17_21, by = "Cod_Munic") %>%
  drop_na()  # Remove linhas sem dados completos




winsorize <- function(x, lower = 0.01, upper = 0.99) {
  if (all(is.na(x))) return(x)
  quant <- quantile(x, probs = c(lower, upper), na.rm = TRUE)
  x[x < quant[1]] <- quant[1]
  x[x > quant[2]] <- quant[2]
  return(x)
}
df_tratado <- df_cluster_base %>%
  mutate(
    ATIVOS_media = winsorize(ATIVOS_media, 0.01, 0.99),
    SOBRAS_media = winsorize(SOBRAS_media, 0.01, 0.99),
    CPLA_media = winsorize(CPLA_media, 0.01, 0.99),
    ROA_media = winsorize(ROA_media, 0.01, 0.99)
  )

summary(df_tratado$ATIVOS_media)
boxplot(df_tratado$CPLA_media, main = "ATIVOS (winsorizado)")



#### INICIANDO A ANALISE DE CLUSTER DO PERIODO 2017-2021

library(dplyr)
library(cluster)
library(factoextra)
library(NbClust)

# ==============================================================
# 1. DEFINIR VARIÁVEIS DE AGRUPAMENTO (PADRONIZADAS)
# ==============================================================

vars_agrup <- c("IFDM_Educacao", "IFDM_Emprego_Renda",
                "VAB_agro", "VAB_ind", "VAB_serv", "VAB_outros")

dados_cluster <- df_tratado %>%
  select(all_of(vars_agrup)) %>%
  drop_na()


p_elbow <- fviz_nbclust(dados_cluster, kmeans, method = "wss", k.max = 8) +
  geom_vline(xintercept = 3, linetype = "dashed", color = "red", size = 1) +
  labs(
    title = "Método do Cotovelo",
    subtitle = "Soma dos Quadrados Intra-Cluster",
    x = "Número de Clusters (k)",
    y = "Total Within SS"
  ) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold"))

print(p_elbow)



p_sil <- fviz_nbclust(dados_cluster, kmeans, method = "silhouette", k.max = 8) +
  labs(
    title = "Método da Silhueta",
    subtitle = "Largura Média da Silhueta",
    x = "Número de Clusters (k)",
    y = "Largura Média"
  ) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold"))

print(p_sil)

set.seed(123)
gap_stat <- clusGap(dados_cluster, FUN = kmeans, nstart = 25, K.max = 8, B = 50)

p_gap <- fviz_gap_stat(gap_stat) +
  labs(
    title = "Estatística Gap",
    subtitle = "Comparação com Dados Nulos",
    x = "Número de Clusters (k)",
    y = "Gap Statistic"
  ) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold"))

print(p_gap)

# ==============================================================
# GRÁFICO NBCLUST MANUAL (SEM ERRO)
# ==============================================================

# Extrair votos por k
votos <- data.frame(
  k = as.integer(names(table(nb$Best.nc[1, ]))),
  votos = as.integer(table(nb$Best.nc[1, ]))
) %>%
  filter(!is.na(k)) %>%
  arrange(k)

# k com mais votos
k_maioria <- votos$k[which.max(votos$votos)]

# Gráfico
p_nb <- ggplot(votos, aes(x = factor(k), y = votos)) +
  geom_col(fill = "#2c7bb6", width = 0.6, alpha = 0.9) +
  geom_text(aes(label = votos), vjust = -0.8, size = 5, fontface = "bold", color = "black") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(
    title = "NbClust: 30 Índices de Validação",
    subtitle = paste("Maioria (", max(votos$votos), " índices) sugere k =", k_maioria),
    x = "Número de Clusters (k)",
    y = "Número de Índices que Sugerem k"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray30"),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank()
  )

print(p_nb)


library(patchwork)

(p_elbow | p_sil) / (p_gap | p_nb) +
  plot_annotation(
    title = "Validação do Número Ótimo de Clusters (k)",
    subtitle = "Métodos: Cotovelo, Silhueta, Gap e NbClust",
    theme = theme(plot.title = element_text(size = 16, face = "bold"))
  )

##### TESTE COM PAM

library(cluster)
library(factoextra)
library(dplyr)

# ==============================================================
# 1. USAR df_tratado (variáveis de agrupamento já padronizadas)
# ==============================================================

vars_agrup <- c("IFDM_Educacao", "IFDM_Emprego_Renda",
                "VAB_agro", "VAB_ind", "VAB_serv", "VAB_outros")

dados_scaled <- df_tratado %>%
  select(all_of(vars_agrup)) %>%
  drop_na()


testar_pam_k <- function(k_values = 2:8) {
  resultados <- data.frame(k = k_values, silhueta = NA, tot_within = NA)
  
  for (k in k_values) {
    set.seed(123)
    pam_fit <- pam(dados_scaled, k = k)
    
    # Silhueta
    sil <- silhouette(pam_fit$clustering, dist(dados_scaled))
    resultados$silhueta[resultados$k == k] <- mean(sil[, 3])
    
    # Elbow (distância total aos medoides)
    resultados$tot_within[resultados$k == k] <- pam_fit$objective[2]
  }
  
  return(resultados)
}

# Rodar
validacao_pam <- testar_pam_k(2:8)
print(validacao_pam)

# Silhueta
p_sil_pam <- ggplot(validacao_pam, aes(x = k, y = silhueta)) +
  geom_line(color = "blue", size = 1) +
  geom_point(size = 3, color = "blue") +
  geom_vline(xintercept = 3, linetype = "dashed", color = "red", size = 1) +
  labs(
    title = "Silhueta Média por k (PAM)",
    subtitle = "Pico em k = 3",
    x = "Número de Clusters (k)",
    y = "Silhueta Média"
  ) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold"))

# Elbow
p_elbow_pam <- ggplot(validacao_pam, aes(x = k, y = tot_within)) +
  geom_line(color = "darkgreen", size = 1) +
  geom_point(size = 3, color = "darkgreen") +
  geom_vline(xintercept = 3, linetype = "dashed", color = "red", size = 1) +
  labs(
    title = "Elbow: Distância Total aos Medoides (PAM)",
    subtitle = "Inflexão em k = 3",
    x = "Número de Clusters (k)",
    y = "Total Medoid Distance"
  ) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold"))

# Combinar
library(patchwork)
p_sil_pam + p_elbow_pam


library(cluster)
library(factoextra)


# ==============================================================
# 1. FUNÇÃO CORRETA PARA clusGap COM PAM
# ==============================================================

pam_gap_function <- function(x, k) {
  # x = dados escalados, k = número de clusters
  pam_result <- pam(x, k = k)
  # Retorna um objeto com $cluster
  return(list(cluster = pam_result$clustering))
}

# ==============================================================
# 2. RODAR GAP STATISTIC
# ==============================================================

set.seed(123)
gap_pam <- clusGap(
  x = dados_scaled,
  FUNcluster = pam_gap_function,
  K.max = 8,
  B = 50
)

# ==============================================================
# 3. GRÁFICO GAP
# ==============================================================

p_gap_pam <- fviz_gap_stat(gap_pam) +
  labs(
    title = "Gap Statistic com PAM",
    subtitle = "k = primeiro onde Gap > Gap(k+1) - SE",
    x = "Número de Clusters (k)",
    y = "Gap Statistic"
  ) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold"))

print(p_gap_pam)
print(gap_pam$Tab)

#### CONCLUSAO
### KMEANS sugere 2 a 3
### PAM sugere 3


#############
### AGORA MANTANDO OS CLUSTERS PAM com k=3

library(cluster)
library(dplyr)

# ==============================================================
# 1. EXTRAIR VARIÁVEIS DE AGRUPAMENTO (JÁ PADRONIZADAS)
# ==============================================================

vars_agrup <- c("IFDM_Educacao", "IFDM_Emprego_Renda",
                "VAB_agro", "VAB_ind", "VAB_serv", "VAB_outros")

dados_scaled <- df_tratado %>%
  select(all_of(vars_agrup)) %>%
  drop_na()

# ==============================================================
# 2. PAM k=3 (ROBUSTO E FINAL)
# ==============================================================

dist_matrix <- dist(dados_scaled)

set.seed(123)
pam_final <- pam(dist_matrix, k = 3, diss = TRUE)

# ==============================================================
# 3. ADICIONAR CLUSTER AO DATASET ORIGINAL
# ==============================================================

df_cluster_final <- df_tratado %>%
  filter(!is.na(IFDM_Educacao)) %>%  # Alinhar com dados_scaled
  mutate(
    cluster = factor(pam_final$clustering),
    perfil = case_when(
      cluster == 1 ~ "Baixo IFDM e VAB",
      cluster == 2 ~ "Médio IFDM e VAB",
      cluster == 3 ~ "Alto IFDM e VAB"
    )
  )


tabela_final <- df_cluster_final %>%
  group_by(perfil) %>%
  summarise(
    n = n(),
    IFDM_Educacao = round(mean(IFDM_Educacao, na.rm = TRUE), 3),
    IFDM_Emprego_Renda = round(mean(IFDM_Emprego_Renda, na.rm = TRUE), 3),
    VAB_agro = round(mean(VAB_agro, na.rm = TRUE), 0),
    ATIVOS_media = round(mean(ATIVOS_media, na.rm = TRUE), 0),
    ROA_media = round(mean(ROA_media, na.rm = TRUE), 4),
    SOBRAS_media = round(mean(SOBRAS_media, na.rm = TRUE), 0),
    CPLA_media = round(mean(CPLA_media, na.rm = TRUE), 2),
    .groups = "drop"
  ) %>%
  arrange(desc(ATIVOS_media))

print(tabela_final)


summary(dados_scaled)

####### refazendo

library(cluster)
library(dplyr)
library(cluster)
library(dplyr)

# ==============================================================
# 1. VARIÁVEIS DE AGRUPAMENTO (JÁ PADRONIZADAS)
# ==============================================================

vars_agrup <- c("IFDM_Educacao", "IFDM_Emprego_Renda",
                "VAB_agro", "VAB_ind", "VAB_serv", "VAB_outros")

dados_cluster <- df_tratado %>%
  select(all_of(vars_agrup)) %>%
  drop_na()

set.seed(123)
pam_final <- pam(dist_matrix, k = 3, diss = TRUE)

# ==============================================================
# 4. ADICIONAR CLUSTER AO DATASET COMPLETO
# ==============================================================

df_cluster_final <- df_tratado %>%
  filter(complete.cases(select(., all_of(vars_agrup)))) %>%
  mutate(
    cluster = factor(pam_final$clustering),
    perfil = case_when(
      cluster == 1 ~ "Baixo IFDM e VAB",
      cluster == 2 ~ "Médio IFDM e VAB",
      cluster == 3 ~ "Alto IFDM e VAB"
    )
  )


tabela_final <- df_cluster_final %>%
  group_by(perfil) %>%
  summarise(
    n = n(),
    prop = round(n / sum(n) * 100, 1),
    # Agrupamento
    IFDM_Educacao = round(mean(IFDM_Educacao), 3),
    VAB_agro = round(mean(VAB_agro), 0),
    # Desempenho (NÃO usado no cluster!)
    ATIVOS_media = round(mean(ATIVOS_media), 0),
    ROA_media = round(mean(ROA_media), 4),
    .groups = "drop"
  ) %>%
  arrange(desc(ATIVOS_media))

print(tabela_final)


#### NOVO TESTE
# Pacotes
library(dplyr)
library(cluster)
library(factoextra)

set.seed(123)

# ---- 1) Seleção das 6 variáveis (com checagens) ----
vars_pam <- c("IFDM_Educacao","IFDM_Emprego_Renda",
              "VAB_agro","VAB_ind","VAB_serv","VAB_outros")

faltando <- setdiff(vars_pam, names(df_tratado))
if (length(faltando)) stop("Colunas ausentes em df_tratado: ", paste(faltando, collapse=", "))

X <- df_tratado %>%
  select(all_of(vars_pam))

# garantir que são numéricas e imputar NAs por mediana (PAM não aceita NA)
if (!all(sapply(X, is.numeric))) stop("Há colunas não-numéricas entre as 6 selecionadas.")
X <- X %>% mutate(across(everything(), ~ ifelse(is.na(.x), median(.x, na.rm=TRUE), .x)))

# remover colunas constantes (var = 0), se existirem
const_cols <- names(X)[sapply(X, function(v) sd(v, na.rm=TRUE) == 0)]
if (length(const_cols)) X <- X %>% select(-all_of(const_cols))

# ---- 2) PAM k=3 (euclidiana) ----
pam_fit <- pam(X, k = 2, metric = "euclidean", stand = FALSE)

# qualidade (silhueta média)
pam_fit$silinfo$avg.width

# ---- 3) Anexar rótulos ao df original ----
df_tratado <- df_tratado %>%
  mutate(Cluster_PAM3 = factor(pam_fit$clustering))

# ---- 4) Resumo por cluster (medianas das 6 variáveis) ----
resumo_clusters <- df_tratado %>%
  group_by(Cluster_PAM3) %>%
  summarise(across(all_of(vars_pam), median, na.rm = TRUE), .groups="drop")
print(resumo_clusters)

# ---- 5) Visualização (redução 2D automática) ----
fviz_cluster(pam_fit, data = X, geom = "point")



library(ggplot2)
library(tidyr)

# Transformar para longo
dados_long <- dados_scaled %>%
  pivot_longer(everything(), names_to = "Variavel", values_to = "Valor")

# Boxplot
ggplot(dados_long, aes(x = Variavel, y = Valor)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Boxplot: Outliers nas Variáveis de Agrupamento (Padronizadas)",
       x = "Variável", y = "Valor Padronizado") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


##### NOVO DIA 31.10.25
# Pelo summary(dados_scaled) que você compartilhou, os dados parecem bem padronizados 
# (média próxima de 0, desvio-padrão próximo de 1 em todas as variáveis), o que é ótimo 
# para o cluster. Isso confirma que a transformação em % do VAB + winsorização funcionou 
# corretamente. Não há problemas graves — vamos prosseguir com a formação do cluster PAM k=3 
# usando esses dados.

library(cluster)
library(dplyr)

# ==============================================================
# 1. USAR DADOS JÁ PADRONIZADOS (SOMENTE AGRUPAMENTO)
# ==============================================================

df_tratado


library(dplyr)
library(stringr)

# --- 1) Definir variáveis tratadas (winsorizadas + padronizadas) ---
vars_desempenho_z <- c("ATIVOS_media_wz_z", "ROA_media_wz_z",
                       "SOBRAS_media_wz_z", "CPLA_media_wz_z")

# --- 2) Criar novo data frame apenas com as variáveis desejadas ---
df_desempenho_tratado <- df_tratado %>%
  select(Cod_Munic, all_of(vars_desempenho_z)) %>%
  # renomear Cod_Munic -> Codigo e remover o dígito verificador (último)
  mutate(
    Codigo = str_sub(as.character(Cod_Munic), 1, nchar(as.character(Cod_Munic)) - 1)
  ) %>%
  select(Codigo, all_of(vars_desempenho_z)) %>%
  # garantir que Codigo seja numérico
  mutate(Codigo = as.numeric(Codigo))

# --- 3) Conferir resultado ---
glimpse(df_desempenho_tratado)
summary(df_desempenho_tratado)

library(dplyr)

# --- 1) Juntar os dois data frames pela coluna 'Codigo' ---
df_completo <- df_desempenho_tratado %>%
  inner_join(dados_scaled, by = "Codigo") %>%
  drop_na()

# --- 2) Conferir resultado ---
glimpse(df_completo)
summary(df_completo)


# --- 1) Renomear todas as colunas (exceto Codigo) adicionando o sufixo _wz_z ---
df_completo <- df_completo %>%
  rename_with(~ ifelse(.x != "Codigo", paste0(.x, "_wz_z"), .x))

# --- 2) Conferir resultado ---
names(df_completo)


# --- 1) Corrigir nomes duplicados (_wz_z_wz_z → _wz_z) ---
names(df_completo) <- str_replace_all(names(df_completo), "_wz_z_wz_z$", "_wz_z")

# --- 2) Conferir o resultado final ---
names(df_completo)

####INICIANDO AS ANALISES

vars_agrupamento <- c("IFDM_Educacao_wz_z", "IFDM_Emprego_Renda_wz_z",
                      "VAB_agro_pct_wz_z", "VAB_ind_pct_wz_z",
                      "VAB_serv_pct_wz_z", "VAB_outros_pct_wz_z")

dados_cluster <- df_completo %>%
  select(Codigo, all_of(vars_agrupamento))


library(cluster)

dist_matrix <- dist(dados_cluster %>% select(-Codigo), method = "euclidean")

set.seed(123)
pam_fit <- pam(dist_matrix, k = 3, diss = TRUE)


pam_fit$silinfo$avg.width
#[1] 0.2810199



###CONFIRMANDO O NUMERO DE CLUSTERS 
################################
library(factoextra)

set.seed(123)

fviz_nbclust(
  df_completo %>% select(IFDM_Educacao_wz_z, IFDM_Emprego_Renda_wz_z,
                         VAB_agro_pct_wz_z, VAB_ind_pct_wz_z,
                         VAB_serv_pct_wz_z, VAB_outros_pct_wz_z),
  FUNcluster = pam,
  method = "silhouette"
)

fviz_nbclust(
  df_completo %>% select(IFDM_Educacao_wz_z, IFDM_Emprego_Renda_wz_z,
                         VAB_agro_pct_wz_z, VAB_ind_pct_wz_z,
                         VAB_serv_pct_wz_z, VAB_outros_pct_wz_z),
  FUNcluster = pam,
  method = "wss"
)

library(cluster)
library(factoextra)

for (k in 2:5) {
  pam_k <- pam(df_completo %>%
                 select(IFDM_Educacao_wz_z, IFDM_Emprego_Renda_wz_z,
                        VAB_agro_pct_wz_z, VAB_ind_pct_wz_z,
                        VAB_serv_pct_wz_z, VAB_outros_pct_wz_z),
               k = k)
  
  cat("\nSilhueta média para k =", k, ":", pam_k$silinfo$avg.width, "\n")
  print(fviz_cluster(pam_k,
                     data = df_completo %>%
                       select(IFDM_Educacao_wz_z, IFDM_Emprego_Renda_wz_z,
                              VAB_agro_pct_wz_z, VAB_ind_pct_wz_z,
                              VAB_serv_pct_wz_z, VAB_outros_pct_wz_z),
                     geom = "point"))
}

###################################

###BOX PLOT
library(ggplot2)
library(tidyr)
library(dplyr)

# --- 1) Definir variáveis de agrupamento ---
vars_agrup <- c("IFDM_Educacao_wz_z", "IFDM_Emprego_Renda_wz_z",
                "VAB_agro_pct_wz_z", "VAB_ind_pct_wz_z",
                "VAB_serv_pct_wz_z", "VAB_outros_pct_wz_z")

# --- 2) Garantir que o cluster esteja como fator ---
df_completo <- df_completo %>%
  mutate(Cluster_PAM = factor(pam_fit$clustering))

# --- 3) Transformar o data frame para formato "longo" (tidy) ---
df_box <- df_completo %>%
  select(Cluster_PAM, all_of(vars_agrup)) %>%
  pivot_longer(cols = all_of(vars_agrup),
               names_to = "Variavel",
               values_to = "Valor")

# --- 4) Gerar o boxplot ---
ggplot(df_box, aes(x = Cluster_PAM, y = Valor, fill = Cluster_PAM)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Distribuição das Variáveis de Agrupamento por Cluster",
    x = "Cluster",
    y = "Valor Padronizado (z-score)",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "bottom",
    strip.text = element_text(face = "bold", size = 11)
  )

######A ANALISES
### BOX PLOT DAS VARIÁVEIS DE AGRUPAMENTO (k = 3)
library(ggplot2)
library(tidyr)
library(dplyr)

library(cluster)

# Definir as variáveis de agrupamento (as mesmas usadas no boxplot)
vars_agrup <- c("IFDM_Educacao_wz_z", "IFDM_Emprego_Renda_wz_z",
                "VAB_agro_pct_wz_z", "VAB_ind_pct_wz_z",
                "VAB_serv_pct_wz_z", "VAB_outros_pct_wz_z")

# Executar o PAM com k = 3
set.seed(123)
pam_fit3 <- pam(df_completo %>% select(all_of(vars_agrup)), k = 3, metric = "euclidean")

df_completo <- df_completo %>%
  mutate(Cluster_PAM3 = factor(pam_fit3$clustering))



# --- 3) Converter para formato longo (tidy) ---
df_box <- df_completo %>%
  select(Cluster_PAM3, all_of(vars_agrup)) %>%
  pivot_longer(cols = all_of(vars_agrup),
               names_to = "Variavel",
               values_to = "Valor")

# --- 4) Gerar o boxplot ---
ggplot(df_box, aes(x = Cluster_PAM3, y = Valor, fill = Cluster_PAM3)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Distribuição das Variáveis de Agrupamento por Cluster (k = 3)",
    x = "Cluster",
    y = "Valor Padronizado (z-score)",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "bottom",
    strip.text = element_text(face = "bold", size = 11)
  )

# --- 3) Transformar para formato longo (tidy) ---
vars_agrup <- c("IFDM_Educacao_wz_z","IFDM_Emprego_Renda_wz_z",
                "VAB_agro_pct_wz_z","VAB_ind_pct_wz_z",
                "VAB_serv_pct_wz_z","VAB_outros_pct_wz_z")

df_box <- df_completo %>%
  select(Cluster_PAM3, all_of(vars_agrup)) %>%
  tidyr::pivot_longer(cols = all_of(vars_agrup),
                      names_to = "Variavel",
                      values_to = "Valor")

# (opcional) rótulos amigáveis nas facetas
lab_vars <- c(
  IFDM_Educacao_wz_z = "IFDM Educação",
  IFDM_Emprego_Renda_wz_z = "IFDM Emprego & Renda",
  VAB_agro_pct_wz_z = "VAB Agro (%)",
  VAB_ind_pct_wz_z  = "VAB Indústria (%)",
  VAB_serv_pct_wz_z = "VAB Serviços (%)",
  VAB_outros_pct_wz_z = "VAB Outros (%)"
)

# --- 4) Boxplot ---
library(ggplot2)

p <- ggplot(df_box, aes(x = Cluster_PAM3, y = Valor, fill = Cluster_PAM3)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3,
             labeller = as_labeller(lab_vars)) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Distribuição das Variáveis de Agrupamento por Cluster (k = 3)",
       x = "Cluster", y = "Valor padronizado (z-score)", fill = "Cluster") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom",
        strip.text = element_text(face = "bold", size = 11))

print(p)

# (opcional) salvar
ggsave("boxplot_clusters_k3.png", p, width = 11, height = 7, dpi = 300)


### ANÁLISE DAS VARIÁVEIS DE DESEMPENHO ###

library(dplyr)
library(tidyr)
library(ggplot2)
library(knitr)

# --- 1) Definir variáveis de desempenho ---
vars_desemp <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

# --- 2) Estatísticas descritivas por cluster ---
tab_desemp <- df_completo %>%
  group_by(Cluster_PAM3) %>%
  summarise(across(all_of(vars_desemp),
                   list(mean = mean, median = median, sd = sd),
                   .names = "{.col}_{.fn}"),
            n = n(),
            .groups = "drop")

# --- Corrigir arredondamento das colunas numéricas ---
tab_desemp_round <- tab_desemp %>%
  mutate(across(where(is.numeric), ~ round(.x, 3)))

# Exibir a tabela
knitr::kable(tab_desemp_round,
             caption = "Estatísticas descritivas das variáveis de desempenho por cluster (k = 3)")

# --- 3) Teste de diferença entre clusters ---
for (v in vars_desemp) {
  cat("\n\nKruskal–Wallis para", v, ":\n")
  print(kruskal.test(df_completo[[v]] ~ df_completo$Cluster_PAM3))
}

# --- 4) Boxplots comparativos das variáveis de desempenho ---
df_box_desemp <- df_completo %>%
  select(Cluster_PAM3, all_of(vars_desemp)) %>%
  pivot_longer(cols = all_of(vars_desemp),
               names_to = "Variavel", values_to = "Valor")

ggplot(df_box_desemp, aes(x = Cluster_PAM3, y = Valor, fill = Cluster_PAM3)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Desempenho das Cooperativas por Cluster Socioeconômico (k = 3)",
       x = "Cluster",
       y = "Valor padronizado (z-score)",
       fill = "Cluster") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom",
        strip.text = element_text(face = "bold", size = 11))

#####
#CAPTURANDO OS DADOS

library(openxlsx)

# Criar workbook
wb <- createWorkbook()

# 1. Estatísticas descritivas
addWorksheet(wb, "Resumo_Desempenho")
writeData(wb, "Resumo_Desempenho", tab_desemp_round)

# 2. Teste Kruskal–Wallis
# (vamos capturar os resultados e transformar em tabela)
kw_results <- lapply(vars_desemp, function(v) {
  test <- kruskal.test(df_completo[[v]] ~ df_completo$Cluster_PAM3)
  data.frame(
    Variavel = v,
    Estatistica_H = round(test$statistic, 3),
    gl = test$parameter,
    p_valor = round(test$p.value, 4)
  )
}) %>% bind_rows()

addWorksheet(wb, "Teste_Kruskal")
writeData(wb, "Teste_Kruskal", kw_results)

# Salvar arquivo Excel
saveWorkbook(wb, "c:/Aula3/docs/Resultados_Desempenho_Clusters.xlsx", overwrite = TRUE)

cat("Arquivo salvo com sucesso: Resultados_Desempenho_Clusters.xlsx\n")


### PÓS-TESTE DE DUNN PARA COMPARAÇÕES MÚLTIPLAS ###
library(FSA)  # contém a função dunnTest()

# --- 1) Definir as variáveis de desempenho para o pós-teste ---
vars_desemp <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

# --- 2) Executar o Dunn para cada variável ---
resultados_dunn <- list()

for (v in vars_desemp) {
  cat("\n\n### Pós-teste de Dunn para", v, "###\n")
  dunn_res <- dunnTest(df_completo[[v]] ~ df_completo$Cluster_PAM3,
                       method = "bonferroni")  # ou "holm" (menos conservador)
  print(dunn_res)
  
  # Guardar resultados em lista
  resultados_dunn[[v]] <- dunn_res$res
}

# --- 3) Consolidar todos os resultados em uma única tabela ---
library(dplyr)
dunn_tabela <- bind_rows(resultados_dunn, .id = "Variavel")

# --- 4) Visualizar as comparações e p-valores ajustados ---
knitr::kable(dunn_tabela,
             digits = 4,
             caption = "Pós-teste de Dunn para comparações múltiplas entre clusters (método Bonferroni)")


####CRIANDO EXCEL COM OS DADOS
library(dplyr)
library(openxlsx)

# --- Criar tabela resumo dos resultados do pós-teste de Dunn ---
tabela_resumo <- tribble(
  ~Variavel,             ~Comparacoes_Significativas,           ~Interpretacao,
  "ATIVOS_media_wz_z",   "Nenhuma",                            "O porte médio das cooperativas (ativos) não difere entre os clusters socioeconômicos, indicando que o tamanho das instituições parece ser menos dependente das condições regionais.",
  "ROA_media_wz_z",      "Tendência entre Clusters 2 e 3 (p = 0.0768)", "Há indícios de maior rentabilidade (ROA) em regiões mais desenvolvidas, embora sem significância estatística ao nível de 5%.",
  "CPLA_media_wz_z",     "Diferenças significativas entre Clusters 1×3 e 2×3 (p < 0.001)", "O crescimento do patrimônio líquido é significativamente maior em regiões socioeconomicamente mais desenvolvidas, evidenciando a influência do contexto regional sobre a expansão das cooperativas."
)

# --- Exportar para Excel ---
write.xlsx(tabela_resumo,
           file = "c:/Aula3/docs/Resumo_Dunn_Clusters.xlsx",
           sheetName = "Resultados_PósTeste",
           overwrite = TRUE)

# Mensagem opcional
cat("✅Arquivo 'Resumo_Dunn_Clusters.xlsx' criado com sucesso na pasta de trabalho.\n")



#####REFAZNENDO 31.10.25

library(dplyr)
library(cluster)
library(tidyr)
library(ggplot2)
library(FSA)      # dunnTest
library(knitr)    # kable

# ===== Aponte seu DF ORIGINAL (sem winsor) =====
# Deve conter: Codigo, IFDM_Educacao, IFDM_Emprego_Renda, VAB_agro, VAB_ind, VAB_serv, VAB_outros
df_original <- df_cluster_novo

# 1. VAB em percentuais (estrutura produtiva)
setores <- c("VAB_agro","VAB_ind","VAB_serv","VAB_outros")

df_vab_pct <- df_original %>%
  mutate(
    VAB_total = rowSums(across(all_of(setores))),
    VAB_agro_pct   = VAB_agro   / VAB_total,
    VAB_ind_pct    = VAB_ind    / VAB_total,
    VAB_serv_pct   = VAB_serv   / VAB_total,
    VAB_outros_pct = VAB_outros / VAB_total
  ) %>%
  select(Codigo, IFDM_Educacao, IFDM_Emprego_Renda,
         VAB_agro_pct, VAB_ind_pct, VAB_serv_pct, VAB_outros_pct) %>%
  filter(if_all(-Codigo, ~ is.finite(.x))) %>%
  filter(if_all(starts_with("VAB_"), ~ .x >= 0 & .x <= 1))

# 2. Padronização (z-score) — SUFIXO _z (sem winsor!)
df_agrup_z <- df_vab_pct %>%
  mutate(across(-Codigo, ~ as.numeric(scale(.x)), .names = "{.col}_z"))

# Variáveis de agrupamento (todas com _z)
vars_agrup <- c("IFDM_Educacao_z","IFDM_Emprego_Renda_z",
                "VAB_agro_pct_z","VAB_ind_pct_z","VAB_serv_pct_z","VAB_outros_pct_z")


set.seed(123)
pam_fit3 <- pam(df_agrup_z %>% select(all_of(vars_agrup)),
                k = 3, metric = "euclidean")

# Coloca o cluster no df de agrupamento
df_agrup_z <- df_agrup_z %>%
  mutate(Cluster_PAM3 = factor(pam_fit3$clustering))


# ===== 3) Variáveis de desempenho (MANTER nomes *_wz_z) =====
# df_desempenho_tratado deve ter: Codigo, ATIVOS_media_wz_z, ROA_media_wz_z, CPLA_media_wz_z

# ===== 4) Montar df_completo (agrupamento _z + desempenho *_wz_z) =====
df_completo <- df_agrup_z %>%
  left_join(df_desempenho_tratado %>%
              select(Codigo, ATIVOS_media_wz_z, ROA_media_wz_z, CPLA_media_wz_z),
            by = "Codigo") %>%
  drop_na(Codigo, Cluster_PAM3, ATIVOS_media_wz_z, ROA_media_wz_z, CPLA_media_wz_z)

# listas auxiliares
vars_agrup <- c("IFDM_Educacao_z","IFDM_Emprego_Renda_z",
                "VAB_agro_pct_z","VAB_ind_pct_z","VAB_serv_pct_z","VAB_outros_pct_z")
vars_desemp <- c("ATIVOS_media_wz_z","ROA_media_wz_z","CPLA_media_wz_z")

# ===== 5) Boxplots das variáveis de agrupamento (sem winsor) =====
library(ggplot2); library(tidyr); library(dplyr)

df_box_agrup <- df_completo %>%
  select(Cluster_PAM3, all_of(vars_agrup)) %>%
  pivot_longer(all_of(vars_agrup), names_to = "Variavel", values_to = "Valor")

ggplot(df_box_agrup, aes(x = Cluster_PAM3, y = Valor, fill = Cluster_PAM3)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Variáveis de Agrupamento (z-score)",
       x = "Cluster (PAM k=3)", y = "z-score", fill = "Cluster") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom", strip.text = element_text(face = "bold"))

# ===== 6) Estatísticas descritivas das variáveis de desempenho por cluster =====
library(knitr)

tab_desemp <- df_completo %>%
  group_by(Cluster_PAM3) %>%
  summarise(
    across(all_of(vars_desemp),
           list(mean = mean, median = median, sd = sd, iqr = IQR),
           .names = "{.col}_{.fn}"),
    n = n(), .groups = "drop"
  ) %>%
  mutate(across(where(is.numeric), ~ round(.x, 3)))

kable(tab_desemp,
      caption = "Estatísticas descritivas das variáveis de desempenho por cluster (k = 3)")

# ===== 7) Testes: Kruskal–Wallis + Pós-teste de Dunn (Bonferroni) =====
library(FSA)

# Kruskal–Wallis
for (v in vars_desemp) {
  cat("\nKruskal–Wallis para", v, ":\n")
  print(kruskal.test(df_completo[[v]] ~ df_completo$Cluster_PAM3))
}

# Dunn pós-hoc
resultados_dunn <- lapply(vars_desemp, function(v) {
  out <- dunnTest(df_completo[[v]] ~ df_completo$Cluster_PAM3, method = "bonferroni")
  tibble::as_tibble(out$res) %>% dplyr::mutate(Variavel = v, .before = 1)
}) %>% dplyr::bind_rows()

kable(resultados_dunn, digits = 4,
      caption = "Pós-teste de Dunn (Bonferroni) para variáveis de desempenho (*_wz_z)")

# ===== 8) (Opcional) Exportar resultados para Excel =====
if (!requireNamespace("openxlsx", quietly = TRUE)) install.packages("openxlsx")
library(openxlsx)

wb <- createWorkbook()
addWorksheet(wb, "Resumo_Desempenho")
writeData(wb, "Resumo_Desempenho", tab_desemp)
addWorksheet(wb, "Dunn_PosTeste")
writeData(wb, "Dunn_PosTeste", resultados_dunn)
saveWorkbook(wb, "c:/Aula3/docs/Resultados_Clusters_Refeito.xlsx", overwrite = TRUE)



###TESTANDO NOVAMENTE O NUM DE CLUSTER

# --- 1) Pacotes necessários ---
library(cluster)
library(factoextra)
library(dplyr)

# --- 2) Selecionar as variáveis de agrupamento (sem winsorização) ---
vars_agrup <- c("IFDM_Educacao", "IFDM_Emprego_Renda",
                "VAB_agro", "VAB_ind", "VAB_serv", "VAB_outros")

df_cluster_novo_clean <- df_cluster_novo %>%
  select(all_of(vars_agrup)) %>%
  na.omit()  # remover valores faltantes

# --- 3) Padronizar (z-score) ---
df_scaled <- scale(df_cluster_novo_clean)

# --- 4) Determinar número ótimo de clusters (método do cotovelo) ---
fviz_nbclust(df_scaled, kmeans, method = "wss") +
  labs(title = "Número ótimo de clusters (método do cotovelo)")

# --- 5) Determinar número ótimo de clusters (método da silhueta) ---
fviz_nbclust(df_scaled, kmeans, method = "silhouette") +
  labs(title = "Número ótimo de clusters (método da silhueta)")

# --- 6) (Opcional) Verificar com PAM ---
fviz_nbclust(df_scaled, pam, method = "silhouette") +
  labs(title = "Número ótimo de clusters (PAM - método da silhueta)")


library(cluster)
library(factoextra)

# PAM
pam_fit3 <- pam(df_scaled, k = 4)
sil_pam <- pam_fit3$silinfo$avg.width

# K-means
set.seed(123)
kmeans_fit3 <- kmeans(df_scaled, centers = 3, nstart = 25)
sil_kmeans <- mean(silhouette(kmeans_fit3$cluster, dist(df_scaled))[, 3])

# Comparar
data.frame(
  Metodo = c("PAM", "K-means"),
  Silhouette = c(sil_pam, sil_kmeans)
)


#######################
##TESTANDO COM k=2

library(cluster)
library(dplyr)
library(factoextra)

library(dplyr)
library(cluster)
library(factoextra)

# 1) Selecione as variáveis de agrupamento
vars_agrup <- c("IFDM_Educacao_z","IFDM_Emprego_Renda_z",
                "VAB_agro_pct_z","VAB_ind_pct_z","VAB_serv_pct_z","VAB_outros_pct_z")

# 2) Congele as linhas válidas UMA vez e gere a matriz X
X0 <- df_completo %>% select(all_of(vars_agrup)) %>% as.matrix()
ok <- stats::complete.cases(X0)
X  <- X0[ok, , drop = FALSE]   # já estão z-score; se não, use scale(X0[ok,])

# 3) Rode o PAM diretamente nos dados (sem diss=TRUE)
set.seed(123)
pam_fit2 <- pam(X, k = 2, metric = "euclidean")

# 4) Qualidade (silhueta média)
cat("Silhueta média (k=2):", round(pam_fit2$silinfo$avg.width, 3), "\n")

# 5) Plot dos clusters
fviz_cluster(pam_fit2, data = X,
             geom = "point",
             ellipse.type = "convex",
             ggtheme = theme_minimal(),
             main = "Clusters PAM (k = 2)")

# 6) Anexe os rótulos de cluster ao df_completo, respeitando as mesmas linhas 'ok'
df_completo$Cluster_PAM2 <- NA_integer_
df_completo$Cluster_PAM2[ok] <- pam_fit2$clustering
df_completo$Cluster_PAM2 <- factor(df_completo$Cluster_PAM2)


library(cluster)
library(factoextra)

# --- 1) Matriz com as variáveis de agrupamento ---
vars_agrup <- c("IFDM_Educacao_z","IFDM_Emprego_Renda_z",
                "VAB_agro_pct_z","VAB_ind_pct_z","VAB_serv_pct_z","VAB_outros_pct_z")
X <- df_completo %>%
  dplyr::select(all_of(vars_agrup)) %>%
  dplyr::filter(complete.cases(.)) %>%
  as.matrix()

# --- 2) PAM com k = 2, 3 e 4 ---
set.seed(123)
pam_fit2 <- pam(X, k = 2, metric = "euclidean")
pam_fit3 <- pam(X, k = 3, metric = "euclidean")
pam_fit4 <- pam(X, k = 4, metric = "euclidean")

# --- 3) Plot comparativo dos clusters ---
fviz_cluster(pam_fit2, data = X,
             geom = "point",
             ellipse.type = "convex",
             ggtheme = theme_minimal(),
             main = "Clusters PAM (k = 2)")

fviz_cluster(pam_fit3, data = X,
             geom = "point",
             ellipse.type = "convex",
             ggtheme = theme_minimal(),
             main = "Clusters PAM (k = 3)")

fviz_cluster(pam_fit4, data = X,
             geom = "point",
             ellipse.type = "convex",
             ggtheme = theme_minimal(),
             main = "Clusters PAM (k = 4)")


cat("Silhueta média (k=2):", round(pam_fit2$silinfo$avg.width, 3), "\n")
cat("Silhueta média (k=3):", round(pam_fit3$silinfo$avg.width, 3), "\n")
cat("Silhueta média (k=4):", round(pam_fit4$silinfo$avg.width, 3), "\n")



library(ggplot2)
library(tidyr)
library(dplyr)

# 1) Definir as variáveis de agrupamento
vars_agrup <- c("IFDM_Educacao_z","IFDM_Emprego_Renda_z",
                "VAB_agro_pct_z","VAB_ind_pct_z",
                "VAB_serv_pct_z","VAB_outros_pct_z")

# 2) Garantir que o cluster está como fator
df_completo <- df_completo %>%
  mutate(Cluster_PAM2 = factor(pam_fit2$clustering))

# 3) Transformar para formato longo
df_box2 <- df_completo %>%
  select(Cluster_PAM2, all_of(vars_agrup)) %>%
  pivot_longer(cols = all_of(vars_agrup),
               names_to = "Variavel",
               values_to = "Valor")

# 4) Gerar os boxplots
ggplot(df_box2, aes(x = Cluster_PAM2, y = Valor, fill = Cluster_PAM2)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Distribuição das Variáveis de Agrupamento por Cluster (PAM – k = 2)",
    x = "Cluster",
    y = "Valor Padronizado (z-score)",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "bottom",
    strip.text = element_text(face = "bold", size = 11)
  )

library(rstatix)
library(dunn.test)
library(dplyr)

# 1) Definir variáveis de desempenho
vars_desemp <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

# 2) Teste de Kruskal–Wallis por variável
kw_resultados <- lapply(vars_desemp, function(var) {
  teste <- kruskal_test(df_completo, formula(paste(var, "~ Cluster_PAM2")))
  tibble(Variavel = var,
         Chi2 = teste$statistic,
         p_value = teste$p)
}) %>% bind_rows()

print(kw_resultados)

# 3) Pós-teste de Dunn (se Kruskal for significativo)
resultados_dunn <- lapply(vars_desemp, function(var) {
  dunn.test(df_completo[[var]], df_completo$Cluster_PAM2,
            method = "bonferroni", kw = FALSE, label = TRUE)
})


# Contagem de observações em cada cluster
table(df_completo$Cluster_PAM2)

# Se quiser também em formato percentual:
prop.table(table(df_completo$Cluster_PAM2)) * 100


library(openxlsx)
library(dplyr)

# --- 1) Criar um dataframe com as variáveis principais e o cluster ---
df_export <- df_completo %>%
  select(Codigo,
         IFDM_Educacao_z, IFDM_Emprego_Renda_z,
         VAB_agro_pct_z, VAB_ind_pct_z, VAB_serv_pct_z, VAB_outros_pct_z,
         ATIVOS_media_wz_z, ROA_media_wz_z, CPLA_media_wz_z,
         Cluster_PAM2)

# --- 2) Criar uma planilha resumo com médias por cluster ---
df_resumo <- df_export %>%
  group_by(Cluster_PAM2) %>%
  summarise(across(where(is.numeric), ~ round(mean(.x, na.rm = TRUE), 3)),
            n = n())

# --- 3) Salvar ambas as abas no mesmo arquivo Excel ---
wb <- createWorkbook()
addWorksheet(wb, "Dados_Completos")
addWorksheet(wb, "Resumo_Clusters")

writeData(wb, "Dados_Completos", df_export)
writeData(wb, "Resumo_Clusters", df_resumo)

# --- 4) Salvar o arquivo ---
saveWorkbook(wb, file = "c:/Aula3/docs/Resultados_Clusters_PAM2.xlsx", overwrite = TRUE)

cat("✅ Arquivo 'Resultados_Clusters_PAM2.xlsx' salvo com sucesso na pasta de trabalho!\n")


library(ggplot2)
library(tidyr)
library(dplyr)

# 1) Variáveis de desempenho
vars_desemp <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

# 2) Garantir fator e deixar no formato longo
df_box_des <- df_completo %>%
  filter(!is.na(Cluster_PAM2)) %>%
  mutate(Cluster_PAM2 = factor(Cluster_PAM2)) %>%
  select(Cluster_PAM2, all_of(vars_desemp)) %>%
  pivot_longer(all_of(vars_desemp), names_to = "Variavel", values_to = "Valor")

# 3) Boxplots
ggplot(df_box_des, aes(x = Cluster_PAM2, y = Valor, fill = Cluster_PAM2)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Desempenho das Cooperativas por Cluster (PAM – k = 2)",
    x = "Cluster",
    y = "Valor padronizado (z-score)",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "bottom",
    strip.text = element_text(face = "bold", size = 11)
  )

library(dplyr)

vars_desemp <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

for (v in vars_desemp) {
  cat("\n### Teste Shapiro-Wilk para", v, "###\n")
  print(df_completo %>%
          group_by(Cluster_PAM2) %>%
          summarise(p_value = shapiro.test(get(v))$p.value))
}

library(rstatix)

kw_resultados <- vars_desemp %>%
  map_df(~{
    teste <- kruskal_test(df_completo, as.formula(paste(.x, "~ Cluster_PAM2")))
    tibble(Variavel = .x, 
           Chi2 = teste$statistic, 
           p_value = teste$p)
  })

print(kw_resultados)

library(dunn.test)

for (v in vars_desemp) {
  cat("\n### Pós-teste de Dunn para", v, "###\n")
  dunn.test(df_completo[[v]], df_completo$Cluster_PAM2,
            method = "bonferroni", kw = FALSE, label = TRUE)
}

df_completo %>%
  group_by(Cluster_PAM2) %>%
  summarise(across(all_of(vars_desemp),
                   list(mean = mean, median = median, sd = sd),
                   .names = "{.col}_{.fn}"),
            n = n())


# --- Pacotes necessários ---
library(ggplot2)
library(tidyr)
library(dplyr)

# --- 1) Selecionar variáveis de desempenho ---
vars_desemp <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

# --- 2) Garantir que o cluster está como fator ---
df_completo <- df_completo %>%
  mutate(Cluster_PAM2 = factor(Cluster_PAM2))

# --- 3) Converter para formato longo (tidy) ---
df_box_desempenho <- df_completo %>%
  select(Cluster_PAM2, all_of(vars_desemp)) %>%
  pivot_longer(cols = all_of(vars_desemp),
               names_to = "Variavel",
               values_to = "Valor")

# --- 4) Criar o boxplot ---
ggplot(df_box_desempenho, aes(x = Cluster_PAM2, y = Valor, fill = Cluster_PAM2)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Desempenho das Cooperativas por Cluster Socioeconômico (PAM – k = 2)",
    x = "Cluster",
    y = "Valor Padronizado (z-score)",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "bottom",
    strip.text = element_text(face = "bold", size = 11),
    plot.title = element_text(face = "bold", hjust = 0.5)
  )


# --- pacotes ---
library(dplyr)
library(purrr)
library(rstatix)
library(dunn.test)
library(openxlsx)

# --- variáveis de desempenho ---
vars_desemp <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

# garante fator
df_completo <- df_completo %>% mutate(Cluster_PAM2 = factor(Cluster_PAM2))

# --- função utilitária: Shapiro por cluster (retorna C1 e C2) ---
shapiro_c12 <- function(vec, grp) {
  d <- data.frame(x = vec, g = grp) %>% filter(!is.na(x), !is.na(g))
  out <- d %>% group_by(g) %>% summarise(p = shapiro.test(x)$p.value, .groups="drop")
  # garante colunas para os dois níveis
  tibble(Shapiro_C1 = out$p[out$g == levels(d$g)[1]] %||% NA_real_,
         Shapiro_C2 = out$p[out$g == levels(d$g)[2]] %||% NA_real_)
}

# --- monta a tabela consolidada ---
tabela_estatistica <-
  map_df(vars_desemp, function(v) {
    # Shapiro
    shp <- shapiro_c12(df_completo[[v]], df_completo$Cluster_PAM2)
    
    # Kruskal
    kw  <- kruskal_test(data = df_completo,
                        formula = as.formula(paste(v, "~ Cluster_PAM2")))
    kw_stat <- as.numeric(kw$statistic); kw_p <- as.numeric(kw$p)
    
    # Dunn (com k=2 é uma única comparação)
    dres <- dunn.test(df_completo[[v]], df_completo$Cluster_PAM2,
                      method = "bonferroni", kw = FALSE, label = TRUE, list=TRUE)
    # pega primeira linha
    dunn_Z   <- unname(dres$Z[1])
    dunn_padj<- unname(dres$P.adjusted[1])
    
    tibble(
      Variavel = v,
      Shapiro_C1 = shp$Shapiro_C1,
      Shapiro_C2 = shp$Shapiro_C2,
      KW_chi2 = kw_stat,
      KW_p    = kw_p,
      Dunn_Z  = dunn_Z,
      Dunn_p_adj = dunn_padj,
      Conclusao = case_when(
        KW_p < 0.05 & Dunn_p_adj < 0.05 ~ "Diferença significativa entre C1 e C2",
        KW_p < 0.05 & Dunn_p_adj >= 0.05 ~ "KW sig., Dunn ns (verificar múltiplas comparações)",
        TRUE ~ "Sem diferença significativa"
      )
    )
  }) %>%
  mutate(across(-c(Variavel, Conclusao), ~round(., 6)))

# --- imprime de forma limpa ---
print(tabela_estatistica)

# --- salva em Excel (duas abas: resumo e dados brutos usados) ---
wb <- createWorkbook()
addWorksheet(wb, "Resumo_Testes")
addWorksheet(wb, "Dados_Clustered")

writeData(wb, "Resumo_Testes", tabela_estatistica)
# opcional: também salvar um recorte dos dados usados
writeData(wb, "Dados_Clustered",
          df_completo %>%
            select(Cluster_PAM2, all_of(vars_desemp),
                   IFDM_Educacao_z, IFDM_Emprego_Renda_z,
                   VAB_agro_pct_z, VAB_ind_pct_z, VAB_serv_pct_z, VAB_outros_pct_z))

saveWorkbook(wb, "c:/Aula3/docs/Resumo_Testes_Desempenho_PAM2.xlsx", overwrite = TRUE)
cat("✅ Arquivo salvo: Resumo_Testes_Desempenho_PAM2.xlsx\n")


#########TESTANDO sem a var VAB_outros

vars_agrup_sem_outros <- c("IFDM_Educacao_z", 
                           "IFDM_Emprego_Renda_z",
                           "VAB_agro_pct_z",
                           "VAB_ind_pct_z",
                           "VAB_serv_pct_z")

df_pam_sem_outros <- df_completo %>%
  select(all_of(vars_agrup_sem_outros)) %>%
  drop_na()

df_scaled_sem_outros <- scale(df_pam_sem_outros)

library(cluster)
library(factoextra)

fviz_nbclust(df_scaled_sem_outros, pam, method = "silhouette") +
  labs(title = "Número ótimo de clusters (PAM - sem VAB_outros)",
       x = "Número de clusters (k)",
       y = "Largura média da silhueta")


fviz_nbclust(df_scaled_sem_outros, pam, method = "wss") +
  labs(title = "Número ótimo de clusters (PAM - método do cotovelo)",
       x = "Número de clusters (k)",
       y = "Soma das distâncias intra-cluster (WSS)")



### NOVOS TESTES DE NUM DE CLUSTER sem VBA_outros

# ================== CONFIGURAÇÃO ==================
# Nome do seu novo DF e as variáveis de agrupamento (edite aqui):
df_novo   <- df_completo   # <-- troque para o seu novo data frame
vars_agrup <- c("IFDM_Educacao_z","IFDM_Emprego_Renda_z",
                "VAB_agro_pct_z","VAB_ind_pct_z","VAB_serv_pct_z")
K_MAX <- 10   # k máximo a testar

# ================== PACOTES ==================
suppressPackageStartupMessages({
  library(dplyr); library(tibble); library(purrr)
  library(cluster); library(factoextra); library(openxlsx)
})

# ================== PREPARO DOS DADOS ==================
# Seleciona variáveis, remove NAs e padroniza (z-score)
X0 <- df_novo %>% select(all_of(vars_agrup)) %>% as.matrix()
ok <- stats::complete.cases(X0)
X  <- scale(X0[ok, , drop = FALSE])           # matriz padronizada

# ================== WSS (cotovelo) ==================
# usa fviz_nbclust para obter a série WSS com PAM
wss_df <- fviz_nbclust(X, pam, method = "wss", k.max = K_MAX)$data
colnames(wss_df) <- c("k", "WSS")

# Heurística do "cotovelo": maior curvatura (~máx 2ª derivada)
# (não é perfeito, mas ajuda)
if (nrow(wss_df) >= 3) {
  d1 <- diff(wss_df$WSS)
  d2 <- diff(d1)
  best_k_wss <- wss_df$k[which.max(c(NA, d2, NA))]  # marca o pico interno
  if (is.na(best_k_wss)) best_k_wss <- wss_df$k[which.min(d1)] + 1
} else {
  best_k_wss <- wss_df$k[which.min(wss_df$WSS)]
}

# ================== SILHUETA (PAM) ==================
sil_df <- fviz_nbclust(X, pam, method = "silhouette", k.max = K_MAX)$data
colnames(sil_df) <- c("k", "Silhueta_Media")
best_k_sil <- sil_df$k[which.max(sil_df$Silhueta_Media)]

# ================== GAP STATISTIC (PAM) ==================
# clusGap precisa de uma função que retorne $cluster
pam_fun <- function(x, k) list(cluster = pam(x, k, metric = "euclidean")$clustering)

set.seed(123)
gap <- clusGap(X, FUN = pam_fun, K.max = K_MAX, B = 50)

gap_df <- as.data.frame(gap$Tab) %>%
  rownames_to_column("k") %>%
  mutate(k = as.integer(k)) %>%
  arrange(k)

# Regra de Tibshirani: menor k tal que gap(k) >= gap(k+1) - SE(k+1)
best_k_gap <- {
  g  <- gap_df$gap
  se <- gap_df$SE.sim
  kvals <- gap_df$k
  pick <- kvals[length(kvals)]
  for (i in 1:(length(kvals)-1)) {
    if (g[i] >= g[i+1] - se[i+1]) { pick <- kvals[i]; break }
  }
  pick
}

# ================== RESUMO COMPARATIVO ==================
resumo <- tibble(
  Metodo   = c("WSS (Cotovelo)", "Silhueta Média", "Gap Statistic"),
  Melhor_k = c(best_k_wss,        best_k_sil,       best_k_gap)
)

# ================== EXPORTAR PARA EXCEL ==================
wb <- createWorkbook()

addWorksheet(wb, "WSS")
writeData(wb, "WSS", wss_df)

addWorksheet(wb, "Silhueta")
writeData(wb, "Silhueta", sil_df)

addWorksheet(wb, "Gap_Statistic")
writeData(wb, "Gap_Statistic", gap_df)

addWorksheet(wb, "Resumo")
writeData(wb, "Resumo", resumo)

arq_saida <- "c:/Aula3/docs/Resultados_Numero_Clusters_PAM.xlsx"
saveWorkbook(wb, arq_saida, overwrite = TRUE)
cat("✅ Arquivo salvo:", arq_saida, "\n")

# (Opcional) Mostra no console os melhores k
print(resumo)



####Testando sem a var VAB_outros com K=2

# --- Pacotes necessários ---
library(cluster)
library(factoextra)
library(dplyr)
library(ggplot2)
library(tidyr)

# --- 1) Definir variáveis de agrupamento (sem VAB_outros_pct_z) ---
vars_agrup_sem_outros <- c(
  "IFDM_Educacao_z",
  "IFDM_Emprego_Renda_z",
  "VAB_agro_pct_z",
  "VAB_ind_pct_z",
  "VAB_serv_pct_z"
)

# --- 2) Criar novo data frame apenas com as variáveis selecionadas ---
df_pam_sem_outros <- df_completo %>%
  select(all_of(vars_agrup_sem_outros)) %>%
  drop_na()

# --- 3) Rodar o modelo PAM (k = 2) ---
pam_fit2_sem_outros <- pam(df_pam_sem_outros, k = 3, metric = "euclidean", stand = TRUE)

# --- 4) Avaliar a silhueta ---
cat("Silhueta média (PAM sem VAB_outros, k=2):",
    round(pam_fit2_sem_outros$silinfo$avg.width, 3), "\n")

# --- 5) Plotar clusters ---
fviz_cluster(pam_fit2_sem_outros, data = df_pam_sem_outros,
             geom = "point",
             ellipse.type = "convex",
             ggtheme = theme_minimal(),
             main = "Clusters PAM (k = 3) sem VAB_outros_pct_z")

# --- 6) Gerar boxplot para inspecionar as variáveis ---
df_completo_sem_outros <- df_completo %>%
  mutate(Cluster_PAM2_sem_outros = factor(pam_fit2_sem_outros$clustering))

df_box_sem_outros <- df_completo_sem_outros %>%
  select(Cluster_PAM2_sem_outros, all_of(vars_agrup_sem_outros)) %>%
  pivot_longer(cols = all_of(vars_agrup_sem_outros),
               names_to = "Variavel",
               values_to = "Valor")

ggplot(df_box_sem_outros, aes(x = Cluster_PAM2_sem_outros, y = Valor, fill = Cluster_PAM2_sem_outros)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Distribuição das Variáveis de Agrupamento por Cluster (sem VAB_outros_pct_z)",
    x = "Cluster",
    y = "z-score",
    fill = "Cluster"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "bottom",
    strip.text = element_text(face = "bold", size = 11)
  )

####Testando sem a var VAB_outros com K=3
library(dplyr)
library(cluster)
library(factoextra)
library(ggplot2)
library(tidyr)

# 1) Variáveis de agrupamento (SEM VAB_outros_pct_z)
vars_agrup_sem_outros <- c(
  "IFDM_Educacao_z",
  "IFDM_Emprego_Renda_z",
  "VAB_agro_pct_z",
  "VAB_ind_pct_z",
  "VAB_serv_pct_z"
)

# 2) Congelar amostra válida e montar matriz X (já está em z-score, então NÃO reescalar aqui)
ok <- complete.cases(df_completo[, vars_agrup_sem_outros])
X  <- as.matrix(df_completo[ok, vars_agrup_sem_outros])

# 3) Rodar PAM k=3
set.seed(123)
pam_fit3_sem_outros <- pam(X, k = 3, metric = "euclidean")

# 4) Qualidade (silhueta média)
cat("Silhueta média (PAM k=3, sem VAB_outros):",
    round(pam_fit3_sem_outros$silinfo$avg.width, 3), "\n")

# 5) Plot dos clusters
fviz_cluster(pam_fit3_sem_outros, data = X,
             geom = "point",
             ellipse.type = "convex",
             ggtheme = theme_minimal(),
             main = "Clusters PAM (k = 3) — sem VAB_outros_pct_z")

# 6) Anexar rótulos ao df_completo
df_completo$Cluster_PAM3_sem_outros <- NA_integer_
df_completo$Cluster_PAM3_sem_outros[ok] <- pam_fit3_sem_outros$clustering
df_completo$Cluster_PAM3_sem_outros <- factor(df_completo$Cluster_PAM3_sem_outros)

# 7) Boxplots das variáveis de agrupamento (inspeção)
df_box_sem_outros_k3 <- df_completo %>%
  filter(!is.na(Cluster_PAM3_sem_outros)) %>%
  select(Cluster_PAM3_sem_outros, all_of(vars_agrup_sem_outros)) %>%
  pivot_longer(all_of(vars_agrup_sem_outros),
               names_to = "Variavel", values_to = "Valor")

ggplot(df_box_sem_outros_k3, aes(x = Cluster_PAM3_sem_outros, y = Valor,
                                 fill = Cluster_PAM3_sem_outros)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Variáveis de Agrupamento por Cluster (PAM k=3, sem VAB_outros)",
       x = "Cluster", y = "z-score", fill = "Cluster") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom", strip.text = element_text(face = "bold"))

# 8) Contagem por cluster (para ver concentração)
print(table(df_completo$Cluster_PAM3_sem_outros))


#########INSERINDO A VAR SAUDE

ifdm_saude <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Saude_17_21.xlsx")  # ajuste o caminho

ifdm_saude$IFDM_Saude <- rowMeans(ifdm_saude[c("2017", "2018", "2019", "2020", "2021")], na.rm = TRUE)

df_ComSaude <-df_completo


# Certifique-se de que os nomes dos data frames estão corretos
# Se o data frame com IFDM_Saude tiver outro nome, ajuste aqui:

df_ComSaude <- merge(
  df_ComSaude,
  ifdm_saude[c("Codigo", "UF", "Municipio", "IFDM_Saude")],
  by = "Codigo",
  all.x = TRUE  # Mantém todos os municípios do df_ComSaude
)

###### TESTES DO NUM OTIMO DE CLUSTER COM A VAR SAUDE JUNTO

# --- 1) Pacotes necessários ---
library(cluster)
library(factoextra)
library(dplyr)
library(openxlsx)
library(tibble)

# --- 2) Selecionar apenas variáveis numéricas padronizáveis ---
# (ajuste os nomes conforme o seu df)
vars_agrup <- c("IFDM_Educacao", "IFDM_Emprego_Renda",
                "IFDM_Saude", "VAB_agro_pct", 
                "VAB_ind_pct", "VAB_serv_pct")

# --- 3) Criar uma versão padronizada do df ---
df_scaled <- df_ComSaude %>%
  select(all_of(vars_agrup)) %>%
  mutate(across(everything(), scale)) %>%
  na.omit()

# --- 4) MÉTODO DO COTOVELO (WSS) ---
set.seed(123)
wss_result <- fviz_nbclust(df_scaled, pam, method = "wss")
wss_df <- wss_result$data
colnames(wss_df) <- c("k", "WSS")

# --- 5) MÉTODO DA SILHUETA ---
set.seed(123)
sil_result <- fviz_nbclust(df_scaled, pam, method = "silhouette")
sil_df <- sil_result$data
colnames(sil_df) <- c("k", "Silhueta_Media")

# --- 6) MÉTODO GAP STATISTIC ---
set.seed(123)
gap_stat <- clusGap(df_scaled, FUN = pam, K.max = 10, B = 50)
gap_df <- as.data.frame(gap_stat$Tab)
gap_df <- tibble::rownames_to_column(gap_df, "k")

# --- 7) Identificar o melhor k em cada método ---
best_k_wss <- wss_df$k[which.min(diff(wss_df$WSS))]   # inflexão (cotovelo)
best_k_sil <- sil_df$k[which.max(sil_df$Silhueta_Media)]
best_k_gap <- as.numeric(gap_df$k[which.max(gap_df$gap)])

# --- 8) Criar resumo ---
resumo <- data.frame(
  Metodo = c("WSS (Cotovelo)", "Silhueta Média", "Gap Statistic"),
  Melhor_k = c(best_k_wss, best_k_sil, best_k_gap)
)

# --- 9) Salvar tudo em Excel ---
wb <- createWorkbook()
addWorksheet(wb, "WSS")
writeData(wb, "WSS", wss_df)

addWorksheet(wb, "Silhueta")
writeData(wb, "Silhueta", sil_df)

addWorksheet(wb, "Gap_Statistic")
writeData(wb, "Gap_Statistic", gap_df)

addWorksheet(wb, "Resumo")
writeData(wb, "Resumo", resumo)

saveWorkbook(wb, "c:/Aula3/docs/Resultados_Numero_Clusters_ComSaude.xlsx", overwrite = TRUE)

cat("✅ Resultados salvos em 'Resultados_Numero_Clusters_ComSaude.xlsx'\n")
print(resumo)

############################

#####AGORA TESTANDO COM K=3,4 e 5

#### PAM com df_ComSaude (inclui IFDM_Saude), K = 3, 4 e 5 ####
library(dplyr)
library(tidyr)
library(cluster)
library(factoextra)
library(ggplot2)

# 1) Variáveis de agrupamento (SEM VAB_outros)
vars_agrup <- c(
  "IFDM_Educacao",
  "IFDM_Emprego_Renda",
  "IFDM_Saude",
  "VAB_agro_pct",
  "VAB_ind_pct",
  "VAB_serv_pct"
)

# 2) Selecionar amostra válida e padronizar (z-score)
#X0 <- df_ComSaude %>%
  X0 <- df_3 %>%
  
  select(all_of(vars_agrup)) %>%
  mutate(across(everything(), as.numeric)) %>%
  as.matrix()

ok <- stats::complete.cases(X0)
X  <- scale(X0[ok, , drop = FALSE])  # matriz padronizada usada no PAM

# Função auxiliar para rodar PAM, plotar e anexar rótulos ao df_ComSaude
run_pam <- function(k) {
  set.seed(123)
  fit <- pam(X, k = k, metric = "euclidean")
  
  # 2.1) Silhueta média
  cat(sprintf("Silhueta média (PAM k=%d): %.3f\n", k, fit$silinfo$avg.width))
  
  # 2.2) Plot dos clusters
  p <- fviz_cluster(fit, data = X,
                    geom = "point",
                    ellipse.type = "convex",
                    ggtheme = theme_minimal(),
                    main = paste0("Clusters PAM (k = ", k, ")"))
  print(p)
  
  # 2.3) Anexar rótulos no df original
  col_name <- paste0("Cluster_PAM", k, "")
  df_ComSaude[[col_name]] <<- NA_integer_
  df_ComSaude[[col_name]][ok] <<- fit$clustering
  df_ComSaude[[col_name]] <<- factor(df_ComSaude[[col_name]])
  
  # 2.4) Boxplots (usando as variáveis padronizadas)
  df_box <- as.data.frame(X)
  names(df_box) <- paste0(vars_agrup, "_z")
  df_box[[col_name]] <- factor(fit$clustering)
  
  df_box_long <- df_box %>%
    pivot_longer(cols = ends_with("_z"),
                 names_to = "Variavel", values_to = "Valor")
  
  g <- ggplot(df_box_long, aes(x = .data[[col_name]], y = Valor, fill = .data[[col_name]])) +
    geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
    facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
    scale_fill_brewer(palette = "Set2") +
    labs(title = paste0("Variáveis de Agrupamento por Cluster (PAM k=", k, ")"),
         x = "Cluster", y = "z-score", fill = "Cluster") +
    theme_minimal(base_size = 12) +
    theme(legend.position = "bottom", strip.text = element_text(face = "bold"))
  print(g)
  
  # 2.5) Contagem por cluster
  print(table(df_ComSaude[[col_name]]))
  
  invisible(fit)
}

# 3) Rodar para K = 3, 4 e 5
pam_fit3 <- run_pam(3)
pam_fit4 <- run_pam(4)
pam_fit5 <- run_pam(5)


############## PREPARANDO OS GRAFICOS COM O METODOS DE FORMACAO DO NUM DE CLUSTERS
#################
# --- DADOS ---
wss <- c(4524.38, 3419.31, 2916.91, 2488.94, 2258.14, 2092.35, 1875.72, 1779.88, 1735.56)
sil <- c(0.288694, 0.305137, 0.292016, 0.285436, 0.278913, 0.237013, 0.251955, 0.263701, 0.247488)
gap <- c(0.659713, 0.703367, 0.724453, 0.742542, 0.748691, 0.763706, 0.798945, 0.808349, 0.816325)
se  <- c(0.008252, 0.011154, 0.013297, 0.009751, 0.009928, 0.009338, 0.008503, 0.008645, 0.008574)

k <- 2:10

png("c:/Aula3/docs/validacao_tres_metodos.png", width = 1200, height = 500, res = 130)
layout(matrix(c(1,2,3), nrow=1), widths=c(1,1,1.2))
par(mar=c(5,5,3,1))

# 1. WSS
plot(k, wss, type="b", pch=19, col="steelblue", lwd=2,
     xlab="k", ylab="WSS", main="Método do Cotovelo")
abline(v=4, col="red", lty=2); text(4, 3200, "k=4", col="red", pos=4)

# 2. Silhueta
plot(k, sil, type="b", pch=19, col="darkgreen", lwd=2,
     xlab="k", ylab="Silhueta Média", main="Silhueta Média")
abline(v=3, col="red", lty=2); text(3, 0.30, "k=3", col="red", pos=4)

# 3. Gap
plot(k, gap, type="b", pch=19, col="purple", lwd=2,
     xlab="k", ylab="Gap Statistic", main="Gap Statistic")
lines(k, gap - se, lty=2, col="orange")
abline(v=5, col="red", lty=2); text(5, 0.76, "k=5", col="red", pos=4)

dev.off()

##############
#######INICIANDO OS TESTES COM AS NOVAS VARs

table(df_ComSaude$Cluster_PAM3_Saude)
# > table(df_ComSaude$Cluster_PAM3_Saude)
# 
# 1   2   3 
# 320 557 231 


library(dplyr)
library(tidyr)
library(broom)

vars_desempenho <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

shapiro_resultados <- df_ComSaude %>%
  filter(!is.na(Cluster_PAM3_Saude)) %>%
  group_by(Cluster_PAM3_Saude) %>%
  summarise(across(all_of(vars_desempenho),
                   ~ shapiro.test(.x)$p.value,
                   .names = "{.col}_p")) %>%
  pivot_longer(-Cluster_PAM3_Saude,
               names_to = "Variavel", values_to = "p_value")

print(shapiro_resultados)


# Cluster_PAM3_Saude Variavel             p_value
# <fct>              <chr>                  <dbl>
#   1 1                  ATIVOS_media_wz_z_p 2.76e-29
# 2 1                  ROA_media_wz_z_p    3.14e-22
# 3 1                  CPLA_media_wz_z_p   2.86e-27
# 4 2                  ATIVOS_media_wz_z_p 5.56e-37
# 5 2                  ROA_media_wz_z_p    6.11e-33
# 6 2                  CPLA_media_wz_z_p   2.66e-36
# 7 3                  ATIVOS_media_wz_z_p 7.67e-26
# 8 3                  ROA_media_wz_z_p    3.95e-19
# 9 3                  CPLA_media_wz_z_p   2.55e-18



library(rstatix)

kw_resultados <- lapply(vars_desempenho, function(var) {
  test <- kruskal_test(df_ComSaude, formula = as.formula(paste(var, "~ Cluster_PAM3_Saude")))
  tibble(Variavel = var,
         Chi2 = test$statistic,
         p_value = test$p)
}) %>%
  bind_rows()

print(kw_resultados)
# > print(kw_resultados)
# # A tibble: 3 × 3
# Variavel           Chi2       p_value
# <chr>             <dbl>         <dbl>
#   1 ATIVOS_media_wz_z  6.06 0.0483       
# 2 ROA_media_wz_z    19.6  0.0000543    
# 3 CPLA_media_wz_z   45.2  0.00000000015



library(dunn.test)

for (var in vars_desempenho) {
  cat("\n### Pós-teste de Dunn para", var, "###\n")
  dunn.test(df_ComSaude[[var]],
            df_ComSaude$Cluster_PAM3_Saude,
            method = "bonferroni", kw = FALSE, label = TRUE)
}




library(ggplot2)

df_box_desemp <- df_3 %>%
  #df_box_desemp <- df_ComSaude %>%
  
  filter(!is.na(Cluster_PAM3_Saude)) %>%
  select(Cluster_PAM3_Saude, all_of(vars_desempenho)) %>%
  pivot_longer(all_of(vars_desempenho),
               names_to = "Variavel", values_to = "Valor")

ggplot(df_box_desemp, aes(x = Cluster_PAM3_Saude, y = Valor,
                          fill = Cluster_PAM3_Saude)) +
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Distribuição das Variáveis de Desempenho por Cluster (PAM k = 3)",
       x = "Cluster", y = "z-score", fill = "Cluster") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom", strip.text = element_text(face = "bold"))



####ADICIONANDO O PONTO VERMELHO COM A MEDIA
# Preparação dos dados (mantendo o que você já tinha)
df_box_desemp <- df_3 %>%
  filter(!is.na(Cluster_PAM3_Saude)) %>%
  select(Cluster_PAM3_Saude, all_of(vars_desempenho)) %>%
  pivot_longer(all_of(vars_desempenho),
               names_to = "Variavel", values_to = "Valor")

# Criação do Gráfico com a Média
ggplot(df_box_desemp, aes(x = Cluster_PAM3_Saude, y = Valor,
                          fill = Cluster_PAM3_Saude)) +
  
  # 1. O Boxplot (Mediana e Quartis)
  geom_boxplot(outlier.alpha = 0.3, width = 0.7) +
  
  # 2. A INSERÇÃO: Ponto Vermelho da Média
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "red") +
  
  # 3. Restante da formatação
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Distribuição das Variáveis de Desempenho por Cluster (PAM k = 3)",
       x = "Cluster", y = "z-score", fill = "Cluster") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom", strip.text = element_text(face = "bold"))


#####################
#Analises
df_ComSaude.BK <- df_ComSaude
# Adicionar coluna padronizada IFDM_Saude_z ao df_ComSaude
df_ComSaude <- df_ComSaude %>%
  mutate(IFDM_Saude_z = scale(IFDM_Saude))

# Verificar se foi criada corretamente
summary(df_ComSaude$IFDM_Saude_z)


# Média e desvio-padrão das variáveis de agrupamento por cluster
df_resumo_agrup <- df_ComSaude %>%
  group_by(Cluster_PAM3_Saude) %>%
  summarise(across(c(IFDM_Educacao_z, IFDM_Emprego_Renda_z, IFDM_Saude_z,
                     VAB_agro_pct_z, VAB_ind_pct_z, VAB_serv_pct_z),
                   list(mean = mean, sd = sd), .names = "{.col}_{.fn}"))

# --- 1) Carregar pacote ---
library(openxlsx)

# --- 2) Exportar para Excel ---
write.xlsx(
  df_resumo_agrup,
  file = "c:/Aula3/docs/Resultados_Resumo_Agrupamento.xlsx",
  sheetName = "Resumo_Clusters",
  rowNames = FALSE
)



###VISUALIZANDO OS CLUSTES

library(dplyr)

# Tabela de frequência por cluster e UF
df_freq <- df_ComSaude %>%
  group_by(Cluster_PAM3_Saude, UF, Municipio) %>%
  summarise(Qtd = n(), .groups = "drop") %>%
  arrange(Cluster_PAM3_Saude, desc(Qtd))

# Selecionar as 10 cidades mais representativas por cluster
df_top_cidades <- df_freq %>%
  group_by(Cluster_PAM3_Saude) %>%
  slice_max(Qtd, n = 10)

# Visualizar
print(df_top_cidades, n=40)

####
library(dplyr)

# troque pelo nome do fator de cluster que você está usando
cl_col <- "Cluster_PAM3_Saude"

top_cidades <- df_ComSaude %>%
  group_by(!!sym(cl_col), UF, Municipio) %>%
  summarise(Qtd = n(), .groups = "drop") %>%
  arrange(!!sym(cl_col), desc(Qtd)) %>%
  group_by(!!sym(cl_col)) %>%
  slice_head(n = 10) %>%      # top 10 por cluster
  ungroup()

print(top_cidades)

library(dplyr)
library(ggplot2)

library(dplyr)
library(ggplot2)

# 1) Calcular a distribuição percentual por UF e Cluster
dist_uf <- df_ComSaude %>%
  count(UF, Cluster_PAM3_Saude) %>%
  group_by(UF) %>%
  mutate(pct = 100 * n / sum(n)) %>%
  ungroup()

# 2) Plot com rótulos verticais dentro das barras
ggplot(dist_uf, aes(x = UF, y = pct, fill = Cluster_PAM3_Saude)) +
  geom_col(width = 0.85) +
  geom_text(
    data = dplyr::filter(dist_uf, pct >= 4),  # exibe apenas se >= 4%
    aes(label = sprintf("%.1f%%", pct)),
    position = position_stack(vjust = 0.5),
    size = 3.2,
    color = "white",
    fontface = "bold",
    angle = 90,          # deixa o texto na vertical
    vjust = 0.5,         # centraliza verticalmente dentro da barra
    hjust = 0.5
  ) +
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, 25),
                     labels = function(x) paste0(x, "%")) +
  labs(title = "Distribuição dos Clusters por UF",
       x = "UF", y = "Percentual (%)", fill = "Cluster") +
  theme_minimal(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 0, hjust = 0.5),
    plot.title = element_text(face = "bold", size = 14),
    legend.position = "right"
  )




library(tidyr)

heat_uf <- df_ComSaude %>%
  count(UF, !!sym(cl_col)) %>%
  group_by(UF) %>%
  mutate(pct = 100 * n / sum(n)) %>%
  ungroup()

ggplot(heat_uf, aes(x = !!sym(cl_col), y = UF, fill = pct)) +
  geom_tile() +
  geom_text(aes(label = sprintf("%.1f%%", pct)), size = 3) +
  scale_fill_gradient(low = "white", high = "steelblue") +
  labs(title = "Heatmap – Composição de Clusters por UF",
       x = "Cluster", y = "UF", fill = "% no estado") +
  theme_minimal()


###Quem é quem” em desempenho por cluster (boxplots/CI)
vars_desemp <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")

df_long <- df_ComSaude %>%
  select(all_of(c(cl_col, vars_desemp))) %>%
  pivot_longer(cols = all_of(vars_desemp), names_to = "Variavel", values_to = "Valor")

ggplot(df_long, aes(x = !!sym(cl_col), y = Valor, fill = !!sym(cl_col))) +
  geom_boxplot(outlier.alpha = 0.25) +
  facet_wrap(~ Variavel, scales = "free_y", ncol = 3) +
  labs(title = "Desempenho por Cluster (z-score)",
       x = "Cluster", y = "Valor (z)") +
  theme_minimal() +
  theme(legend.position = "none")


sum_desemp <- df_ComSaude %>%
  group_by(!!sym(cl_col)) %>%
  summarise(across(all_of(vars_desemp),
                   ~mean(.x, na.rm=TRUE), .names = "mean_{.col}"))

print(sum_desemp)



library(openxlsx)

wb <- createWorkbook()
addWorksheet(wb, "TopCidades");       writeData(wb, "TopCidades", top_cidades)
addWorksheet(wb, "DistUF");           writeData(wb, "DistUF", dist_uf)
addWorksheet(wb, "HeatUF");           writeData(wb, "HeatUF", heat_uf)
addWorksheet(wb, "MediasDesempenho"); writeData(wb, "MediasDesempenho", sum_desemp)

saveWorkbook(wb, "c:/Aula3/docs/Resumo_Clusters_SemMapa.xlsx", overwrite = TRUE)



library(ggplot2)
library(reshape2)

# Exemplo de estrutura de dados
dunn_results <- data.frame(
  Variavel = rep(c("ATIVOS", "ROA", "CPLA"), each = 3),
  Comparacao = c("1 vs 2", "1 vs 3", "2 vs 3",
                 "1 vs 2", "1 vs 3", "2 vs 3",
                 "1 vs 2", "1 vs 3", "2 vs 3"),
  p_valor = c(0.2340, 0.0211, 0.2260,
              0.0856, 0.0216, 0.0000,
              0.0000, 0.0016, 0.0239)
)

# Gráfico de calor
ggplot(dunn_results, aes(x = Comparacao, y = Variavel, fill = p_valor <= 0.05)) +
  geom_tile(color = "white") +
  geom_text(aes(label = sprintf("p=%.4f", p_valor)), color = "black", size = 3.5) +
  scale_fill_manual(values = c("FALSE" = "gray90", "TRUE" = "steelblue")) +
  labs(title = "Pós-teste de Dunn (Bonferroni)",
       subtitle = "Comparação entre grupos (p ≤ 0.05 indica diferença significativa)",
       fill = "Significativo") +
  theme_minimal()


##################
##TESTANDO os diferentes k

# PAM com diferentes k
pam_k3 <- pam(X, k = 3)
pam_k4 <- pam(X, k = 4)
pam_k5 <- pam(X, k = 5)

# Comparar silhuetas
cat("k=3 →", pam_k3$silinfo$avg.width, "\n")
cat("k=4 →", pam_k4$silinfo$avg.width, "\n")
cat("k=5 →", pam_k5$silinfo$avg.width, "\n")

# Visualizar comparativamente
library(factoextra)
fviz_nbclust(X, pam, method = "silhouette")

############### COMPARANDO k=3,4 e 5
#####06.11.2025

# Pacotes
library(dplyr)
library(FSA)        # FSA::dunnTest
library(openxlsx)

# 1) Definições
vars_desemp   <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")
cluster_cols  <- c("Cluster_PAM3_Saude", "Cluster_PAM4_Saude", "Cluster_PAM5_Saude")
ajuste        <- "bonferroni"   # pode trocar p/ "holm" se quiser

# 2) Função para rodar Dunn e devolver data.frame "limpo"
run_dunn <- function(df, cluster_col, var, method = "bonferroni"){
  fml <- as.formula(paste(var, "~", cluster_col))
  dt  <- FSA::dunnTest(fml, data = df, method = method)$res
  dt  <- dt %>%
    transmute(
      Variavel   = var,
      Comparison = Comparison,
      Z          = Z,
      P.unadj    = P.unadj,
      P.adj      = P.adj,
      k          = gsub("\\D", "", cluster_col),     # extrai 3/4/5 do nome da coluna
      Metodo     = paste0("Dunn (", method, ")")
    )
  dt
}

# 3) Executa para todos os k e todas as variáveis
todas_tabelas <- purrr::map_dfr(
  cluster_cols,
  \(cl) purrr::map_dfr(vars_desemp, \(v) run_dunn(df_ComSaude, cl, v, ajuste))
)

# 4) Impressão amigável no console (uma "lista" por k e por variável)
print_pretty <- function(tbl) {
  tbl %>%
    mutate(sig = ifelse(P.adj <= 0.05, "*", "")) %>%
    arrange(Variavel, Comparison) %>%
    group_by(k, Variavel) %>%
    group_walk(~{
      cat("\n=== Pós-teste de Dunn — k =", unique(.x$k),
          "—", unique(.x$Variavel), "===\n")
      txt <- sprintf("%s : %.4f (%.4g)%s", .x$Comparison, .x$Z, .x$P.adj, .x$sig)
      cat(paste(txt, collapse = "\n"), "\n")
    })
}
print_pretty(todas_tabelas)

# 5) Salvar no Excel (uma aba por k)
wb <- createWorkbook()
for (kk in unique(todas_tabelas$k)) {
  addWorksheet(wb, paste0("k=", kk))
  writeData(wb, paste0("k=", kk),
            todas_tabelas %>% filter(k == kk) %>% arrange(Variavel, Comparison))
}
addWorksheet(wb, "Resumo_geral")
writeData(wb, "Resumo_geral", todas_tabelas)

saveWorkbook(wb, "Resultados_Dunn_por_k.xlsx", overwrite = TRUE)
cat("✅ Arquivo salvo: Resultados_Dunn_por_k.xlsx\n")



#### NOVOV

# Pacotes
library(dplyr)
library(FSA)        # FSA::dunnTest
library(openxlsx)

# 1) Definições
vars_desemp   <- c("ATIVOS_media_wz_z", "ROA_media_wz_z", "CPLA_media_wz_z")
cluster_cols  <- c("Cluster_PAM3_Saude", "Cluster_PAM4_Saude", "Cluster_PAM5_Saude")
ajuste        <- "bonferroni"   # pode trocar p/ "holm" se quiser

# 2) Função para rodar Dunn e devolver data.frame "limpo"
run_dunn <- function(df, cluster_col, var, method = "bonferroni"){
  fml <- as.formula(paste(var, "~", cluster_col))
  dt  <- FSA::dunnTest(fml, data = df, method = method)$res
  dt  <- dt %>%
    transmute(
      Variavel   = var,
      Comparison = Comparison,
      Z          = Z,
      P.unadj    = P.unadj,
      P.adj      = P.adj,
      k          = gsub("\\D", "", cluster_col),     # extrai 3/4/5 do nome da coluna
      Metodo     = paste0("Dunn (", method, ")")
    )
  dt
}

# 3) Executa para todos os k e todas as variáveis
todas_tabelas <- purrr::map_dfr(
  cluster_cols,
  \(cl) purrr::map_dfr(vars_desemp, \(v) run_dunn(df_ComSaude, cl, v, ajuste))
)

# 4) Impressão amigável no console (uma "lista" por k e por variável)
print_pretty <- function(tbl) {
  tbl %>%
    mutate(sig = ifelse(P.adj <= 0.05, "*", "")) %>%
    arrange(Variavel, Comparison) %>%
    group_by(k, Variavel) %>%
    group_walk(~{
      cat("\n=== Pós-teste de Dunn — k =", unique(.x$k),
          "—", unique(.x$Variavel), "===\n")
      txt <- sprintf("%s : %.4f (%.4g)%s", .x$Comparison, .x$Z, .x$P.adj, .x$sig)
      cat(paste(txt, collapse = "\n"), "\n")
    })
}
print_pretty(todas_tabelas)

# 5) Salvar no Excel (uma aba por k)
wb <- createWorkbook()
for (kk in unique(todas_tabelas$k)) {
  addWorksheet(wb, paste0("k=", kk))
  writeData(wb, paste0("k=", kk),
            todas_tabelas %>% filter(k == kk) %>% arrange(Variavel, Comparison))
}
addWorksheet(wb, "Resumo_geral")
writeData(wb, "Resumo_geral", todas_tabelas)

saveWorkbook(wb, "c:/Aula3/docs/Resultados_Dunn_por_k.xlsx", overwrite = TRUE)
cat("✅ Arquivo salvo: Resultados_Dunn_por_k.xlsx\n")


###########ANALISE DE correlacao

# --- 1) Selecionar variáveis ---
vars_agrup <- c("IFDM_Educacao", "IFDM_Emprego_Renda", "IFDM_Saude",
                "VAB_agro_pct", "VAB_ind_pct", "VAB_serv_pct")

vars_desemp <- c("ROA_media_wz_z", "CPLA_media_wz_z", "ATIVOS_media_wz_z")

# --- 2) Criar dataframe apenas com as variáveis relevantes ---
df_corr <- df_ComSaude %>%
  select(all_of(vars_agrup), all_of(vars_desemp)) %>%
  na.omit()

# --- 3) Calcular matriz de correlação de Spearman ---
# (Spearman é mais robusto e apropriado para dados não-normais)
corr_matrix <- cor(df_corr, method = "spearman")

# --- 4) Visualizar a matriz de correlação ---
library(corrplot)
corrplot(corr_matrix, method = "color", type = "upper",
         addCoef.col = "black", tl.col = "black",
         title = "Correlação entre variáveis socioeconômicas e de desempenho",
         mar = c(0,0,2,0))



gc()
rm(list = ls()[sapply(ls(), function(x) inherits(get(x), "try-error"))])
renv::snapshot()
save.image("c:/Aula3/docs/AMBIENTE_COMPLETO_11_11_2025.RData")
load("c:/Aula3/docs/AMBIENTE_COMPLETO_11_11_2025.RData")


###GERANDO GRAFICO DO ARTTIGO 2

# 1. Carregar as bibliotecas necessárias
library(ggplot2)
library(forcats) # Para reordenar o eixo Y

# 2. Criar o data.frame com os dados da Tabela 14
# (Valores de média, mínimo e máximo que calculamos)
dados_grafico <- data.frame(
  Escala_espacial = c("Municipal", "Região Imediata", "Região Intermediária", "Estadual"),
  UN_media = c(47.5, 45.2, 43.4, 43.9),
  UN_min = c(37.6, 37.5, 35.9, 31.3),
  UN_max = c(56.3, 54.1, 51.8, 50.6),
  Loc_media = c(5.5, 6.9, 10.0, 8.2),
  Loc_min = c(0.4, 0.0, 4.1, 3.3),
  Loc_max = c(11.1, 15.8, 17.8, 11.9)
)

# 3. Reordenar o eixo Y (Escala_espacial) para ficar igual ao seu gráfico original
# (ggplot plota de baixo para cima, então invertemos a ordem)
dados_grafico$Escala_espacial <- factor(dados_grafico$Escala_espacial, 
                                        levels = c("Região Intermediária", 
                                                   "Região Imediata", 
                                                   "Municipal", 
                                                   "Estadual"))

# 4. Criar o gráfico
ggplot(dados_grafico, aes(y = Escala_espacial)) +
  
  # --- Camada da LOCALIZAÇÃO ---
  # Barra de erro (min/max) para Localização
  geom_errorbarh(aes(xmin = Loc_min, xmax = Loc_max), 
                 height = 0.2, color = "gray50", linewidth = 0.8) +
  
  # Ponto cheio (média) para Localização
  geom_point(aes(x = Loc_media), 
             shape = 16, size = 3.5, color = "black") + # shape 16 = círculo cheio
  
  # --- Camada da UNIDADE DE NEGÓCIO (com a nova barra de erro) ---
  # Barra de erro (min/max) para Unidade de Negócio
  geom_errorbarh(aes(xmin = UN_min, xmax = UN_max), 
                 height = 0.2, color = "gray50", linewidth = 0.8) +
  
  # Círculo vazado (média) para Unidade de Negócio
  # Usamos shape 21 (permite cor de borda e cor de preenchimento)
  geom_point(aes(x = UN_media), 
             shape = 21, size = 3.5, color = "black", fill = "white", stroke = 1) +
  
  # --- Ajustes e Títulos ---
  labs(
    title = "Contribuição Média e Variação (%) dos Efeitos",
    subtitle = "Localização vs. Unidade de Negócio por Escala Espacial",
    x = "Contribuição (%)",
    y = "Escala Espacial",
    caption = "Ponto cheio: Localização (média). Círculo vazado: Unidade de Negócio (média). Barras: Variação min-máx entre janelas."
  ) +
  theme_minimal(base_size = 14) + # Aumenta o tamanho da fonte base
  theme(
    panel.grid.major.y = element_blank(), # Limpa as linhas de grade do eixo Y
    panel.grid.minor.x = element_blank(),
    plot.caption = element_text(hjust = 0, face = "italic", color = "gray30")
  )

# 1. Carregar as bibliotecas necessárias
library(ggplot2)
library(forcats) # Para reordenar o eixo Y

# 2. Criar o data.frame com os dados da Tabela 14
dados_grafico <- data.frame(
  Escala_espacial = c("Municipal", "Região Imediata", "Região Intermediária", "Estadual"),
  UN_media = c(47.5, 45.2, 43.4, 43.9),
  UN_min = c(37.6, 37.5, 35.9, 31.3),
  UN_max = c(56.3, 54.1, 51.8, 50.6),
  Loc_media = c(5.5, 6.9, 10.0, 8.2),
  Loc_min = c(0.4, 0.0, 4.1, 3.3),
  Loc_max = c(11.1, 15.8, 17.8, 11.9)
)

# 3. Reordenar o eixo Y (Escala_espacial) para ficar igual ao seu gráfico original
dados_grafico$Escala_espacial <- factor(dados_grafico$Escala_espacial, 
                                        levels = c("Região Intermediária", 
                                                   "Região Imediata", 
                                                   "Municipal", 
                                                   "Estadual"))

# 4. Criar o gráfico
ggplot(dados_grafico, aes(y = Escala_espacial)) +
  
  # --- Camada da LOCALIZAÇÃO ---
  # Barra de erro (min/max) para Localização
  geom_errorbarh(aes(xmin = Loc_min, xmax = Loc_max), 
                 height = 0.2, color = "gray50", linewidth = 0.8) +
  
  # Ponto cheio (média) para Localização
  geom_point(aes(x = Loc_media), 
             shape = 16, size = 3.5, color = "black") +
  
  # NOVO: Texto (média) para Localização
  geom_text(aes(x = Loc_media, 
                label = gsub("\\.", ",", format(round(Loc_media, 1), nsmall = 1))), 
            vjust = -1.0, # Ajusta a posição vertical (para cima do ponto)
            color = "black", size = 3.5) +
  
  # --- Camada da UNIDADE DE NEGÓCIO ---
  # Barra de erro (min/max) para Unidade de Negócio
  geom_errorbarh(aes(xmin = UN_min, xmax = UN_max), 
                 height = 0.2, color = "gray50", linewidth = 0.8) +
  
  # Círculo vazado (média) para Unidade de Negócio
  geom_point(aes(x = UN_media), 
             shape = 21, size = 3.5, color = "black", fill = "white", stroke = 1) +
  
  # NOVO: Texto (média) para Unidade de Negócio
  geom_text(aes(x = UN_media, 
                label = gsub("\\.", ",", format(round(UN_media, 1), nsmall = 1))), 
            vjust = -1.0, # Ajusta a posição vertical (para cima do ponto)
            color = "black", size = 3.5) +
  
  # --- Ajustes e Títulos ---
  labs(
    title = "Contribuição Média e Variação (%) dos Efeitos",
    subtitle = "Localização vs. Unidade de Negócio por Escala Espacial",
    x = "Contribuição (%)",
    y = "Escala Espacial",
    caption = "Ponto cheio: Localização (média). Círculo vazado: Unidade de Negócio (média). Barras: Variação min-máx."
  ) +
  theme_minimal(base_size = 14) +
  theme(
    panel.grid.major.y = element_blank(), 
    panel.grid.minor.x = element_blank(),
    plot.caption = element_text(hjust = 0, face = "italic", color = "gray30")
  ) +
  # Expande o limite do eixo X para dar espaço para os rótulos
  scale_x_continuous(limits = c(0, 60))


###### REFAZENDO GRAFICO ARTIGO 2 depois de buscar no DB

library(dplyr)


# Limpeza e filtragem
df_filtrado <- df_2 %>%
  filter(!is.na(SOBRAS_POR_ATIVO)) %>%                  # remove NA
  filter(SOBRAS_POR_ATIVO >= -0.10 & SOBRAS_POR_ATIVO <= 0.20) # mantém somente -10% a +20%



df_filtrado <- df_filtrado %>%
  mutate(Janela_Temporal = case_when(
    ANO >= 1995 & ANO <= 2002 ~ "FHC12",
    ANO >= 2003 & ANO <= 2010 ~ "Lula12",
    ANO >= 2011 & ANO <= 2016 ~ "Dilma12",
    ANO >= 2017 & ANO <= 2022 ~ "TemerBolsonaro",
    TRUE ~ NA_character_
  )) %>%
  filter(!is.na(Janela_Temporal))   # remove anos fora das janelas definidas


estatisticas <- df_filtrado %>%
  group_by(Janela_Temporal) %>%
  summarise(
    Media = mean(SOBRAS_POR_ATIVO, na.rm = TRUE),
    Mediana = median(SOBRAS_POR_ATIVO, na.rm = TRUE),
    Desvio_Padrao = sd(SOBRAS_POR_ATIVO, na.rm = TRUE),
    n = n()
  )

estatisticas

library(tidyr)
library(ggplot2)

estatisticas_long <- estatisticas %>%
  pivot_longer(cols = c(Media, Mediana, Desvio_Padrao),
               names_to = "Medida",
               values_to = "Valor")

ggplot(estatisticas_long, aes(x = Janela_Temporal, y = Valor, color = Medida)) +
  geom_point(size = 4) +
  labs(
    x = "Janela Temporal",
    y = "Valores Estatísticos (SOBRAS_POR_ATIVO)",
    color = "Indicador",
    title = "Estatísticas Descritivas por Janela Temporal (ROA filtrado)"
  ) +
  theme_minimal() +
  scale_color_manual(values = c(
    "Desvio_Padrao" = "red",
    "Media" = "blue",
    "Mediana" = "green"
  ))



##### NOVA VERSAO DO GRADICO COM GROK

# -------------------------------
# Pacotes
# -------------------------------
library(ggplot2)
library(dplyr)

# -------------------------------
# Dados (os valores que extraímos do seu gráfico)
# -------------------------------
df <- data.frame(
  Janela = factor(c("FHC12", "Lula12", "Dilma12", "TemerBolsonaro"),
                  levels = c("FHC12", "Lula12", "Dilma12", "TemerBolsonaro")),
  Desvio_Padrao = c(2.35, 1.40, 1.42, 1.05),
  Media         = c(0.05, 0.03, 0.08, 0.02),
  Mediana       = c(0.12, 0.10, 0.10, 0.05)
)

# Fator de escala para o Desvio Padrão caber no mesmo espaço visual
# (2.35 × 0.05 ≈ 0.1175 → fica próximo do maior valor de Média/Mediana)
scale_factor <- 0.05   

# -------------------------------
# Gráfico com dois eixos (funciona!)
# -------------------------------
ggplot(df, aes(x = Janela)) +
  
  # Média e Mediana (eixo esquerdo)
  geom_line(aes(y = Media,   color = "Média"),   size = 1.2) +
  geom_point(aes(y = Media,  color = "Média"),   size = 4) +
  
  geom_line(aes(y = Mediana, color = "Mediana"), size = 1.2) +
  geom_point(aes(y = Mediana,color = "Mediana"), size = 4) +
  
  # Desvio Padrão (escalado para o eixo esquerdo, depois corrigido no eixo direito)
  geom_line(aes(y = Desvio_Padrao * scale_factor, color = "Desvio Padrão"), 
            size = 1.2) +
  geom_point(aes(y = Desvio_Padrao * scale_factor, color = "Desvio Padrão"), 
             size = 4) +
  
  # Eixos
  scale_y_continuous(
    name = "Média e Mediana (z-score)",
    limits = c(0, 0.15),
    breaks = seq(0, 0.15, 0.03),
    sec.axis = sec_axis(~ . / scale_factor,
                        name = "Desvio Padrão (z-score)",
                        breaks = seq(0, 2.5, 0.5))
  ) +
  
  scale_color_manual(values = c("Desvio Padrão" = "#E41A1C",   # vermelho
                                "Média"         = "#377EB8",   # azul
                                "Mediana"       = "#4DAF4A"),  # verde
                     name = "Estatística") +
  
  labs(title = "Comparação das estatísticas por janela temporal",
       subtitle = "Média e Mediana (eixo esquerdo) × Desvio Padrão (eixo direito)",
       x = "Janela Temporal") +
  
  theme_minimal(base_size = 14) +
  theme(
    plot.title    = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, color = "gray50"),
    axis.title.y        = element_text(color = "gray30"),
    axis.title.y.right  = element_text(color = "#E41A1C"),
    legend.position = "right"
  )


########CRIANDO NOVO GRAFICO ART 3
## 03.12

# Carregar as bibliotecas necessárias
library(ggplot2)
library(tidyr)
library(dplyr)

# 1. Preparar os dados
# Transformar de formato "largo" (wide) para "longo" (long) para o ggplot entender as facetas
df_long <- df_3 %>%
  select(Cluster_PAM3_Saude, ROA_media_wz_z, CPLA_media_wz_z, ATIVOS_media_wz_z) %>%
  pivot_longer(
    cols = c(ROA_media_wz_z, CPLA_media_wz_z, ATIVOS_media_wz_z),
    names_to = "Variavel",
    values_to = "z_score"
  )

# 2. Criar o Gráfico
ggplot(df_long, aes(x = factor(Cluster_PAM3_Saude), y = z_score, fill = factor(Cluster_PAM3_Saude))) +
  geom_boxplot(outlier.shape = 16, outlier.size = 1.5, alpha = 0.8) + # Boxplot com outliers visíveis
  
  # Dividir em 3 gráficos (facetas), um para cada variável
  facet_wrap(~Variavel, scales = "free_y") + # scales="free_y" permite escalas diferentes se necessário
  
  # Estilo visual (Tema limpo similar ao da sua imagem)
  theme_bw() +
  
  # Cores (Paleta "Set2" é muito próxima à da sua Figura 15: verde, laranja, azul)
  scale_fill_brewer(palette = "Set2") +
  
  # Títulos e Rótulos
  labs(
    title = "Variáveis de Desempenho por Cluster (PAM k=3)",
    x = "Cluster",
    y = "z-score",
    fill = "Cluster"
  ) +
  
  # Ajustes finos de layout
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    strip.background = element_rect(fill = "white"), # Fundo branco nos títulos das facetas
    strip.text = element_text(face = "bold", size = 10),
    legend.position = "bottom" # Legenda abaixo, como é padrão em artigos
  )


################## NOVAS MEDIAS PARA GRAFICO

library(dplyr)

# 1. Lista das variáveis de DESEMPENHO (padronizadas)
vars_desempenho <- c(
  "ROA_media_wz_z", 
  "CPLA_media_wz_z", 
  "ATIVOS_media_wz_z"
)

# 2. Calcular a média de cada variável de desempenho por Cluster
tabela_desempenho <- df_3 %>%
  group_by(Cluster_PAM3_Saude) %>%
  summarise(
    across(all_of(vars_desempenho), mean, .names = "Media_{.col}"),
    Contagem = n() # Útil para saber quantas cooperativas tem em cada grupo
  )

# 3. Visualizar a tabela
print(tabela_desempenho)

library(dplyr)

# 1. Lista das variáveis de DESEMPENHO (padronizadas ou originais)
# Se você quiser usar as originais (sem ser z-score) para facilitar a interpretação,
# substitua os nomes abaixo pelos nomes das colunas originais do seu df_3.
vars_desempenho <- c(
  "ROA_media_wz_z", 
  "CPLA_media_wz_z", 
  "ATIVOS_media_wz_z"
)

# 2. Calcular a MEDIANA de cada variável por Cluster
tabela_medianas <- df_3 %>%
  group_by(Cluster_PAM3_Saude) %>%
  summarise(
    # A função agora é 'median' em vez de 'mean'
    across(all_of(vars_desempenho), median, .names = "Mediana_{.col}"),
    Contagem = n()
  )

# 3. Visualizar a tabela
print(tabela_medianas)

# Opcional: Exportar para CSV
# write.csv(tabela_medianas, "medianas_desempenho_pam3_saude.csv")

library(ggplot2)
library(tidyr)
library(dplyr)

# 1. Preparar os dados
# Selecionamos a coluna correta de clusterização e as variáveis de desempenho
df_long <- df_3 %>%
  select(Cluster_PAM3_Saude, ROA_media_wz_z, CPLA_media_wz_z, ATIVOS_media_wz_z) %>%
  pivot_longer(
    cols = c(ROA_media_wz_z, CPLA_media_wz_z, ATIVOS_media_wz_z),
    names_to = "Variavel",
    values_to = "z_score"
  )

# 2. Criar o Boxplot
ggplot(df_long, aes(x = factor(Cluster_PAM3_Saude), y = z_score, fill = factor(Cluster_PAM3_Saude))) +
  
  # Desenhar o Boxplot (escondendo os outliers extremos para limpar o visual)
  geom_boxplot(outlier.shape = NA, alpha = 0.6, width = 0.5) +
  
  # Adicionar a MÉDIA como um ponto vermelho (para comparar com a mediana)
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "red", position = position_dodge(0.5)) +
  
  # Dividir em 3 painéis (um para cada variável)
  facet_wrap(~Variavel, scales = "free_y") +
  
  # Estilo Visual
  theme_bw() +
  scale_fill_brewer(palette = "Set2") +
  
  # ZOOM no Eixo Y
  # Ajuste este intervalo (-1.5 a 1.5) se precisar mostrar mais ou menos da caixa
  coord_cartesian(ylim = c(-1.5, 1.5)) + 
  
  # Títulos e Legendas
  labs(
    title = "Desempenho por Cluster (PAM): Mediana (Linha) vs Média (Ponto Vermelho)",
    subtitle = "Visualização com zoom para destacar as tendências centrais",
    x = "Cluster (PAM3 Saúde)",
    y = "z-score padronizado",
    fill = "Cluster"
  ) +
  theme(
    legend.position = "bottom",
    plot.title = element_text(face = "bold", hjust = 0.5),
    strip.text = element_text(face = "bold", size = 10)
  )



#### MOVO SEPARADO
library(ggplot2)
library(dplyr)
library(gridExtra) # Para juntar os gráficos no final, se quiser

# Definir tema padrão para garantir uniformidade visual
tema_padrao <- theme_bw() +
  theme(
    legend.position = "none", # Removemos a legenda pois o eixo X já diz o cluster
    plot.title = element_text(face = "bold", size = 12, hjust = 0.5),
    axis.title = element_text(size = 10)
  )

# --- GRÁFICO 1: ROA (Rentabilidade) ---
p_roa <- df_3 %>%
  ggplot(aes(x = factor(Cluster_PAM3_Saude), y = ROA_media_wz_z, fill = factor(Cluster_PAM3_Saude))) +
  geom_boxplot(outlier.shape = NA, alpha = 0.6, width = 0.5) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "red") +
  scale_fill_brewer(palette = "Set2") +
  # Zoom adequado para ROA (ajuste se necessário)
  coord_cartesian(ylim = c(-2, 2)) + 
  labs(title = "Rentabilidade (ROA)", x = "Cluster", y = "z-score") +
  tema_padrao

# --- GRÁFICO 2: ATIVOS (Porte) ---
p_ativos <- df_3 %>%
  ggplot(aes(x = factor(Cluster_PAM3_Saude), y = ATIVOS_media_wz_z, fill = factor(Cluster_PAM3_Saude))) +
  geom_boxplot(outlier.shape = NA, alpha = 0.6, width = 0.5) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "red") +
  scale_fill_brewer(palette = "Set2") +
  # Zoom adequado para ATIVOS
  coord_cartesian(ylim = c(-1, 1)) + 
  labs(title = "Porte (ATIVOS)", x = "Cluster", y = "z-score") +
  tema_padrao

# --- GRÁFICO 3: CPLA (Crescimento) - O "Super Zoom" ---
p_cpla <- df_3 %>%
  ggplot(aes(x = factor(Cluster_PAM3_Saude), y = CPLA_media_wz_z, fill = factor(Cluster_PAM3_Saude))) +
  geom_boxplot(outlier.shape = NA, alpha = 0.6, width = 0.5) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "red") +
  scale_fill_brewer(palette = "Set2") +
  # ZOOM ESPECÍFICO PARA CPLA: Focamos numa faixa bem estreita
  # Como as médias são aprox -0.25, vamos focar entre -0.5 e 0.0
  coord_cartesian(ylim = c(-0.6, 0.1)) + 
  labs(title = "Crescimento (CPLA)", x = "Cluster", y = "z-score") +
  tema_padrao

# --- EXIBIR OS GRÁFICOS ---

# Opção A: Exibir um por um (para você salvar individualmente)
print(p_roa)
print(p_cpla)
print(p_ativos)

# Opção B: Juntar os 3 em uma única imagem (Lado a Lado)
grid.arrange(p_ativos, p_cpla, p_roa, ncol = 3)


#####CRIANDO OS GRAFICOS DE HETEROGENEIDADE
str(df_2)

library(dplyr)
glimpse(df_2)


library(ggplot2)
library(dplyr)
library(scales) # Para formatar eixos como porcentagem

# 1. Preparação rápida dos dados
# Vamos criar uma versão filtrada para tirar extremos (opcional, mas recomendado em dados financeiros)
# e garantir que ANO seja tratado como categoria (fator) nos gráficos.
df_graficos <- df_2 %>%
  mutate(
    ANO_Fator = as.factor(ANO),
    ROA_Percent = SOBRAS_POR_ATIVO * 100 # Assumindo que o dado original está em decimal (ex: 0.05)
  )

# --- GRÁFICO 1: Boxplot (A evolução da dispersão no tempo) ---
# Este gráfico mostra se a diferença entre as melhores e piores coops está aumentando.
# Solução: Mantemos 'ANO_Fator' no aes() para o desenho funcionar,
# mas mudamos o rótulo visualmente com labs()

ggplot(df_graficos, aes(x = ANO_Fator, y = ROA_Percent)) +
  geom_boxplot(fill = "steelblue", alpha = 0.7, outlier.shape = 1) +
  
  # AQUI ESTÁ A MUDANÇA:
  labs(
    title = "Heterogeneidade do ROA ao Longo dos Anos (-20% +30%)",
    y = "ROA (%)",
    x = "Ano"  # <-- Isso substitui "ANO_Fator" por "Ano" no gráfico
  ) +
  
  theme_minimal() +
  coord_cartesian(ylim = c(-20, 30)) + # Mantendo o zoom sugerido antes
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Inclina os anos para caber melhor


# Gráfico de Dispersão: Tamanho vs Performance
# Vamos focar apenas no ano mais recente (2024) ou comparar 1995 vs 2024
df_foco <- df_graficos %>% 
  filter(ANO %in% c(1995, 2010, 2024)) # Pegando 3 anos chave para comparar

ggplot(df_foco, aes(x = ATIVOS_VERDADEIROS, y = ROA_Percent)) +
  geom_point(alpha = 0.5, color = "darkblue") +
  # Escala logarítmica é vital aqui, senão as cooperativas gigantes esmagam o gráfico
  scale_x_log10(labels = scales::label_number(scale_cut = scales::cut_short_scale())) + 
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  facet_wrap(~ANO) + # Cria 3 painéis lado a lado
  labs(
    title = "O tamanho afeta a estabilidade do ROA?",
    subtitle = "Comparativo 1995, 2010 e 2024",
    x = "Ativos Totais (Escala Log)",
    y = "ROA (%)"
  ) +
  theme_minimal() +
  coord_cartesian(ylim = c(-20, 30)) # Mantendo o mesmo zoom para facilitar a comparação



# --- GRÁFICO 2: Densidade (A forma da heterogeneidade) ---
# Este gráfico mostra se a maioria está concentrada em um valor ou se há "calombos" (bimodalidade).
ggplot(df_graficos, aes(x = ROA_Percent, fill = ANO_Fator)) +
  geom_density(alpha = 0.3) +
  labs(
    title = "Distribuição de Densidade do ROA",
    subtitle = "Comparativo da forma da distribuição por ano",
    x = "ROA (%)",
    y = "Densidade"
  ) +
  scale_x_continuous(limits = c(-10, 20)) + # Ajuste os limites conforme seus dados reais
  theme_minimal()




# --- GRÁFICO 3: Scatterplot (Heterogeneidade vs. Tamanho) ---
# Mostra se as cooperativas maiores (Ativos) têm menos variação de ROA que as pequenas.
ggplot(df_graficos, aes(x = ATIVOS_VERDADEIROS, y = ROA_Percent)) +
  geom_point(alpha = 0.4, color = "steelblue") +
  scale_x_log10(labels = label_number(scale_cut = cut_short_scale())) + # Escala logarítmica é vital para ativos
  geom_smooth(method = "lm", color = "red", se = FALSE) + # Linha de tendência
  facet_wrap(~ANO) + # Um gráfico por ano
  labs(
    title = "Relação Tamanho vs. Performance (ROA)",
    subtitle = "Escala Log nos Ativos para melhor visualização",
    x = "Ativos Totais (Escala Log)",
    y = "ROA (%)"
  ) +
  theme_minimal()


###NOVO
library(dplyr)
library(ggplot2)
library(scales)

# 1. Definindo as regras de filtragem personalizadas
# Usamos a lógica OU (|) para pegar apenas os recortes específicos de cada ano
df_filtrado_tamanho <- df_graficos %>%
  filter(
    (ANO == 2010 & ATIVOS_VERDADEIROS >= 500000 & ATIVOS_VERDADEIROS <= 1000000000) |
      (ANO == 2024 & ATIVOS_VERDADEIROS >= 10000000 & ATIVOS_VERDADEIROS <= 2000000000)
  )

# 2. Criando um data frame auxiliar para desenhar as linhas verticais (limites visuais)
# Isso ajuda a visualizar os pontos de corte intermediários que você mencionou (10M em 2010, 500M em 2024)
linhas_referencia <- data.frame(
  ANO = c(2010, 2010, 2010, 2024, 2024, 2024),
  x_intercept = c(500000, 10000000, 1000000000, 10000000, 500000000, 2000000000),
  tipo = c("Limite", "Intermediario", "Limite", "Limite", "Intermediario", "Limite")
)

# 3. Gerando o gráfico
ggplot(df_filtrado_tamanho, aes(x = ATIVOS_VERDADEIROS, y = ROA_Percent)) +
  geom_point(alpha = 0.5, color = "darkblue") +
  
  # Escala Logarítmica com formatação de moeda ou "K/M/B" para facilitar a leitura
  scale_x_log10(
    labels = scales::label_number(scale_cut = scales::cut_short_scale()),
    breaks = c(500000, 10000000, 500000000, 2000000000) # Força os números que você pediu aparecerem no eixo
  ) + 
  
  # Linha de referência do ROA zero
  geom_hline(yintercept = 0, linetype = "dashed", color = "red", alpha = 0.5) +
  
  # Adicionando as linhas verticais dos seus limites
  geom_vline(data = linhas_referencia, aes(xintercept = x_intercept), 
             linetype = "dotted", color = "gray20") +
  
  facet_wrap(~ANO, scales = "free_x") + # "free_x" permite que cada ano tenha seu próprio eixo ajustado
  
  labs(
    title = "Relação Tamanho vs. Performance (Com Filtros Personalizados)",
    subtitle = "2010 (500k-1B) vs 2024 (10M-2B)",
    x = "Ativos Totais (Escala Log)",
    y = "ROA (%)"
  ) +
  theme_minimal() +
  coord_cartesian(ylim = c(-20, 30)) # Mantendo o zoom no eixo Y



################
# 1. Focar apenas no cenário atual (2024) para provar a persistência HOJE
library(dplyr)
library(ggplot2)

# 1. Preparar os dados e remover os NAs
df_2024 <- df_graficos %>% 
  filter(ANO == 2024) %>%
  mutate(
    # Divide os ativos em 4 grupos (Quartis)
    Quartil_Tamanho = ntile(ATIVOS_VERDADEIROS, 4),
    Nome_Grupo = case_when(
      Quartil_Tamanho == 1 ~ "1. Pequenas (Base)",
      Quartil_Tamanho == 2 ~ "2. Médias-Baixas",
      Quartil_Tamanho == 3 ~ "3. Médias-Altas",
      Quartil_Tamanho == 4 ~ "4. Gigantes (Topo)"
    )
  ) %>%
  # --- AQUI ESTÁ A CORREÇÃO ---
  # Removemos qualquer linha que não tenha conseguido classificação (NA)
  filter(!is.na(Nome_Grupo)) 

# 2. Plotar o gráfico limpo
ggplot(df_2024, aes(x = Nome_Grupo, y = ROA_Percent, fill = Nome_Grupo)) +
  geom_boxplot(alpha = 0.6, outlier.alpha = 0.4, outlier.size = 1) +
  labs(
    title = "A Persistência da Heterogeneidade nas Pequenas Cooperativas",
    subtitle = "Dispersão do ROA em 2024 segmentada por porte (quartis)",
    x = "Porte da Cooperativa",
    y = "ROA (%)"
  ) +
  theme_minimal() +
  coord_cartesian(ylim = c(-25, 25)) + 
  theme(legend.position = "none") # Remove a legenda lateral pois o eixo X já explica


####NOVOS GRADICOS PARA APRESENTACAO 11.12.25
library(ggplot2)
library(dplyr)

# 1. Criando o Dataframe com seus dados
dados_ano <- data.frame(
  Periodo = c(rep("FHC (1995-2002)", 7), rep("Lula (2003-2010)", 6), 
              rep("Dilma (2011-2016)", 5), rep("Temer/Bolsonaro (2017-2022)", 5)),
  Ano = c(1996, 1997, 1998, 2000, 2001, 2002, 1995, # FHC (1995 é NA no original, removido depois)
          2004, 2006, 2007, 2008, 2009, 2010,       # Lula
          2012, 2013, 2014, 2015, 2016,             # Dilma
          2018, 2019, 2020, 2021, 2022),            # Temer/Bolsonaro
  Coeficiente = c(0.023117, 0.012300, -0.001060, 0.025623, -0.015054, -0.002831, NA,
                  -0.015243, -0.015953, -0.020043, 0.028242, -0.032058, -0.038431,
                  0.0005705, -0.0015438, -0.003494, -0.0085754, -0.0103213,
                  -0.005563, -0.003068, -0.004756, -0.008488, -0.011938),
  Erro_Padrao = c(0.007926, 0.007926, 0.007926, 0.007926, 0.007926, 0.007926, NA,
                  0.004305, 0.004305, 0.004305, 0.004305, 0.004305, 0.004305,
                  0.0021782, 0.0021782, 0.0021782, 0.0021782, 0.0021782,
                  0.001825, 0.001825, 0.001825, 0.001825, 0.001825)
)

# 2. Limpeza e Cálculos
dados_plot <- dados_ano %>%
  filter(!is.na(Coeficiente)) %>% # Remove os anos de referência vazios
  mutate(
    # Calcula Intervalo de Confiança (95%)
    CI_Lower = Coeficiente - (1.96 * Erro_Padrao),
    CI_Upper = Coeficiente + (1.96 * Erro_Padrao),
    # Define se é significativo (se o intervalo não cruza o zero)
    Significativo = ifelse(CI_Lower > 0 | CI_Upper < 0, "Sim", "Não")
  )

# Ordem correta dos períodos para a legenda
dados_plot$Periodo <- factor(dados_plot$Periodo, levels = c("FHC (1995-2002)", "Lula (2003-2010)", "Dilma (2011-2016)", "Temer/Bolsonaro (2017-2022)"))

# 3. Gerando o Gráfico
ggplot(dados_plot, aes(x = Ano, y = Coeficiente)) +
  # Linha zero de referência (importante para ver se o efeito é positivo ou negativo)
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray50") +
  
  # Linha conectando os pontos (mostra a tendência)
  geom_line(color = "gray70", size = 0.8) +
  
  # Barras de erro (Intervalo de Confiança)
  geom_errorbar(aes(ymin = CI_Lower, ymax = CI_Upper, color = Periodo), width = 0.4, alpha = 0.7) +
  
  # Pontos (Coeficientes)
  geom_point(aes(color = Periodo, shape = Significativo), size = 3) +
  
  # Cores personalizadas para os períodos (opcional, cores sóbrias)
  scale_color_manual(values = c("#2E8B57", "#B22222", "#E37222", "#1E3F5A")) +
  
  # Ajuste de escalas e textos
  scale_y_continuous(labels = scales::percent) +
  scale_x_continuous(breaks = seq(1996, 2022, 2)) +
  
  labs(
    title = "Efeito Temporal (Ano) no Desempenho das Cooperativas",
    subtitle = "Coeficientes de efeito fixo com intervalo de confiança de 95%",
    y = "Impacto no Desempenho (Coeficiente)",
    x = "Ano",
    shape = "Estat. Significativo?"
  ) +
  
  theme_minimal() +
  theme(
    legend.position = "bottom",
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.minor = element_blank()
  )


####OUTRA FIGURA
library(gt)
library(dplyr)

# 1. Recriando os dados da Tabela 18 manualmente
dados_tabela <- data.frame(
  Variavel = c("ATIVOS (Porte)", "ATIVOS (Porte)", "ATIVOS (Porte)",
               "ROA (Rentabilidade)", "ROA (Rentabilidade)", "ROA (Rentabilidade)",
               "CPLA (Crescimento)", "CPLA (Crescimento)", "CPLA (Crescimento)"),
  Comparacao = c("1 vs 2", "1 vs 3", "2 vs 3",
                 "1 vs 2", "1 vs 3", "2 vs 3",
                 "1 vs 2", "1 vs 3", "2 vs 3"),
  Estatistica_Z = c(14.187, 24.552, 14.371, 
                    19.028, -24.466, -44.047, 
                    67.228, 32.777, -24.098),
  Valor_P = c(0.2340, 0.0211, 0.2260, 
              0.0856, 0.0216, 0.0000, 
              0.0000, 0.0016, 0.0239),
  Significativo = c("Não", "Sim", "Não", 
                    "Não", "Sim", "Sim", 
                    "Sim", "Sim", "Sim")
)

# 2. Gerando a Tabela Visual com 'gt'
tabela_visual <- dados_tabela %>%
  group_by(Variavel) %>% # Agrupa para não repetir o nome da variável
  gt() %>%
  
  # Cabeçalho
  tab_header(
    title = md("**Teste de Dunn (Pós-hoc)**"),
    subtitle = "Comparação de pares com correção de Bonferroni (α=0,05)"
  ) %>%
  
  # Formatação dos Números
  fmt_number(
    columns = c(Estatistica_Z),
    decimals = 3
  ) %>%
  fmt_number(
    columns = c(Valor_P),
    decimals = 4
  ) %>%
  
  # Destaque Visual: Pintar de azul claro as linhas onde houve diferença significativa ("Sim")
  tab_style(
    style = list(
      cell_fill(color = "#e6f3ff"), # Azul bem clarinho
      cell_text(weight = "bold")
    ),
    locations = cells_body(
      rows = Significativo == "Sim"
    )
  ) %>%
  
  # Renomear colunas para ficar bonito
  cols_label(
    Comparacao = "Comparação",
    Estatistica_Z = "Estatística Z",
    Valor_P = "Valor-p",
    Significativo = "Diferença?"
  ) %>%
  
  # Estilo geral (Bordas e alinhamento)
  opt_align_table_header(align = "left") %>%
  tab_options(
    table.border.top.color = "black",
    table.border.bottom.color = "black",
    heading.title.font.size = 18,
    column_labels.font.weight = "bold"
  )


# 3. Exibir a tabela
tabela_visual

# Para salvar como imagem (PNG), use a função gtsave:
# gtsave(tabela_visual, "tabela_dunn_formatada.png")

x <- 5
y <- 10
x + y

getwd()

###save.image("c:/Aula3/docs/novo1_05_10_24_.RData")
load("C:/Users/Possani/OneDrive/Aula3/docs/novo_30_09_25_.RData")

install.packages("remotes")
remotes::install_github("ricardo-bion/ggradar")
library(ggradar)

Sys.which("make")

install.packages("remotes")
options(expressions = 500000)

remotes::install_github(
  "ricardo-bion/ggradar",
  dependencies = TRUE,
  upgrade = "never",
  build_vignettes = FALSE
)

renv::deactivate()

options(expressions = 500000)
install.packages("remotes")
remotes::install_github(
  "ricardo-bion/ggradar",
  dependencies = TRUE,
  upgrade = "never",
  build_vignettes = FALSE
)
library(ggradar)


pkgs <- c(
  "lme4","Rcpp","ggplot2","ggpubr","purrr","flexclust",
  "scales","plotly","factoextra","strucchange",
  "ggrepel","patchwork","tidytext","openxlsx","leaflet",
  "officer","fable","R6","fabletools","modeltools"
)

# Instala o que estiver faltando
to_install <- pkgs[!pkgs %in% rownames(installed.packages())]
if (length(to_install) > 0) install.packages(to_install)

# Carrega todos (falha com mensagem clara se algo der errado)
invisible(lapply(pkgs, function(p) {
  ok <- require(p, character.only = TRUE)
  if (!ok) stop(paste("Falha ao carregar o pacote:", p))
}))

##load("C:/Users/Possani/OneDrive/Aula3/docs/novo_30_09_25_.RData")
load("C:/Users/Possani/OneDrive/Aula3/docs/novo_13_10_25_.RData")
getwd()


obj_names <- load("C:/Users/Possani/OneDrive/Aula3/docs/novo_13_10_25_.RData", envir = new.env())
obj_names


e <- new.env(parent = emptyenv())
try({
  nm <- load("C:/Users/Possani/OneDrive/Aula3/docs/novo_13_10_25_.RData", envir = e)
}, silent = TRUE)
if (exists("nm")) {
  print(nm)
} else {
  print("Falha ao carregar o arquivo .RData")
}


arq <- "C:/Users/Possani/OneDrive/Aula3/docs/novo_13_10_25_.RData"

e <- new.env(parent = emptyenv())
obj_names <- load(arq, envir = e)

length(obj_names)
head(obj_names, 20)

info <- data.frame(
  name  = obj_names,
  class = sapply(obj_names, function(nm) paste(class(e[[nm]]), collapse = "/")),
  type  = sapply(obj_names, function(nm) typeof(e[[nm]])),
  size_mb = sapply(obj_names, function(nm) as.numeric(object.size(e[[nm]])) / 1024^2),
  stringsAsFactors = FALSE
)

info <- info[order(-info$size_mb), ]
head(info, 30)


keep_df <- obj_names[sapply(obj_names, function(nm) is.data.frame(e[[nm]]))]

keep_models <- obj_names[sapply(obj_names, function(nm) {
  inherits(e[[nm]], c("lmerMod", "glmerMod", "lm", "glm"))
})]

length(keep_df)
length(keep_models)

# ver exemplos
head(keep_df, 30)
head(keep_models, 30)

drop_by_name <- grep(
  "(^\\.|^p\\d+$|^g\\d+$|^k\\d+$|^M$|^X$|^df$|^b$|^c$|^i$|^p$|^v$|^res$|^result$|^temp$|^names$|^grid$|^wb$|^doc$|^fig$|mapa|plot|leaflet|plotly|officer|xml|html|widget)",
  obj_names,
  value = TRUE,
  ignore.case = TRUE
)


keep <- unique(c(keep_df, keep_models))
keep <- setdiff(keep, drop_by_name)

# montar lista com os objetos mantidos
limpo <- mget(keep, envir = e)

# salvar
saveRDS(limpo, file = "dados_tese_limpo.rds")

length(limpo)
names(limpo)[1:20]

limpo <- readRDS("dados_tese_limpo.rds")
# para trazer um objeto:
estatisticas_totais_ano <- limpo$estatisticas_totais_ano


keep_manual <- c("resultado_combinado", "estatisticas_totais_ano",
                 "df_TemerBolsonaro_filtrado", "mod_Lula1_UF2")

limpo <- mget(keep_manual, envir = e)
saveRDS(limpo, "dados_selecionados.rds")

arq <- "C:/Users/Possani/OneDrive/Aula3/docs/novo_13_10_25_.RData"

e <- new.env(parent = emptyenv())
obj_names <- load(arq, envir = e)

df_names <- obj_names[sapply(obj_names, function(nm) is.data.frame(e[[nm]]))]

dfs <- mget(df_names, envir = e)   # lista nomeada com todos os dataframes
length(dfs)
names(dfs)[1:30]

dfs$df_TemerBolsonaro_filtrado


#Criar a pasta de data frames versionáveis
dir.create("dataframes_rds", showWarnings = FALSE)

#Criar a pasta de data frames versionáveis
for (nm in names(dfs)) {
  saveRDS(dfs[[nm]], file = file.path("dataframes_rds", paste0(nm, ".rds")))
}

df_teste <- readRDS("dataframes_rds/estatisticas_totais_ano.rds")
str(df_teste)

###dia 17.12 github configurado



