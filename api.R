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
#* @apiDescription API para cálculos de produtividade do milho.

# -----------------------------------------------------------------------------
# Primeiro Método

#* Cálculo Simples
#* 
#* @param peso_medio Peso médio dos grãos (gramas) das espigas selecionadas
#* @param populacao População de plantas na área por hectare
#* @serializer unboxedJSON
#* @get /simples
function(peso_medio, populacao) {
  res <- (as.numeric(peso_medio)/1000) * as.numeric(populacao)
  return(list(Produtividade_Estimada = res, Unidade_Medida = "kg/ha"))
}

# Segundo Método

#* Corn Yield Calculation
#* 
#* @param req:file Arquivo CSV das amostras coletadas
#* @post /illinois
function(req) {
  file <- Rook::Multipart$parse(req)$req$tempfile
  amostras <- read.csv(file)
  amostras$Prod_Espiga <- (amostras$Espigas4m2) * (amostras$FileirasGraos) * (amostras$GraosFileira) * 0.70
  mean(amostras$Prod_Espiga)
}
