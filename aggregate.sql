-- Instead of directly applying aggregate functions to a column, you can use conditions or transformations to modify the data before aggregation. These rules apply on each rows essentially filtering or transforming the data before the aggregation is performed.


--1. ROUND numbers to specified decimal places before aggregation.
ROUND(AVG(col), 2)
-- Calculates the average of the specified column and rounds the result to 2 decimal places.



--2. AVERAGE
AVG(col = val)
-- Calculates the average of the specified column only for rows where the column equals the specified value.

AVG(col + 5)
-- Calculates the average of the specified column after adding 5 to each value in that column.



-- 3. SUMMATION
SUM(col1 * col2)
-- Calculates the sum of the product of two specified columns.

SUM(CASE WHEN status = val THEN col ELSE alt_val END)
-- Calculates the sum of a specified column, but only for rows where a certain condition is met. If the condition is not met, it uses an alternative value instead.

SUM(col < val)
-- FOR each row, if the expression is true, it returns 1 else 0. So the sum of this expression will give the count of rows satisfying the condition not the sum of values satisfying the condition.
COUNT(col < val) -- will not work because COUNT counts non-null values and the expression will always return a non-null value (1 or 0).
COUNT(CASE WHEN col < val THEN 1 END) -- will work because it counts only the rows where the condition is true.



-- 4. CONDITIONAL AGGREGATION
CASE
    WHEN condition1 THEN value1
    WHEN condition2 THEN value2
    ELSE NULL -- No need to specify ELSE NULL as it is the default behavior of the CASE expression.
END



-- 5. IF() — one condition
IF(condition, value_if_true, value_if_false)

SELECT IF(salary > 50000, 'High', 'Low') AS level 
FROM Employee;



