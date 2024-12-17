-- Criando a tabela Mundo
CREATE TABLE Mundo (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT
);

-- Criando a tabela Pagina
CREATE TABLE Pagina (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    descricao TEXT,
    id_mundo INTEGER,
    FOREIGN KEY (id_mundo) REFERENCES Mundo(id)
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

-- Criando a tabela Personagem_Item para associar itens a personagens
CREATE TABLE Personagem_Item (
    id_personagem INTEGER,
    id_item INTEGER,
    quantidade INTEGER,
    PRIMARY KEY (id_personagem, id_item),
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

-- Criando a tabela Habilidades_Personagem para associar habilidades a personagens
CREATE TABLE Habilidades_Personagem (
    id_personagem INTEGER,
    id_habilidade INTEGER,
    modificador INTEGER,
    PRIMARY KEY (id_personagem, id_habilidade),
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_habilidade) REFERENCES Habilidade(id)
);

-- Criando a tabela Profissao_Pagina para associar profissões às páginas
CREATE TABLE Profissao_Pagina (
    id_pagina INTEGER,
    profissao TEXT,
    PRIMARY KEY (id_pagina, profissao),
    FOREIGN KEY (id_pagina) REFERENCES Pagina(id)
);

-- Criando a tabela Personagem_Pagina para registrar quais páginas os personagens conhecem
CREATE TABLE Personagem_Pagina (
    id_personagem INTEGER,
    id_pagina INTEGER,
    PRIMARY KEY (id_personagem, id_pagina),
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_pagina) REFERENCES Pagina(id)
);

-- Inserindo dados nas tabelas
INSERT INTO Mundo (id, nome, descricao) VALUES
('1', 'Maygïk', 'Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera.');

INSERT INTO Pagina (id, titulo, descricao, id_mundo) VALUES
('1', 'O Culto do Heroi', 'Uma sociedade religiosa que segue os passos do Heroi que salvou Granjaran dos sombrios.', '1'),
('2', 'Uanteji', 'Uma organização secreta de mercenários, espiões e assassinos.', '1');

INSERT INTO Habilidade (id, descricao, atributo_base) VALUES
('1', 'Corrida longa', 'Constituição'),
('2', 'Corrida de arrancada', 'Força'),
('3', 'Acrobacia', 'Destreza');

INSERT INTO Item (id, nome, preco, peso, volume) VALUES
('1', 'Ungento restaurador', '80', '0.2', '0.25'),
('2', 'Poção de regeneração', '200', '0.2', '0.35'),
('3', 'Bolsa de explorador', '20', '0.6', '1.2');

INSERT INTO Personagem (id, nome, idade, profissao, data_criacao, id_mundo) VALUES
('1', 'Ann`aurora', 21, 'Clérigo(a)', '2024-06-05', '1'),
('2', 'Zurendownr Narrwack', 652, 'Diplomata', '2024-06-05', '1');

-- Inserindo dados na tabela Profissao_Pagina
INSERT INTO Profissao_Pagina (id_pagina, profissao) VALUES
('1', 'Clérigo(a)'),
('1', 'Acólito(a)'),
('1', 'Paladino(a)'),
('1', 'Diplomata'),
('2', 'Ladino(a)'),
('2', 'Diplomata');

-- Inserindo o conhecimento das páginas para personagens de acordo com a profissão
INSERT INTO Personagem_Pagina (id_personagem, id_pagina)
SELECT p.id, pp.id_pagina
FROM Personagem p
JOIN Profissao_Pagina pp ON p.profissao = pp.profissao
ON CONFLICT DO NOTHING;

-- Exibindo o nome dos personagens e os títulos das páginas que eles conhecem
SELECT 
    p.nome AS personagem_nome,
    GROUP_CONCAT(pg.titulo, ', ') AS paginas_conhecidas
FROM 
    Personagem p
JOIN 
    Personagem_Pagina pp ON p.id = pp.id_personagem
JOIN 
    Pagina pg ON pp.id_pagina = pg.id
GROUP BY 
    p.id;
