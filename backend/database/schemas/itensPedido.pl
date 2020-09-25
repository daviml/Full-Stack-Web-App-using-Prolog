:- module(
    itensPedido,[itensPedido/4]
).

:- use_module(library(persistency)).

:- persistent 
    itensPedido(
        idPedido:positive_integer,
        idProduto:positive_integer,
        numSequencia:positive_integer,
        valor:positive_integer
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idpedido,Idproduto,Numsequencia,Valor):-
    with_mutex(itensPedido,
               assert_itensPedido(
                   Idpedido,Idproduto,Numsequencia,Valor)).

remove(Idpedido):-
    with_mutex(itensPedido,
               retract_itensPedido(
                   Idpedido, _Idproduto, _Numsequencia, _Valor)).

atualiza(Idpedido,Idproduto,Numsequencia,Valor):-
    with_mutex(itensPedido,
               (retractall_itensPedido(
                    Idpedido, _Idproduto, _Numsequencia, _Valor),
                 assert_itensPedido(
                    Idpedido,Idproduto,Numsequencia,Valor)) ).                   