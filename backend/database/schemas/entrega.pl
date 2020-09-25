:- module(
    entrega,[entrega/1]
).

:- use_module(library(persistency)).

:- persistent 
    entrega(
        idTaxa:positive_integer
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idtaxa):-
    with_mutex(entrega,
               assert_entrega(
                   Idtaxa)).

remove(Idtaxa):-
    with_mutex(entrega,
               retract_entrega(
                   Idtaxa)).

atualiza(Idtaxa):-
    with_mutex(entrega,
               ( retractall_entrega(
                    Idtaxa),
                 assert_entrega(
                    Idtaxa)) ).                   