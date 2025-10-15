CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(100)
);

INSERT INTO clientes (nome, email, cidade) VALUES
('Ana', 'ana@email.com', 'Lisboa'),
('Bruno', 'bruno@email.com', 'Lisboa'),
('Carla', 'carla@email.com', 'Porto'),
('Daniel', 'daniel@email.com', 'Coimbra'),
('Eva', 'eva@email.com', 'Lisboa'),
('Felipe', 'felipe@email.com', 'Porto'),
('Gustavo', 'gustavo@email.com', 'Lisboa'),
('Helena', 'helena@email.com', 'Coimbra');


CREATE INDEX idx_cidade ON clientes (cidade);

EXPLAIN SELECT * FROM clientes WHERE cidade = 'Lisboa';

-- Criação da tabela
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor DECIMAL(10,2),
    status VARCHAR(20)
);

-- Índice em uma coluna usada com frequência em filtros
CREATE INDEX idx_status ON pedidos (status);

-- Consulta otimizada
SELECT * FROM pedidos WHERE status = 'Concluído';

-- Índice que cobre cidade e data
CREATE INDEX idx_cidade_data ON pedidos (cliente_id, data_pedido);

-- Consulta que se beneficia
SELECT * 
FROM pedidos 
WHERE cliente_id = 102 AND data_pedido BETWEEN '2025-01-01' AND '2025-12-31';

CREATE INDEX idx_data_valor ON pedidos (data_pedido, valor);

SELECT * 
FROM pedidos
WHERE status = 'Concluído'
ORDER BY data_pedido;
