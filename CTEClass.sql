create database CTEClass;
use CTEClass;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    joining_year INT
);

INSERT INTO employees (emp_id, emp_name, department, salary, joining_year) VALUES
(1, 'Alice', 'HR', 50000, 2020),
(2, 'Bob', 'IT', 60000, 2019),
(3, 'Carol', 'IT', 70000, 2021),
(4, 'David', 'Finance', 65000, 2018),
(5, 'Eva', 'HR', 55000, 2022),
(6, 'Frank', 'Finance', 60000, 2017),
(7, 'Grace', 'IT', 80000, 2016),
(8, 'Helen', 'HR', 52000, 2019),
(9, 'Ian', 'Finance', 58000, 2020),
(10, 'Jack', 'IT', 62000, 2022);

select * from employees;

-- 1. Write a CTE to find the average salary per department.

with dept_avg as (select department, avg(salary) from employees group by department) select * from dept_avg;

-- 6 Using a CTE, get a list of employees along with the count of employees in their department.

-- with emp_count as (select department, count(*) from employees group by department ) select e.emp_id, e.emp_name, e.department, 
-- e.salary, e.joining_year, e1.e_count from employees e join emp_count e1 on
-- e.department = e1.department;



WITH emp_count AS (
  SELECT department, COUNT(*) AS e_count
  FROM employees
  GROUP BY department
)
SELECT 
  e.emp_id, 
  e.emp_name, 
  e.department, 
  e.salary, 
  e.joining_year, 
  e1.e_count
FROM employees e
JOIN emp_count e1 
  ON e.department = e1.department;

-- 2. Using a CTE, list employees whose salary is greater than their department's average.

WITH dept_avg AS (
  SELECT 
    department, 
    AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
) SELECT 
  e.emp_id,
  e.emp_name,
  e.department,
  e.salary,
  d.avg_salary
FROM employees e
JOIN dept_avg d
  ON e.department = d.department WHERE e.salary > d.avg_salary;

with deptAvg as (select department, avg(salary) as avg_salary from employees group by department) select e.emp_id, e.emp_name,
e.department, e.salary, d.avg_salary from employees e join deptAvg d on e.department = d.department
where e.salary > d.avg_salary order by e.salary asc;

-- 7. Create a CTE to list employees who earn below the overall average salary.

select emp_name from employees where avg(salary) < avg(salary) group by sum(salary);

-- with avg_off as (select avg(salary) as avg_salary from employees)
-- select e.emp_name, e.salary


with avg_salary as (select avg(salary) as avg_salary from employees) select e.*
from employees e, avg_salary where e.salary < avg_salary.avg_salary;


-- 3. Write a CTE that selects all employees who joined after the year 2020.

with recentemp as (select emp_name, department, salary, joining_year from employees where joining_year > 2020) select
* from recentemp;

-- 4. Use a CTE to get the highest salary in each department.

with dept_max_salary as (
    select department, MAX(salary) as highest_salary from employees group by department
)select * from dept_max_salary;

-- 5. Write a CTE to get total salary expenditure per department, and then select only those departments where total expenditure is more than 150000.

with dept_salary_expenditure AS (
    select 
        department,
        SUM(salary) AS total_expenditure
    from employees
    group by department
)
select 
    department,
    total_expenditure
from dept_salary_expenditure
where total_expenditure > 150000;



