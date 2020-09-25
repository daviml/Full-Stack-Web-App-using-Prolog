:- module(
    itens_pedido,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    itens_pedido(
        idPedido:positive_integer,
        idProduto:positive_integer,
        numSequencia:positive_integer,
        valor:positive_integer,
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idpedido,Idproduto,Numsequencia,Valor):-
    with_mutex(itens_pedido,
               assert_itens_pedido(
                   Idpedido,Idproduto,Numsequencia,Valor)).

remove(Idpedido):-
    with_mutex(itens_pedido,
               retract_itens_pedido(
                   Idpedido, _Idproduto, _Numsequencia, _Valor)).

atualiza(Idpedido,Idproduto,Numsequencia,Valor):-
    with_mutex(itens_pedido,
               (retractall_itens_pedido(
                    Idpedido, _Idproduto, _Numsequencia, _Valor),
                 assert_itens_pedido(
                    Idpedido,Idproduto,Numsequencia,Valor)) ).                   