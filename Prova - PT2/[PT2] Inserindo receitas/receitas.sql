-- Criação de Tabelas de cozinheiros, ingredientes e estoques (item anterior)

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

-- Novas tabelas de Receitas e Composições
create table Receitas(
    id int primary key,
    nome varchar(45),
    modo_de_preparo text
);

create table Composicoes(
    receita int,
    ingrediente int,
    quantidade int,
    primary key(receita, ingrediente),
    foreign key(receita) references Receitas(id),
    foreign key(ingrediente) references Ingredientes(id)
);

-- Inserção de cozinheiros, ingredientes e estoques (item anterior)

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

-- Inserção de Receitas e Composições
insert into Receitas (id, nome, modo_de_preparo) values
(1, 'Bolo de Banana', ' Misture tudo coloque na forma e asse por 30 min.'),
(2, 'Batida de Banana', ' Bata tudo no liquidificador e aproveite!'),
(3, 'Tarte jacquier poisson', ' Cozinhe a jaca em pressão por 20 min. Refogue a barracuda em pedaços pequenos, com a jaca cozida, manteiga, cebola, sal e pimenta. Faça a massa com farinha, manteiga e uma pitada de sal. Forre uma forma com a massa e coloque o recheio. Cubra com outra parte da massa e leve ao forno por 20 min ou até dourar.');

insert into Composicoes (receita, ingrediente, quantidade) values
(1, 1, 150),
(1, 3, 80),
(1, 4, 100),
(1, 5, 150),
(1, 6, 50),
(2, 1, 100),
(2, 2, 150),
(3, 5, 200),
(3, 6, 100),
(3, 8, 300),
(3, 9, 200),
(3, 10, 10),
(3, 11, 10),
(3, 12, 200);

-- Nomes das receitas em ordem alfabética e quantos ingredientes diferentes são necessários para fazê-la
select 
    r.nome as nome_receita,
    count(distinct c.ingrediente) as ingredientes_diferentes
from 
    Receitas r
join 
    Composicoes c on r.id = c.receita
group by 
    r.id
order by 
    r.nome;
