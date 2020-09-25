:- module(
    produto,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    produto(
        idProduto:positive_integer,
        idCategoria:positive_integer,
        nome:atom,
        descricao:atom,
        preco:positive_integer
        ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idproduto,Idcategoria,Nome,Descricao,Preco):-
    with_mutex(produto,
               assert_produto(
                   Idproduto,Idcategoria,Nome,Descricao,Preco)).

remove(Idproduto):-
    with_mutex(produto,
               retract_produto(
                   Idproduto, _Idcategoria, _Nome, _Descricao, _Preco)).

atualiza(Idproduto, Idcategoria, Nome, Descricao,Preco):-
    with_mutex(produto,
               ( retractall_produto(
                    Idproduto, _Idcategoria, _Nome, _Descricao, _Preco),
                 assert_produto(
                    Idproduto,Idcategoria,Nome,Descricao,Preco)) ).                   