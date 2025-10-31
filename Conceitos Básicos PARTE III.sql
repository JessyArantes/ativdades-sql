SELECT * FROM clientes WHERE cidade = 'Lisboa';

SELECT * FROM clientes WHERE cidade != 'Porto';

SELECT * FROM produtos WHERE preco > 100;

SELECT * FROM clientes WHERE cidade='Lisboa' AND idade > 25;

SELECT * FROM clientes WHERE cidade='Lisboa' OR cidade='Porto';

SELECT * FROM pedidos WHERE data BETWEEN '2025-01-01' AND '2025-12-31';

SELECT * FROM clientes WHERE cidade IN ('Lisboa', 'Porto', 'Coimbra');

SELECT * FROM clientes ORDER BY nome ASC;
SELECT * FROM produtos ORDER BY preco DESC;

SELECT * FROM clientes LIMIT 5;

SELECT * FROM clientes LIMIT 5 OFFSET 10; -- mostra do 11º ao 15º
