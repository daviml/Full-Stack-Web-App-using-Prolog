:- module(
    situacao,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    situacao(
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Nome):-
    with_mutex(situacao,
               assert_situacao(
                  Nome)).

remove(Nome):-
    with_mutex(situacao,
               retract_situacao(Nome)).

atualiza(Nome):-
    with_mutex(situacao,
               ( retractall_situacao(Nome),
                 assert_cliente(Nome)) ).                   