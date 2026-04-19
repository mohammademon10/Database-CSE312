-- Subquery or nested query is a query inside another query.
-- It is used to perform operations that require multiple steps or to retrieve data based on the results
-- of another query. Subqueries can be used in various clauses of a SQL statement, such as SELECT, WHERE, and FROM.


--step:01 create  a databse as a same name which is you imported in MySQL workbench
CREATE DATABASE  nation;
USE nation;

--step:02 now perform the following queries on the country table of nation database

--1.Show me the dtails of thous countries which grater than average area.
SELECT * FROM countries
WHERE area > (SELECT AVG(area) FROM countries);

--2. centreal  Africa Which continents belonga show the name.
SELECT name FROM continents
WHERE continents_id = (SELECT continents_id FROM regions WHERE name = 'Central Africa');


--3. show all region details who belongs to africa continents.
SELECT * FROM regions
WHERE continents_id = (SELECT continents_id FROM continents WHERE name = 'Africa');

--4. show all region details who belongs to africa and Asia continents.
SELECT * FROM regions
WHERE continents_id IN (SELECT continents_id FROM continents WHERE name= 'Africa' OR name = 'Asia');

--OR

SELECT * FROM regions
WHERE continents_id IN (SELECT continents_id FROM continents WHERE name IN ('Africa', 'Asia'));

--5. Afganistan which continent belongs to show the name./Find The continent name of the country Afghanistan.
SELECT name FROM continents
WHERE continent_id = (SELECT continent_id FROM regions WHERE region_id = (SELECT region_id FROM countries WHERE name = 'Afghanistan'));

--6 In ASia Largst Counrty information .
SELECT *FROM countries
WHERE region_id IN (SELECT region_id FROM regions WHERE continent_id = (SELECT continent_id FROM continents WHERE name = 'Asia'))
ORDER BY area DESC
LIMIT 1;

--7. In ASia Smallest Counrty information .
SELECT *FROM countries
WHERE region_id IN (SELECT region_id FROM regions WHERE continent_id = (SELECT continent_id FROM continents WHERE name = 'Asia'))
ORDER BY area ASC
LIMIT 1;

--8. condition: asia continent and region Middle East show the  largest country name .
SELECT* FROM countries
WHERE region_id IN (SELECT region_id FROM regions WHERE continent_id = (SELECT continent_id FROM continents WHERE name = 'Asia') AND name = 'Middle East');
ORDER BY area DESC
LIMIT 1;

--9.Show the average area of the regions in Asia continent.
SELECT region_id, AVG(area) AS avg_area FROM countries
WHERE region_id IN (SELECT region_id FROM regions WHERE continent_id = (SELECT continent_id FROM continents WHERE name = 'Asia'))
GROUP BY region_id;

--10.countries table, show the details of those countries whose area is greater than the average area of the regions in Asia continent. 
--When use aggregate function(like avg(), sum(), count() etc) use subquery to get the result.
SELECT *FROM countries
WHERE area > (SELECT AVG(area) FROM countries)

--If we wanr to use GROUP BY then use condition do not use  WHERE clause, use HAVING clause to get the result.
--Stntax
--SELECT column1, column2, aggregate_function(column3)
--FROM table_name
--GROUP BY column1, column2
--HAVING condition;

SELECT region_id, count(*) AS Numbers FROM countries
WHERE region_id NOT IN(1)
GROUP BY region_id
HAVING Numbers> 10;
ORDER BY Numbers DESC
LIMIT 1;

-----------------------------------------------------------END OF SUBQUERY-----------------------------------------------------------


