:- module(
    caixa,[caixa/3]
).

:- use_module(library(persistency)).

:- persistent 
    caixa(
        data2:atom,
        trocoInicial:nonneg,
        totalVendas:positive_integer
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Data2,Trocoinicial,Totalvendas):-
    with_mutex(caixa,
               assert_caixa(
                   Data2,Trocoinicial,Totalvendas)).

remove(Data2):-
    with_mutex(caixa,
               retract_caixa(
                   Data2, _Trocoinicial, _Totalvendas)).

atualiza(Data2,Trocoinicial,Totalvendas):-
    with_mutex(caixa,
               ( retractall_caixa(
                    Data2, _Trocoinicial, _Totalvendas),
                 assert_caixa(
                    Data2,Trocoinicial,Totalvendas)) ).                   