# HEAD_ME: Passo a Passo do Processo de Regressão Linear

## Introdução
Este documento detalha o processo de desenvolvimento de um modelo de regressão linear múltipla para prever o preço de aluguel de imóveis com base em variáveis independentes.

---

## 1. Pré-processamento dos Dados
### a) Verificação dos Tipos de Dados
- Carreguei a base de dados utilizando `pandas`.
- Verifiquei os tipos de dados com `df.info()`, confirmando que todas as colunas eram do tipo `int64`.

### b) Verificação de Dados Faltantes
- Utilize `df.isnull().sum()` para identificar valores ausentes.
- Não havia valores faltantes, então não foi necessário tratamento.

### c) Identificação de Outliers
- Usei `df.describe()` para analisar estatísticas básicas e possíveis outliers.
- Notei que `Valor_Condominio` possuía valores extremos.
- Apliquei o método do Intervalo Interquartil (IQR) para remover outliers.

---

## 2. Análise Exploratória
### a) Análise Bivariada
- Plotei gráficos de dispersão, boxplots e heatmaps de correlação utilizando `seaborn` e `matplotlib`.
- Identifiquei que a variável `Metragem` tinha correlação moderada com `Valor_Aluguel`.

---

## 3. Separação dos Dados em Treino e Teste
- Defini `X` (variáveis independentes) e `y` (variável dependente: `Valor_Aluguel`).
- Dividi os dados em 80% para treino e 20% para teste usando `train_test_split()`.

---

## 4. Treinamento do Modelo de Regressão Linear Simples
- Utilizei apenas a variável `Metragem` para treinar um modelo de regressão linear simples (`LinearRegression()` do `sklearn`).
- Obtive a equação da reta: `y = -97.00 + 34.47 * Metragem`.
- O coeficiente de determinação (R²) foi de:
  - Treino: 0.52
  - Teste: 0.57
- A dispersão dos pontos sugeriu que a variável `Metragem` sozinha não era suficiente para um bom modelo.

---

## 5. Treinamento do Modelo de Regressão Linear Múltipla
- Treinei um novo modelo usando todas as variáveis independentes.
- Obtive os seguintes coeficientes:
  - `Valor_Condominio`: 0.78
  - `Metragem`: 20.68
  - `N_Quartos`: -649.12
  - `N_Banheiros`: 223.71
  - `N_Suites`: 340.34
  - `N_Vagas`: 501.25
- O coeficiente de determinação (R²) foi de:
  - Treino: 0.60
  - Teste: 0.64

---

## 6. Avaliação dos Modelos
- A regressão múltipla apresentou um R² superior ao da regressão simples, indicando que mais variáveis melhoram a previsão.
- No entanto, o modelo pode estar subajustado, sugerindo que outras técnicas podem ser aplicadas para aprimorar sua performance.

---

## 7. Conclusão
- A regressão linear simples não foi suficiente para prever com precisão o valor do aluguel.
- A regressão múltipla apresentou um melhor desempenho, mas ainda pode ser melhorada com mais ajustes ou técnicas avançadas, como regularização.

---

## 8. Próximos Passos
- Explorar técnicas como `Ridge` e `Lasso` para reduzir possíveis problemas de overfitting.
- Considerar a transformação de variáveis para melhorar a linearidade dos dados.
- Avaliar outras métricas como erro absoluto médio (MAE) e erro quadrático médio (MSE) para validar a precisão do modelo.

---

Este documento detalha cada etapa do processo, desde a análise inicial até a avaliação final do modelo de regressão linear.
