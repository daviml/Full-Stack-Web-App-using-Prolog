:- module(
    categoria,[categoria/3]
).

:- use_module(library(persistency)).

:- persistent 
    categoria(
        idCategoria:positive_integer,
        nome:atom,
        numeroSabores:positive_integer
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idcategoria, Nome, NumeroSabores):-
    with_mutex(categoria,
               assert_categoria(
                   Idcategoria,Nome,NumeroSabores)).

remove(Idcategoria):-
    with_mutex(categoria,
               retract_categoria(
                   Idcategoria, _Nome, _NumeroSabores)).

atualiza(Idcategoria, Nome, NumeroSabores):-
    with_mutex(categoria,
               ( retractall_categoria(
                    Idcategoria, _Nome, _NumeroSabores),
                 assert_categoria(
                    Idcategoria, Nome, NumeroSabores)) ).                   