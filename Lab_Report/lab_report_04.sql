--Q1.Design a Trigger named “grade_change_log” that mainly occurs when you are 
-- updating a grade of a student. For instance if a student’s grade is changing from 
-- “C” to “A” a trigger will save the data of the student's previous grade and new 
-- grade alongside the student’s id in the updated_grade table as a log. Assume 
-- that the updated_grade table and student_grade table is already created. 
-- student_grade: { std_id,  course_id, grade} 
-- updated_grade : { std_id,  course_id, previous_grade, new_grade}           
-- NB: If there is no change in grade your trigger should not work.   
 
 --Create the student_grade table
CREATE TABLE student_grade (
    std_id INT,
    course_id INT,
    grade CHAR(1),
    PRIMARY KEY (std_id, course_id)
);

--Create the updated_grade table
CREATE TABLE updated_grade (
    std_id INT,
    course_id INT,
    previous_grade CHAR(1),
    new_grade CHAR(1)
);

--Create the trigger
DELIMITER $$
CREATE TRIGGER grade_change_log
AFTER UPDATE ON student_grade
FOR EACH ROW
BEGIN
    IF NEW.grade <> OLD.grade THEN
        INSERT INTO updated_grade (std_id, course_id, previous_grade, new_grade)
        VALUES (OLD.std_id, OLD.course_id, OLD.grade, NEW.grade);
    END IF;
END$$   
DELIMITER ;


--Q2.Create  a  stored  procedure  named  All_students_CGPA() 
--to calculate the CGPA of all the students from the 
--Student_grade table. Output Format : std_id, CGPA.  
--CGPA_formula :   ∑(𝑔𝑝𝑎*𝑐𝑟𝑒𝑑𝑖𝑡)/  ∑(𝑐𝑟𝑒𝑑𝑖𝑡)
--Student_grade : {std_id, course_id, c_credit, grade}

--Create the Student_grade table
CREATE TABLE Student_grade (
    std_id INT,
    course_id INT,
    c_credit INT,
    grade DECIMAL(3,2),
    PRIMARY KEY (std_id, course_id)
);

--Create the stored procedure
DELIMITER $$
CREATE PROCEDURE All_students_CGPA()
BEGIN
    SELECT std_id, 
           SUM(grade *c_credit) / SUM(c_credit) AS CGPA
    FROM Student_grade
    GROUP BY std_id;
END$$

DELIMITER ;

Q3.Create  a  SQL  view  named  Avg_Result  that  displays  the  average  CGPA  of 
--students for each department using the given schema. In the Output it will display

-- dept_id || dept_name || avg(cgpa) 
 
--Department : { dept_id (PK), dept_name } 
--Students : { student_id (PK), student_name, dept_id (FK), Cgpa }

--Create the Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255)
);

--Create the Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255),
    dept_id INT,
    Cgpa DECIMAL(3,2),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

--Create the view
CREATE VIEW Avg_Result AS
SELECT d.dept_id, d.dept_name, AVG(s.Cgpa) AS avg_cgpa
FROM Department d
JOIN Students s ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name;

