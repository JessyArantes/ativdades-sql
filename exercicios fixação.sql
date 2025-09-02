create database revisao;

use  revisao;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    cidade VARCHAR(50),
    idade INT
);

INSERT INTO clientes (nome, email, cidade, idade)
VALUES 
('João Santos', 'joao@email.com', 'Porto', 35),
('Ana Costa', 'ana@email.com', 'Lisboa', 22);

SELECT nome, cidade FROM clientes;

SELECT * FROM clientes WHERE cidade = 'Lisboa';

SELECT * FROM clientes WHERE nome LIKE 'A%';

SELECT DISTINCT cidade FROM clientes;

SELECT c.nome, c.cidade 
FROM clientes AS c;



