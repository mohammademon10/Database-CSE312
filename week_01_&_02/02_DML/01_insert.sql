--DML means Data Manipulation Language
--This script inserts sample data into the 'Department' and 'Student' tables in the 'university' database.
--data


--inserting data into Department table
INSERT INTO Department (dep_initial, dep_name)
VALUES 
('CSE', 'Computer Science'),
('ECE', 'Electronics and Communication'),
('MECH', 'Mechanical Engineering');



--inserting data into Student table
INSERT INTO Student(std_id, std_name, cgpa, dep_initial)
VALUES 
(1, 'EMON', 3.22, 'CSE'),
(2, 'RAHIM', 3.50, 'ECE');