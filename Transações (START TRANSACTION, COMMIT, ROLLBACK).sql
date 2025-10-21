CREATE DATABASE IF NOT EXISTS Loja_Online;
USE Loja_Online;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    saldo DECIMAL(10,2)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    valor DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
) ENGINE = InnoDB;

INSERT INTO clientes (nome, saldo) VALUES
('Maria Silva', 500.00),
('João Souza', 300.00);

START TRANSACTION;

INSERT INTO pedidos (id_cliente, valor, status)
VALUES (1, 100.00, 'Pendente');


UPDATE clientes
SET saldo = saldo - 100.00
WHERE id_cliente = 1;

COMMIT;

START TRANSACTION;

INSERT INTO pedidos (id_cliente, valor, status)
VALUES (99, 200.00, 'Pendente');

UPDATE clientes
SET saldo = saldo - 200.00
WHERE id_cliente = 99;

ROLLBACK;


