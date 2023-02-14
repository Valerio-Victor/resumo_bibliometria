# Pacotes Utilizados: -----------------------------------------------------
library(magrittr, include.only = '%>%')
library(bibliometrix)

# Importação dos Dados: ---------------------------------------------------
# Importação dos dados da base Web Of Science:
load(file = './dados/wos.RData')
dados_wos <- M %>%
  dplyr::filter(DT == 'ARTICLE',
                PY <= 2022,
                LA == 'ENGLISH')

# Importação dos dados da base Scopus:
load(file = './dados/scopus.RData')
dados_scopus <- M %>%
  dplyr::filter(DT == 'ARTICLE',
                PY <= 2021,
                LA == 'ENGLISH')

# Fusão das bases:
M <- bibliometrix::mergeDbSources(dados_wos,
                                  dados_scopus)
# Exportação dos dados:
save(x = M,
     file = './dados/dados_consolidados.RData')

