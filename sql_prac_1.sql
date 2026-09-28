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
-- The foreign key prevents the invalid data from being inserted in child (this) table. It maintains the referential integrity between the two tables. It ensures that the value in the foreign key column must match a value (or exist) in the referenced primary key column of the parent table.
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