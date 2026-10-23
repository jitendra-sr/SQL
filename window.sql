Window Function:

1. A type of SQL function that performs calculations across a set of table rows that are related to the current row. 
2. They are often used for tasks such as calculating running totals, ranking rows, and performing moving averages.
3. They work differently than GROUP BY clause (or aggregate functions) as they do not collapse the result set into a single row. Instead, they return a value for each row in the result set.


Syntax:

SELECT 
    column1, 
    column2, 
    window_function(column3) OVER (PARTITION BY column1 ORDER BY column2 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS window_function_result
FROM table_name;



Window_Function Examples:

1. Aggregate Functions -> SUM, AVG, COUNT, MIN, MAX
2. Ranking Functions -> RANK, DENSE_RANK, PERCENT_RANK, ROW_NUMBER
3. Analytical/Value Functions -> LAG, LEAD, FIRST_VALUE, LAST_VALUE
