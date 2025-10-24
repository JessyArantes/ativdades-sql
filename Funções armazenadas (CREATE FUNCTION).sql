USE Loja_online;

DELIMITER $$

CREATE FUNCTION calcular_total_pedido(id_pedido INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(ip.quantidade * p.preco) INTO total
    FROM itens_pedido AS ip
    JOIN produtos AS p ON ip.id_produto = p.id_produto
    WHERE ip.id_pedido = id_pedido;

    RETURN IFNULL(total, 0);
END$$

DELIMITER ;

SELECT calcular_total_pedido(1) AS total_pedido;

DROP FUNCTION calcular_total_pedido;


USE Loja_online;

DELIMITER $$

CREATE FUNCTION calcular_total_cliente(id_cliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_cliente DECIMAL(10,2);

    SELECT SUM(ip.quantidade * p.preco)
    INTO total_cliente
    FROM pedidos AS ped
    JOIN itens_pedido AS ip ON ped.id_pedido = ip.id_pedido
    JOIN produtos AS p ON ip.id_produto = p.id_produto
    WHERE ped.id_cliente = id_cliente;

    RETURN IFNULL(total_cliente, 0);
END$$

DELIMITER ;

SELECT calcular_total_cliente(3) AS total_gasto;

SET total_cliente = total_cliente * 0.90; 

