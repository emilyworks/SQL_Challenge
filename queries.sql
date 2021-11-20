
-- 1) list the following details of each employee: 
--employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s 
ON e.emp_no = s.emp_no;

--2) list first name, last name, and hire date for employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date LIKE '%1986%';

--3) list the manager of each dept with the following information: 
--dept number, dept name, manager's employee number, last name, first name
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS m
ON d.dept_no = m.dept_no
JOIN employees AS e
ON e.emp_no = m.emp_no;

--4) List the dept of each employee w/ the following info:
-- employee number, last name, first name, and dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no;

--5) list first name, last name, and sex for employees whose first name is 'Hercules'
--and last names begin with 'B'
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6) list all employees in the sales dept
-- including employee number, last name, first name, dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7) list all employees the sales and development depts
-- including emp number, last name, first name, dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Development' OR dept_name = 'Sales';

--8) in descending order, list frequency count of employee last names
--i.e. how many employees share each last name
SELECT last_name, COUNT(emp_no) AS "Number of Employees"
FROM employees
GROUP BY last_name
ORDER BY "Number of Employees" desc;
