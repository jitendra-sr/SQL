Window Function
1. A type of SQL function that performs calculations across a set of table rows that are related to each other called a window, that is defined by the user.
2. It work differently than GROUP BY clause (or aggregate functions) as they collapse the result set into a single row, but it return a value for each row in the result set.
3. It saves from writing complex subqueries (like group by) and then doing self-join or other techniques like IN/BETWEEN/EXISTS to get the desired result set.



Syntax:

SELECT 
    *,
    window_function(params) OVER (
        PARTITION BY column1
        ORDER BY column2
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        RANGE BETWEEN CURRENT ROW AND val_given FOLLOWING
    ) AS window_function_result
FROM table_name;



NOTES ABOUT CLAUSES:

1. The PARTITION BY clause is used to divide the result set (or table) into partitions (or groups) based on the values of one or more columns. The window function is then applied to each partition separately. 
If it is not specified, then window function will operate on the entire table as a single partition

2. The ORDER BY clause is used to specify the order of the rows within each partition. 
It is not a mandatory clause as such, but it became mandatory for ranking and analytical functions as they require a specific order to determine the rank or value of each row in relation to its neighbors.

3. The ROWS/RANGE BETWEEN clauses are used to define the window frame, which determines the set of rows that the window function will operate on for each row in the result set. 
If it is not specified, then the default window frame is used, which is the current row and all preceding rows in the partition.
ROWS are physical and RANGE is logical.



Window_Function Examples:

1. Aggregate Functions -> SUM, AVG, COUNT, MIN, MAX
-- Mainly used to calculate cumulative (or running) totals, averages, or other aggregate values over a specified window of rows.
SELECT 
    sname, 
    marks, 
    SUM(marks) OVER (PARTITION BY city ORDER BY marks DESC) AS total_marks_in_city
FROM students;



2. Ranking Functions -> ROW_NUMBER, RANK, DENSE_RANK, PERCENT_RANK
-- Mainly used to find top/bottom N records, or to assign a unique rank to each row in the result set based on a specified order.
SELECT 
    sname, 
    marks, 
    RANK() OVER (PARTITION BY city ORDER BY marks DESC) AS rank_in_city
FROM students;



3. Analytical/Value Functions -> LAG, LEAD, FIRST_VALUE, LAST_VALUE
-- Mainly used to find the data from a next or previous row in the same result set ie. to compare the current row with its neighbors.
SELECT 
    sname, 
    marks, 
    LAG(marks, 2, 0) OVER (PARTITION BY city ORDER BY marks DESC) AS previous_marks
FROM students;