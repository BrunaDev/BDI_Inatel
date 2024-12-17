CREATE TABLE item (
    cod_item INT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10, 2),
    custo DECIMAL(10, 2),
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

-- Inserindo dados
INSERT INTO item (cod_item, nome, preco, custo, quantidade) VALUES
('1', 'Arco', '20', '10', '22'),
('2', 'Flecha', '2', '1', '43'),
('3', 'Espada', '35', '20', '16'),
('4', 'Escudo', '20', '12', '20'),
('5', 'Maça', '23', '11', '19'),
('6', 'Mangual', '56', '35', '16'),
('7', 'Lança', '21', '16', '18'),
('8', 'Machado', '20', '13', '21');

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

-- Valor total do lucro das vendas
SELECT SUM((item.preco - item.custo) * item_vendido.quantidade) AS lucro_total
FROM item_vendido
JOIN item ON item_vendido.cod_item = item.cod_item;
