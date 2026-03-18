ALTER TABLE Student
ADD FOREIGN KEY (dep)
REFERENCES Department(dep_initial);
