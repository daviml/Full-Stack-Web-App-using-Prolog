:- module(
    bairro,[bairro/2]
).

:- use_module(library(persistency)).

:- persistent 
    bairro(
        idBairro:positive_integer,
        nome:atom        
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idbairro,Nome):-
    with_mutex(bairro,
               assert_bairro(
                   Idbairro,Nome)).

remove(Idbairro):-
    with_mutex(bairro,
               retract_bairro(
                   Idbairro, _Nome)).

atualiza(Idbairro,Nome):-
    with_mutex(bairro,
               ( retractall_bairro(
                    Idbairro, _Nome),
                 assert_bairro(
                    Idbairro,Nome)) ).                   