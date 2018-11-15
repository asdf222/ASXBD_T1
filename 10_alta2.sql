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




