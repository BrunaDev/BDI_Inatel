-- Criando a tabela Mundo
CREATE TABLE Mundo (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT
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

-- Criando a tabela Pagina
CREATE TABLE Pagina (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL
);

-- Criando a tabela Personagem_Pagina
CREATE TABLE Personagem_Pagina (
    id_personagem INTEGER,
    id_pagina INTEGER,
    PRIMARY KEY (id_personagem, id_pagina),
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_pagina) REFERENCES Pagina(id)
);

-- Inserindo dados na tabela Personagem (exemplo)
INSERT INTO Personagem (id, nome, idade, profissao, data_criacao, id_mundo) VALUES
('1', 'Ann`aurora', 21, 'Clérigo(a)', '2024-06-05', '1'),
('2', 'Zurendownr Narrwack', 652, 'Diplomata', '2024-06-05', '1');

-- Inserindo dados na tabela Pagina (exemplo)
INSERT INTO Pagina (id, titulo) VALUES
(1, 'Página Sagrada'),
(2, 'Página do Ladino');

-- Atribuindo a página 1 aos personagens com as profissões especificadas
INSERT INTO Personagem_Pagina (id_personagem, id_pagina)
SELECT id, 1
FROM Personagem
WHERE profissao IN ('Clérigo(a)', 'Acólito(a)', 'Paladino(a)')
ON CONFLICT DO NOTHING;

-- Exibindo o nome de todos os personagens que conhecem a página 1
SELECT p.nome
FROM Personagem p
JOIN Personagem_Pagina pp ON p.id = pp.id_personagem
WHERE pp.id_pagina = 1;
