/*  WHERE title = 'Teller' AND start_date < '2007-01-01' */
/*  WHERE title = 'Teller' OR start_date < '2007-01-01' */

/*  WHERE end_date IS NULL
      AND (title = 'Teller' OR start_date < '2007-01-01')
*/

/* WHERE end_date IS NULL
    AND NOT (title = 'Teller' OR start_date < '2007-01-01')
*/

/* WHERE end_date IS NULL
  AND title != 'Teller' AND start_date >= '2007-01-01'
  */

title = 'Teller'
fed_id = '111-11-1111'
amount = 375.25
dept_id = (SELECT dept_id FROM department WHERE name = 'Loans')

SELECT pt.name product_type, p.name product
  FROM product p INNER JOIN product_type pt
  ON p.product_type_cd = pt.product_type_cd
  WHERE pt.name = 'Customer Accounts';

SELECT pt.name product_type, p.name product
FROM product p INNER JOIN product_type pt
ON p.product_type_cd = pt.product_type_cd
WHERE pt.name <> 'Customer Accounts';
-- WHERE pt.name != 'Customer Accounts';

DELETE FROM account WHERE status = 'CLOSED' AND YEAR(close_date) = 2002;

SELECT emp_id, fname, lname, start_date FROM employee WHERE start_date < '2007-01-01';
SELECT emp_id, fname, lname, start_date FROM employee WHERE start_date < '2007-01-01' AND start_date >= '2005-01-01';

SELECT emp_id, fname, lname, start_date FROM employee WHERE start_date BETWEEN '2005-01-01' AND '2007-01-01';
SELECT emp_id, fname, lname, start_date FROM employee WHERE start_date BETWEEN '2007-01-01' AND '2005-01-01'; 
SELECT account_id, product_cd, cust_id, avail_balance FROM account WHERE avail_balance BETWEEN 3000 AND 5000;

SELECT cust_id, fed_id FROM customer WHERE cust_type_cd = 'I' AND fed_id BETWEEN '500-00-0000' AND '999-99-9999'; 
-- SELECT cust_id, fed_id, cust_type_cd FROM customer WHERE cust_type_cd = 'I' AND fed_id BETWEEN '500-00-0000' AND '999-99-9999';

SELECT account_id, product_cd, cust_id, avail_balance FROM account WHERE product_cd = 'CHK' OR product_cd = 'SAV' OR product_cd = 'CD' OR product_cd = 'MM';
SELECT account_id, product_cd, cust_id, avail_balance FROM account WHERE product_cd IN ('CHK','SAV','CD','MM');

SELECT account_id, product_cd, cust_id, avail_balance FROM account WHERE product_cd IN (SELECT product_cd FROM product WHERE product_type_cd = 'ACCOUNT');
SELECT account_id, product_cd, cust_id, avail_balance FROM account WHERE product_cd NOT IN ('CHK','SAV','CD','MM');

SELECT emp_id, fname, lname FROM employee WHERE LEFT(lname, 1) = 'T';

SELECT lname FROM employee WHERE lname LIKE '_a%e%'; 
SELECT cust_id, fed_id FROM customer WHERE fed_id LIKE '___-__-____'; 
SELECT emp_id, fname, lname FROM employee WHERE lname LIKE 'F%' OR lname LIKE 'G%';
SELECT emp_id, fname, lname FROM employee WHERE lname REGEXP '^[FG]';

SELECT emp_id, fname, lname, superior_emp_id FROM employee WHERE superior_emp_id IS NULL;
SELECT emp_id, fname, lname, superior_emp_id FROM employee WHERE superior_emp_id IS NOT NULL; 
SELECT emp_id, fname, lname, superior_emp_id FROM employee WHERE superior_emp_id = NULL;
SELECT emp_id, fname, lname, superior_emp_id FROM employee WHERE superior_emp_id != 6; 
SELECT emp_id, fname, lname, superior_emp_id FROM employee WHERE superior_emp_id != 6 OR superior_emp_id IS NULL;

txn_date < '2005-02-26' AND (txn_type_cd = 'DBT' OR amount > 100)

account_id IN (101,103) AND NOT (txn_type_cd = 'DBT' OR amount > 100)

select * from account where open_date LIKE "2002%";

-- SELECT * from individual where lname LIKE "_a%e"-- ;
