# 6 - Criando um mecanismo de conhecimento

Considere que um personagem pode conhecer uma página dada a sua profissão. Personagens de uma determinada profissão podem conhecer várias páginas, assim como uma página pode ser conhecida por personagens de diferentes profissões. 

Considere todos os Mundos, Páginas e Personagens criados nas atividades anteriores. Além disso, crie a tabela necessária para registrar quais profissões podem conhecer cada uma das páginas criadas.

> Conhecedores

| página | profissão |
| --- | --- |
| 1 | Clérigo(a) |
| 1 | Acólito(a) |
| 1 | Paladino(a) |
| 1	| Diplomata |
| 2 | Ladino(a) |
| 2	| Diplomata |

Por fim, exiba o nome de todos os personagens e o título das páginas que eles conhecem separados por vírgula (use o comando `GROUP_CONCAT` par realizar essa operação).
