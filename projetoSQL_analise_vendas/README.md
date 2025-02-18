
# Projeto SQL de Análise de Vendas

## Descrição do Projeto

Eu criei este projeto com o objetivo de realizar uma análise robusta dos dados de vendas de uma empresa fictícia. O foco principal foi utilizar funções agregadas do SQL (`MIN`, `MAX`, `SUM`, `AVG`, `COUNT`) em conjunto com o `GROUP BY` para obter insights relevantes sobre o desempenho de cada produto vendido. A consulta foi projetada para analisar os dados de forma eficiente e retornar métricas-chave para cada produto vendido.

## Etapas do Projeto

### 1. Criação da Tabela `Vendas`
Primeiro, criei uma tabela chamada `Vendas`, onde armazenei informações relevantes sobre as vendas, incluindo:
- `id_venda`: Um identificador único para cada venda.
- `id_produto`: Um identificador para o produto vendido.
- `quantidade`: A quantidade de unidades vendidas.
- `preco_unitario`: O preço por unidade do produto.
- `data_venda`: A data em que a venda foi realizada.

### 2. Inserção dos Dados
Depois de criar a tabela, inseri alguns dados fictícios para simular as vendas da empresa. Os dados incluem vendas de três produtos diferentes (`101`, `102` e `103`) ao longo de várias datas, com diferentes quantidades e preços.

### 3. Consulta com Funções Agregadas
Para extrair insights dos dados, criei uma consulta SQL que utiliza as seguintes funções agregadas:

- **`MIN(quantidade)`**: Retorna a menor quantidade de unidades vendidas para cada produto.
- **`MAX(quantidade)`**: Retorna a maior quantidade de unidades vendidas para cada produto.
- **`SUM(quantidade)`**: Retorna o total de unidades vendidas para cada produto.
- **`AVG(quantidade)`**: Retorna a média de unidades vendidas para cada produto.
- **`COUNT(id_venda)`**: Conta o número total de vendas realizadas para cada produto.

Utilizei o **`GROUP BY id_produto`** para agrupar os resultados por produto, o que me permitiu calcular essas métricas individualmente para cada um dos produtos.

## Resultados

A consulta retorna um resumo das vendas para cada produto, permitindo que eu veja rapidamente qual foi o desempenho de cada um deles em termos de quantidade mínima, máxima, total e média de vendas. Além disso, o número total de vendas por produto também está incluído, o que me ajuda a entender a popularidade de cada item.

Por exemplo, a consulta pode mostrar que o produto `101` teve uma quantidade mínima vendida de 5 unidades e uma máxima de 20 unidades, com um total de 35 unidades vendidas e uma média de 11.67 unidades por venda. Já o produto `102` teve uma quantidade máxima de 12 unidades vendidas e um total de 27 vendas no período analisado.

## Conclusão

Este projeto foi uma oportunidade para aplicar de forma prática as funções agregadas do SQL e compreender como essas métricas podem ser usadas para tomar decisões informadas sobre o estoque e as vendas de produtos. A combinação de funções como `MIN`, `MAX`, `SUM`, `AVG` e `COUNT` com o `GROUP BY` oferece uma visão completa do desempenho dos produtos e pode ser expandida para análises mais complexas, conforme necessário.
