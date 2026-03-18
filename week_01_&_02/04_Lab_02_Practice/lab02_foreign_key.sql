CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50),
    dept VARCHAR(10)
);

ALTER TABLE Faculty
ADD FOREIGN KEY (dept)
REFERENCES Department(dep_initial);
