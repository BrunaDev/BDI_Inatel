# Aulas

### [SQL] Cadastro
Poles está começando sua loja sua loja online de itens. Inicialmente ele quer começar registrando todos os itens disponíveis para venda.
Dada a lista itens a seguir, Poles precisa ver se os itens foram cadastrados corretamente. Para isso, depois de fazer os cadastros execute a query "SELECT * FROM item;".

> Itens
| cod_item | nome | preco | quantidade |
| 1 | Arco | 20 | 22 |
| 2 | Flecha | 2 | 43 |
| 3 | Espada | 5 | 16 |
| 4 | Escudo | 20 | 20 |
| 5 | Maça | 23 | 19 |
| 6 | Mangual | 56 | 16 |
| 7 | Lança | 21 | 18 |
| 8 | Machado | 20 | 21 |

### [SQL] Itens vendidos
Poles começou a vender itens em sua loja online. Ele já tem um controle de itens disponíveis para venda e usuários cadastrados para fazer compras. Porém ele precisa de sua ajuda para realizar o controle de itens vendidos em cada venda. Para cada venda realizada ele armazena o código da venda (um número inteiro), a data e a hora que a venda foi realizada e o e-mail do usuário que realizou a compra. Vários itens podem ser vendidos em cada venda, em diferentes quantidades. Além disso, cada item pode ser vendido em diferentes vendas. 

Dada a lista de vendas e de itens vendidos a seguir, Poles precisa de duas informações: A quantidade média (inteira) de itens vendidos por venda e uma lista contendo o código dos 5 itens mais vendidos em ordem decrescente da quantidade total vendida.

> Vendas
| cod | data_hora | email_usuario |
| 1 2024-05-10 11:22 | j@g.com |
| 2 2024-05-12 11:22 | k@g.com |
| 3 2024-05-13 11:22 | a@g.com |
| 4 2024-05-13 11:22 | r@g.com |
| 5 2024-05-13 11:22 | r@g.com |
| 6 2024-05-14 11:22 | f@g.com |
| 7 2024-05-15 11:22 | r@g.com |

> Itens Vendidos
| cod_venda | cod_item | quantidade |
| 1 | 1 | 15 |
| 1 | 3 | 5 |
| 2 | 2 | 2 |
| 3 | 5 | 2 |
| 4 | 8 | 3 |
| 4 | 6 | 2 |
| 4 | 1 | 1 |
| 5 | 3 | 6 |
| 6 | 4 | 7 |
| 6 | 3 | 5 |
| 7 | 7 | 10 |

### [SQL] Estoque
Poles precisa controlar o estoque da sua loja. Ele já tem um controle de itens disponíveis para venda, usuários cadastrados para fazer compras e de itens vendidos em cada venda. 

Dadas as listas de itens, de vendas e de itens vendidos a seguir, Poles precisa atualizar o estoque dos itens. Além disso ele precisa de uma lista com os nomes dos itens e suas quantidade em estoque dos itens com menos de 10 peças no estoque em ordem crescente da quantidade disponível.

> Itens
| cod_item | nome | preco | quantidade |
| 1 | Arco | 20 | 22 |
| 2 | Flecha | 2 | 43 |
| 3 | Espada | 5 | 16 |
| 4 | Escudo | 20 | 20 |
| 5 | Maça | 23 | 19 |
| 6 | Mangual | 56 | 16 |
| 7 | Lança | 21 | 18 |
| 8 | Machado | 20 | 21 |

> Vendas
| cod | data_hora | email_usuario |
| 1 2024-05-10 11:22 | j@g.com |
| 2 2024-05-12 11:22 | k@g.com |
| 3 2024-05-13 11:22 | a@g.com |
| 4 2024-05-13 11:22 | r@g.com |
| 5 2024-05-13 11:22 | r@g.com |
| 6 2024-05-14 11:22 | f@g.com |
| 7 2024-05-15 11:22 | r@g.com |

> Itens Vendidos
| cod_venda | cod_item | quantidade |
| 1 | 1 | 15 |
| 1 | 3 | 5 |
| 2 | 2 | 2 |
| 3 | 5 | 2 |
| 4 | 8 | 3 |
| 4 | 6 | 2 |
| 4 | 1 | 1 |
| 5 | 3 | 6 |
| 6 | 4 | 7 |
| 6 | 3 | 5 |
| 7 | 7 | 10 |

### [SQL] Lucro
Poles precisa controlar agora o lucro que está tendo com as vendas da sua loja. Ele já tem um controle de itens disponíveis para venda, usuários cadastrados para fazer compras e de itens vendidos em cada venda. 

Dadas as listas de itens, de vendas e de itens vendidos a seguir, Poles precisa do valor total do lucro obtido nessas vendas.

> Itens
| cod_item | nome | preco | quantidade |
| 1 | Arco | 20 | 22 |
| 2 | Flecha | 2 | 43 |
| 3 | Espada | 5 | 16 |
| 4 | Escudo | 20 | 20 |
| 5 | Maça | 23 | 19 |
| 6 | Mangual | 56 | 16 |
| 7 | Lança | 21 | 18 |
| 8 | Machado | 20 | 21 |

> Vendas
| cod | data_hora | email_usuario |
| 1 2024-05-10 11:22 | j@g.com |
| 2 2024-05-12 11:22 | k@g.com |
| 3 2024-05-13 11:22 | a@g.com |
| 4 2024-05-13 11:22 | r@g.com |
| 5 2024-05-13 11:22 | r@g.com |
| 6 2024-05-14 11:22 | f@g.com |
| 7 2024-05-15 11:22 | r@g.com |

> Itens Vendidos
| cod_venda | cod_item | quantidade |
| 1 | 1 | 15 |
| 1 | 3 | 5 |
| 2 | 2 | 2 |
| 3 | 5 | 2 |
| 4 | 8 | 3 |
| 4 | 6 | 2 |
| 4 | 1 | 1 |
| 5 | 3 | 6 |
| 6 | 4 | 7 |
| 6 | 3 | 5 |
| 7 | 7 | 10 |
