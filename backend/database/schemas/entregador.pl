:- module(
    entregador,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    entregador(
        idEntregador:positive_integer,
        telefone:atom,
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Identregador,Telefone,Nome):-
    with_mutex(entregador,
               assert_entregador(
                   Identregador,Telefone,Nome)).

remove(Identregador):-
    with_mutex(entregador,
               retract_entregador(
                   Identregador, _Telefone, _Nome)).

atualiza(Identregador,Telefone,Nome):-
    with_mutex(entregador,
               (retractall_entregador(
                    Identregador, _Telefone, _Nome),
                 assert_entregador(
                    Identregador,Telefone,Nome)) ).                   