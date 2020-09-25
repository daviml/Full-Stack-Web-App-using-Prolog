:- module(
    pagamento,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    pagamento(
        idForma:positive_integer,
        nome:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idforma,Nome):-
    with_mutex(pagamento,
               assert_pagamento(
                    Idforma,Nome)).

remove(Idforma):-
    with_mutex(pagamento,
               retract_pagamento(
                    Idforma, _Nome)).

atualiza(Idforma,Nome):-
    with_mutex(pagamento,
               ( retractall_pagamento(
                    Idforma, _Nome),
                 assert_pagamento(
                    Idforma,Nome)) ).                   