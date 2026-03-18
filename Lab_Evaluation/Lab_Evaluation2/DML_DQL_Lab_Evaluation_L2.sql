-- Lab Test - 2 
-- Database Management System Lab 
 
-- Import the national.sql database (which is provided) into your system and perform the following 
-- tasks. Create a notepad named id.txt (id = your ID) and write down the SQL queries there.  
 
 
-- 1.  Insert a new region named “South America” in the region table.  
 
-- 2.  Update the name of the region named “America” to “North America.” 
 
-- 3.  In  the  nation  table,  insert  a  new  entry  named  “Brazil,l  ”which  is  situated  in  “South 
-- America,”  with a population of 213.5 million.   
 
-- 4.  Delete all the data from the orders table which is more than average order amount.  
 
-- 5.  Display all nations who belongs to same region as “Bangladesh” 
 
-- 6.  Show  the  name  of  the  nation  that  belongs  to  the  region  named  ‘Europe’  using  a 
-- subquery.  
 
-- 7.  Show  all  the  data  of  those  countries  which  have  higher  populations  than the average 
-- population but lower than  213.5 million. 
 
-- 8.  Find the total number of countries in every region in this database and present them in 
-- descending order. 
   
 
 
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

-- 4. Delete all the data from the orders table which is more than average order amount.
DELETE FROM orders
WHERE order_amount > (SELECT AVG(order_amount) FROM orders);


-- 5. Display all nations who belongs to same region as “Bangladesh”
SELECT name FROM nation
WHERE region_id = (SELECT region_id FROM nation WHERE name = 'Bangladesh');

-- 6. Show the name of the nation that belongs to the region named ‘Europe’ using a subquery.
SELECT name FROM nation
WHERE region_id = (SELECT region_id FROM region WHERE name = 'Europe');

-- 7. Show all the data of those countries which have higher populations than the average population but lower than 213.5 million.
SELECT * FROM nation
WHERE population > (SELECT AVG(population) FROM nation)
AND population < 213500000;

-- 8. Find the total number of countries in every region in this database and present them in descending order.
SELECT region_id, COUNT(*) FROM nation
GROUP BY region_id
ORDER BY COUNT(*) DESC;