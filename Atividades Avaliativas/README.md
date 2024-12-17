# Exercícios
Poles gosta muito de jogar RPG de mesa com seus amigos. Ele quer construir um site para gerenciar as informações sobre os diferentes mundos que eles e seus amigos criaram para jogar. Ele precisa da sua ajuda para construir o banco de  dados desse site.

Primeiramente, ele precisa de um sistema onde os mestres podem cadastrar mundos e páginas. Os mundos podem ter nome e descrição. As páginas contêm um título e uma descrição e vão descrever informação relacionadas a um determinado mundo.

Em seguida, ele precisa de um sistema de uma loja de itens e habilidades. Os mestres podem cadastrar itens e habilidades. Itens podem possuir nome, preço, peso e volume. Além disso, podem existir alguns itens especiais, como itens mágicos, inventários e armas. Alguns itens podem ser mágicos e possuir um efeito. Outros itens podem ser do tipo inventário, possuindo uma capacidade de peso e uma capacidade de volume. Por fim podem existir itens do tipo arma, possuindo uma classe e um dano. Cada habilidade deve ter uma descrição e um atributo base.

Por fim, os jogadores podem criar seus personagens para jogar. Personagens podem ter nome, idade, profissão, cultura e data de criação. Além disso, cada personagem vai viver em um determinado mundo e pode conhecer algumas informações descritas pelas páginas. Cada personagem pode carregar quantos itens ele aguentar, ou não carregar nenhum item. Mas cada item é único e só pode ser carregado por um personagem. Um personagem pode ter uma ou mais habilidades com um determinado modificador. Vários personagens podem ter as mesmas habilidades, mas com modificadores diferentes.

![modelo relacional](image.png)

Considerando a descrição e o modelo relacional apresentados, responda as questões a seguir descrevendo os comando SQL para criar o esquema desse banco de dados no SGBD SQLite e para manipular os registros.
