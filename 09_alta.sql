DELIMITER $$
DROP PROCEDURE IF EXISTS alta $$
CREATE PROCEDURE alta(nome_insert VARCHAR(30), apelido_insert VARCHAR(30), nif_insert CHAR(9))
BEGIN
INSERT INTO persoa(nome,apelido,nif) VALUES(nome_insert, apelido_insert, nif_insert);
END;
$$
