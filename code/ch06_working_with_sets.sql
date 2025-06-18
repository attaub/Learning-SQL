DESC product; 
DESC customer;

SELECT 1 num, 'abc' str
  UNION
    SELECT 9 num, 'xyz' str;

SELECT 'IND' type_cd, cust_id, lname name FROM individual
UNION ALL
SELECT 'BUS' type_cd, cust_id, name FROM business;

SELECT 'IND' type_cd, cust_id, lname name FROM individual
UNION ALL
SELECT 'BUS' type_cd, cust_id, name FROM business
UNION ALL
SELECT 'BUS' type_cd, cust_id, name FROM business;

SELECT emp_id FROM employee WHERE assigned_branch_id = 2 AND (title = 'Teller' OR title = 'Head Teller')
UNION ALL
SELECT DISTINCT open_emp_id FROM account WHERE open_branch_id = 2;

SELECT emp_id FROM employee WHERE assigned_branch_id = 2 AND (title = 'Teller' OR title = 'Head Teller')
UNION
SELECT DISTINCT open_emp_id FROM account WHERE open_branch_id = 2;

SELECT emp_id, fname, lname FROM employee
INTERSECT
SELECT cust_id, fname, lname FROM individual;

SELECT emp_id FROM employee WHERE assigned_branch_id = 2 AND (title = 'Teller' OR title = 'Head Teller')
INTERSECT
SELECT DISTINCT open_emp_id FROM account WHERE open_branch_id = 2;

SELECT emp_id FROM employee WHERE assigned_branch_id = 2 AND (title = 'Teller' OR title = 'Head Teller')
EXCEPT
SELECT DISTINCT open_emp_id FROM account WHERE open_branch_id = 2;

SELECT emp_id, assigned_branch_id FROM employee WHERE title = 'Teller'
 UNION
 SELECT open_emp_id, open_branch_id FROM account WHERE product_cd = 'SAV'
 ORDER BY emp_id;

SELECT emp_id, assigned_branch_id FROM employee WHERE title = 'Teller'
  UNION
  SELECT open_emp_id, open_branch_id FROM account WHERE product_cd = 'SAV'
  ORDER BY open_emp_id;

SELECT cust_id FROM account WHERE product_cd IN ('SAV', 'MM')
UNION ALL
SELECT a.cust_id FROM account a INNER JOIN branch b ON a.open_branch_id = b.branch_id WHERE b.name = 'Woburn Branch'
UNION
SELECT cust_id FROM account WHERE avail_balance BETWEEN 500 AND 2500;

SELECT cust_id FROM account WHERE product_cd IN ('SAV', 'MM')
 UNION
 SELECT a.cust_id FROM account a INNER JOIN branch b ON a.open_branch_id = b.branch_id WHERE b.name = 'Woburn Branch'
 UNION ALL
 SELECT cust_id FROM account WHERE avail_balance BETWEEN 500 AND 2500;

SELECT cust_id FROM account
 WHERE product_cd IN ('SAV', 'MM')
 UNION
 SELECT a.cust_id FROM account a
INNER JOIN branch b ON a.open_branch_id = b.branch_id
 WHERE b.name = 'Woburn Branch'
 UNION ALL
 SELECT cust_id FROM account
 WHERE avail_balance BETWEEN 500 AND 2500;

SELECT cust_id FROM account
 WHERE product_cd IN ('SAV', 'MM')
 UNION
 SELECT a.cust_id FROM account a
INNER JOIN branch b ON a.open_branch_id = b.branch_id
 WHERE b.name = 'Woburn Branch'
 UNION ALL
 SELECT cust_id FROM account
 WHERE avail_balance BETWEEN 500 AND 2500;

SELECT fname, lname FROM individual 
UNION
SELECT fname, lname FROM employee;

SELECT fname, lname FROM individual 
UNION
SELECT fname, lname FROM employee
ORDER BY lname;
