:- initialization( popula_tabelas ).

popula_tabelas :-
  insere_clientes.

insere_clientes:- 
cliente:insere(2,3,'190',ruab,4,udi,'000',casa1,naotem).
