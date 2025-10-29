USE loja_online;

CREATE TABLE clientes(
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100), email VARCHAR(100)
);

INSERT INTO clientes(nome) VALUES('Ana');
UPDATE clientes SET nome='Maria' WHERE id=1;
DELETE FROM clientes WHERE id=2;

SELECT * FROM clientes;
SELECT nome FROM clientes WHERE cidade='Lisboa';
