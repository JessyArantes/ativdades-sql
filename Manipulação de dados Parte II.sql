CREATE DATABASE Empresa;
USE Empresa;

CREATE TABLE Funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE,
    departamento_id INT
);

CREATE TABLE Departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

INSERT INTO Departamentos (nome) VALUES
('TI'), ('Financeiro'), ('RH');

INSERT INTO Funcionarios (nome, cargo, salario, data_admissao, departamento_id) VALUES
('Ana', 'Analista', 4500.00, '2022-01-15', 1),
('Bruno', 'Desenvolvedor', 5500.00, '2021-08-20', 1),
('Carla', 'Contadora', 5000.00, '2020-05-10', 2),
('Daniel', 'Recrutador', 3000.00, '2023-03-01', 3);

SELECT * FROM Funcionarios WHERE salario > 4000;

SELECT f.nome, f.cargo
FROM Funcionarios f
JOIN Departamentos d ON f.departamento_id = d.id
WHERE d.nome = 'TI';

INSERT INTO Funcionarios (nome, cargo, salario, data_admissao, departamento_id)
VALUES ('Eduarda', 'Estagiária', 1500.00, '2024-02-10', 1);

UPDATE Funcionarios f
JOIN Departamentos d ON f.departamento_id = d.id
SET f.salario = f.salario * 1.10
WHERE d.nome = 'RH';

DELETE FROM Funcionarios
WHERE data_admissao < '2021-01-01';

SELECT nome, salario
FROM Funcionarios
WHERE salario > (SELECT AVG(salario) FROM Funcionarios);

SELECT nome, salario
FROM Funcionarios
WHERE salario > (
    SELECT AVG(salario) FROM Funcionarios
);

SELECT d.nome AS departamento, t.media_salario
FROM (
    SELECT departamento_id, AVG(salario) AS media_salario
    FROM Funcionarios
    GROUP BY departamento_id
) AS t
JOIN Departamentos d ON t.departamento_id = d.id
WHERE t.media_salario > 4500;

SELECT nome, salario,
       (SELECT MAX(salario) FROM Funcionarios) AS maior_salario
FROM Funcionarios;

SELECT nome
FROM Departamentos d
WHERE EXISTS (
    SELECT 1
    FROM Funcionarios f
    WHERE f.departamento_id = d.id
);

SELECT nome, cargo
FROM Funcionarios
WHERE departamento_id IN (
    SELECT id FROM Departamentos
    WHERE nome IN ('TI', 'Financeiro')
);
