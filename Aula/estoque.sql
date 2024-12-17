-- Criação das tabelas
CREATE TABLE item (
    cod_item INT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT
);

CREATE TABLE venda (
    cod INT PRIMARY KEY,
    data_hora DATETIME,
    email_usuario VARCHAR(50)
);

CREATE TABLE item_vendido (
    cod_venda INT,
    cod_item INT,
    quantidade INT,
    FOREIGN KEY (cod_venda) REFERENCES venda(cod),
    FOREIGN KEY (cod_item) REFERENCES item(cod_item)
);

-- Inserindo dados na tabela item
INSERT INTO item (cod_item, nome, preco, quantidade) VALUES
('1', 'Arco', '20', '22'),
('2', 'Flecha', '2', '43'),
('3', 'Espada', '35', '16'),
('4', 'Escudo', '20', '20'),
('5', 'Maça', '23', '19'),
('6', 'Mangual', '56', '16'),
('7', 'Lança', '21', '18'),
('8', 'Machado', '20', '21');

-- Inserindo dados na tabela venda
INSERT INTO venda (cod, data_hora, email_usuario) VALUES
('1', '2024-05-10 11:22', 'j@g.com'),
('2', '2024-05-12 11:22', 'k@g.com'),
('3', '2024-05-13 11:22', 'a@g.com'),
('4', '2024-05-13 11:22', 'r@g.com'),
('5', '2024-05-13 11:22', 'r@g.com'),
('6', '2024-05-14 11:22', 'f@g.com'),
('7', '2024-05-15 11:22', 'r@g.com');

-- Inserindo dados na tabela item_vendido
INSERT INTO item_vendido (cod_venda, cod_item, quantidade) VALUES
('1', '1', '15'),
('1', '3', '5'),
('2', '2', '2'),
('3', '5', '2'),
('4', '8', '3'),
('4', '6', '2'),
('4', '1', '1'),
('5', '3', '6'),
('6', '4', '7'),
('6', '3', '5'),
('7', '7', '10');

-- Atualizando o estoque (com base nas vendas)
WITH total_vendas AS (
    SELECT cod_item, SUM(quantidade) AS quantidade_vendida
    FROM item_vendido
    GROUP BY cod_item
)

UPDATE item
SET quantidade = quantidade - (
    SELECT quantidade_vendida
    FROM total_vendas
    WHERE item.cod_item = total_vendas.cod_item
)
WHERE cod_item IN (SELECT cod_item FROM total_vendas);

-- lista com os nomes dos itens e suas quantidade em estoque dos itens com menos de 10 peças no estoque em ordem crescente
SELECT nome
FROM item
WHERE quantidade < 10
ORDER BY quantidade ASC;
