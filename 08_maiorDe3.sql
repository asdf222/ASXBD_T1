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

