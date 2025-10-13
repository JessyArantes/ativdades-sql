USE loja_online;

CREATE VIEW vw_clientes_top_gastos AS
SELECT 
    c.id_cliente,
    c.nome AS cliente,
    COUNT(p.id_pedido) AS total_pedidos,
    SUM(p.valor_total) AS valor_total_gasto
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY valor_total_gasto DESC;

SELECT * FROM vw_clientes_top_gastos;

CREATE VIEW vw_produtos_mais_vendidos AS
SELECT 
    pr.id_produto,
    pr.nome AS produto,
    SUM(ip.quantidade) AS total_vendido,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento_total
FROM produtos pr
JOIN itens_pedido ip ON pr.id_produto = ip.id_produto
GROUP BY pr.id_produto, pr.nome
ORDER BY total_vendido DESC;

SELECT * FROM vw_produtos_mais_vendidos;

CREATE VIEW vw_vendas_mensais AS
SELECT 
    DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
    COUNT(id_pedido) AS total_pedidos,
    SUM(valor_total) AS total_vendas
FROM pedidos
GROUP BY DATE_FORMAT(data_pedido, '%Y-%m')
ORDER BY mes;

SELECT * FROM vw_vendas_mensais;

CREATE OR REPLACE VIEW vw_pedidos_detalhes AS
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

CREATE OR REPLACE VIEW vw_total_por_pedido AS
SELECT 
    id_pedido,
    cliente,
    SUM(total_item) AS total_pedido
FROM vw_pedidos_detalhes
GROUP BY id_pedido, cliente;

SELECT * FROM vw_total_por_pedido;

CREATE OR REPLACE VIEW vw_vendas_mensais AS
SELECT 
    DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
    SUM(valor_total) AS total_vendas,
    COUNT(id_pedido) AS qtd_pedidos
FROM pedidos
GROUP BY DATE_FORMAT(data_pedido, '%Y-%m');

DROP VIEW vw_clientes_top_gastos;






