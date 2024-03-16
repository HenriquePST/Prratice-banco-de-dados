INSERT INTO cliente (nome, cpf, telefone)
VALUES ("JOAO", "12345678911", "2828282828");

INSERT INTO pedido (data, valor, Cliente_idCliente)
VALUES ("2021-01-01", 50, 2);

INSERT INTO produto (nome, valor)
VALUES ("computaodr i5", 2000);

INSERT INTO produto_has_pedido (produto_idproduto, pedido_idpedido)
VALUES(1, 1);

INSERT INTO produto(nome, valor)
VALUES("monitor 25", 1000);

INSERT INTO produto_has_pedido (produto_idproduto, pedido_idpedido)
VALUES(2, 1);



