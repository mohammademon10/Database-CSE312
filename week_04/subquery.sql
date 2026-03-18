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
WHERE continents_id IN (SELECT continents_id FROM continents WHERE name IN ('Africa', 'Asia'));