:- module(
    cliente,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    cliente(
        idCliente:positive_integer,
        idBairro:positive_integer,
        telefone:atom,
        endereco:atom,
        numero:positive_integer,
        cidade:atom,
        cep:atom,
        complemento:atom,
        observacao:atom
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Idcliente,Idbairro,Telefone,Endereco,Numero,Cidade,Cep,Complemento,Observacao):-
    with_mutex(cliente,
               assert_cliente(
                   Idcliente,Idbairro,Telefone,Endereco,Numero,Cidade,Cep,Complemento,Observacao)).

remove(Idcliente):-
    with_mutex(cliente,
               retract_cliente(
                   Idcliente, _Idbairro, _Telefone, _Endereco, _Numero, _Cidade, _Cep, _Complemento, _Observacao)).

atualiza(Idcliente, Idbairro, Telefone, Endereco, Numero, Cidade, Cep, Complemento, Observacao):-
    with_mutex(cliente,
               ( retractall_cliente(
                    Idcliente, _Idbairro, _Telefone, _Endereco, _Numero, _Cidade, _Cep, _Complemento, _Observacao),
                 assert_cliente(
                    Idcliente,Idbairro,Telefone,Endereco,Numero,Cidade,Cep,Complemento,Observacao)) ).                   