SELECT nome, cidade FROM clientes_brasil
UNION
SELECT nome, cidade FROM clientes_portugal;

SELECT nome, cidade FROM clientes_brasil
UNION ALL
SELECT nome, cidade FROM clientes_portugal;

SELECT nome, cidade, 'Brasil' AS origem FROM clientes_brasil
UNION ALL
SELECT nome, cidade, 'Portugal' AS origem FROM clientes_portugal;

SELECT nome, cidade FROM clientes_brasil
WHERE cidade LIKE '%Rio%'
UNION
SELECT nome, cidade FROM clientes_portugal
WHERE cidade LIKE '%o%';

SELECT nome, cidade FROM clientes_brasil
UNION
SELECT nome, cidade FROM clientes_portugal
ORDER BY nome ASC;


