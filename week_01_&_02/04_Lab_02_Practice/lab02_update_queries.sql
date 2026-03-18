--1. Create Department and Faculty tables.
--2. Add Foreign Key using ALTER TABLE.
--3. Insert 3 faculty records.
--4. Update CGPA of a student.
--5. Delete a faculty by ID.


-- 1. Create Department and Faculty tables.
CREATE TABLE Department (
    dep_initial VARCHAR(10) PRIMARY KEY,
    dep_name VARCHAR(50)
);
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50),
    dept VARCHAR(10)
);

-- 2. Add Foreign Key using ALTER TABLE.
ALTER TABLE Faculty
ADD FOREIGN KEY (dept)
REFERENCES Department(dep_initial);

-- 3. Insert 3 faculty records.
INSERT INTO Faculty (faculty_id, faculty_name, dept) VALUES
(1, 'Dr. Smith', 'CSE'),
(2, 'Prof. Johnson', 'ECE'),
(3, 'Dr. Lee', 'MECH');
-- 4. Update CGPA of a student.
UPDATE Student
SET cgpa = 3.75
WHERE std_id = 2;

-- 5. Delete a faculty by ID.
DELETE FROM Faculty
WHERE faculty_id = 3;
-- Note: Ensure that the Department and Student tables exist and have relevant data before running this script.
