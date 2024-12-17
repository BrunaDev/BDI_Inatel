CREATE TABLE item (
    cod_item INT PRIMARY KEY,
    nome VARCHAR(50),
    preco FLOAT,
    quantidade INT
);

INSERT INTO item (cod_item, nome, preco, quantidade) VALUES
(1, 'Arco', 20.0, 22),
(2, 'Flecha', 2.0, 43),
(3, 'Espada', 35.0, 16),
(4, 'Escudo', 20.0, 20),
(5, 'Maça', 23.0, 19),
(6, 'Mangual', 56.0, 16),
(7, 'Lança', 21.0, 18),
(8, 'Machado', 20.0, 21);

SELECT * FROM item;