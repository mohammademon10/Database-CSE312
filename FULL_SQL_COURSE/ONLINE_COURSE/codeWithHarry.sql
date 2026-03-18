
------------------------------------------------------------
--Topic: Creating and Deleting a Database and Table 
------------------------------------------------------------

--step 1:CREATE DATABASE statement

CREATE DATABASE  startersql1;

--step 2:USE statement
USE startersql1;

--step 3: CREATE TABLE statement
CREATE TABLE users (
    id int AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP --when the record is created
);

 --to see the empty table
select * from users;

--output:
--id    name email  gender  date_of_birth    created_at
--null  null null   null        null           null

--specific seens of the empty table
select id, name  from users;
--output:
--id    name
--null  null


--step 4: DROP TABLE statement
--to delete the table
DROP TABLE users;


--step 5: DROP DATABASE statementp
--to delete the database
DROP DATABASE startersql1;

-----------------------------------------------------------
--Topic:Ranaming a table
----------------------------------------------------------

--step 1: CREATE DATABASE statement
CREATE DATABASE renametestdb;

--step 2:USE statement
USE renametestdb;

--step 3: CREATE TABLE statement
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    position VARCHAR(50)
);

--step 4: RENAME TABLE statement
RENAME TABLE employees TO staff;

--to see the renamed table
SHOW TABLES;

--output:
--Tables_in_renametestdb
--staff

--To Rename is back to the original name
RENAME TABLE staff TO employees;

--to see the renamed table
SHOW TABLES;

--output:
--Tables_in_renametestdb
--employees


------------------------------------------------------------
--Topic:Altering a table to add, modify, or delete columns
------------------------------------------------------------
CREATE DATABASE  alterdb;
USE alterdb;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
    color VARCHAR(50)
);


-- Adding a new column 'stock_quantity'
ALTER TABLE products
ADD COLUMN stock_quantity INT DEFAULT 0;

-- Modifying the 'price' column to increase its size
ALTER TABLE products
MODIFY COLUMN price DECIMAL(12,2);
--modyfying column data type and size
ALTER TABLE products
MODIFY COLUMN product_name VARCHAR(150);

--move the column position
ALTER TABLE products
MODIFY COLUMN color VARCHAR(50) AFTER product_id;


--move the column to first position
ALTER TABLE products
MODIFY COLUMN stock_quantity INT FIRST;

--

-- Deleting the 'stock_quantity' column
ALTER TABLE products 
DROP COLUMN stock_quantity;



----------------------------------------------------------------
--Topic: Inserting data into a table
----------------------------------------------------------------
CREATE DATABASE  insertdb;
USE insertdb;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    contact_email VARCHAR(100)
);

-- Inserting a single record
INSERT INTO customers (customer_id, customer_name, contact_email)
VALUES (181, 'Emon', 'emon@');

--INSERT INTO customers VALUES (120, 'Karim', 'karim@');//another way of inserting data without specifying column names

-- Inserting multiple records
INSERT INTO customers (customer_id, customer_name, contact_email) VALUES 
(182, 'Alice', 'Alice@'),
(183, 'Bob', 'Bob@'),
(184, 'Charlie', 'Charlie@');

-- Viewing the inserted records
SELECT * FROM customers;

--output:
--customer_id  customer_name  contact_email
--181          Emon           emon@
--182          Alice         Alice@
--183          Bob           Bob@
--184          Charlie       Charlie@



------------------------------------------------------------
--Topic: forigen key, update and delete operations
------------------------------------------------------------
--Creating Department and Faculty tables.
CREATE database university;
USE university;

CREATE TABLE Department (
    dep_initial VARCHAR(10) PRIMARY KEY,
    dep_name VARCHAR(50)
);
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50),
    dept VARCHAR(10)
);


-- Adding Foreign Key using ALTER TABLE.
ALTER TABLE Faculty 
ADD FOREIGN KEY (dept)
REFERENCES Department(dep_initial);


-- Inserting 3 faculty records.
INSERT INTO Faculty (faculty_id, faculty_name, dept) VALUES
(1, 'Dr. Smith', 'CSE'),
(2, 'Prof. Johnson', 'ECE'),
(3, 'Dr. Lee', 'MECH');


-- Update CGPA of a student.
UPDATE Student
SET cgpa = 3.75
WHERE std_id = 2;


-- Delete a faculty by ID.
DELETE FROM Faculty
WHERE faculty_id = 3;
-- Note: Ensure that the Department and Student tables exist and have relevant data before running this script.



--------------------------------------------------------------
--Topic: Quiring data from a table
--------------------------------------------------------------
--after 1.11 minutes after






