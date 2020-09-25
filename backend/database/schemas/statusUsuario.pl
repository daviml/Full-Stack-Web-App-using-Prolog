:- module(
    statusUsuario,[statusUsuario/1]
).

:- use_module(library(persistency)).

:- persistent 
    statusUsuario(
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Nome):-
    with_mutex(statusUsuario,
               assert_statusUsuario(
                   Nome)).

remove(Nome):-
    with_mutex(statusUsuario,
               retract_statusUsuario(
                   Nome)).

atualiza(Nome):-
    with_mutex(statusUsuario,
               (retractall_statusUsuario(
                    Nome),
                 assert_statusUsuario(
                    Nome)) ).                   