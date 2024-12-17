-- Tabela principal de itens
CREATE TABLE Item (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco REAL,
    peso REAL,
    volume REAL
);

-- Tabela para itens mágicos (possuem efeitos especiais)
CREATE TABLE Item_Magico (
    id_item INTEGER PRIMARY KEY,
    efeito TEXT,
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

-- Tabela para itens de inventário (possuem capacidade de peso e volume)
CREATE TABLE Item_Inventario (
    id_item INTEGER PRIMARY KEY,
    cap_peso REAL,
    cap_volume REAL,
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

-- Tabela para itens do tipo arma (possuem classe e dano)
CREATE TABLE Item_Arma (
    id_item INTEGER PRIMARY KEY,
    classe TEXT,
    dano TEXT,
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

-- Inserindo dados na tabela Item
INSERT INTO Item (id, nome, preco, peso, volume) VALUES
('1', 'Ungento restaurador', '80', '0.2', '0.25'),
('2', 'Poção de regeneração', '200', '0.2', '0.35'),
('3', 'Bolsa de explorador', '20', '0.6', '1.2'),
('4', 'Bolsa encantada', '500', '0.7', '1.1'),
('5', 'Machado de guerra', '50', '15.5', '10.1');

-- Inserindo dados na tabela Item_Magico
INSERT INTO Item_Magico (id_item, efeito) VALUES
('2', 'Cicatriza ferimentos profundos (1d4+2 PV)'),
('4', 'Tem uma dimensão de bolso para armazenar itens');

-- Inserindo dados na tabela Item_Inventario
INSERT INTO Item_Inventario (id_item, cap_peso, cap_volume) VALUES
('3', '50', '23.6'),
('4', '1850', '1020');

-- Inserindo dados na tabela Item_Arma
INSERT INTO Item_Arma (id_item, classe, dano) VALUES
('5', 'Corpo-a-corpo pesada', '1d8');

-- Consulta para itens comuns
SELECT id, nome, preco, peso, volume
FROM Item
WHERE id NOT IN (SELECT id_item FROM Item_Magico)
  AND id NOT IN (SELECT id_item FROM Item_Inventario)
  AND id NOT IN (SELECT id_item FROM Item_Arma);

-- Consulta para itens mágicos
SELECT Item.id, Item.nome, Item.preco, Item.peso, Item.volume, Item_Magico.id_item, Item_Magico.efeito
FROM Item
JOIN Item_Magico ON Item.id = Item_Magico.id_item;

-- Consulta para itens de inventário
SELECT Item.id, Item.nome, Item.preco, Item.peso, Item.volume, Item_Inventario.id_item, Item_Inventario.cap_peso, Item_Inventario.cap_volume
FROM Item
JOIN Item_Inventario ON Item.id = Item_Inventario.id_item;

-- Consulta para itens do tipo arma
SELECT Item.id, Item.nome, Item.preco, Item.peso, Item.volume, Item_Arma.id_item, Item_Arma.dano, Item_Arma.classe
FROM Item
JOIN Item_Arma ON Item.id = Item_Arma.id_item;
