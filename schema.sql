-- Create the tables corresponding to the six CSV files

CREATE TABLE titles(
title_id VARCHAR NOT NULL PRIMARY KEY,
title VARCHAR NOT NULL
);

CREATE TABLE departments(
dept_no VARCHAR NOT NULL PRIMARY KEY,
dept_name VARCHAR NOT NULL
);

CREATE TABLE employees(
emp_no INT NOT NULL PRIMARY KEY,
emp_title_id VARCHAR NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
birth_date VARCHAR,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date VARCHAR
);

CREATE TABLE salaries(
emp_no INT NOT NULL PRIMARY KEY,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INT
);

CREATE TABLE dept_emp(
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager(
dept_no VARCHAR NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (dept_no, emp_no)
);