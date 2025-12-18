library(readxl)
library(tidyverse)
library(magrittr)
library(dplyr)
library(ggplot2)

#install.packages("openai")

# if (!require(remotes)) {
#   install.packages("remotes")
# }
#remotes::install_github("MichelNivard/gptstudio")

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

summary(Dados_pivotados_2022)

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


total_dados <- bind_rows(
  Dados_pivotados_2022, Dados_pivotados_2021, Dados_pivotados_2020, Dados_pivotados_2019,
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
class(Dados_limpos_2022$ANO)

total_dados_limpos <- bind_rows(
  Dados_limpos_2022, Dados_limpos_2021, Dados_limpos_2020, Dados_limpos_2019,
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

save.image("novo_11_09_24_.RData")
load("novo_11_09_24_.RData")

resultado_combinado <- bind_rows(
  resultado_validos23, resultado_validos24, resultado_validos25, resultado_validos26,
  resultado_validos22, resultado_validos21, resultado_validos20, resultado_validos19,
  resultado_validos18, resultado_validos17, resultado_validos16, resultado_validos15,
  resultado_validos14, resultado_validos13, resultado_validos12, resultado_validos11,
  resultado_validos10, resultado_validos9, resultado_validos8, resultado_validos7,
  resultado_validos6, resultado_validos5, resultado_validos4, resultado_validos3,
  resultado_validos2, resultado_validos1
)



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

# Garantir que as variáveis categóricas estão como fatores
df_limpo$Unidade_de_Negocio <- factor(df_limpo$CNPJ)
df_limpo$Localizacao_munic <- factor(df_limpo$Cod_Munic)
df_limpo$Localizacao_UF <- factor(df_limpo$UF)
df_limpo$Localizacao_Inter <- factor(df_limpo$Cod_Reg_Intermed)
df_limpo$Localizacao_Imed <- factor(df_limpo$Cod_Reg_Imediata)
df_limpo$Ano <- factor(df_limpo$ANO)

save.image("novo3_11_09_24_.RData")
load("novo_11_09_24_.RData")

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






df_Dilma2 <- df_limpo[df_limpo$ANO %in% c(2015, 2016), ]

df_Dilma2_filteredMunic <- filtrar_cooperativas(df_Dilma2,
  min_coop_munic = 3,
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

rmarkdown::render("mod_BolsonaroFil.Rmd")


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

head(estatisticas_totais_ano)

summary(df_Temer)


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
# write.csv(df_TemerBolsonaro, "c:/Aula3/docs/df_TemerBolsonaro.csv", row.names = FALSE)
df_TemerBolsonaro <- read.csv("c:/Aula3/docs/df_TemerBolsonaro.csv",
  sep = ",", # Use ";" se o arquivo estiver com separador de ponto e vírgula
  stringsAsFactors = FALSE,
  fileEncoding = "UTF-8"
)

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
library(readxl)
IFDM_Emp_Renda <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Emprego_Renda.xlsx")
IFDM_Edu <- read_excel("C:/Aula3/DadosCoopBrasil/IFDM/Educacao.xlsx")


df_Art3 <- df_limpo[df_limpo$ANO %in% c(2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016), ]

#O dígito verificador é um mecanismo que ajuda a evitar erros na digitação ou transmissão do código.
df_Art3$Cod_Munic <- substr(df_Art3$Cod_Munic, 1, nchar(df_Art3$Cod_Munic)-1)

IFDM_Emp_Renda <- IFDM_Emp_Renda [ , -c(2,3,4)]
IFDM_Edu <- IFDM_Edu[,-c(2,3,4)]
# Transforma a coluna Código e id_municipio para o mesmo formato
IFDM_Emp_Edu$Código <- as.character(IFDM_Emp_Renda$Código)
IFDM_Edu$Código <- as.character(IFDM_Edu$Código)

library(dplyr)
library(tidyr)

# Transformar IFDM_Emp_Renda de formato largo para longo
IFDM_Emp_Renda_long <- IFDM_Emp_Renda %>%
  pivot_longer(cols = starts_with("20"), names_to = "ANO", values_to = "IFDM_Emp_Renda") %>%
  mutate(ANO = as.integer(ANO), Cod_Munic = Código)  # Certificar que ANO está em formato numérico

# Fazer o merge dos DataFrames
df_Art3 <- df_Art3 %>%
  left_join(IFDM_Emp_Renda_long, by = c("Cod_Munic", "ANO"))

IFDM_Edu <- IFDM_Edu %>%
  mutate(across(starts_with("20"), as.character))
# Transformar IFDM_Edu de formato largo para longo
IFDM_Edu_long <- IFDM_Edu %>%
  pivot_longer(cols = starts_with("20"), names_to = "ANO", values_to = "IFDM_Edu") %>%
  mutate(ANO = as.integer(ANO), Cod_Munic = Código)  # Certificar que ANO está em formato numérico

# Fazer o merge dos DataFrames com IFDM_Edu
df_Art3 <- df_Art3 %>%
  left_join(IFDM_Edu_long, by = c("Cod_Munic", "ANO"))

#### carregando VAB
VAB1 <- read_excel("C:/Aula3/DadosCoopBrasil/IBGE/PIB_dos_Municipios_2002-2009_NOVO.xls")
VAB1 <- VAB1 %>% select(1,7,41)
VAB1 <- VAB1[VAB1$Ano %in% c(2005,2006,2007,2008,2009), ]

VAB2 <- read_excel("C:/Aula3/DadosCoopBrasil/IBGE/PIB_dos_Municipios_2010-2020_NOVO.xls")
VAB2 <- VAB2 %>% select(1,7,41)
VAB2 <- VAB2[VAB2$Ano %in% c(2010,2011,2012,2013,2014,2015,2016), ]

VAB <- bind_rows(VAB1, VAB2)
VAB$Código <- substr(VAB$Código, 1, nchar(VAB$Código)-1)


# Renomear a coluna Código para Cod_Munic, se necessário
VAB <- VAB %>%
  rename(Cod_Munic = Código, ANO = Ano)  # Ajustar nomes conforme necessário

# Unir o VAB com df_Art3 com base em Cod_Munic e ANO
df_Art3 <- df_Art3 %>%
  left_join(VAB, by = c("Cod_Munic", "ANO"))

df_Art3$IFDM_Emp_Renda <- as.factor(df_Art3$IFDM_Emp_Renda)
df_Art3$IFDM_Edu <- as.factor(df_Art3$IFDM_Edu)
df_Art3$VAB <- as.factor(df_Art3$VAB)

# Verifica se há valores NA em cada coluna específica
sapply(df_Art3[, c("IFDM_Emp_Renda", "IFDM_Edu", "VAB", "Código.y")], function(x) sum(is.na(x)))

write.csv(df_Art3, "c:/Aula3/docsdf_Art3.csv", row.names = FALSE)
library()
modelo_ROA <- lmer(SOBRAS_POR_ATIVO ~ IFDM_Emp_Renda + IFDM_Edu + VAB + Ano + (1 | Localizacao_munic), data = df_Art3)
modelo_ROA <- lmer(SOBRAS_POR_ATIVO ~ + VAB + (1 | Localizacao_munic), data = df_Art3)

save.image("c:/Aula3/docs/novo1_27_10_24_.RData")
load("c:/Aula3/docs/novo_27_10_24_.RData")

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

