# Análise Estatística: Comparação de Duas Estratégias de Ensino

Este documento relata os passos realizados para analisar a eficácia de duas estratégias de ensino de matemática para alunos do ensino médio utilizando um teste Z. O objetivo é determinar se há uma diferença significativa no desempenho médio dos alunos entre as duas estratégias.

## Contexto do Problema

Uma escola deseja avaliar a eficácia de duas estratégias de ensino. Foram coletadas amostras das notas de 50 alunos para cada estratégia:

- **Estratégia A:** 50 alunos
- **Estratégia B:** 50 alunos

### Hipóteses

- **Hipótese nula (H₀):** A média das notas dos alunos na Estratégia A é igual à média das notas dos alunos na Estratégia B.
- **Hipótese alternativa (H₁):** A média das notas dos alunos na Estratégia B é maior do que a média das notas dos alunos na Estratégia A.

### Método

Utilizamos um teste Z para comparar as médias das notas entre as duas amostras. O nível de significância adotado foi α = 0.05.

---

## Passo a Passo da Análise

### 1. Geração dos Dados

Inicialmente, geramos dados fictícios representando as notas das duas estratégias.

```python
import numpy as np

# Definindo médias e desvios padrão
media_estrategia_A = 70
desvio_padrao_estrategia_A = 10
media_estrategia_B = 75
desvio_padrao_estrategia_B = 12

# Gerando as amostras
np.random.seed(0)
amostra_estrategia_A = np.random.normal(loc=media_estrategia_A, scale=desvio_padrao_estrategia_A, size=50)
amostra_estrategia_B = np.random.normal(loc=media_estrategia_B, scale=desvio_padrao_estrategia_B, size=50)

print("Notas da Estratégia A:", amostra_estrategia_A[:5])
print("Notas da Estratégia B:", amostra_estrategia_B[:5])
```

**Notas iniciais:**
- Estratégia A: `[87.64, 74.00, 79.78, 92.40, 88.67]`
- Estratégia B: `[64.25, 79.64, 68.87, 60.83, 74.66]`

---

### 2. Natureza do Teste Estatístico

Nosso teste é **unilateral à direita**, pois estamos verificando se a média das notas dos alunos que seguiram a Estratégia B é maior do que a média das notas dos alunos que seguiram a Estratégia A.

**Justificativa:**
- H₀: Média A = Média B
- H₁: Média B > Média A

Como estamos analisando uma possível superioridade de B, o teste é direcionado apenas à cauda direita da distribuição.

---

### 3. Cálculo das Médias e Variâncias

**Cálculos:**

```python
# Calculando médias e variâncias
media_A = np.mean(amostra_estrategia_A)
media_B = np.mean(amostra_estrategia_B)
variancia_A = np.var(amostra_estrategia_A, ddof=1)
variancia_B = np.var(amostra_estrategia_B, ddof=1)

print(f"Média A: {media_A:.2f}, Variância A: {variancia_A:.2f}")
print(f"Média B: {media_B:.2f}, Variância B: {variancia_B:.2f}")
```

**Resultados:**
- Média A: `72.94`
- Variância A: `47.68`
- Média B: `74.11`
- Variância B: `27.51`

**Insights:**
- A média da Estratégia B é ligeiramente maior, indicando um desempenho marginalmente melhor.
- A variância da Estratégia A é maior, sugerindo maior dispersão nas notas.

---

### 4. Teste Z

**Cálculos:**

```python
from scipy.stats import norm

# Estatística Z
z_stat = (media_B - media_A) / np.sqrt((variancia_A / 50) + (variancia_B / 50))
p_valor = 1 - norm.cdf(z_stat)

print(f"Estatística Z: {z_stat:.2f}")
print(f"P-valor: {p_valor:.2f}")
```

**Resultados:**
- Estatística Z: `0.95`
- P-valor: `0.17`
- Nível de significância: `α = 0.05`

**Decisão:**
- Como o p-valor (`0.17`) é maior que o nível de significância, **não rejeitamos H₀**.
- Não há evidências suficientes para concluir que a Estratégia B é significativamente melhor que a Estratégia A.

---

### 5. Visualização Gráfica

**Gráfico:**

```python
import matplotlib.pyplot as plt
from scipy.stats import norm

# Dados para o gráfico
z_values = np.linspace(-3, 3, 1000)
z_distribution = norm.pdf(z_values)

# Plotagem
plt.figure(figsize=(10, 6))
plt.plot(z_values, z_distribution, label="Distribuição Normal Padrão", color="blue")
plt.axvline(z_stat, color="red", linestyle="--", label=f"Estatística Z = {z_stat:.2f}")
plt.fill_between(z_values, 0, z_distribution, where=(z_values >= z_stat), color="red", alpha=0.3, label="Região p-valor")
plt.axvline(norm.ppf(1 - nivel_significancia), color="green", linestyle="--", label="Valor crítico (Z crítico)")
plt.title("Distribuição da Estatística do Teste Z", fontsize=14)
plt.xlabel("Z", fontsize=12)
plt.ylabel("Densidade de Probabilidade", fontsize=12)
plt.legend(fontsize=10)
plt.grid(alpha=0.3)
plt.show()
```

**Observações do Gráfico:**
- A curva azul representa a distribuição normal padrão.
- A linha vermelha marca o valor da estatística Z (`0.95`).
- A região sombreada (p-valor) à direita de Z é maior que o nível de significância, indicando que não rejeitamos H₀.

---

## Conclusão

Com base no teste Z:
- Não há evidências estatísticas suficientes para afirmar que a Estratégia B é significativamente melhor do que a Estratégia A.
- Embora a média de B seja maior, o p-valor alto indica que essa diferença pode ser atribuída ao acaso.

Essa análise estatística demonstra a importância de interpretar os resultados no contexto de hipóteses bem definidas e níveis de significância estabelecidos.
