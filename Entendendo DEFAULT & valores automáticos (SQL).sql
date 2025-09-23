CREATE DATABASE thirdexample;
USE thirdexample;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'ativo'
);

INSERT INTO clientes (nome) VALUES ('Ana');

CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    cliente VARCHAR(100)
);

INSERT INTO pedidos (cliente)
VALUES ('Ana Silva');

INSERT INTO pedidos (cliente)
VALUES
  ('João'),
  ('Maria'),
  ('Pedro');

select * from  clientes;

select * from pedidos;


