create database subqueriesDummy;
use subqueriesDummy;

CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
dept_id INT,
salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(100)
);

CREATE TABLE Projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(100),
dept_id INT
);

CREATE TABLE Timesheets (
timesheet_id INT PRIMARY KEY,
emp_id INT,
project_id INT,
hours_worked INT
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

INSERT INTO Employees (emp_id, emp_name, dept_id, salary) VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 2, 60000),
(103, 'Charlie', 3, 75000),
(104, 'David', 3, 70000),
(105, 'Eve', 2, 55000),
(106, 'Frank', 4, 45000),
(107, 'Grace', 3, 80000),
(108, 'Heidi', 4, 47000),
(109, 'Ivan', 3, 72000),
(110, 'John', 1, 49000);

INSERT INTO Projects (project_id, project_name, dept_id) VALUES
(201, 'Payroll System', 2),
(202, 'Website Redesign', 4),
(203, 'AI Model', 3),
(204, 'HR Onboarding', 1),
(205, 'Marketing Analytics', 4);

INSERT INTO Timesheets (timesheet_id, emp_id, project_id, hours_worked) VALUES
(1, 101, 204, 10),
(2, 102, 201, 15),
(3, 103, 203, 25),
(4, 104, 203, 20),
(5, 105, 201, 30),
(6, 106, 202, 12),
(7, 108, 205, 18),
(8, 109, 203, 22),
(9, 107, 203, 28),
(10, 101, 204, 5),
(11, 104, 201, 8),
(12, 102, 203, 12);

select * from employees;
select * from departments;
select * from Projects;
select * from Timesheets;


# 8. Find the department name of the employee who earns the minimum salary.

select d.dept_name from departments as d join employees e on d.dept_id = e.dept_id where e.salary = 
(select min(salary) from employees);

# 7. Display employee names who work on the same project(s) as employee ID 101.

SELECT 
    e.emp_name
FROM
    employees e
WHERE
    e.emp_id IN (SELECT DISTINCT
            t.emp_id
        FROM
            timesheets t
        WHERE
            t.emp_id = 101);



# 11. Display departments and their average salaries, but only for departments having more than 2 employees.

select dept_id, count(e.emp_id) as employee_count from employees e group by dept_id;