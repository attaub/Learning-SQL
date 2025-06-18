SELECT emp_id, fname, lname FROM employee WHERE lname = 'Bkadfl';
SELECT emp_id, fname, lname FROM employee ;

SELECT * FROM department; SELECT dept_id, name  FROM department; SELECT  name  FROM department;

SELECT emp_id, 'ACTIVE', emp_id * 3.14159, UPPER(lname) FROM employee;

SELECT VERSION(), USER(), DATABASE();

SELECT emp_id,
  'ACTIVE' status,
  emp_id * 3.14159 empid_x_pi,
  UPPER(lname) last_name_upper
  FROM employee;

SELECT emp_id,
  'ACTIVE' AS status,
  emp_id * 3.14159 AS empid_x_pi,
  UPPER(lname) AS last_name_upper
  FROM employee;

SELECT cust_id
  FROM account;

SELECT DISTINCT cust_id
  FROM account;

SELECT e.emp_id, e.fname, e.lname
  FROM (SELECT emp_id, fname, lname, start_date, title FROM employee) e;

SELECT emp_id, fname, lname, start_date, title FROM employee;

SELECT e.emp_id, e.fname, e.lname, e.start_date, e.title FROM employee e;

CREATE VIEW employee_vw AS SELECT emp_id, fname, lname, YEAR(start_date) start_year FROM employee;

SELECT emp_id, start_year FROM employee_vw;

SELECT employee.emp_id, employee.fname,
  employee.lname, department.name dept_name
  FROM employee INNER JOIN department
  ON employee.dept_id = department.dept_id;

SELECT e.emp_id, e.fname, e.lname,
 d.name dept_name
 FROM employee e INNER JOIN department d
 ON e.dept_id = d.dept_id;

SELECT emp_id, fname, lname, start_date, title FROM employee WHERE title = 'Head Teller';

SELECT emp_id, fname, lname, start_date, title FROM employee WHERE title = 'Head Teller' AND start_date > '2006-01-01';

SELECT emp_id, fname, lname, start_date, title FROM employee WHERE title = 'Head Teller' OR start_date > '2006-01-01';

SELECT emp_id, fname, lname, start_date, title FROM employee
WHERE (title = 'Head Teller' AND start_date > '2006-01-01') OR (title = 'Teller' AND start_date > '2007-01-01');

SELECT d.name, count(e.emp_id) num_employees
FROM department d INNER JOIN employee e ON d.dept_id = e.dept_id
GROUP BY d.name HAVING count(e.emp_id) > 2;

SELECT open_emp_id, product_cd FROM account; 
SELECT open_emp_id, product_cd FROM account ORDER BY open_emp_id;
SELECT open_emp_id, product_cd FROM account ORDER BY open_emp_id, product_cd;

SELECT account_id, product_cd, open_date, avail_balance
 FROM account
 ORDER BY avail_balance DESC;

SELECT cust_id, cust_type_cd, city, state, fed_id
 FROM customer
 ORDER BY RIGHT(fed_id, 3);

SELECT emp_id, title, start_date, fname, lname
 FROM employee
 ORDER BY 2, 5;

SELECT emp_id, fname, lname FROM employee ORDER by lname, fname;

SELECT a.account_id, a.cust_id, a.avail_balance from account a
  WHERE status='ACTIVE';

SELECT * FROM account;
SELECT open_emp_id FROM account;
SELECT a.open_emp_id FROM account a;
SELECT distinct(a.open_emp_id) FROM account a;

SELECT p.product_cd, a.cust_id, a.avail_balance
FROM product p INNER JOIN account <1>
ON p.product_cd = <2>
WHERE p.<3> = 'ACCOUNT'
ORDER BY <4>, <5>;

SELECT p.product_cd, a.cust_id, a.avail_balance
FROM product p INNER JOIN account a
ON p.product_cd = a.product_cd
WHERE p.product_type_cd = 'ACCOUNT'
ORDER BY p.product_cd, a.cust_id;
