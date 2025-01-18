
# Modelo de Classificação Utilizando Algoritmo Naive Bayes

## Descrição do Projeto
Neste projeto, desenvolvi um modelo de classificação utilizando o algoritmo de Naive Bayes aplicado a uma base de crédito. O objetivo principal foi prever o score de crédito dos clientes, analisando características específicas presentes na base de dados. Durante o processo, realizei o tratamento dos dados, treinei o modelo e avaliei seu desempenho tanto no conjunto de treinamento quanto no de teste.

O uso do Naive Bayes, sendo um algoritmo probabilístico, permitiu trabalhar com múltiplas classes de forma eficiente, gerando previsões baseadas na probabilidade de cada instância pertencer a uma determinada classe. O foco foi entender a capacidade do modelo de generalizar e identificar corretamente padrões nos dados, proporcionando insights valiosos para tomadas de decisão futuras em relação ao perfil de crédito dos clientes.

## Passo a Passo do Desenvolvimento
1. **Carregamento das Bases de Dados**  
   - Importei os dados de treinamento e teste para `X` (variáveis independentes) e `y` (variável dependente, score de crédito).
   - Verifiquei a consistência dos dados, garantindo que o número de linhas e as variáveis estavam corretas.

2. **Treinamento do Modelo**  
   - Instanciei o modelo `GaussianNB` do Naive Bayes.
   - Treinei o modelo utilizando os dados de treinamento (`X_train` e `y_train`).

3. **Avaliação no Conjunto de Treinamento**  
   - Realizei previsões no conjunto de treinamento e calculei as métricas de desempenho:
     - **Acurácia**
     - **Recall (média macro)**
   - Analisei a matriz de confusão para identificar possíveis dificuldades do modelo em diferenciar classes específicas.

4. **Avaliação no Conjunto de Teste**  
   - Apliquei o modelo aos dados de teste e calculei as mesmas métricas de desempenho.
   - Comparei os resultados de treinamento e teste para verificar se o modelo estava generalizando bem.

5. **Interpretação dos Resultados**  
   - Analisei as métricas obtidas e as matrizes de confusão, avaliando o desempenho do modelo na identificação das classes.
   - Concluí que o modelo foi eficaz na maioria das classes, embora algumas possam ter apresentado maior dificuldade devido a características similares.

## Conclusão
Trabalhar neste projeto foi uma experiência prática enriquecedora, conectando teoria e prática no aprendizado supervisionado. O modelo mostrou-se útil para prever scores de crédito, e os insights obtidos podem ser aplicados para melhorar a gestão de risco e estratégias de negócios.

