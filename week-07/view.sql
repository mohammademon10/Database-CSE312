--View: 

-- 🔹 What is a View?

-- 👉 View = a virtual table (saved SELECT query)

-- That means:

-- It is not a real table
-- It is a saved SELECT query

-- 📌 Think:

-- “Shortcut table”


-- 🔹 Why use Views?
-- 👉 To simplify complex queries
-- 👉 To enhance security (restrict access to specific data)

--CreateTable
CREATE TABLE student (
    std_id INT PRIMARY KEY ,
    std_name VARCHAR(255),
    department VARCHAR(255),
    cgpa DECIMAL(3,2)
);

--insert data
INSERT INTO student VALUES (1,'Emon','CSE',3.85);
INSERT INTO student VALUES (2,'Akash','CSE',3.75);
INSERT INTO student VALUES (3,'Sabbir','CSE',3.65);
INSERT INTO student VALUES (4,'Sanjida','CSE',3.95);

--Create View Syntax:
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;

--1. Create a view to fetch all students with CGPA greater than 3.80
CREATE VIEW high_cgpa_students AS
SELECT std_id, std_name, department, cgpa
FROM student
WHERE cgpa > 3.80;

--2. Create a view to fetch all students from the CSE department
CREATE VIEW cse_students AS
SELECT std_id, std_name, department, cgpa
FROM student
WHERE department = 'CSE';

--3. Create a view to fetch the names of all students
CREATE VIEW student_names AS
SELECT std_name
FROM student;
--4. Create a view to fetch the average CGPA of all students
CREATE VIEW average_cgpa AS
SELECT AVG(cgpa) AS avg_cgpa
FROM student;
--5. Create a view to fetch the count of students in each department
CREATE VIEW department_counts AS
SELECT department, COUNT(*) AS student_count
FROM student
GROUP BY department;

--To query a view, you can use the following syntax:

SELECT * FROM high_cgpa_students;
SELECT * FROM cse_students;
SELECT * FROM student_names;
SELECT * FROM average_cgpa;
SELECT * FROM department_counts;

--CASE Statement in View
--1. Create a view to categorize students based on their CGPA

CREATE VIEW v1 AS
SELECT std_id, std_name, department, cgpa,
CASE 
    WHEN cgpa >= 3.90 THEN 'Excellent'
    WHEN cgpa >= 3.70 THEN 'Good'
    ELSE 'Average'
END CASE AS performance
FROM student;

SELECT * FROM v1;

--2. TAble
--std_id  std_name    department  cgpa    performance
--1       Emon        CSE         3.85    Good
--2       Akash       CSE         3.75    Good
--3       Sabbir      CSE         3.65    Average
--4       Sanjida     CSE         3.95    Excellent
--5       Sabbir      CSE         3.65    Average


--3. Create a view to categorize students based on their department    
CREATE VIEW v2 AS
SELECT std_id, std_name, department, cgpa,
CASE 
    WHEN department = 'CSE' THEN 'Computer Science'
    WHEN department = 'EEE' THEN 'Electrical Engineering'
    ELSE 'Other'
END CASE AS department_category
FROM student;

SELECT * FROM v2;

--std_id  std_name    department  cgpa    department_category
--1       Emon        CSE         3.85    Computer Science
--2       Akash       CSE         3.75    Computer Science
--3       Sabbir      CSE         3.65    Computer Science
--4       Sanjida     CSE         3.95    Computer Science
--5       Sabbir      CSE         3.65    Computer Science




----------------------------------------------------End of View----------------------------------------------------