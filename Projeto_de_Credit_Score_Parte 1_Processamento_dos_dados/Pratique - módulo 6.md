# **Documentação do Projeto de Análise de Score de Crédito**

---

## **1\. Carregamento dos Dados**

**Carreguei o arquivo `CREDIT_SCORE_PROJETO_PARTE1.csv` usando o pandas:**

**import pandas as pd**  
**df \= pd.read\_csv("C:/Users/welly/PycharmProjects/M17/CREDIT\_SCORE\_PROJETO\_PARTE1.csv", delimiter=';')**  
**df.head(10)**

**Isso permitiu visualizar as primeiras linhas do DataFrame. Em seguida, verifiquei os tipos de dados e identifiquei valores ausentes:**

**print(df.dtypes)**  
**df.info()**  
**print(df.isnull().sum())**

---

## **2\. Tratamento de Valores Ausentes e Conversão de Tipos de Dados**

### **Colunas numéricas:**

* **Income: Removi caracteres de formatação e converti para float. Preenchi valores ausentes com a mediana.**  
* **Age: Preenchi valores ausentes com a mediana.**  
* **Number of Children: Substituí valores ausentes por 0\.**

### **Colunas categóricas:**

* **Gender, Marital Status: Substituí valores ausentes pela moda.**

**Código utilizado:**

**df\['Income'\] \= df\['Income'\].replace({',': ''}, regex=True).astype(float)**  
**df\['Age'\] \= df\['Age'\].fillna(df\['Age'\].median())**  
**df\['Income'\] \= df\['Income'\].fillna(df\['Income'\].median())**  
**df\['Number of Children'\] \= df\['Number of Children'\].fillna(0)**  
**df\['Gender'\] \= df\['Gender'\].fillna(df\['Gender'\].mode()\[0\])**  
**df\['Marital Status'\] \= df\['Marital Status'\].fillna(df\['Marital Status'\].mode()\[0\])**

**Após o tratamento, converti as colunas para os tipos apropriados:**

**data\_types \= {**  
    **'Age': 'int64',**  
    **'Gender': 'category',**  
    **'Income': 'float64',**  
    **'Education': 'category',**  
    **'Marital Status': 'category',**  
    **'Number of Children': 'int64',**  
    **'Home Ownership': 'category',**  
    **'Credit Score': 'category'**  
**}**  
**df \= df.astype(data\_types)**  
**df.info()**

---

## **3\. Análise Exploratória**

### **Resumo Estatístico:**

**Utilizei `df.describe()` para entender as distribuições das variáveis numéricas.**

### **Identificação de Outliers:**

**Utilizei boxplots para as colunas `Age`, `Income` e `Number of Children`. Exemplo:**

**import seaborn as sns**  
**import matplotlib.pyplot as plt**

**sns.boxplot(x=df\['Income'\])**  
**plt.title('Boxplot \- Income')**  
**plt.show()**

**Identifiquei outliers em `Number of Children` e optei por tratá-los utilizando o método do IQR (Intervalo Interquartil).**

**Q1 \= df\['Number of Children'\].quantile(0.25)**  
**Q3 \= df\['Number of Children'\].quantile(0.75)**  
**IQR \= Q3 \- Q1**  
**upper\_bound \= Q3 \+ 1.5 \* IQR**  
**df\['Number of Children'\] \= df\['Number of Children'\].apply(lambda x: upper\_bound if x \> upper\_bound else x)**

---

## **4\. Visualizações Gráficas**

**Realizei várias análises gráficas para explorar relações entre variáveis:**

**Relação entre Idade e Estado Civil:**

 **sns.boxplot(x='Marital Status', y='Age', data=df)**  
**plt.title('Relação entre Idade e Status Civil')**  
**plt.show()**

1.  **Insight: Pessoas casadas tendem a ser mais velhas.**

**Score de Crédito vs. Escolaridade:**

 **sns.countplot(x='Credit Score', hue='Education', data=df)**  
**plt.title('Relação entre Score de Crédito e Escolaridade')**  
**plt.xticks(rotation=45)**  
**plt.show()**

2.  **Insight: Scores mais altos são comuns entre pessoas com nível superior.**

**Salário vs. Idade:**

 **sns.scatterplot(x='Age', y='Income', data=df)**  
**plt.title('Relação entre Salário e Idade')**  
**plt.show()**

3.  **Insight: Salários aumentam com a idade.**

**Correlações Gerais:**

 **corr \= df.corr()**  
**sns.heatmap(corr, annot=True, cmap="coolwarm")**  
**plt.title("Matriz de Correlação")**  
**plt.show()**

4.  **Insight: Identifiquei fortes correlações entre idade e renda.**

---

## **5\. Balanceamento e Preparação de Dados para Modelagem**

**A coluna `Credit Score` apresentava um desequilíbrio significativo:**

* **High: 68,9%**  
* **Average: 22%**  
* **Low: 9,1%**

**Para corrigir isso, utilizei a técnica SMOTE (Synthetic Minority Oversampling Technique):**

**from sklearn.model\_selection import train\_test\_split**  
**from imblearn.over\_sampling import SMOTE**

**X \= df.drop(columns=\['Credit Score'\])**  
**y \= df\['Credit Score'\]**

**X\_train, X\_test, y\_train, y\_test \= train\_test\_split(X, y, test\_size=0.2, random\_state=42, stratify=y)**

**smote \= SMOTE(random\_state=42)**  
**X\_train\_balanced, y\_train\_balanced \= smote.fit\_resample(X\_train, y\_train)**

**Após o balanceamento, todas as classes tinham frequência igual no conjunto de treinamento.**

---

## **6\. Codificação de Variáveis Categóricas**

**Para variáveis categóricas, utilizei `OneHotEncoder` para criar variáveis dummy:**

**from sklearn.preprocessing import OneHotEncoder**

**categorical\_columns \= X.select\_dtypes(include=\['object'\]).columns**  
**encoder \= OneHotEncoder(sparse\_output=False, drop='first')**  
**X\_encoded \= encoder.fit\_transform(X\[categorical\_columns\])**

**X\_numeric \= X.drop(columns=categorical\_columns)**  
**X\_prepared \= pd.concat(\[X\_numeric.reset\_index(drop=True),**  
                        **pd.DataFrame(X\_encoded, columns=encoder.get\_feature\_names\_out())\], axis=1)**

---

## **Resumo Geral**

* **Realizei limpeza e tratamento de dados ausentes.**  
* **Identifiquei e tratei outliers.**  
* **Explorei relações entre variáveis com gráficos.**  
* **Balanceei o conjunto de dados para corrigir o desequilíbrio na variável-alvo.**  
* **Preparei os dados com codificação de variáveis categóricas e dividição em treino e teste.**

**Essas etapas asseguram uma base de dados consistente e pronta para modelagem preditiva.**

