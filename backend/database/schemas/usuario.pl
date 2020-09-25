:- module(
    usuario,[arquivo_da_tabela/1]
).

:- use_module(library(persistency)).

:- persistent 
    usuario(
        login:atom,
        tipoUsuario:atom,
        statusUsuario:atom,
        nome:atom,
        senha:password
    ).

arquivo_da_tabela(Arquivo):- db_attach(Arquivo,[]).    

insere(Login,Tipousuario,Statususuario,Nome,Senha):-
    with_mutex(usuario,
               assert_usuario(
                    Login,Tipousuario,Statususuario,Nome,Senha)).

remove(Login):-
    with_mutex(usuario,
               retract_usuario(
                    Login, _Tipousuario, _Statususuario, _Nome, _Senha)).

atualiza(Login,Tipousuario,Statususuario,Nome,Senha):-
    with_mutex(usuario,
               (retractall_usuario(
                    Login, _Tipousuario, _Statususuario, _Nome, _Senha),
                 assert_usuario(
                    Login,Tipousuario,Statususuario,Nome,Senha)) ).                   