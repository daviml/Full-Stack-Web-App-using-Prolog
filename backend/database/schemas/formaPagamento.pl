:- module(
    formaPagamento,[formaPagamento/2]
).

:- use_module(library(persistency)).

:- persistent 
    formaPagamento(
        idForma:positive_integer,
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idforma,Nome):-
    with_mutex(formaPagamento,
               assert_formaPagamento(
                    Idforma,Nome)).

remove(Idforma):-
    with_mutex(formaPagamento,
               retract_formaPagamento(
                    Idforma, _Nome)).

atualiza(Idforma,Nome):-
    with_mutex(formaPagamento,
               ( retractall_formaPagamento(
                    Idforma, _Nome),
                 assert_formaPagamento(
                    Idforma,Nome)) ).                   