-- UNION -> It is used to combine the result-set of two or more SELECT satatements, Gives uniques records only.
-- UNION ALL -> Gives all records including duplicate ones.

-- Every SELECT should have same no of columns
-- Columns must have similar data types
-- Columns in every SELECT should be in same order

-- ###############################################################################################



-- Join -> The normal JOIN is inner join ie. returns the records matching in both tables.

-- Self Join -> It's a normal join but the table is joined with itself
SELECT
a.name as stu_name, b.name
FROM student as a
JOIN student as b
ON a.s_id = b.c_id;

-- Inner Join -> returns records that have matching values in both tables
SELECT * FROM student INNER JOIN course ON student.s_id = course.c_id;

SELECT * 
FROM student as s 
INNER JOIN course as c
ON s.s_id = c.c_id;

-- Note: We can skip "INNER" keyword in inner join and "AS" keyword in table aliasing.

-- ###############################################################################################



-- Left Join -> returns all records from left table and matched records from right table

SELECT * FROM student LEFT JOIN course ON student.s_id = course.c_id;

-- ###############################################################################################



-- Right Join -> returns all records from right table and matched records from left table

SELECT * FROM student RIGHT JOIN course ON student.s_id = course.c_id;

-- ###############################################################################################



-- Full Join -> returns all records when there is a match in either left or right table

SELECT * FROM student LEFT JOIN course ON student.s_id = course.c_id
UNION
SELECT * FROM student RIGHT JOIN course ON student.s_id = course.c_id;

-- ###############################################################################################



-- Left/Right Exclusive Join -> returns all records from left/right table exclusively

SELECT * FROM student LEFT JOIN course ON student.s_id = course.c_id WHERE course.id IS NULL;
SELECT * FROM student RIGHT JOIN course ON student.s_id = course.c_id WHERE student.id IS NULL;

-- ###############################################################################################



-- Full Exclusive Join -> returns all records from left and right table excluding the common one

SELECT * FROM student LEFT JOIN course ON student.s_id = course.c_id WHERE course.id IS NULL
UNION
SELECT * FROM student RIGHT JOIN course ON student.s_id = course.c_id WHERE student.id IS NULL;

-- ###############################################################################################