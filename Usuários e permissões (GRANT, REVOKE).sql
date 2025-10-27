
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'senha123';

GRANT SELECT, INSERT ON loja_online.produtos TO 'usuario1'@'localhost';

GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;

REVOKE INSERT ON loja_online.produtos FROM 'usuario1'@'localhost';

SHOW GRANTS FOR 'usuario1'@'localhost';

DROP USER 'usuario1'@'localhost';




