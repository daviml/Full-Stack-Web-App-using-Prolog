:- module(
    taxa,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    taxa(
        idTaxa:positive_integer,
        idBairro:positive_integer,
        valor:positive_integer
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idtaxa,Idbairro,Valor):-
    with_mutex(taxa,
               assert_taxa(
                   Idtaxa,Idbairro,Valor)).

remove(Idtaxa):-
    with_mutex(taxa,
               retract_taxa(
                   Idtaxa, _Idbairro, _Valor)).

atualiza(Idtaxa,Idbairro,Valor):-
    with_mutex(taxa,
               ( retractall_taxa(
                    Idtaxa, _Idbairro, _Valor),
                 assert_taxa(
                   Idtaxa,Idbairro,Valor)) ). 