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
