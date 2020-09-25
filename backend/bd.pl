:- load_files([caminhos,
    schemas(cliente)
],
[if(not_loaded),
silent(true)
]).

:- initialization(inicializa_tabelas).

tabela(cliente).

inicializa_tabelas :-
  findall(Tabela, tabela(Tabela), Tabelas),
  liga_todos_arquivos(Tabelas).

liga_todos_arquivos([Tabela|Tabelas]):-
  liga_arquivo(Tabela),
  !,
  liga_todos_arquivos(Tabelas).
liga_todos_arquivos([]).

liga_arquivo(NomeTabela):- !,
   atomic_list_concat(['tbl_', NomeTabela, '.pl'], Arquivo),
   expand_file_search_path(tables(Arquivo), CaminhoArquivoTabela),
   NomeTabela:arquivo_da_tabela(CaminhoArquivoTabela).