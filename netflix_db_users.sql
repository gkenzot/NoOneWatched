USE netflix;

-- CRIACAO DE USUARIOS

CREATE USER 'admin'@'localhost' IDENTIFIED BY '123admin';
CREATE ROLE 'role_admin'; 
GRANT SELECT ON netflix.* TO 'role_admin';
GRANT 'role_admin' TO 'admin'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'visitante'@'localhost' IDENTIFIED BY '123visit';
CREATE ROLE 'role_visitante'; 
GRANT SELECT ON *.* TO 'role_visitante';
GRANT 'role_visitante' TO 'visitante'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'assinante'@'localhost' IDENTIFIED BY '123assint';
CREATE ROLE 'role_assinante'; 
GRANT INSERT, UPDATE, DELETE ON *.* TO 'role_assinante';
GRANT 'role_assinante','role_visitante' TO 'assinante'@'localhost';
FLUSH PRIVILEGES;

/*
SELECT * FROM mysql.user ;
DROP USER 'admin'@'localhost';
DROP ROLE 'role_admin';
DROP USER 'visitante'@'localhost';
DROP ROLE 'role_visitante';
DROP USER 'assinante'@'localhost';
DROP ROLE 'role_assinante';
*/