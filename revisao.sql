use revisao;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    cidade VARCHAR(50),
    tipo VARCHAR(20) DEFAULT 'Ativo',
    idade INT
);

-- Selecionar apenas clientes de Lisboa
SELECT * FROM clientes
WHERE cidade = 'Lisboa';

-- Remove apenas clientes da cidade de Lisboa
DELETE FROM clientes
WHERE cidade = 'Lisboa';

-- Remove todos os registros da tabela (cuidado!)
DELETE FROM clientes;

-- Remove a tabela de clientes completamente
DROP TABLE clientes;



