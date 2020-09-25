:- module(
    tipoEntrega,[tipoEntrega/1]
).

:- use_module(library(persistency)).

:- persistent 
    tipoEntrega(
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Nome):-
    with_mutex(tipoEntrega,
               assert_tipoEntrega(
                   Nome)).

remove(Nome):-
    with_mutex(tipoEntrega,
               retract_tipoEntrega(
                   Nome)).

atualiza(Nome):-
    with_mutex(tipoEntrega,
               (retractall_tipoEntrega(
                    Nome),
                 assert_tipoEntrega(
                    Nome)) ).                   