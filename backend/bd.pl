:- load_files([caminhos,
    schemas(bairro),
    schemas(caixa),
    schemas(categoria),
    schemas(cliente),
    schemas(comandaPedido),
    schemas(entrega),
    schemas(entregador),
    schemas(formaPagamento),
    schemas(itensPedido),
    schemas(pedido),
    schemas(produto),
    schemas(situacao),
    schemas(statusUsuario),
    schemas(taxa),
    schemas(tipoEntrega),
    schemas(tipoUsuario),
    schemas(usuario)
],
[if(not_loaded),
silent(true)
]).

:- initialization(inicializa_tabelas).

tabela(bairro).
tabela(caixa).
tabela(categoria).
tabela(cliente).
tabela(comandaPedido).
tabela(entrega).
tabela(entregador).
tabela(formaPagamento).
tabela(itensPedido).
tabela(pedido).
tabela(produto).
tabela(situacao).
tabela(statusUsuario).
tabela(taxa).
tabela(tipoEntrega).
tabela(tipoUsuario).
tabela(usuario).

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