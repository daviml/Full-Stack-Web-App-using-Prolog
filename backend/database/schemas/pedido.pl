:- module(
    pedido,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    pedido(
        idPedido:positive_integer,
        situacao:atom,
        idForma:positive_integer,
        idTaxa:positive_integer,
        tipoEntrega:atom,
        idCliente:positive_integer,
        dataSolicitacao:date,
        precoTotal:positive_integer
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idpedido,Situacao,Idforma,Idtaxa,Tipoentrega,Idcliente,Datasolicitacao,Precototal):-
    with_mutex(pedido,
               assert_pedido(
                   Idpedido,Situacao,Idforma,Idtaxa,Tipoentrega,Idcliente,Datasolicitacao,Precototal)).

remove(Idpedido):-
    with_mutex(pedido,
               retract_pedido(
                   Idpedido, _Situacao, _Idforma, _Idtaxa, _Tipoentrega, _Idcliente, _Datasolicitacao, _Precototal)).

atualiza(Idpedido,Situacao,Idforma,Idtaxa,Tipoentrega,Idcliente,Datasolicitacao,Precototal):-
    with_mutex(pedido,
               ( retractall_pedido(
                    Idpedido, _Situacao, _Idforma, _Idtaxa, _Tipoentrega, _Idcliente, _Datasolicitacao, _Precototal),
                 assert_pedido(
                    Idpedido,Situacao,Idforma,Idtaxa,Tipoentrega,Idcliente,Datasolicitacao,Precototal)) ).                   