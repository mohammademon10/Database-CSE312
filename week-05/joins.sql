--Table
--customer(customer_id, nation_id)
--orders(order_id, customer_id, amount)
--nation(nation_id, name, region_id, population)
--region(region_id, name)

--Topic: joins: inner join, left join, right join, full outer join, cross join

--1. Inner Join: returns only the rows that have matching values in both tables.
--nation and region tables have a common column region_id, we can use an inner join 
--to retrieve the name of the nation along with the name of the region it belongs to.
SELECT nation.name, nation.population, region.name
FROM nation INNER JOIN region ON nation.region_id = region.region_id;
--output: name, population, name

--q1.After inner join highest population nation name and its region name
SELECT nation.name, nation.population, region.name
FROM nation INNER JOIN region ON nation.region_id = region.region_id
WHERE nation.population = (SELECT MAX(population) FROM nation);
--output: name, population, name

--or
SELECT nation.name, nation.population, region.name
FROM nation INNER JOIN region ON nation.region_id = region.region_id;
ORDER BY nation.population DESC
LIMIT 1;
--output: name, population, name

--q2.after inner join region name starts with 'A' 
SELECT nation.name, nation.population, region.name
FROM nation INNER JOIN region ON nation.region_id = region.region_id;
WHERE region.name LIKE 'a%';
--output: name, population, name

--end with a
Where region.name LIKE '%a';
--output: name, population, name

--start with a and end with a
Where region.name LIKE 'a%a';
--output: name, population, name

--group by region name and count the number of nations in each region
SELECT region.name, COUNT(nation.nation_id) 
FROM nation INNER JOIN region ON nation.region_id = region.region_id
GROUP BY region.name;
--output: name, count 

--2. Left Join: returns all rows from the left table and the matched rows from the right table. If there is no match, the result is NULL on the right side.
--nation and region tables have a common column region_id, we can use a left join
--to retrieve the name of the nation along with the name of the region it belongs to, including nations that do not belong to any region.
SELECT nation.name, nation.population, region.name
FROM nation 
 LEFT JOIN region ON nation.region_id = region.region_id;
 --here we are using left join, so we will get all the nations even if they do not belong to any region,
 -- in that case region name will be null.
--output: name, population, name
--        Bangladesh, 160000000, ASia
--        India, 1400000000, Asia
--        USA, 330000000, North America
--        France, 67000000, Europe
--        Germany, 83000000, Europe
--        Argentina, 45000000, Null
--        Canada, 38000000, Null

--3. Right Join: returns all rows from the right table and the matched rows from the left table.
--If there is no match, the result is NULL on the left side.
--nation and region tables have a common column region_id, we can use a right join
--to retrieve the name of the nation along with the name of the region it belongs to,
--including regions that do not have any nations.
SELECT nation.name, nation.population, region.name
FROM nation 
 RIGHT JOIN region ON nation.region_id = region.region_id;

--here we are using right join, so we will get all the regions even if they do not have any nations
-- in that case nation name and population will be null.
--output: name, population, name
--        Bangladesh, 160000000, ASia
--        India, 1400000000, Asia
--        USA, 330000000, North America
--        France, 67000000, Europe
--        Germany, 83000000, Europe
--        Null, Null, Africa

--4. Full Outer Join: returns all rows when there is a match in either left or right table.
--If there is no match, the result is NULL on the side that does not have a match.
--nation and region tables have a common column region_id, we can use a full outer join
--to retrieve the name of the nation along with the name of the region it belongs to,
--including nations that do not belong to any region and regions that do not have any nations.
SELECT nation.name, nation.population, region.name
FROM nation 
 FULL OUTER JOIN region ON nation.region_id = region.region_id;
--here we are using full outer join, so we will get all the nations and all the regions even if they do not have any match
-- in that case nation name and population will be null for regions that do not have any nations
-- and region name will be null for nations that do not belong to any region.
--output: name, population, name
--
--        Bangladesh, 160000000, ASia
--        India, 1400000000, Asia
--        USA, 330000000, North America
--        France, 67000000, Europe
--        Germany, 83000000, Europe
--        Argentina, 45000000, Null
--        Canada, 38000000, Null
--        Null, Null, Africa


--5. Cross Join: returns the Cartesian product of the two tables, i.e., it returns all possible combinations of rows from both tables.
--nation and region tables have a common column region_id, we can use a cross join
--to retrieve the name of the nation along with the name of the region it belongs to,
--including all possible combinations of nations and regions.
SELECT nation.name, nation.population, region.name
FROM nation 
 CROSS JOIN region;

--here we are using cross join, so we will get all the possible combinations of nations and regions
--output: name, population, name
--
--        Bangladesh, 160000000, ASia
--        Bangladesh, 160000000, North America
--        Bangladesh, 160000000, Europe
--        India, 1400000000, Asia




----------------------------------------------------End of Joins---------------------------------------------------



 