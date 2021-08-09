# Installing and loading the packages

pacotes <- c("plumber","gapminder","roxygen2", "Rook")

if(sum(as.numeric(!pacotes %in% installed.packages())) != 0){
  instalador <- pacotes[!pacotes %in% installed.packages()]
  for(i in 1:length(instalador)) {
    install.packages(instalador, dependencies = T)
    break()}
  sapply(pacotes, require, character = T) 
} else {
  sapply(pacotes, require, character = T) 
}

# -----------------------------------------------------------------------------
#* @apiTitle milhaRal API
#* @apiDescription API para estimar a produtividade do milho.
#* @apiContact list(name = "José Henrique Roveda", url = "https://www.linkedin.com/in/jhroveda/", email = "josehenriqueroveda@usp.br")
#* @apiLicense list(name = "MIT License", url = "https://raw.githubusercontent.com/josehenriqueroveda/milhaRal-API/main/LICENSE")
#* @apiTag Estimativas Cálculos para estimar a produtividade do milho

# -----------------------------------------------------------------------------
# Primeiro Método

#* Cálculo de Produtividade - Simples
#* @tag Estimativas
#* @param peso_medio Peso médio dos grãos (g) das espigas selecionadas
#* @param populacao População de plantas na área por hectare
#* @serializer unboxedJSON
#* @get /simples
function(peso_medio, populacao) {
  res <- (as.numeric(peso_medio)/1000) * as.numeric(populacao)
  return(list(Produtividade_Estimada = res, Unidade_Medida = "kg/ha"))
}

# Segundo Método

#* Corn Yield Calculation - Universidade de Illinois
#* @tag Estimativas
#* @param req:file Arquivo CSV das amostras coletadas
#* @post /illinois
function(req) {
  file <- Rook::Multipart$parse(req)$req$tempfile
  amostras <- read.csv(file)
  amostras$Prod_Espiga <- (amostras$Espigas4m2) * (amostras$FileirasGraos) * (amostras$GraosFileira) * 0.70
  return(list(Produtividade_Estimada = mean(amostras$Prod_Espiga), Unidade_Medida = "kg/ha a 15.5% de umidade"))
}


# Terceiro Método

#* Cáculo de Produtividade - Emater
#* @tag Estimativas
#* @param n_espigas Número de espigas em 10m lineares
#* @param peso_medio Peso médio de grãos de 3 espigas coletadas (g)
#* @param entre_linhas Espaçamento entre linhas (m)
#* @get /emater
function(n_espigas, peso_medio, entre_linhas) {
  res <- ((as.numeric(n_espigas) * as.numeric(peso_medio)) / as.numeric(entre_linhas)) / 1000
  return(list(Produtividade_Estimada = res, Unidade_Medida = "ton/ha a 15.5% de umidade"))
}