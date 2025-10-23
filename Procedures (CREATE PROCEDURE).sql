DELIMITER $$

CREATE PROCEDURE listar_produtos()
BEGIN
    SELECT id_produto, nome, preco, estoque
    FROM produtos
    ORDER BY nome;
END $$

DELIMITER ;

CALL listar_produtos();

DELIMITER $$

CREATE PROCEDURE produtos_por_categoria(IN categoria_nome VARCHAR(50))
BEGIN
    SELECT p.nome, p.preco, p.estoque, c.nome AS categoria
    FROM produtos p
    INNER JOIN categorias c ON p.id_categoria = c.id_categoria
    WHERE c.nome = categoria_nome;
END $$

DELIMITER ;

-- Executar
CALL produtos_por_categoria('Eletrônicos');


DELIMITER $$

CREATE PROCEDURE total_pedido(IN idPedido INT, OUT total DECIMAL(10,2))
BEGIN
    SELECT SUM(ip.quantidade * p.preco)
    INTO total
    FROM itens_pedido ip
    INNER JOIN produtos p ON ip.id_produto = p.id_produto
    WHERE ip.id_pedido = idPedido;
END $$

DELIMITER ;

-- Executar
CALL total_pedido(1, @valor_total);
SELECT @valor_total AS Total_Pedido;

DELIMITER $$

CREATE PROCEDURE atualizar_estoque(IN idProduto INT, IN qtdVendida INT)
BEGIN
    UPDATE produtos
    SET estoque = estoque - qtdVendida
    WHERE id_produto = idProduto;
END $$

DELIMITER ;

-- Executar
CALL atualizar_estoque(2, 5);

DELIMITER $$

CREATE PROCEDURE adicionar_cliente(
    IN nome_cliente VARCHAR(100),
    IN email_cliente VARCHAR(100),
    IN telefone_cliente VARCHAR(20)
)
BEGIN
    INSERT INTO clientes (nome, email, telefone)
    VALUES (nome_cliente, email_cliente, telefone_cliente);
END $$

DELIMITER ;

-- Executar
CALL adicionar_cliente('Maria Silva', 'maria@email.com', '99999-1234');
