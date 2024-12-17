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

INSERT INTO venda (cod, data_hora, email_usuario) VALUES
('1', '2024-05-10 11:22', 'j@g.com'),
('2', '2024-05-12 11:22', 'k@g.com'),
('3', '2024-05-13 11:22', 'a@g.com'),
('4', '2024-05-13 11:22', 'r@g.com'),
('5', '2024-05-13 11:22', 'r@g.com'),
('6', '2024-05-14 11:22', 'f@g.com'),
('7', '2024-05-15 11:22', 'r@g.com');

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

-- A quantidade média (inteira) de itens vendidos por venda
SELECT CAST(AVG(total_quantidade) AS INT) AS quantidade_media_itens
FROM (
    SELECT cod_venda, SUM(quantidade) AS total_quantidade
    FROM item_vendido
    GROUP BY cod_venda
) AS venda_quantidades;

-- Uma lista contendo o código dos 5 itens mais vendidos em ordem decrescente da quantidade total vendida
SELECT cod_item
FROM item_vendido
GROUP BY cod_item
ORDER BY SUM(quantidade) DESC
LIMIT 5;
