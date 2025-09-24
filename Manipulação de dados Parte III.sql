CREATE DATABASE Empresa;
USE Empresa;

WITH MediaPorDepto AS (
    SELECT departamento_id, AVG(salario) AS media
    FROM Funcionarios
    GROUP BY departamento_id
)
SELECT d.nome, m.media
FROM MediaPorDepto m
JOIN Departamentos d ON m.departamento_id = d.id
WHERE m.media > 4000;

SELECT nome, salario FROM Funcionarios WHERE salario > 5000
UNION
SELECT nome, salario FROM Funcionarios WHERE cargo = 'Analista';

SELECT nome,
       CASE
         WHEN salario < 3000 THEN 'Baixo'
         WHEN salario BETWEEN 3000 AND 5000 THEN 'Médio'
         ELSE 'Alto'
       END AS faixa_salarial
FROM Funcionarios;

SELECT nome, salario,
       RANK() OVER (ORDER BY salario DESC) AS ranking
FROM Funcionarios;

CREATE VIEW vw_salario_medio_por_depto AS
SELECT d.nome AS departamento, AVG(f.salario) AS salario_medio
FROM Funcionarios f
JOIN Departamentos d ON f.departamento_id = d.id
GROUP BY d.nome;

SELECT * FROM vw_salario_medio_por_depto;





