--QUERY SHORT-PROCEDURE USE

--1. Create a procedure that fetches all data from the region table and call it.
-- To create a procedure in MySQL, you can use the following syntax:
DELIMITER $$
CREATE PROCEDURE procedure_name()
BEGIN
     -- SQL statements go here
 END $$
DELIMITER ;

--1. Fetch All Data (region table)
DELIMITER $$

CREATE PROCEDURE fetching_alldata()
BEGIN
    SELECT * FROM region;
END $$

DELIMITER ;

CALL fetching_alldata();

--2. Fetch All Data (nation table)
DELIMITER $$

CREATE PROCEDURE fetching_alldata2()
BEGIN
    SELECT * FROM nation;
END $$  

DELIMITER ;

CALL fetching_alldata2();




--3. Insert Data into nation table
-- To insert data into a table using a stored procedure, you can use the following syntax:
-- DELIMITER $$
-- CREATE PROCEDURE procedure_name()
-- BEGIN
--     INSERT INTO table_name (column1, column2, ...)
--     VALUES (value1, value2, ...);
-- END $$
-- DELIMITER ;
DELIMITER $$

CREATE PROCEDURE  fetching_alldata_nationTable()
BEGIN
 INSERT INTO nation VALUES (1,'Brazil',4,1200000);
  SELECT * FROM nation ;
END $$  

DELIMITER ;

CALL fetching_alldata_nationTable()

--4. Insert into region with parameters

DELIMITER $$

CREATE PROCEDURE insert_region(
    IN region_id INT, 
    IN name VARCHAR(255)
)
BEGIN
    INSERT INTO region VALUES (region_id, name);
    SELECT * FROM region;
END $$  

DELIMITER ;

CALL insert_region(5, 'Oceania');
CALL insert_region(6, 'Antarctica');



--5. Population Range Query
--population show in 70000000 between 170000000
DELIMITER $$

CREATE PROCEDURE fetching_population()
BEGIN
    SELECT * 
    FROM nation 
    WHERE population BETWEEN 70000000 AND 170000000;
END $$

DELIMITER ;

CALL fetching_population();

--6.Count total regions (OUT parameter)
DELIMITER $$
CREATE PROCEDURE  counting_region(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM region;
END $$  
DELIMITER ;

-- Store
CALL counting_region(@total);

--Show the result
SELECT @total AS total_regions;


--7. Count nation + insert region 
DELIMITER $$

CREATE PROCEDURE counting_nation(
    OUT total INT, 
    IN region_id INT, 
    IN name VARCHAR(255)
)
BEGIN
    INSERT INTO region VALUES (region_id, name);

    SELECT COUNT(*) 
    INTO total 
    FROM nation;
END $$

DELIMITER ;

-- Store
CALL counting_nation(@total, 7, 'Africa');
--Show the result
SELECT @total AS total_nations;

--8. Largest Population by Region
--region Table:nation_id, name, region_id, population
--Procedure name :Region_Largest County("Asia ",@population)
--SELECT @population AS population;
DELIMITER $$

CREATE PROCEDURE Region_Largest_County(
    IN region_name VARCHAR(255), 
    OUT pop INT
)
BEGIN
    SELECT MAX(population) 
    INTO pop 
    FROM nation
    WHERE region_id = (
        SELECT region_id 
        FROM region 
        WHERE name = region_name
    );
END $$

DELIMITER ;

CALL Region_Largest_County('Asia', @population);
SELECT @population AS population;



------------------------------------------------------END OF STORED PROCEDURE------------------------------------------------------

