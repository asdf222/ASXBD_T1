DELIMITER $$
DROP PROCEDURE IF EXISTS data$$
CREATE procedure data()
COMMENT 'Procedemento para obter a data e a versión do servidor'
BEGIN
SELECT version() as Version;
SELECT current_date as Data;
END
$$
