CREATE TABLE Habilidade (
    id INTEGER PRIMARY KEY,
    descricao TEXT NOT NULL,
    atributo_base TEXT NOT NULL
);

INSERT INTO Habilidade (id, descricao, atributo_base) VALUES
('1', 'Corrida longa', 'Constituição'),
('2', 'Corrida de arrancada', 'Força'),
('3', 'Acrobacia', 'Destreza'),
('4', 'Tiro com arco', 'Destreza');

-- A quantidade de habilidades para cada atributo base.
SELECT atributo_base, COUNT(*) AS quantidade_habilidades
FROM Habilidade
GROUP BY atributo_base;
