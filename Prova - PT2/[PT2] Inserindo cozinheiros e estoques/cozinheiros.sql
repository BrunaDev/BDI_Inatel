-- Criação de Tabelas de cozinheiros, ingredientes e estoques

create table Cozinheiros(
    id int primary key,
    nome varchar(45),
    email varchar(45),
    senha varchar(15)
);

create table Ingredientes(
    id int primary key,
    nome varchar(45)
);

create table Estoques(
    cozinheiro int,
    ingrediente int,
    quantidade int,
    primary key(cozinheiro, ingrediente),
    foreign key(cozinheiro) references Cozinheiros(id),
    foreign key(ingrediente) references Ingredientes(id)
);

-- Inserção de cozinheiros, ingredientes e estoques

insert into Cozinheiros (id, nome, email, senha) values
(1, 'Soebad Saliv', 'contato@poisonfrit.com', 'Jaca_1234'),
(2, 'Poles Najos', 'poles@g.com', 'DnD13#'),
(3, 'Sani Vosjal', 'sani@g.com', 'Kituti67!');

insert into Ingredientes (id, nome) values
(1, 'Banana'),
(2, 'Leite'),
(3, 'Ovo'),
(4, 'Açúcar'),
(5, 'Farinha de trigo'),
(6, 'Manteiga'),
(7, 'Baunilha'),
(8, 'Jaca'),
(9, 'Barracuda'),
(10, 'Sal'),
(11, 'Pimenta'),
(12, 'Cebola');

insert into Estoques (cozinheiro, ingrediente, quantidade) values
(1, 5, 1854),
(1, 6, 985),
(1, 8, 1520),
(1, 9, 1652),
(1, 10, 566),
(1, 11, 362),
(1, 12, 512),
(2, 1, 124),
(2, 2, 512),
(2, 3, 222),
(2, 4, 356),
(2, 5, 1020),
(2, 6, 558),
(3, 1, 102),
(3, 2, 253),
(3, 5, 152),
(3, 9, 280);

-- Nomes dos cozinheiros em ordem alfabética e o peso total de estoque de cada
select 
    c.nome,
    sum(e.quantidade) as peso_total_estoque
from 
    Cozinheiros c
join 
    Estoques e on c.id = e.cozinheiro
group by 
    c.id
order by 
    c.nome;