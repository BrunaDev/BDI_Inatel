CREATE TABLE Mundo (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT
);

CREATE TABLE Pagina (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    descricao TEXT,
    id_mundo INTEGER,
    FOREIGN KEY (id_mundo) REFERENCES Mundo(id)
);

-- Inserindo dados na tabela Mundo
INSERT INTO Mundo (id, nome, descricao) VALUES
('1', 'Maygïk', 'Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera.'),
('2', 'Lucinera', 'O mundo é dominado por dragões. Como você vai trilhar o seu caminho: Para livrar o seu povo ou para ascender como um senhor dos dragões?');

-- Inserindo dados na tabela Pagina
INSERT INTO Pagina (id, titulo, descricao, id_mundo) VALUES
('1', 'O Culto do Heroi', 'Uma sociedade religiosa que segue os passos do Heroi que salvou Granjaran dos sombrios.', '1'),
('2', 'Uanteji', 'Uma organização secreta de mercenários, espiões e assassinos.', '1');

-- Título, a descrição e o nome do mundo de todas as páginas cadastradas.
SELECT Pagina.titulo, Pagina.descricao, Mundo.nome AS nome_mundo
FROM Pagina
JOIN Mundo ON Pagina.id_mundo = Mundo.id;
