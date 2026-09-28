-- General Order of Commands ->
-- SELECT cols 
-- FROM tab 
-- WHERE conditions 
-- GROUP BY cols 
-- HAVING conditions 
-- ORDER BY cols DESC 

SELECT * FROM student WHERE marks+10 >= 80 OR city != "Mumbai";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city NOT IN ("Delhi" , "Mumbai");

SELECT DISTINCT city FROM student;
SELECT * FROM student ORDER BY marks DESC LIMIT 5;

SELECT SUM(marks), AVG(marks), MIN(marks) FROM student;
SELECT sname, city, COUNT(id) FROM student GROUP BY sname, city;

SELECT city, COUNT(id) FROM student GROUP BY city HAVING MAX(marks) > 90;
-- WHERE applies conditions on rows while HAVING applies on cols (or groups).
-- The HAVING clause is used to filter the results of the grouped data based on a condition
-- It is similar to the WHERE clause, but it is used with aggregate functions.


-- GROUP BY (usage in general):
-- When we use aggregate functions like sum,avg etc, then we also use GROUP BY clause to group the data based on one or more columns.
-- The cols used in the GROUP BY clause are the cols used in SELECT statement immediately. If there are other cols in SELECT, then they must be aggregate functions.