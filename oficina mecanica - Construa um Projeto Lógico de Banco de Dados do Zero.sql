select * from clientes
order by nome ASC;

select * from clientes
order by idade DESC;

select * from clientes
limit 3;

select * from clientes
limit 3 offset 3;

select nome, idade from clientes
order by idade DESC
limit 2;

select nome, idade from clientes
order by idade ASC 
limit 1;

select nome, cidade, idade from clientes
order by cidade ASC, idade DESC;

