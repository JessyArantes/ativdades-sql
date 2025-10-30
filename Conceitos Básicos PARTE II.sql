USE loja_online;

SELECT p.id, c.nome
FROM pedidos p
JOIN clientes c ON p.cliente_id=c.id;

SELECT cidade, COUNT(*) FROM clientes GROUP BY cidade;

CREATE VIEW v_clientes AS SELECT nome, cidade FROM clientes;

CREATE FUNCTION soma(a INT,b INT) RETURNS INT RETURN a+b;

CREATE TRIGGER antes_insert BEFORE INSERT ON pedidos FOR EACH ROW SET NEW.data=NOW();
