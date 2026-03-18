-- 1. Create a database named "Library" and create the following tables given below 
-- 2. Librarian { lib_id (pk), lib_name, shift, branch_id (fk) } 
-- 3. Member  {  m_id  (pk),  m_name,  membership_type(Student,  Teacher,Admin), 
--    branch_id (fk), assigned_librarian (fk) } 
-- 4. Branch { branch_id (pk), location (Rajshai, Dhaka, Khulna) }
-- 5. Modify the table name of Branch to Uni_Branch.
-- NB: Add the necessary primary key and foreign key to every table's field, which will have
-- a constraint of 'Not Null.


-- 1. Create database and use it
CREATE DATABASE Library;
USE Library;

-- Create Branch table
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY NOT NULL,
    location ENUM('Rajshai', 'Dhaka', 'Khulna') NOT NULL
);
-- Create Librarian table
CREATE TABLE Librarian (
    lib_id INT PRIMARY KEY NOT NULL,
    lib_name VARCHAR(100) NOT NULL,
    shift VARCHAR(50) NOT NULL,
    branch_id INT NOT NULL,

    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Create Member table
CREATE TABLE Member (
    m_id INT PRIMARY KEY NOT NULL,
    m_name VARCHAR(100) NOT NULL,
    membership_type ENUM('Student', 'Teacher', 'Admin') NOT NULL,
    branch_id INT NOT NULL,
    assigned_librarian INT NOT NULL,

    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
    FOREIGN KEY (assigned_librarian) REFERENCES Librarian(lib_id)
);

-- Modify the table name of Branch to Uni_Branch
ALTER TABLE Branch RENAME TO Uni_Branch;

SELECT * FROM Uni_Branch;
SELECT * FROM Librarian;
SELECT * FROM Member;

-------------------------------------------------------------------------------------------
--2nd way to create the same database and tables
-------------------------------------------------------------------------------------------

-- 1. Create database and use it
CREATE DATABASE Library;
USE Library;

-- Create Librarian table
CREATE TABLE Librarian (
    lib_id INT PRIMARY KEY NOT NULL,
    lib_name VARCHAR(100) NOT NULL,
    shift VARCHAR(50) NOT NULL,
    branch_id INT NOT NULL

);
-- Create Member table
CREATE TABLE Member (
    m_id INT PRIMARY KEY NOT NULL,
    m_name VARCHAR(100) NOT NULL,
    membership_type ENUM('Student', 'Teacher', 'Admin') NOT NULL,
    branch_id INT NOT NULL,
    assigned_librarian INT NOT NULL

);

-- Create Branch table
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY NOT NULL,
    location ENUM('Rajshai', 'Dhaka', 'Khulna') NOT NULL
);
--ADD foreign key
ALTER TABLE Librarian
ADD FOREIGN KEY (branch_id) REFERENCES Branch(branch_id);

ALTER TABLE Member
ADD FOREIGN KEY (branch_id) REFERENCES Branch(branch_id);
ADD FOREIGN KEY (assigned_librarian) REFERENCES Librarian(lib_id);

-- Modify the table name of Branch to Uni_Branch
ALTER TABLE Branch RENAME TO Uni_Branch;

SELECT * FROM Uni_Branch;
SELECT * FROM Librarian;
SELECT * FROM Member;

-------------------------------------------------------------------------------------------
