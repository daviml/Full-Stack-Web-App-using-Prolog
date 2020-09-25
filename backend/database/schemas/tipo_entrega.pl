:- module(
    status_usuario,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    status_usuario(
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Nome):-
    with_mutex(status_usuario,
               assert_status_usuario(
                   Nome)).

remove(Nome):-
    with_mutex(status_usuario,
               retract_status_usuario(
                   Nome)).

atualiza(Nome):-
    with_mutex(status_usuario,
               (retractall_status_usuario(
                    Nome),
                 assert_status_usuario(
                    Nome)) ).                   