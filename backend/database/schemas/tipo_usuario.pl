:- module(
    tipo_usuario,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    tipo_usuario(
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Nome):-
    with_mutex(tipo_usuario,
               assert_tipo_usuario(
                   Nome)).

remove(Nome):-
    with_mutex(tipo_usuario,
               retract_tipo_usuario(
                   Nome)).

atualiza(Nome):-
    with_mutex(tipo_usuario,
               (retractall_tipo_usuario(
                    Nome),
                 assert_tipo_usuario(
                    Nome)) ).                   