DESC employee; 
DESC department;

SELECT e.fname, e.lname, d.name FROM employee e JOIN department d;

SELECT e.fname, e.lname, d.name FROM employee e JOIN department d ON e.dept_id = d.dept_id;
SELECT e.fname, e.lname, d.name FROM employee e INNER JOIN department d ON e.dept_id = d.dept_id; 
SELECT e.fname, e.lname, d.name FROM employee e INNER JOIN department d USING (dept_id);

SELECT e.fname, e.lname, d.name FROM employee e, department d WHERE e.dept_id = d.dept_id;

SELECT a.account_id, a.cust_id, a.open_date, a.product_cd FROM account a, branch b, employee e
  WHERE a.open_emp_id = e.emp_id
  AND e.start_date < '2007-01-01' AND e.assigned_branch_id = b.branch_id
  AND (e.title = 'Teller' OR e.title = 'Head Teller') AND b.name = 'Woburn Branch';

SELECT a.account_id, a.cust_id, a.open_date, a.product_cd
  FROM account a
  INNER JOIN employee e ON a.open_emp_id = e.emp_id
  INNER JOIN branch b ON e.assigned_branch_id = b.branch_id
  WHERE e.start_date < '2007-01-01'
  AND (e.title = 'Teller' OR e.title = 'Head Teller') AND b.name = 'Woburn Branch';

SELECT a.account_id, c.fed_id FROM account a
  INNER JOIN customer c ON a.cust_id = c.cust_id
    WHERE c.cust_type_cd = 'B';

SELECT a.account_id, c.fed_id, e.fname, e.lname FROM account a
  INNER JOIN customer c ON a.cust_id = c.cust_id
  INNER JOIN employee e ON a.open_emp_id = e.emp_id
    WHERE c.cust_type_cd = 'B'; 

SELECT a.account_id, c.fed_id, e.fname, e.lname FROM customer c
  INNER JOIN account a ON a.cust_id = c.cust_id
  INNER JOIN employee e ON a.open_emp_id = e.emp_id
    WHERE c.cust_type_cd = 'B'; 
    
SELECT a.account_id, c.fed_id, e.fname, e.lname FROM employee e
  INNER JOIN account a ON e.emp_id = a.open_emp_id
  INNER JOIN customer c ON a.cust_id = c.cust_id
   WHERE c.cust_type_cd = 'B'; 

SELECT STRAIGHT_JOIN a.account_id, c.fed_id, e.fname, e.lname FROM customer c
  INNER JOIN account a ON a.cust_id = c.cust_id
  INNER JOIN employee e ON a.open_emp_id = e.emp_id
    WHERE c.cust_type_cd = 'B';

SELECT a.account_id, a.cust_id, a.open_date, a.product_cd
  FROM account a INNER JOIN
  (SELECT emp_id, assigned_branch_id
  FROM employee
  WHERE start_date < '2007-01-01'
  AND (title = 'Teller' OR title = 'Head Teller')) e
  ON a.open_emp_id = e.emp_id
  INNER JOIN
  (SELECT branch_id
  FROM branch
  WHERE name = 'Woburn Branch') b
  ON e.assigned_branch_id = b.branch_id;

SELECT emp_id, assigned_branch_id
 FROM employee
 WHERE start_date < '2007-01-01'
AND (title = 'Teller' OR title = 'Head Teller');

SELECT branch_id
 FROM branch
 WHERE name = 'Woburn Branch';

SELECT a.account_id, e.emp_id,
b_a.name open_branch, b_e.name emp_branch
FROM account a INNER JOIN branch b_a
ON a.open_branch_id = b_a.branch_id
INNER JOIN employee e
ON a.open_emp_id = e.emp_id
INNER JOIN branch b_e
ON e.assigned_branch_id = b_e.branch_id
WHERE a.product_cd = 'CHK';

SELECT e.fname, e.lname, e_mgr.fname mgr_fname, e_mgr.lname mgr_lname FROM employee e
  INNER JOIN employee e_mgr ON e.superior_emp_id = e_mgr.emp_id;

SELECT e.emp_id, e.fname, e.lname, e.start_date FROM employee e
  INNER JOIN product p ON e.start_date >= p.date_offered AND e.start_date <= p.date_retired
  WHERE p.name = 'no-fee checking'; 

SELECT e1.fname, e1.lname, 'VS' vs, e2.fname, e2.lname FROM employee e1
  INNER JOIN employee e2 ON e1.emp_id != e2.emp_id
  WHERE e1.title = 'Teller' AND e2.title = 'Teller'; 

SELECT e1.fname, e1.lname, 'VS' vs, e2.fname, e2.lname FROM employee e1
  INNER JOIN employee e2 ON e1.emp_id < e2.emp_id
  WHERE e1.title = 'Teller' AND e2.title = 'Teller';

SELECT a.account_id, a.product_cd, c.fed_id FROM account a
  INNER JOIN customer c ON a.cust_id = c.cust_id WHERE c.cust_type_cd = 'B'; 

SELECT a.account_id, a.product_cd, c.fed_id FROM account a
  INNER JOIN customer c ON a.cust_id = c.cust_id AND c.cust_type_cd = 'B'; 

SELECT a.account_id, a.product_cd, c.fed_id FROM account a
  INNER JOIN customer c WHERE a.cust_id = c.cust_id AND c.cust_type_cd = 'B';

SELECT e.emp_id, e.fname, e.lname, b.name FROM employee e INNER JOIN <1> b ON e.assigned_branch_id = b.<2>; 
SELECT e.emp_id, e.fname, e.lname, b.name FROM employee e INNER JOIN branch b ON e.assigned_branch_id = b.branch_id;

SELECT a.account_id, c.fed_id from account a    
INNER JOIN  customer c ON a.cust_id = c.cust_id
WHERE c.cust_type_cd = 'I';
