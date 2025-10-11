CREATE DATABASE loja_online;
USE loja_online;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    cidade VARCHAR(50),
    data_cadastro DATE
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO clientes (nome, email, cidade, data_cadastro) VALUES
('Ana Souza', 'ana@email.com', 'Lisboa', '2025-01-10'),
('Bruno Costa', 'bruno@email.com', 'Porto', '2025-03-22'),
('Carla Dias', 'carla@email.com', 'Coimbra', '2025-05-18');

INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('Smartphone X', 'Eletrônicos', 899.90, 20),
('Fone Bluetooth', 'Acessórios', 149.90, 50),
('Notebook Pro', 'Informática', 2999.90, 10);

INSERT INTO pedidos (id_cliente, data_pedido, valor_total) VALUES
(1, '2025-09-10', 1049.80),
(2, '2025-09-12', 2999.90);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 899.90),
(1, 2, 1, 149.90),
(2, 3, 1, 2999.90);

CREATE VIEW vw_resumo_clientes AS
SELECT 
    c.id_cliente,
    c.nome,
    COUNT(p.id_pedido) AS total_pedidos,
    SUM(p.valor_total) AS total_gasto
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome;

CREATE VIEW vw_detalhes_pedidos AS
SELECT 
    p.id_pedido,
    c.nome AS cliente,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS total_item,
    p.data_pedido
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produtos pr ON ip.id_produto = pr.id_produto;

CREATE VIEW vw_estoque_categoria AS
SELECT 
    categoria,
    COUNT(id_produto) AS qtd_produtos,
    SUM(estoque) AS total_em_estoque,
    ROUND(AVG(preco),2) AS preco_medio
FROM produtos
GROUP BY categoria;

SELECT * FROM vw_resumo_clientes;
SELECT * FROM vw_detalhes_pedidos;
SELECT * FROM vw_estoque_categoria;





