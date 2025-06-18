CREATE TABLE string_tbl
(char_fld CHAR(30), vchar_fld VARCHAR(30), text_fld TEXT);

INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
VALUES ('This is char data', 'This is varchar data', 'This is text data');

UPDATE string_tbl
SET vchar_fld = 'This is a piece of extremely long varchar data';

SELECT @@session.sql_mode; 
SET sql_mode='ansi';
SELECT @@session.sql_mode;
SHOW WARNINGS;
SELECT vchar_fld FROM string_tbl;

UPDATE string_tbl SET text_fld = 'This string doesn''t work'; 
UPDATE string_tbl SET text_fld = 'This string didn\' t work, but it does now';

SELECT text_fld FROM string_tbl; 
SELECT quote(text_fld) FROM string_tbl;

SELECT 'abcdefg', CHAR(97,98,99,100,101,102,103);
SELECT CHAR(128,129,130,131,132,133,134,135,136,137);
SELECT CHAR(138,139,140,141,142,143,144,145,146,147);
SELECT CHAR(148,149,150,151,152,153,154,155,156,157);
SELECT CHAR(158,159,160,161,162,163,164,165);
SELECT CONCAT('danke sch', CHAR(148), 'n');
SELECT 'danke sch' || CHR(148) || 'n' FROM dual;
SELECT ASCII('ö');

DELETE FROM string_tbl;

INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
VALUES ('This string is 28 characters', 'This string is 28 characters', 'This string is 28 characters');

SELECT LENGTH(char_fld) char_length,
LENGTH(vchar_fld) varchar_length,
LENGTH(text_fld) text_length
FROM string_tbl;

SELECT POSITION('characters' IN vchar_fld) FROM string_tbl;
SELECT LOCATE('is', vchar_fld, 5) FROM string_tbl;
DELETE FROM string_tbl;
INSERT INTO string_tbl(vchar_fld) VALUES ('abcd');
INSERT INTO string_tbl(vchar_fld) VALUES ('xyz'); 
INSERT INTO string_tbl(vchar_fld) VALUES ('QRSTUV'); 
INSERT INTO string_tbl(vchar_fld) VALUES ('qrstuv'); 
INSERT INTO string_tbl(vchar_fld) VALUES ('12345'); 
SELECT vchar_fld FROM string_tbl ORDER BY vchar_fld;
 
SELECT 
STRCMP('12345','12345') 12345_12345,
STRCMP('abcd','xyz') abcd_xyz,
STRCMP('abcd','QRSTUV') abcd_QRSTUV,
STRCMP('qrstuv','QRSTUV') qrstuv_QRSTUV,
STRCMP('12345','xyz') 12345_xyz,
STRCMP('xyz','qrstuv') xyz_qrstuv;
 
SELECT name, name LIKE '%ns' ends_in_ns FROM department;

SELECT 
cust_id, cust_type_cd, fed_id, fed_id REGEXP '.{3}-.{2}-.{4}' is_ss_no_format
FROM customer;

DELETE FROM string_tbl; 

INSERT INTO string_tbl (text_fld) VALUES ('This string was 29 characters');

UPDATE string_tbl SET text_fld = CONCAT(text_fld, ', but now it is longer');

SELECT text_fld FROM string_tbl; 
 
SELECT CONCAT(fname, ' ', lname, ' has been a ', title, ' since ', start_date) emp_narrative
  FROM employee
  WHERE title = 'Teller' OR title = 'Head Teller';
 
SELECT INSERT('goodbye world', 9, 0, 'cruel ') string;
 
SELECT INSERT('goodbye world', 1, 7, 'hello') string; 
 
SELECT REPLACE('goodbye world', 'goodbye', 'hello') FROM dual; 
 
SELECT SUBSTRING('goodbye cruel world', 9, 5);

SELECT (37 * 59) / (78 - (8 * 6));

SELECT MOD(10,4); 
SELECT MOD(22.75, 5);
SELECT POW(2,8);
SELECT POW(2,10) kilobyte, POW(2,20) megabyte, POW(2,30) gigabyte, POW(2,40) terabyte;

SELECT CEIL(72.445), FLOOR(72.445);  
SELECT CEIL(72.000000001), FLOOR(72.999999999);
SELECT ROUND(72.49999), ROUND(72.5), ROUND(72.50001);
SELECT ROUND(72.0909, 1), ROUND(72.0909, 2), ROUND(72.0909, 3);
SELECT TRUNCATE(72.0909, 1), TRUNCATE(72.0909, 2), TRUNCATE(72.0909, 3);
SELECT ROUND(17, -1), TRUNCATE(17, -1);

SELECT account_id, SIGN(avail_balance), ABS(avail_balance) FROM account;

SELECT @@global.time_zone, @@session.time_zone; 
SET time_zone = 'Europe/Zurich';
SELECT @@global.time_zone, @@session.time_zone;

/* --__--__--__-- */

use mysql; 
SELECT name FROM time_zone_name;

UPDATE transaction
SET txn_date = '2008-09-17 15:30:00'
WHERE txn_id = 99999;

SELECT CAST('2008-09-17 15:30:00' AS DATETIME);
SELECT CAST('2008-09-17' AS DATE) date_field, CAST('108:17:57' AS TIME) time_field;

UPDATE individual
SET birth_date = STR_TO_DATE('September 17, 2008', '%M %d, %Y')
WHERE cust_id = 9999;  
SELECT CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP();

SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY); 
 UPDATE transaction
 SET txn_date = DATE_ADD(txn_date, INTERVAL '3:27:11' HOUR_SECOND)
WHERE txn_id = 9999;

UPDATE employee
SET birth_date = DATE_ADD(birth_date, INTERVAL '9-11' YEAR_MONTH)
WHERE emp_id = 4789;

UPDATE employee
SET birth_date = ADD_MONTHS(birth_date, 119)
WHERE emp_id = 4789;

SELECT LAST_DAY('2008-09-17');

SELECT CURRENT_TIMESTAMP() current_est,
CONVERT_TZ(CURRENT_TIMESTAMP(), 'US/Eastern', 'UTC') current_utc;

SELECT DAYNAME('2008-09-18');
SELECT EXTRACT(YEAR FROM '2008-09-18 22:19:05');

SELECT DATEDIFF('2009-09-03', '2009-06-24');  
SELECT DATEDIFF('2009-09-03 23:59:59', '2009-06-24 00:00:01');
SELECT DATEDIFF('2009-06-24', '2009-09-03');

SELECT CAST('1456328' AS SIGNED INTEGER); 
SELECT CAST('999ABC111' AS UNSIGNED INTEGER); 
show warnings;

SELECT SUBSTRING('Please find the substring in this string', 17, 9) AS result;

SELECT ABS(-25.76823), SIGN(-25.76823), ROUND(-25.76823,2);

SELECT MONTH(CURRENT_DATE) AS month;
