CREATE database if not exists probas;
USE probas if exists;
CREATE table if not exists persoa(nome VARCHAR(30), apelido VARCHAR(30), nif CHAR(9));


DELIMITER $$
DROP PROCEDURE IF EXISTS Hola_mundo $$
CREATE PROCEDURE Hola_mundo()
BEGIN
SELECT "Hola mundo";
END
$$
DELIMITER $$
DROP PROCEDURE IF EXISTS data$$
CREATE procedure data()
COMMENT 'Procedemento para obter a data e a versión do servidor'
BEGIN
SELECT version() as Version;
SELECT current_date as Data;
END
$$
DELIMITER $$
DROP PROCEDURE IF EXISTS Info_servidor $$
CREATE PROCEDURE Info_servidor()
BEGIN
SHOW GLOBAL STATUS LIKE "Uptime";
SHOW GLOBAL STATUS LIKE "Connections";
SHOW GLOBAL STATUS LIKE "Threads_connected";
END
$$
DELIMITER $$
DROP FUNCTION IF EXISTS estado $$
CREATE FUNCTION estado(in_estado CHAR(1))
	RETURNS VARCHAR(20)
BEGIN
	DECLARE estado VARCHAR(20);
	IF in_estado = "P" THEN 
		SET estado="caducado";
	ELSEIF in_estado="O" THEN
		SET estado="activo";
	ELSEIF in_estado="N" THEN
		SET estado="nuevo";
	END IF;
	RETURN(estado);
END;
$$
DELIMITER $$
DROP FUNCTION IF EXISTS esimpar $$
CREATE FUNCTION esimpar(numero int)
	RETURNS INT
BEGIN
	DECLARE impar INT;
	IF MOD(numero,2)=0 THEN SET impar=FALSE;
	ELSE SET impar=TRUE;
	END IF;
	RETURN(impar);
END;
$$
DELIMITER $$
DROP FUNCTION IF EXISTS suma1 $$
CREATE FUNCTION suma1(numero INT)
	RETURNS INT
BEGIN
	DECLARE resultado INT;
	SET resultado = numero + 1;
	RETURN(resultado);
END;
$$
DELIMITER $$
DROP PROCEDURE IF EXISTS muestra_estado$$
CREATE PROCEDURE muestra_estado(in numero int)
BEGIN
IF (esimpar(numero)) THEN
	SELECT CONCAT(numero,' es impar');
ELSE
	SELECT CONCAT(numero,' es par');
END IF;
END;
$$
DELIMITER $$
DROP FUNCTION IF EXISTS maiorDe3 $$
CREATE FUNCTION maiorDe3(num1 INT, num2 INT, num3 INT)
        RETURNS INT
BEGIN
        DECLARE resultado INT;
        SET resultado = GREATEST(num1,num2,num3);
        RETURN(resultado);
END;
$$

DELIMITER $$
DROP PROCEDURE IF EXISTS alta $$
CREATE PROCEDURE alta(nome_insert VARCHAR(30), apelido_insert VARCHAR(30), nif_insert CHAR(9))
BEGIN
INSERT INTO persoa(nome,apelido,nif) VALUES(nome_insert, apelido_insert, nif_insert);
END;
$$
DELIMITER $$
DROP FUNCTION IF EXISTS verificarNIF $$
CREATE FUNCTION verificarNIF(nif CHAR(9))
	RETURNS INT
BEGIN
	DECLARE resultado INT;
	IF SUBSTR(nif,9,1) RLIKE '^[A-Z]'
		THEN
			 SET resultado = 1;
		ELSE
			SET resultado = 0;
	END IF;
	RETURN(resultado);
END $$


DROP PROCEDURE IF EXISTS alta2 $$
CREATE PROCEDURE alta2(nome_insert VARCHAR(30), apelido_insert VARCHAR(30), nif_insert CHAR(9))
BEGIN
		IF verificarNIF(nif_insert) = 1
			THEN
				INSERT INTO persoa(nome,apelido,nif) VALUES(nome_insert, apelido_insert, nif_insert);
			ELSE
				SELECT "error";
		END IF; 
END $$
DELIMITER ;



