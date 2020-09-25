:- module(
    comanda,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    comanda(
        idComanda:positive_integer,
        idPedido:positive_integer,
        numSequencia:positive_integer,
        nomeCategoria:atom,
        descricao:atom,
        valor:positive_integer,
        observacao:atom,
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idcomanda,Idpedido,Numsequencia,Nomecategoria,Descricao,Valor,Observacao):-
    with_mutex(comanda,
               assert_comanda(
                   Idcomanda,Idpedido,Numsequencia,Nomecategoria,Descricao,Valor,Observacao)).

remove(Idcomanda):-
    with_mutex(comanda,
               retract_comanda(
                   Idcomanda, _Idpedido, _Numsequencia, _Nomecategoria, _Descricao, _Valor, _Observacao)).

atualiza(Idcomanda,Idpedido,Numsequencia,Nomecategoria,Descricao,Valor,Observacao):-
    with_mutex(comanda,
               ( retractall_comanda(
                    Idcomanda, _Idpedido, _Numsequencia, _Nomecategoria, _Descricao, _Valor, _Observacao),
                 assert_comanda(
                    Idcomanda,Idpedido,Numsequencia,Nomecategoria,Descricao,Valor,Observacao)) ).                   