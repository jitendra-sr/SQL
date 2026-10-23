CONDITIONALS IN SQL:
1. They are SQL construct that allows you to perform different actions based on different conditions.
2. They can be used with different clauses (WHERE, HAVING, ORDER BY) and functions (Aggregate, Mathematical) to conditionally modify the output or behavior of a query.
3. They can be used to filter data, transform data, or control the flow of execution in a query.



1. CASE STATEMENT:

CASE
    WHEN condition1 THEN value1
    WHEN condition2 THEN value2
    ELSE value3 -- Default value of ELSE is NULL and no need to specify as ELSE NULL as it is the default behavior
END



2. IF-ELSE STATEMENT:

IF(condition, value_if_true, value_if_false)
-- SELECT *, IF(amount > 1000, 'High', 'Low') AS result from salary;


3. CASE EXPRESSION:

CASE expression/col
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE default_result
END



4. COALESCE FUNCTION:

COALESCE(expression1, expression2, ..., expressionN)
-- Returns the first non-null expression from the list of expressions provided. If all expressions are null, it returns null. It is often used to handle null values in queries and provide a default value when necessary.
