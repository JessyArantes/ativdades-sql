EXPLAIN SELECT * FROM clientes WHERE cidade = 'Lisboa';

EXPLAIN SELECT * FROM clientes WHERE nome LIKE '%Silva%';

EXPLAIN
SELECT c.nome, p.id_pedido, p.valor_total
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE c.cidade = 'Porto';

EXPLAIN
SELECT * FROM produtos
WHERE categoria = 'Eletrônicos'
ORDER BY preco DESC;

EXPLAIN
SELECT nome FROM clientes
WHERE id_cliente IN (SELECT id_cliente FROM pedidos WHERE valor_total > 1000);

CREATE INDEX idx_valor_total ON pedidos (valor_total);

EXPLAIN ANALYZE
SELECT p.id_pedido, SUM(i.quantidade * i.preco_unit) AS total
FROM pedidos p
JOIN itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY p.id_pedido;





