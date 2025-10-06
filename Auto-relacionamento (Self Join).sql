SELECT 
    f.nome AS Funcionario,
    g.nome AS Gerente
FROM funcionarios AS f
LEFT JOIN funcionarios AS g
    ON f.id_gerente = g.id_func;

SELECT 
    c1.nome AS Subcategoria,
    c2.nome AS Categoria_Pai
FROM categorias AS c1
LEFT JOIN categorias AS c2
    ON c1.id_pai = c2.id_cat;

SELECT 
    u1.nome AS Usuario,
    u2.nome AS Indicador
FROM usuarios AS u1
LEFT JOIN usuarios AS u2
    ON u1.indicado_por = u2.id_user;

SELECT 
    c1.nome AS Cidade,
    c2.nome AS Cidade_Irma
FROM cidades AS c1
LEFT JOIN cidades AS c2
    ON c1.id_irma = c2.id;

SELECT 
    p1.nome AS Produto,
    p2.nome AS Produto_Relacionado
FROM produtos AS p1
LEFT JOIN produtos AS p2
    ON p1.id_relacionado = p2.id_prod;
