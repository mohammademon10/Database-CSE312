--1. Show the total number of students from CUET.

SELECT COUNT(*) AS Students_from_CUET FROM university
WHERE name = "CUET"


--2.2. Show the details of the oldest university.
SELECT * FROM university
ORDER BY established_year ASC
LIMIT 1


--3.Using JOIN, show the details of universities which have an ongoing Law department.(INNER JOIN   )
SELECT * FROM university u
JOIN department d
ON u.university_id = d.university_id
WHERE d.name="Law"

--4. Using Subquery, show details of faculty working in BUET, RUET, CUET in CSE department.
SELECT * FROM faculty
WHERE department_id = (SELECT department_id FROM department
WHERE name = "CSE" AND university_id = (SELECT university_id FROM
                        university WHERE name = "BUET" OR "RUET" or "CUET"))

--Alternative with subquery if separate university table exists
SELECT *
FROM faculty
WHERE department = 'CSE'
AND university_id IN (
    SELECT university_id
    FROM university
    WHERE university_name IN ('BUET', 'RUET', 'CUET')
);


-- 5. Determine if faculty members are underpaid or rightfully paid
-- 💡 Condition:
-- Professor < 110000 → underpaid
-- Associate Professor < 100000 → underpaid
-- Assistant Professor < 90000 → underpaid
-- Lecturer < 50000 → underpaid

SELECT faculty_id,name,designation,salary,
CASE
	WHEN designation = "Professor" AND salary < 110000 THEN "underpaid"
    WHEN designation = "Associate Professor" AND salary < 100000 THEN "underpaid"
    WHEN designation = "Assistant Professor" AND salary < 90000 THEN "underpaid"
    WHEN designation = "Lecturer" AND salary < 50000 THEN "underpaid"
    ELSE "rightfully paid"
END AS verdict
FROM faculty





