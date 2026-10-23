Common Table Expression: 

1. A CTE is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. It is defined using the WITH keyword and can be used to simplify complex queries by breaking them down into smaller, more manageable parts.
2. CTEs can be recursive or non-recursive. Recursive CTEs are used to perform hierarchical or recursive queries, while non-recursive CTEs are used for simpler queries.
3. The main difference between a CTE and a subquery is that a CTE can be referenced multiple times within the same query, while a subquery can only be used once.



Syntax:

WITH cte_name AS (
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition
), cte_name2 AS (
    SELECT column1, column2, ...
    FROM cte_name
    WHERE condition
)

SELECT *
FROM cte_name2;
