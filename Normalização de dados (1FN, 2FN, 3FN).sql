CREATE TABLE Pedidos_Nao_Normalizados (
    id_pedido INT,
    cliente_nome VARCHAR(100),
    cliente_endereco VARCHAR(200),
    produtos VARCHAR(200), -- ex: 'Mouse, Teclado, Monitor'
    valor_total DECIMAL(10,2)
);

CREATE TABLE Pedidos_1FN (
    id_pedido INT,
    cliente_nome VARCHAR(100),
    cliente_endereco VARCHAR(200),
    produto VARCHAR(100),
    valor_total DECIMAL(10,2)
);

CREATE TABLE Enderecos (
    id_endereco INT PRIMARY KEY,
    cep VARCHAR(10),
    cidade VARCHAR(100),
    rua VARCHAR(150)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE Itens_Pedido (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

CREATE TABLE Enderecos (
    id_endereco INT PRIMARY KEY,
    cep VARCHAR(10),
    cidade VARCHAR(100),
    rua VARCHAR(150)
);

ALTER TABLE Clientes
ADD COLUMN id_endereco INT,
ADD FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco);

-- Endereços
INSERT INTO Enderecos VALUES
(1, '79000-000', 'Campo Grande', 'Rua das Flores, 123'),
(2, '01000-000', 'São Paulo', 'Av. Paulista, 999');

-- Clientes
INSERT INTO Clientes VALUES
(1, 'Maria Silva', 1),
(2, 'João Pereira', 2);

-- Produtos
INSERT INTO Produtos VALUES
(1, 'Mouse', 80.00),
(2, 'Teclado', 120.00),
(3, 'Monitor', 950.00);

-- Pedidos
INSERT INTO Pedidos VALUES
(1, 1, '2025-10-10'),
(2, 2, '2025-10-12');

-- Itens dos Pedidos
INSERT INTO Itens_Pedido VALUES
(1, 1, 2),  -- 2 Mouses no pedido 1
(1, 2, 1),  -- 1 Teclado no pedido 1
(2, 3, 1);  -- 1 Monitor no pedido 2




