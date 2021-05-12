-- DATA ANALYSIS

-- DISPLAY TABLES
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM departments;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 	e.emp_no AS "Employee Number", 
		e.last_name AS "Last Name", 
		e.first_name AS "First Name", 
		e.sex AS "Sex", 
		s.salary AS "Salary"
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT 	e.first_name AS "First Name", 
		e.last_name AS "Last Name", 
		e.hire_date AS "Hire Date"
FROM employees AS e
WHERE e.hire_date > '1985-12-31' AND e.hire_date <'1987-01-01'
ORDER BY e.hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 	d.dept_no AS "Department Number",
		d.dept_name AS "Department Name",
		dm.emp_no AS "Manager Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name"
FROM dept_manager AS dm
JOIN departments AS d ON (d.dept_no = dm.dept_no)
JOIN employees AS e ON (dm.emp_no = e.emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 	e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM dept_emp AS de
JOIN departments AS d ON (de.dept_no = d.dept_no)
JOIN employees AS e ON (e.emp_no = de.emp_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 	e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.sex AS "Sex"
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 	e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM dept_emp AS de
JOIN departments AS d ON (de.dept_no = d.dept_no)
JOIN employees AS e ON (e.emp_no = de.emp_no)
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 	e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM dept_emp AS de
JOIN departments AS d ON (de.dept_no = d.dept_no)
JOIN employees AS e ON (e.emp_no = de.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name AS "Last Name", 
COUNT(last_name) AS "Frequency Counts"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Counts" DESC;

--------------------------------------------------------------------------------------------------------------------

-- Epilogue - Search you employee ID number 499942

SELECT first_name AS "First Name", last_name AS "Last Name"
FROM employees
WHERE emp_no = '499942';