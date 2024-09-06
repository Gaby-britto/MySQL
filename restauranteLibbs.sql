CREATE DATABASE restauranteLibbs;

USE restauranteLibbs;

CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE categorias (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE produtos(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
	preco VARCHAR(100),
	id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE,
	id_cliente INT,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itenspedido (
	id_itenspedido INT PRIMARY KEY AUTO_INCREMENT,
    preco_unitario INT,
	quantidade INT,
    id_pedido INT,
    id_produto INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


CREATE TABLE pagamentos(
	id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    metodo_pagamento VARCHAR(100),
	valor_pago INT,
    data_pagamento DATE,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);


INSERT INTO clientes (nome, email, telefone) VALUES
('Rafael', 'Rafael@gmail.com', '113657842369'),
('Jorge', 'Jorge@gmail.com', '11356987412');

INSERT INTO categorias (nome) VALUES
('Bebida'),
('Entrada');

INSERT INTO produtos (nome, preco, id_categoria) VALUES
('Coca Cola 2L', 'R$ 20.00', 1),
('Camarão', 'R$ 60.00', 2);


INSERT INTO pedidos (data_pedido, id_cliente) VALUES
('2024-09-03',  1),
('2023-03-09', 2);

INSERT INTO itenspedido (preco_unitario, quantidade, id_pedido, id_produto) VALUES
( 10,  5, 1, 2),
(5, 6, 2, 1);

INSERT INTO pagamentos (metodo_pagamento, valor_pago , data_pagamento,  id_pedido) VALUES
('Cartão', 20, '2024-09-03', 1),
('Dinheiro', 60, '2023-03-09', 2);


SELECT * FROM pagamentos;

SELECT 
	prod.nome, 
	prod.preco,
    categorias.nome
FROM produtos AS prod
INNER JOIN categorias ON prod.id_categoria = categorias.id_categoria;


SELECT 
	cli.nome,
	pedidos.id_pedido
FROM clientes AS cli
INNER JOIN pedidos ON cli.id_cliente = pedidos.id_cliente;

SELECT  cat.nome, produtos.nome, itenspedido.quantidade, pedidos.data_pedido FROM categorias AS cat
INNER JOIN produtos ON cat.id_categoria = produtos.id_categoria
INNER JOIN itenspedido ON produtos.id_produto = itenspedido.id_produto
INNER JOIN pedidos ON itenspedido.id_pedido = pedidos.id_pedido
 