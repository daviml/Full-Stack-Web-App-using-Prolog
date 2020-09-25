:- module(
    comandaPedido,[comandaPedido/7]
).

:- use_module(library(persistency)).

:- persistent 
    comandaPedido(
        idComandaPedido:positive_integer,
        idPedido:positive_integer,
        numSequencia:positive_integer,
        nomeCategoria:atom,
        descricao:atom,
        valor:positive_integer,
        observacao:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(IdcomandaPedido,Idpedido,Numsequencia,Nomecategoria,Descricao,Valor,Observacao):-
    with_mutex(comandaPedido,
               assert_comandaPedido(
                   IdcomandaPedido,Idpedido,Numsequencia,Nomecategoria,Descricao,Valor,Observacao)).

remove(IdcomandaPedido):-
    with_mutex(comandaPedido,
               retract_comandaPedido(
                   IdcomandaPedido, _Idpedido, _Numsequencia, _Nomecategoria, _Descricao, _Valor, _Observacao)).

atualiza(IdcomandaPedidoPedido,Idpedido,Numsequencia,Nomecategoria,Descricao,Valor,Observacao):-
    with_mutex(comandaPedidoPedido,
               ( retractall_comandaPedidoPedido(
                    IdcomandaPedidoPedido, _Idpedido, _Numsequencia, _Nomecategoria, _Descricao, _Valor, _Observacao),
                 assert_comandaPedidoPedido(
                    IdcomandaPedidoPedido,Idpedido,Numsequencia,Nomecategoria,Descricao,Valor,Observacao)) ).                   