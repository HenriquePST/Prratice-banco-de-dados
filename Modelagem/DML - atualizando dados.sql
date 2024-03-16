update cliente
set nome = "Maria"
where idcliente = 2;


update cliente
set cpf = "10212328922"
where idcliente = 2;


update cliente
set nome = "Nicolas"
where idcliente = 3;

update produto
set valor = 1500
where idproduto = 2 or idproduto = 1;


update produto
set valor = 1500, nome = "monitor ultrawide"
where idproduto = 2 or idproduto = 1;

update cliente
set telefone = "8199293949"
where idcliente = 2;