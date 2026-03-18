--ADD
ALTER TABLE Student
ADD email VARCHAR(50);

--CHANGE
ALTER TABLE Student
CHANGE dept department VARCHAR(10);

--MODIFY
ALTER TABLE Student
MODIFY cgpa DECIMAL(4,2);

--DROP
ALTER TABLE Student
DROP COLUMN email;

--RENAME
ALTER TABLE Student
RENAME std_id TO student_id;

--rename table
ALTER TABLE Student
RENAME TO Students;


