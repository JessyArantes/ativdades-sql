SELECT nome, salario
FROM funcionarios
WHERE salario > (
    SELECT AVG(salario)
    FROM funcionarios
);

SELECT nome
FROM funcionarios
WHERE departamento_id IN (
    SELECT id
    FROM departamentos
    WHERE nome IN ('TI', 'RH')
);

SELECT nome, salario, departamento_id
FROM funcionarios f
WHERE salario > (
    SELECT AVG(salario)
    FROM funcionarios
    WHERE departamento_id = f.departamento_id
);

SELECT nome
FROM departamentos d
WHERE EXISTS (
    SELECT 1
    FROM funcionarios f
    WHERE f.departamento_id = d.id

);

SELECT nome
FROM departamentos d
WHERE NOT EXISTS (
    SELECT 1
    FROM funcionarios f
    WHERE f.departamento_id = d.id
);




