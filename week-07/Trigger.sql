--Trigger means: When a specific event happens, the trigger will automatically execute the code that we have defined.

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


--VArtual table
--When we create a trigger, MySQL creates two virtual tables named NEW and OLD.
CREATE Table backup_log(
    backuup_std_id INT PRIMARY KEY ,
    backup_std_name VARCHAR(255),

)

--Create Trigger Syntax:
DELIMITER $$

CREATE TRIGGER trigger_name
BEFORE/AFTER  INSERT/UPDATE/DELETE
ON table_name
FOR EACH ROW
BEGIN
    -- SQL logic
END $$

DELIMITER ;

--DELETE
--q1. Delete a record from the student table where std_id = 2
DELIMITER $$
CREATE TRIGGER t1
AFTER DELETE ON student
FOR EACH ROW
BEGIN
    INSERT INTO backup_log VALUES (OLD.std_id,OLD.std_name);
END $$
DELIMITER ;

DELETE FROM student WHERE std_id = 2;

--now we can see the deleted record in the backup_log table
SELECT * FROM backup_log;

--bacup_log table
--std_id  backup_std_name
--2       Akash


--insert
--q2. Insert a record into the student table and see the effect in the backup_log table
DELIMITER $$
CREATE TRIGGER t2
AFTER INSERT ON student
FOR EACH ROW
BEGIN
    INSERT INTO backup_log VALUES (NEW.std_id,NEW.std_name);
END $$

DELIMITER ;

INSERT INTO student VALUES (5,'Rafi','CSE',3.80);

--now we can see the inserted record in the backup_log table
SELECT * FROM backup_log;

--backup_log table
--std_id  backup_std_name
--2       Akash
--5       Rafi

--update
--q3. Update a record in the student table and see the effect in the backup_log
--CREATE TABLE update_cpa

CREATE TABLE update_cgpa_log (
    std_id INT PRIMARY KEY,
    old_cgpa DECIMAL(3,2),
    new_cgpa DECIMAL(3,2)
);

--TRIGGER
DELIMITER $$
CREATE TRIGGER t3
AFTER UPDATE ON student
FOR EACH ROW
BEGIN
    INSERT INTO update_cgpa_log VALUES (OLD.std_id, OLD.cgpa, NEW.cgpa);
END $$
DELIMITER ;

UPDATE student SET cgpa = 3.90 WHERE std_id = 1;
--now we can see the updated record in the update_cgpa_log table
SELECT * FROM update_cgpa_log;
--update_cgpa_log table
--std_id  old_cgpa  new_cgpa
--1       3.85      3.90


--NOte:
--buthere is problem face when we update the record again like update std_name or department then the trigger will execute 
--and insert the record into the update_cgpa_log table but we only want to insert the record when we update the cgpa column.
-- To solve this problem we can use IF statement in the trigger.

--solve use IF statement
DELIMITER $$
CREATE TRIGGER t4
AFTER UPDATE ON student
FOR EACH ROW
BEGIN
    IF OLD.cgpa <> NEW.cgpa THEN--<> means not equal to
        INSERT INTO update_cgpa_log VALUES (OLD.std_id, OLD.cgpa, NEW.cgpa);
    END IF;
END $$
DELIMITER ;

UPDATE student SET std_name = 'Emon Hossain' WHERE std_id = 1;
--now we can see that the record is not inserted into the update_cgpa_log table because we only update the std_name column
SELECT * FROM update_cgpa_log;
--update_cgpa_log table
--std_id  old_cgpa  new_cgpa
--1       3.85      3.90




--------------------------------------------------------END OF TRIGGER--------------------------------------------------------