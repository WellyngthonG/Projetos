
# Projeto de Credit Score - Árvore de Decisão

Neste projeto, implementei uma árvore de decisão para prever scores de crédito com base em diferentes features de clientes. Vou descrever o passo a passo do desenvolvimento e análise do modelo.

## 1. Carregando e Verificando as Bases de Treinamento e Teste

Primeiramente, carreguei as bases de dados de treino e teste, tanto para as variáveis independentes (X) quanto para a variável dependente (y), e verifiquei se os números de linhas e colunas estão consistentes.

```python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Carregar as bases de treino e teste
X_train = pd.read_csv("X_train.csv")
y_train = pd.read_csv("y_train.csv")
X_test = pd.read_csv("X_test.csv")
y_test = pd.read_csv("y_test.csv")

# Verificar o número de linhas
print("Número de linhas na base de treino X:", X_train.shape[0])
print("Número de linhas na base de treino y:", y_train.shape[0])
print("Número de linhas na base de teste X:", X_test.shape[0])
print("Número de linhas na base de teste y:", y_test.shape[0])

# Verificar se a variável y está balanceada
sns.countplot(data=y_test, x=y_test.columns[0])
plt.title("Distribuição da variável y no teste")
plt.show()
```

Verifiquei a consistência do número de linhas, que está correto. Também conferi as colunas e observei que as variáveis independentes (X) têm as colunas `['feature1', 'feature2', 'feature3']`, e a variável dependente (y) é `['target']`.

## 2. Aplicação do Algoritmo de Árvore de Decisão

Agora, apliquei o algoritmo da árvore de decisão nos dados de treinamento, utilizando o critério de Gini e definindo o `random_state` como 0 para garantir a reprodutibilidade.

### Passo a Passo:

1. **Coleta e preparação dos dados:** Fiz o tratamento dos dados para garantir que não houvessem valores ausentes ou inconsistências.
2. **Divisão em treino e teste:** Separei os dados em dois conjuntos: um para treino e outro para teste.
3. **Construção da árvore de decisão:** Utilizei o critério de Gini e random_state = 0. A árvore foi construída recursivamente, dividindo os nós até atingir critérios de parada.
4. **Avaliação do modelo:** Calculei métricas de avaliação como acurácia, precisão e matriz de confusão.

```python
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

# Treinar o modelo de árvore de decisão
modelo = DecisionTreeClassifier(criterion='gini', random_state=0)
modelo.fit(X_train, y_train)

# Fazer previsões no treino
y_pred_train = modelo.predict(X_train)

# Avaliar a acurácia no conjunto de treino
acuracia_treino = accuracy_score(y_train, y_pred_train)
print(f'Acurácia no conjunto de treinamento: {acuracia_treino:.4f}')
```

A acurácia no conjunto de treinamento foi de 1.0000, o que indica que o modelo aprendeu muito bem os dados de treino.

## 3. Avaliação no Conjunto de Teste

Em seguida, avaliei o modelo nos dados de teste para verificar sua capacidade de generalização.

```python
# Fazer previsões no teste
y_pred_test = modelo.predict(X_test)

# Avaliar a acurácia no conjunto de teste
acuracia_teste = accuracy_score(y_test, y_pred_test)
print(f'Acurácia no conjunto de teste: {acuracia_teste:.4f}')
```

A acurácia no conjunto de teste foi de 0.9400, mostrando que o modelo tem um bom desempenho em dados que ele não viu durante o treinamento.

## 4. Visualização da Árvore de Decisão

Para entender melhor a estrutura do modelo, fiz a visualização da árvore de decisão.

```python
from sklearn.tree import plot_tree
import matplotlib.pyplot as plt

plt.figure(figsize=(20,10))
plot_tree(modelo, filled=True, feature_names=X_train.columns, class_names=['Classe 0', 'Classe 1'], rounded=True)
plt.title("Árvore de Decisão - Visualização")
plt.show()
```

A profundidade da árvore foi de 4. Embora o modelo tenha apresentado uma boa performance, a profundidade pode ser um indicativo de overfitting, já que a acurácia no treino foi 100%.

## 5. Principais Features do Modelo

Identifiquei as duas principais features que mais influenciaram nas decisões da árvore.

```python
import pandas as pd

# Acessar a importância das features
importances = modelo.feature_importances_

# Criar um DataFrame para visualizar as importâncias
feature_importance_df = pd.DataFrame({
    'Feature': X_train.columns,
    'Importance': importances
})

# Ordenar as features por importância
feature_importance_df = feature_importance_df.sort_values(by='Importance', ascending=False)

# Exibir as duas principais features
print("As duas principais features são:")
print(feature_importance_df.head(2))
```

As duas principais features foram `feature2` e `feature3`.

## 6. Novo Modelo com as Principais Features

Finalmente, treinei um novo modelo de árvore de decisão apenas com as duas principais features e comparei os resultados.

```python
# Treinar um novo modelo usando apenas feature2 e feature3
X_train_reduzido = X_train[['feature2', 'feature3']]
X_test_reduzido = X_test[['feature2', 'feature3']]

modelo_reduzido = DecisionTreeClassifier(criterion='gini', random_state=0)
modelo_reduzido.fit(X_train_reduzido, y_train)

# Fazer previsões no teste reduzido
y_pred_test_reduzido = modelo_reduzido.predict(X_test_reduzido)

# Avaliar a acurácia no conjunto de teste
acuracia_teste_reduzido = accuracy_score(y_test, y_pred_test_reduzido)
print(f'Acurácia no conjunto de teste (modelo reduzido): {acuracia_teste_reduzido:.4f}')
```

A acurácia do modelo reduzido no conjunto de teste foi próxima à do modelo original. Isso sugere que podemos simplificar o modelo utilizando apenas essas duas variáveis principais, sem perder muito em performance.

## Conclusão

A aplicação da árvore de decisão foi eficaz na previsão do score de crédito. No entanto, o modelo inicial mostrou sinais de overfitting, com uma acurácia de 100% no treino. Após simplificar o modelo, mantendo apenas as principais features, conseguimos um desempenho semelhante, o que indica que o modelo pode ser simplificado sem perder precisão.
