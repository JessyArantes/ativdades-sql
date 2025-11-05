SELECT COUNT(*) AS total_vendas
FROM vendas;

SELECT SUM(valor) AS soma_total
FROM vendas;

SELECT SUM(valor) AS soma_total
FROM vendas;

SELECT AVG(valor) AS media_vendas
FROM vendas;

SELECT MIN(valor) AS menor, MAX(valor) AS maior
FROM vendas;

SELECT vendedor, SUM(valor) AS total_vendedor
FROM vendas
GROUP BY vendedor;

SELECT categoria, AVG(valor) AS media_categoria
FROM vendas
GROUP BY categoria;

SELECT categoria, COUNT(*) AS qtd_vendas
FROM vendas
GROUP BY categoria;

SELECT categoria, SUM(valor) AS total_categoria
FROM vendas
GROUP BY categoria
HAVING total_categoria > 500;

SELECT vendedor, COUNT(*) AS qtd_vendas
FROM vendas
GROUP BY vendedor
HAVING COUNT(*) > 1;
