SELECT * FROM student;
---output:
---std_id  std_name  cgpa  dep_initial
---1       EMON      3.22  CSE
---2       RAHIM     3.50  NULL


--- Delete the student with std_id = 2 from the Student table
DELETE FROM Student
WHERE std_id = 2;

-- Verify the deletion by selecting all records from the Student table
SELECT * FROM Student;
--output:
--std_id  std_name  cgpa  dep_initial
--1       EMON      3.22  CSE




