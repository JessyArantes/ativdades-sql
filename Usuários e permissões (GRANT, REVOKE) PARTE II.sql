-- Usuário para leitura (somente SELECT)
CREATE USER 'leitor'@'localhost' IDENTIFIED BY '1234';

-- Usuário para escrita (INSERT, UPDATE, DELETE)
CREATE USER 'editor'@'localhost' IDENTIFIED BY 'abcd';

-- Usuário com acesso remoto
CREATE USER 'adm'@'%' IDENTIFIED BY 'senhaSegura';

-- Permitir apenas ler a tabela produtos
GRANT SELECT ON loja_online.produtos TO 'leitor'@'localhost';

-- Permitir atualizar apenas a tabela clientes
GRANT UPDATE ON loja_online.clientes TO 'editor'@'localhost';

-- Permitir criar e alterar tabelas no banco
GRANT CREATE, ALTER ON loja_online.* TO 'editor'@'localhost';

-- Permitir apagar o banco (cuidado!)
GRANT DROP ON loja_online.* TO 'adm'@'%';

FLUSH PRIVILEGES;

-- Remover permissão de DELETE do usuário editor
REVOKE DELETE ON loja_online.* FROM 'editor'@'localhost';

-- Remover tudo de um usuário
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'adm'@'%';

DROP USER 'leitor'@'localhost';



