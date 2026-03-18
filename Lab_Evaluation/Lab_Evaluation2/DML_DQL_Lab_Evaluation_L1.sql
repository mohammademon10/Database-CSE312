-- Lab Report Task- 2 
-- Database Management System Lab 
 
-- Import the national.sql database (which is provided) into your system and perform the following 
-- tasks.  
 
-- 1.  Insert a new region named “South America” in the region table.  
 
-- 2.  Update the name of the region named “America” to “North America.” 
 
-- 3.  In  the  nation  table,  insert  a  new  entry  named  “Brazil,l  ”which  is  situated  in  “South 
-- America,”  with a population of 213.5 million.  (You will get a bonus mark if you can use 
-- a sub-query for inserting data.) 
 
-- 4.  Delete all the data from the orders table consisting amount between 300 and 780 
   
 
-- 5.  Display all nations whose region id is the same as Germany's region. 
 
-- 6.  Show the name of the nation that belongs to the region named 'Asia' using a subquery.  
 
-- 7.  Show  all  the  data  of  those  countries  which  has  higher  population  than  the  average 
-- population. 
 
-- 8.  Find the total number of countries in every region in this database.  
   
 
 
--DML and DQL Queries:
-- 1. Insert a new region named “South America” in the region table.
INSERT INTO region (name) VALUES ('South America');

-- 2. Update the name of the region named “America” to “North America.”
UPDATE region
SET name = 'North America'
WHERE name = 'America';

-- 3. In the nation table, insert a new entry named “Brazil,” which is situated in “South America,” with a population of 213.5 million.
INSERT INTO nation (name, region_id, population)
VALUES ('Brazil', (SELECT region_id FROM region WHERE name = 'South America'), 213500000);

-- 4. Delete all the data from the orders table consisting amount between 300 and 780
DELETE FROM orders
WHERE order_amount BETWEEN 300 AND 780;

-- 5. Display all nations whose region id is the same as Germany's region.
SELECT name FROM nation
WHERE region_id = (SELECT region_id FROM nation WHERE name = 'Germany');

-- 6. Show the name of the nation that belongs to the region named 'Asia' using a subquery.
SELECT name FROM nation
WHERE region_id = (SELECT region_id FROM region WHERE name = 'Asia');

-- 7. Show all the data of those countries which has higher population than the average population.
SELECT * FROM nation
WHERE population > (SELECT AVG(population) FROM nation);

-- 8. Find the total number of countries in every region in this database.
SELECT region_id, COUNT(*) 
FROM nation
GROUP BY region_id
ORDER BY COUNT(*) DESC;
