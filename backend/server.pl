:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/html_write)).
:-use_module(library(http/http_parameters)).

user:file_search_path(root,'.').

:- http_handler('/js', assets_handler, [prefix]).
:- http_handler('/css', assets_handler, [prefix]).
:- http_handler('/images', assets_handler, [prefix]).
:- http_handler('/cadastro_cliente', cadastrar_cliente_handler, []).
:- http_handler('/cliente', post_cliente_handler, [method(post)]).

server(Port):-

	http_server(http_dispatch, [port(Port)]).


cadastrar_cliente_handler(Request):-

	reply_html_page( title('Cadastrar Cliente'),
		[ form([ action='/cliente', method='POST'],
			[ p([], [ label([for=name],'Nome:'),
				input([name=name, type=textarea]) ]),
			p([], [ label([for=adress],'Endereco:'),
				input([name=adress, type=textarea]) ]),
			p([], [ label([for=adressnumber],'Numero:'),
				input([name=adressnumber, type=textarea]) ]),
			p([], [ label([for=cep],'CEP:'),
				input([name=cep, type=textarea]) ]),
			p([], [ label([for=neighborhood],'Bairro:'),
				input([name=neighborhood, type=textarea]) ]),
			p([], [ label([for=complement],'Complemento:'),
				input([name=complement, type=textarea]) ]),
			p([], [ label([for=phone],'Telefone:'),
				input([name=phone, type=textarea]) ]),
			p([], input([ name=submit, type=submit, value='Enviar'],
					[]))
		])]).
	
assets_handler(Request):-

	memberchk(path(Path),Request),
	http_reply_file(root(Path),[],Request).

post_cliente_handler(Request):-
	reply_html_page( title('Cadastrar Cliente'),[\pagina(Request) ]).

pagina(Pedido) -->
	{   catch(
			http_parameters(Pedido, [], [ form_data(Dados) ]),
			_E,fail ),
		!,
		resposta(Dados, HTML)
	},
	html([h1('Resposta do servidor') | HTML]).

	pagina(_Pedido) -->
		html([ h1('Erro'),p('Algum parametro nao e valido') ]).

	resposta([Nome=Valor | Atribs], [Par|Pares]) :-
		Par = p('~w = ~w',[Nome,Valor]),
		!,
		resposta(Atribs, Pares).
	resposta([],[]).

