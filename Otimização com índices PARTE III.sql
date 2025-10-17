CREATE DATABASE IF NOT EXISTS loja5;
USE loja5;

-- Tabela de clientes
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100),
  cidade VARCHAR(50)
);

-- Categorias de produtos
CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100)
);

-- Produtos
CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(10,2),
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

-- Pedidos
CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  data_pedido DATE,
  total DECIMAL(10,2),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Itens de cada pedido
CREATE TABLE itens_pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  id_produto INT,
  quantidade INT,
  subtotal DECIMAL(10,2),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
  FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, email, cidade) VALUES
('Ana', 'ana@email.com', 'São Paulo'),
('Bruno', 'bruno@email.com', 'Rio de Janeiro'),
('Carla', 'carla@email.com', 'Belo Horizonte'),
('Daniel', 'daniel@email.com', 'São Paulo');

INSERT INTO categorias (nome) VALUES ('Eletrônicos'), ('Roupas'), ('Livros');

INSERT INTO produtos (nome, preco, id_categoria) VALUES
('Notebook', 3500, 1),
('Camiseta', 80, 2),
('Livro SQL', 50, 3),
('Celular', 2800, 1);

INSERT INTO pedidos (id_cliente, data_pedido, total) VALUES
(1, '2025-10-01', 3550),
(2, '2025-10-03', 80),
(3, '2025-10-05', 2850),
(4, '2025-10-06', 50);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, subtotal) VALUES
(1, 1, 1, 3500),
(1, 3, 1, 50),
(2, 2, 1, 80),
(3, 4, 1, 2800),
(4, 3, 1, 50);

CREATE INDEX idx_produtos_categoria ON produtos (id_categoria);

SELECT * FROM pedidos WHERE total > 1000;

CREATE INDEX idx_pedidos_total ON pedidos (total);

SELECT * FROM pedidos
WHERE data_pedido BETWEEN '2025-10-01' AND '2025-10-10';

CREATE INDEX idx_pedidos_data ON pedidos (data_pedido);

SELECT p.nome, SUM(i.quantidade) AS total_vendido
FROM itens_pedido i
JOIN produtos p ON p.id = i.id_produto
GROUP BY p.nome
ORDER BY total_vendido DESC;

CREATE INDEX idx_itens_produto ON itens_pedido (id_produto);

EXPLAIN SELECT * FROM pedidos WHERE total > 1000;

SELECT * 
FROM pedidos 
WHERE id_cliente = 1 AND data_pedido > '2025-10-01';

CREATE INDEX idx_pedidos_cliente_data
ON pedidos (id_cliente, data_pedido);

EXPLAIN SELECT * 
FROM pedidos 
WHERE id_cliente = 1 AND data_pedido > '2025-10-01';

