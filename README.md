# 🌽 milhaRal API 🌽
API para cálculos de estimativa de produtividade do milho.

## 🚜 Qual importância de realizar estimativas de produtividade?

Estimar a produtividade tem como principal objetivo dar uma "ideia" de quanto rendimento o campo proporcionará. Também pode ser útil tanto em ensaios de híbridos, onde é possível testar a variabilidade genética da produção, e em avaliar diferentes estratégias de manejo.
Apesar de inúmeros fatores que se associam diretamente com a produtividade final, existem três métodos propostos para servirem de base para fazer comparações.

## 💻 Conhecendo a API e seus métodos:

![](https://raw.githubusercontent.com/josehenriqueroveda/milhaRal-API/main/img/metodos.png)

#### 1. Método Simples

Para utilizar este método é necessário saber a população de plantas na área de 1 *hectare*, coletar algumas espigas desta área e calcular o peso médio dos grãos destas espigas.
Ao utilizar o *endpoint* **/simples**, utiliza-se como entrada este peso médio e a população de plantas.

![](https://raw.githubusercontent.com/josehenriqueroveda/milhaRal-API/main/img/simplesReq.png)

Como resposta, a API retornará a produtividade estimada por meio deste método:

![](https://raw.githubusercontent.com/josehenriqueroveda/milhaRal-API/main/img/simplesResponse.png)


#### 2. Método Corn Yield Calculation

Este método de cálculo foi publicado pelo Universidade de Illinois (EUA).
O primeiro passo é criar uma planilha para alimentar os dados de entrada, portanto, siga os passos:

**1.** Conte o número de espigas em 4m² (utilize a tabela abaixo como referência):


| Espaçamento Entre Linhas (cm) | Comprimento para obter 4m² |
|:-----------------------------:|:--------------------------:|
|               50              |            8,0 m           |
|               60              |            6,6 m           |
|               70              |            5,7 m           |
|               80              |            5,0 m           |
|               90              |            4,4 m           |
|              100              |            4,0 m           |


**2.** Selecione 4 espigas representativas nesta área contando o número de fileiras de grãos e de grãos por fileira em cada uma dessas espigas (sem contar os das extremidades muito pequenos). Preencha sua planilha de forma que as informações estejam como no exemplo abaixo:

| Espigas 4m2 | Fileiras de Graos | Graos por Fileira |
|:-----------:|:-----------------:|:-----------------:|
|      16     |         12        |         26        |
|      16     |         16        |         37        |
|      16     |         22        |         38        |
|      16     |         14        |         30        |
|      18     |         16        |         40        |
|      18     |         16        |         22        |
|      18     |         14        |         28        |
|      18     |         12        |         33        |

**3.** Ao utilizar o *endpoint* **/illinois**, uitiliza-se um arquivo **.csv** como entrada, a partir da planilha de dados das amostras:

![](https://raw.githubusercontent.com/josehenriqueroveda/milhaRal-API/main/img/illinoisReq.png)

Como resposta, a API retornará a produtividade estimada por meio deste método:

![](https://raw.githubusercontent.com/josehenriqueroveda/milhaRal-API/main/img/illinoisResponse.png)


#### 3. Método indicado pelo Emater

Para utilizar este método é necessária a população média de plantas em 10m lineares, além do peso médio dos grãos entre 3 espigas coletadas e o espaçamento entre linhas (m).
Ao utilizar o *endpoint* **/emater**, utiliza-se como entrada os dados citados acima.

![](https://raw.githubusercontent.com/josehenriqueroveda/milhaRal-API/main/img/ematerReq.png)

Como resposta, a API retornará a produtividade estimada por meio deste método:

![](https://raw.githubusercontent.com/josehenriqueroveda/milhaRal-API/main/img/ematerResponse.png)


---

### ⚙️ Técnico

> **Linguagem:** [R](https://www.r-project.org/)

> **API Generator:** [plumber](https://www.rplumber.io/)

> **Other Packages:** gapminder, roxygen2, Rook

---

### Sobre:

> - 💻 **José Henrique Roveda**
> - 📨 Contact me on [LinkedIn](https://www.linkedin.com/in/jhroveda/)

