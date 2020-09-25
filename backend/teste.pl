:- initialization( popula_tabelas ).

popula_tabelas :-
  insere_bairros,
  insere_caixas,
  insere_categorias,
  insere_clientes,
  insere_comandaPedidos,
  insere_entrega,
  insere_entregador,
  insere_formaPagamento,
  insere_itensPedido,
  insere_pedido,
  insere_produto,
  insere_situacao,
  insere_statusUsuario,
  insere_taxa,
  insere_tipoEntrega,
  insere_tipoUsuario,
  insere_usuario.
  

insere_bairros:- 
    bairro:insere(1000,centro),
    bairro:insere(1001,fundinho),
    bairro:insere(1002,martins),
    bairro:insere(1003,brasil).

insere_caixas:- 
    caixa:insere('2020-09-20',100,1000),
    caixa:insere('2020-09-21',95,1200),
    caixa:insere('2020-09-22',80,1500),
    caixa:insere('2020-09-23',130,900).

insere_categorias:- 
    categoria:insere(100,brotinho,1),
    categoria:insere(101,media,2),
    categoria:insere(102,grande,3),
    categoria:insere(103,'extra grande',4).

insere_clientes:- 
    cliente:insere(1,1000,'32323232','rua a',10,uberlandia,'38400000','ap 101','edificio brasil'),
    cliente:insere(2,1001,'32323233','rua b',20,uberlandia,'38400000','ap 201','edificio equador'),
    cliente:insere(3,1002,'32323234','rua c',30,uberlandia,'38400000','ap 202','edificio mexico'),
    cliente:insere(4,1003,'32323235','rua d',40,uberlandia,'38400000','ap 102','edificio estados unidos').

insere_comandaPedidos:- 
    comandaPedido:insere(103,3,3,brotinho,'pizza calabresa brotinho',2999,'sem cebola'),
    comandaPedido:insere(104,4,4,media,'pizza calabresa media',3999,'sem cebola'),
    comandaPedido:insere(105,5,5,grande,'pizza calabresa grande',4999,'sem cebola'),
    comandaPedido:insere(106,6,6,'extra grande','pizza calabresa extra grande',5999,'sem cebola').

insere_entrega:- 
    entrega:insere(95),
    entrega:insere(96),
    entrega:insere(97),
    entrega:insere(98).

insere_entregador:- 
    entregador:insere(1,'98989898','Andre'),
    entregador:insere(2,'98989899','Felipe'),
    entregador:insere(3,'98989891','Lucas'),
    entregador:insere(4,'98989892','Gabriel').

insere_formaPagamento:- 
    formaPagamento:insere(1,'Dinheiro'),
    formaPagamento:insere(2,'Cartao de debito'),
    formaPagamento:insere(3,'Cartao de credito'),
    formaPagamento:insere(4,'Transferencia').

insere_itensPedido:- 
    itensPedido:insere(103,1,3,2999),
    itensPedido:insere(104,2,4,3999),
    itensPedido:insere(105,3,5,4999),
    itensPedido:insere(106,4,6,5999).

insere_pedido:- 
    pedido:insere(103,entregue,1,1,balcao,1,'2020-09-20',2999),
    pedido:insere(104,'em producao',2,2,delivery,2,'2020-09-22',3999),
    pedido:insere(105,'saiu para entrega',3,2,delivery,3,'2020-09-22',4999),
    pedido:insere(106,entregue,4,1,balcao,4,'2020-09-22',5999).

insere_produto:- 
    produto:insere(1,100,calabresa,'pizza calabresa brotinho',2999),
    produto:insere(2,101,calabresa,'pizza calabresa media',3999),
    produto:insere(3,102,calabresa,'pizza calabresa grande',4999),
    produto:insere(4,103,calabresa,'pizza calabresa extra grande',5999).

insere_situacao:- 
    situacao:insere(entregue),
    situacao:insere('em producao'),
    situacao:insere('saiu para entrega'),
    situacao:insere('aguardando entregador').

insere_statusUsuario:- 
    statusUsuario:insere(ativo),
    statusUsuario:insere(inativo).

insere_taxa:- 
    taxa:insere(1,1000,100),
    taxa:insere(2,1001,500),
    taxa:insere(3,1002,700),
    taxa:insere(4,1003,1000).

insere_tipoEntrega:- 
    tipoEntrega:insere(balcao),
    tipoEntrega:insere(delivery).

insere_tipoUsuario:- 
    tipoUsuario:insere(gerente),
    tipoUsuario:insere(atendente),
    tipoUsuario:insere(caixa),
    tipoUsuario:insere(producao).

insere_usuario:- 
    usuario:insere(teste,gerente,ativo,'Ana',teste123),
    usuario:insere(teste1,atendente,inativo,'Gabriela',teste456),
    usuario:insere(teste2,caixa,ativo,'Douglas',teste789),
    usuario:insere(teste3,producao,inativo,'Jorge',teste012).