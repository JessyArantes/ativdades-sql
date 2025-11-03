SELECT * FROM clientes WHERE nome LIKE 'A%';      -- começa com A
SELECT * FROM clientes WHERE nome LIKE '%a';      -- termina com a
SELECT * FROM clientes WHERE nome LIKE '%an%';    -- contém "an"
SELECT * FROM clientes WHERE nome LIKE '_a%';     -- segunda letra é "a"

SELECT DISTINCT cidade FROM clientes;

SELECT nome AS cliente, idade AS anos FROM clientes;

SELECT c.nome, p.nome AS produto
FROM clientes AS c
JOIN pedidos AS p ON c.id = p.cliente_id;
