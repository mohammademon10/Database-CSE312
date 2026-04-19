--function basic Syntax:
DELIMITER $$
CREATE FUNCTION function_name (parameters)
RETURNS return_data_type
BEGIN
    -- function body
    RETURN value;
END $$
DELIMITER ;

SELECT function_name(arguments) AS result;

--1. Multiply two numbers using a function

DELIMITER $$

CREATE FUNCTION MULTIPLY(a INT, b INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a * b;
END $$

DELIMITER ;

SELECT MULTIPLY(5, 10) AS result;



-- 1. SUM Function
SELECT SUM(population) FROM nation;
-- 2. AVG Function
SELECT AVG(population) FROM nation;
-- 3. MAX / MIN
SELECT MAX(population) FROM nation;
SELECT MIN(population) FROM nation;
-- 4. COUNT
SELECT COUNT(*) FROM nation;

