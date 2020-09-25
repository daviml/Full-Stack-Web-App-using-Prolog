:- module(
    tipoUsuario,[tipoUsuario/1]
).

:- use_module(library(persistency)).

:- persistent 
    tipoUsuario(
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Nome):-
    with_mutex(tipoUsuario,
               assert_tipoUsuario(
                   Nome)).

remove(Nome):-
    with_mutex(tipoUsuario,
               retract_tipoUsuario(
                   Nome)).

atualiza(Nome):-
    with_mutex(tipoUsuario,
               (retractall_tipoUsuario(
                    Nome),
                 assert_tipoUsuario(
                    Nome)) ).                   