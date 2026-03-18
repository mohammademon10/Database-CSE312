CREATE TABLE Department (
    dep_initial VARCHAR(10) PRIMARY KEY,
    dep_name VARCHAR(50)
);

CREATE TABLE Student (
    std_id INT,
    std_name VARCHAR(50),
    cgpa DECIMAL(3,2),
    dept VARCHAR(10)
);

 