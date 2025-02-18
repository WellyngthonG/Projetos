
-- Criação da tabela de vendas
CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    data_venda DATE
);

-- Inserção de dados na tabela de vendas
INSERT INTO Vendas (id_venda, id_produto, quantidade, preco_unitario, data_venda)
VALUES
(1, 101, 10, 19.99, '2025-01-01'),
(2, 102, 5, 49.99, '2025-01-02'),
(3, 101, 20, 19.99, '2025-01-03'),
(4, 103, 7, 25.50, '2025-01-04'),
(5, 102, 10, 49.99, '2025-01-05'),
(6, 103, 15, 25.50, '2025-01-06'),
(7, 101, 5, 19.99, '2025-01-07'),
(8, 102, 12, 49.99, '2025-01-08');

-- Consulta SQL com funções agregadas
SELECT
    id_produto,
    MIN(quantidade) AS quantidade_minima,
    MAX(quantidade) AS quantidade_maxima,
    SUM(quantidade) AS quantidade_total,
    AVG(quantidade) AS quantidade_media,
    COUNT(id_venda) AS total_vendas
FROM
    Vendas
GROUP BY
    id_produto;
