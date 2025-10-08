create database empresa_teste;

use empresa_teste;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO clientes (nome)
VALUES ('Ana'), ('Bruno'), ('Carla'), ('Diego');

INSERT INTO pedidos (cliente_id, valor)
VALUES 
(1, 150.00),   
(1, 200.00),
(3, 300.00); 

select * from clientes;

SELECT nome
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM pedidos p
    WHERE p.cliente_id = c.id
);

SELECT nome
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1
    FROM pedidos p
    WHERE p.cliente_id = c.id
);

SELECT nome
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM pedidos p
    WHERE p.cliente_id = c.id
      AND p.valor > 200
);


  
