CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE log_clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_insercao DATETIME,
    usuario VARCHAR(100)
);

DELIMITER $$

CREATE TRIGGER trg_log_insercao_clientes
AFTER INSERT
ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO log_clientes (cliente_id, data_insercao, usuario)
    VALUES (NEW.id, NOW(), USER());
END$$

DELIMITER ;

CREATE TRIGGER trg_atualiza_estoque
AFTER INSERT
ON vendas
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET quantidade = quantidade - NEW.quantidade_vendida
    WHERE id = NEW.produto_id;
END;


SHOW TRIGGERS;

DROP TRIGGER nome_do_trigger;


