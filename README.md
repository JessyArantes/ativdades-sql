# 🗄️ Atividades SQL

Repositório com exercícios e atividades práticas em **SQL**, voltados para estudo e fixação de conceitos fundamentais de banco de dados.  
Aqui você encontrará exemplos de **consultas, criação de tabelas e manipulação de dados**.

---

## 📂 Estrutura dos Arquivos

- **Count-AVG-SUM-MIN-MAX.sql**  
  Exercícios utilizando funções de agregação no SQL.

- **Count-AVG-SUM-MIN-MAX exercicios.sql**  
  Lista de exercícios de fixação com as funções de agregação.

- **Exe order by-limit-offset.sql**  
  Consultas utilizando `ORDER BY`, `LIMIT` e `OFFSET`.

- **Join.sql**  
  Exercícios de junções entre tabelas.

- **Join part 2.sql**  
  Continuação de exercícios de junções.

- **Like -%-as.sql**  
  Consultas utilizando `LIKE`, curingas `%` e `_`, além de `AS` (alias).

- **Select&Insert.sql**  
  Exercícios de seleção e inserção de dados.

- **copia.sql**  
  Script auxiliar de cópia de tabelas/dados.

- **empresa_treinamento.sql**  
  Base de dados fictícia para treinamento.

- **ex-1.sql, ex-2.sql, ex-3.sql**  
  Listas de exercícios variados para fixação.

- **main.sql**  
  Script principal com consultas iniciais.

- **oficina_mecanica.sql**  
  Base de dados fictícia para oficina mecânica.

- **sistemas_vendas.sql**  
  Base de dados fictícia para controle de vendas.

---

## 🗂️ Manipulação de Dados em MySQL – Resumo
### 1️⃣ Criação e Estrutura
- **CREATE DATABASE / USE**: cria e seleciona o banco de dados.
- **CREATE TABLE**: define tabelas com tipos de dados (ex.: `INT`, `VARCHAR`, `DECIMAL`, `DATE`).
- **INSERT INTO**: insere registros.

---

### 2️⃣ Consultas Básicas (`SELECT`)
- **SELECT … FROM …**: busca dados de uma ou mais tabelas.  
- **WHERE**: filtra registros com condições (`>`, `<`, `=`, `LIKE`, `BETWEEN`).  
- **ORDER BY**: ordena resultados (`ASC` ou `DESC`).  
- **JOIN**: une tabelas relacionadas (ex.: `INNER JOIN`, `LEFT JOIN`).  

---

### 3️⃣ Funções de Agregação
- **AVG**, **MAX**, **MIN**, **COUNT**, **SUM** para cálculos sobre conjuntos de linhas.  
- **GROUP BY**: agrupa resultados por coluna(s).  
- **HAVING**: filtra grupos depois da agregação.

---

### 4️⃣ Manipulação de Registros
- **UPDATE**: altera valores existentes.
- **DELETE**: remove registros com base em uma condição.

---

### 5️⃣ Subconsultas (Subqueries)
Consultas internas usadas dentro de outra query.

- **WHERE**: compara um valor com o resultado de uma subconsulta.  
  ```sql
  SELECT nome, salario
  FROM Funcionarios
  WHERE salario > (SELECT AVG(salario) FROM Funcionarios);

## 🚀 Como Utilizar

1. Clone este repositório:
   ```bash
   git clone https://github.com/SeuUsuario/atividades-sql.git
