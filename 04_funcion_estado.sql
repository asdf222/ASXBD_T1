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
