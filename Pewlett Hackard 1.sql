DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- Create new tables
CREATE TABLE departments (
    dept_no VARCHAR(30) PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

);

ALTER TABLE dept_emp
ADD COLUMN id SERIAL PRIMARY KEY;

CREATE TABLE dept_manager (
    emp_no INT,
	dept_no VARCHAR(30),
	PRIMARY KEY (emp_no, dept_no), 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

);

CREATE TABLE employees (
    emp_no INT,
    emp_title_id VARCHAR(30),
    birth_date VARCHAR(30) NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(30),
    hire_date VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no, emp_title_id),
	FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)

);

ALTER TABLE employees
ADD CONSTRAINT unique2_emp_no UNIQUE (emp_no);

ALTER TABLE employees
ADD CONSTRAINT unique_emp_title_id UNIQUE (emp_title_id);

CREATE TABLE salaries (
    emp_no INT,
    salary VARCHAR(30),
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);

CREATE TABLE titles (
    emp_title_id VARCHAR(30) PRIMARY KEY,
    title VARCHAR(100),
	FOREIGN KEY (emp_title_id) REFERENCES employees(emp_title_id)


);

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

