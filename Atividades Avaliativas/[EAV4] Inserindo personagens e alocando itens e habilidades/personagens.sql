-- Criando a tabela Mundo
CREATE TABLE Mundo (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT
);

-- Criando a tabela Habilidade
CREATE TABLE Habilidade (
    id INTEGER PRIMARY KEY,
    descricao TEXT NOT NULL,
    atributo_base TEXT
);

-- Criando a tabela Item
CREATE TABLE Item (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco REAL,
    peso REAL,
    volume REAL,
    efeito TEXT,
    cap_peso REAL,
    cap_volume REAL,
    classe TEXT,
    dano TEXT
);

-- Criando a tabela Personagem
CREATE TABLE Personagem (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    idade INTEGER,
    profissao TEXT,
    data_criacao DATE,
    id_mundo INTEGER,
    FOREIGN KEY (id_mundo) REFERENCES Mundo(id)
);

-- Tabela para registrar itens de cada personagem
CREATE TABLE Personagem_Item (
    id_personagem INTEGER,
    id_item INTEGER,
    quantidade INTEGER,
    PRIMARY KEY (id_personagem, id_item),
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

-- Tabela para registrar habilidades de cada personagem
CREATE TABLE Habilidades_Personagem (
    id_personagem INTEGER,
    id_habilidade INTEGER,
    modificador INTEGER,
    PRIMARY KEY (id_personagem, id_habilidade),
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_habilidade) REFERENCES Habilidade(id)
);

-- Inserindo dados na tabela Mundo
INSERT INTO Mundo (id, nome, descricao) VALUES
('1', 'Maygïk', 'Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera.');

-- Inserindo dados na tabela Habilidade
INSERT INTO Habilidade (id, descricao, atributo_base) VALUES
('1', 'Corrida longa', 'Constituição'),
('2', 'Corrida de arrancada', 'Força'),
('3', 'Acrobacia', 'Destreza');

-- Inserindo dados na tabela Item
INSERT INTO Item (id, nome, preco, peso, volume) VALUES
('1', 'Ungento restaurador', '80', '0.2', '0.25'),
('2', 'Poção de regeneração', '200', '0.2', '0.35'),
('3', 'Bolsa de explorador', '20', '0.6', '1.2');

-- Inserindo dados na tabela Personagem
INSERT INTO Personagem (id, nome, idade, profissao, data_criacao, id_mundo) VALUES
('1', 'Ann`aurora', 21, 'Clérigo(a)', '2024-06-05', '1'),
('2', 'Zurendownr Narrwack', 652, 'Diplomata', '2024-06-05', '1');

-- Atribuindo habilidades para Ann'aurora
INSERT INTO Habilidades_Personagem (id_personagem, id_habilidade, modificador) VALUES
('1', '2', '2'),
('1', '1', '1');

-- Removendo a habilidade Corrida longa de Ann'aurora
DELETE FROM Habilidades_Personagem WHERE id_personagem = 1 AND id_habilidade = 1;

-- Atribuindo habilidade para Zurendownr Narrwack
INSERT INTO Habilidades_Personagem (id_personagem, id_habilidade, modificador) VALUES
('2', '3', '2');

-- Atribuindo itens para Ann'aurora
INSERT INTO Personagem_Item (id_personagem, id_item, quantidade) VALUES
('1', '1', '3'),
('1', '2', '2'),
('1', '3', '1');

-- Consulta final para exibir todas as informações dos personagens, incluindo a quantidade de itens e a quantidade de habilidades
SELECT
    p.id,
    p.nome,
    p.profissao,
    p.idade,
    p.id_mundo,
    p.data_criacao,
    COALESCE(SUM(pi.quantidade), 0) AS quantidade_itens,
    COUNT(DISTINCT hp.id_habilidade) AS quantidade_habilidades  -- Contagem distinta de habilidades para refletir a remoção corretamente
FROM 
    Personagem p
JOIN 
    Mundo m ON p.id_mundo = m.id
LEFT JOIN 
    Personagem_Item pi ON p.id = pi.id_personagem
LEFT JOIN 
    Habilidades_Personagem hp ON p.id = hp.id_personagem
GROUP BY 
    p.id;