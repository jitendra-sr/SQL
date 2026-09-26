CREATE DATABASE college;
CREATE DATABASE IF NOT EXISTS college;

DROP DATABASE college;
DROP DATABASE IF EXISTS college;

SHOW DATABASES;

USE college;
-- ###################################################################


CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

DROP TABLE student;

SHOW TABLES;

INSERT INTO student VALUES (1, "jitu", 22);
INSERT INTO student VALUES (2, "dpk", 24);

INSERT INTO student 
(id, age)
VALUES
(3, 26),
(4, 28);

SELECT * FROM student;
-- ###################################################################


-- Constraints

CREATE TABLE stu (
	id INT PRIMARY KEY,
    age INT CHECK (age >= 18)
);

CREATE TABLE stu1 (
	id INT,
    age INT,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) UNIQUE,
    course VARCHAR(50) DEFAULT "CSE",
    
    CONSTRAINT cons_name_opt CHECK (id >= 2 AND age >= 18),
    PRIMARY KEY (id,age),
    
    FOREIGN KEY (id) references stu(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
-- ###################################################################


SELECT * FROM student WHERE marks+10 >= 80 OR city != "Mumbai";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city NOT IN ("Delhi" , "Mumbai");

SELECT DISTINCT city FROM student;
SELECT AVG(marks) FROM student;
SELECT * FROM student ORDER BY marks DESC LIMIT 5;
SELECT sname, city, COUNT(id) FROM student GROUP BY sname, city;
SELECT city, COUNT(id) FROM student GROUP BY city HAVING MAX(marks) > 90;
-- WHERE applies conditions on rows while HAVING applies on cols (or groups).

-- General Order of Commands ->
-- SELECT cols 
-- FROM tab 
-- WHERE conditions 
-- GROUP BY cols 
-- HAVING conditions 
-- ORDER BY cols ASC 
-- ###################################################################


-- Data Updation

SET SQL_SAFE_UPDATES = 0;

UPDATE student SET name = "Ram", age = 23 WHERE id = 3;
UPDATE student SET age = age + 1;

DELETE FROM student WHERE id = 4;
DELETE FROM stu;
-- ###################################################################


-- Schema Updation

ALTER TABLE student RENAME TO stu0;

ALTER TABLE student ADD COLUMN city varchar(50) NOT NULL DEFAULT "NYC";
ALTER TABLE student DROP COLUMN city;

ALTER TABLE student CHANGE COLUMN id s_id int;
ALTER TABLE student MODIFY COLUMN id bigint;

TRUNCATE TABLE student;
-- ###################################################################


-- UNION -> It is used to combine the result-set of two or more SELECT satatements, Gives uniques records only.
-- UNION ALL -> Gives all records including duplicate ones.

-- Every SELECT should have same no of columns
-- Columns must have similar data types
-- Columns in every SELECT should be in same order



-- Inner Join -> returns records that have matching values in both tables

SELECT * FROM student INNER JOIN course ON student.s_id = course.c_id;

SELECT * 
FROM student as s 
INNER JOIN course as c
ON s.s_id = c.c_id;



-- Left Join -> returns all records from left table and matched records from right table

SELECT * FROM student LEFT JOIN course ON student.s_id = course.c_id;



-- Right Join -> returns all records from right table and matched records from left table

SELECT * FROM student RIGHT JOIN course ON student.s_id = course.c_id;



-- Full Join -> returns all records when there is a match in either left or right table

SELECT * FROM student LEFT JOIN course ON student.s_id = course.c_id
UNION
SELECT * FROM student RIGHT JOIN course ON student.s_id = course.c_id;



-- Left/Right Exclusive Join -> returns all records from left/right table exclusively

SELECT * FROM student LEFT JOIN course ON student.s_id = course.c_id WHERE course.id IS NULL;
SELECT * FROM student RIGHT JOIN course ON student.s_id = course.c_id WHERE student.id IS NULL;



-- Full Exclusive Join -> returns all records from left and right table excluding the common one

SELECT * FROM student LEFT JOIN course ON student.s_id = course.c_id WHERE course.id IS NULL
UNION
SELECT * FROM student RIGHT JOIN course ON student.s_id = course.c_id WHERE student.id IS NULL;



-- Self Join -> It's a regular join but the table is joined with itself

SELECT
a.name as stu_name, b.name
FROM student as a
JOIN student as b
ON a.s_id = b.c_id;
-- ###################################################################


-- Views -> A view is a virtual table based on the result-set of an sql statement
-- A view always shows up-to-date data ie. live snapshot. The db engine recreates view, everytime a user queries it.

CREATE VIEW view1 AS 
SELECT id, name FROM student;
 
SELECT * FROM view1 WHERE id > 100;
 
DROP VIEW view1;
-- ###################################################################


-- Transactions
SET autocommit = 0;
COMMIT;
ROLLBACK;

DELIMITER $$
DELIMITER ;