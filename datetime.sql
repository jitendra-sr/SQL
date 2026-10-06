-- 1. Add / subtract time
WHERE recordDate = w.recordDate + INTERVAL 1 DAY;
WHERE recordDate = w.recordDate - INTERVAL 2 WEEK;

WHERE recordDate = DATE_ADD(recordDate, INTERVAL 3 MONTH);
WHERE recordDate = DATE_SUB(recordDate, INTERVAL 5 YEAR);


-- 2. Difference between two dates in days
DATEDIFF(a, b)
DATEDIFF('2026-09-28', '2026-09-25')
-- (a − b) can be +ve or -ve depending on the order of the dates.


-- 3. Compare dates directly
WHERE recordDate > '2026-09-01';
WHERE recordDate BETWEEN '2026-09-01' AND '2026-09-30';


-- 4. Get current date/time
SELECT CURRENT_DATE(), CURRENT_TIME();
SELECT NOW(), CURRENT_TIMESTAMP(); -- 2026-09-28 13:40:25


-- 5. Extract parts of a date
SELECT YEAR(recordDate), MONTH(recordDate), WEEK(recordDate), DAY(recordDate), FROM Weather;
SELECT DAYOFYEAR(recordDate), DAYOFMONTH(recordDate), DAYOFWEEK(recordDate), FROM Weather;


-- 6. Format a date or time or datetime
DATE_FORMAT(recordDate, '%Y-%m-%d') -- 2026-09-28
DATE_FORMAT(recordDate, '%d,%a,%b') -- 28,Sun,Sep
DATE_FORMAT(recordTime, '%H:%i:%s') -- 13:40:25
DATE_FORMAT(NOW(), '%h:%i %p') -- 01:40 PM
-- DATE_FORMAT() returns a string, not a date or time.