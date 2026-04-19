-- DQL means Data Query Language. 
--It is used to query the database and retrieve data from one or more tables.
-----------------------------------------------------------------------------
--step:01 create  a databse as a same name which is you imported in MySQL workbench
CREATE DATABASE  nation;
USE nation;

--step:02 now perform the following queries on the country table of nation database

--1. SELECT statement For Sereching
--SELECT column1, column2, ... FROM table_name
--WHERE condition;

--show the country_id, name and area of all the countries.
SELECT Country_id, name , area FROM countries;

--2. SELECT statement For Searching All
--SELECT * FROM table_name
--WHERE condition;
SELECT * FROM countries
WHERE name = 'Bangladesh';

SELECT * FROM countries
WHERE area > 50000;

--AND operator-( all conditions must be true)
--show the details of those countries which is greater than 50000 and less than 100000.
SELECT * FROM countries
WHERE area > 50000 AND area < 100000;

--BETWEEN operator( two values and range)
--show the details of those countries which is greater than 50000 and less than 100000.
SELECT * FROM countries
WHERE  area BETWEEN 50000 AND 100000;

--NOT BETWEEN operator(Should not be in the range)
--show the details of those countries which is not greater than 50000 and less than 100000.
SELECT * FROM countries
WHERE  area NOT BETWEEN 50000 AND 100000;

--OR operator(Any one condition is true)
SELECT * FROM countries
WHERE name ='Afghanistan' OR name = 'Argentina' OR name='Austalia';

--IN operator(multiple values)
SELECT * FROM countries
WHERE name IN ('Afghanistan', 'Argentina', 'Austalia');

--NOT IN operator(Should not be in the list)
SELECT * FROM countries
WHERE name NOT IN ('Afghanistan', 'Argentina', 'Austalia');

--3.Sorting the result
--ORDER BY column_name ASC|DESC
SELECT * FROM countries
ORDER BY area ASC;

SELECT * FROM countries
ORDER BY area DESC;

--show the details of those countries which is greater than 50000 and less than 100000 in descending order of area.
SELECT * FROM countries
WHERE area BETWEEN 50000 AND 100000
ORDER BY area DESC;

--show the details of those countries which is greater than 50000 and less than 100000 in descending order of area and show only highest area country.
SELECT * FROM countries
WHERE area BETWEEN 50000 AND 100000
ORDER BY area DESC
LIMIT 1;

--Find out the details of the country with highest area.
SELECT * FROM countries
ORDER BY area DESC
LIMIT 1;

--4. Aggregate functions
--SUM() function
SELECT SUM(area) FROM countries;
---OUTPUT: 3287263

SELECT SUM(area) AS total_area FROM countries
--output: total_area 3287263

--AVG() function
SELECT AVG(area) AS average_area FROM countries;
--output: average_area 109575.4333333333

--count() function
--count number of rows
SELECT COUNT(*) AS total_row FROM countries;

--count number of non-null values in a column
SELECT COUNT(name) AS total_name FROM countries;

--max() function
SELECT MAX(area) AS max_area FROM countries;

--min() function
SELECT MIN(area) AS min_area FROM countries;

--5. Grouping the result
--GROUP BY column_name
--show the total  countries by continent
SELECT region_id, COUNT(*) FROM countries
GROUP BY region_id;

--Region wise country avrage area
SELECT region_id, AVG(area)  FROM countries
GROUP BY region_id;

--6. Filtering grouped result
--HAVING condition
--Which country count is greater than 10 in each region
SELECT region_id, COUNT(*)  FROM countries
GROUP BY region_id
HAVING COUNT(*) > 10;

--which regin id 4(do not show region id 4) country count is greater than 10 in each region
SELECT region_id, COUNT(*)  FROM countries   
GROUP BY region_id
HAVING COUNT(*) > 10 AND region_id != 4;

 --Another way to write the above query
SELECT region_id, COUNT(*)  FROM countries
WHERE region_id != 4 --(WHERE region_id  NOT IN (4))
GROUP BY region_id
HAVING COUNT(*) > 10;

--sorted result of the above query
SELECT region_id, COUNT(*)  FROM countries
GROUP BY region_id
HAVING COUNT(*) > 10 AND region_id != 4
ORDER BY COUNT(*) DESC;

--highest country count of the above query
SELECT region_id, COUNT(*) FROM countries
GROUP BY region_id
HAVING COUNT(*) > 10 AND region_id != 4
ORDER BY COUNT(*) DESC
LIMIT 1;

--Data skip use OFFSET
SELECT *FROM countries
ORDER BY area 
LIMIT 5 OFFSETS 5; --(LIMIT 5,5) means skip first 5 rows and show next 5 rows

--LIKE operator
--% means any sequence of characters
--_ means any single character
SELECT * FROM countries
WHERE name LIKE 'm%'; --(name starts with m)

SELECT * FROM countries
WHERE name LIKE '%o'; --(name ends with o)

SELECT * FROM countries
WHERE name LIKE 'm%o'; --(name starts with m and ends with o and any sequence of characters in between)

SELECT * FROM countries
WHERE name LIKE 'm-o'; --(name has m as first character and o last character and any single character in between)
SELECT * FROM countries
WHERE name LIKE '%an%'; --(name contains an)

SELECT * FROM countries
WHERE name LIKE '_a%'; --(name has a as second character and any sequence of characters after that)

SELECT * FROM countries
WHERE name LIKE 'A_a%'; --(name starts with A and has a as third character and any sequence of characters after that)

