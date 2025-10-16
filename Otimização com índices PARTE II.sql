
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE INDEX idx_cliente_id ON pedidos (cliente_id);

SELECT c.nome, p.data_pedido
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
WHERE c.cidade = 'Lisboa';

CREATE UNIQUE INDEX idx_email ON clientes (email);

SELECT * FROM clientes WHERE email = 'ana@email.com';

CREATE FULLTEXT INDEX idx_nome_texto ON clientes (nome);

SELECT * FROM clientes WHERE MATCH(nome) AGAINST('João');


