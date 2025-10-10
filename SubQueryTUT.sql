select * from employees; 
select * from departments;
select * from Projects;
select * from Timesheets;

# 1. Find the names of employees who earn more than the average salary of all employees.

select emp_name from employees where salary > (select avg(salary) from employees);

# 2. List departments whose average employee salary is more than 50,000.

select dept_name from departments where dept_id in (select dept_id from employees group by dept_id having avg(salary) > 50000);

# Display the employee(s) with the highest salary.

SELECT emp_name FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

# 4. Show names of employees who work in the same department as ‘John’.

SELECT emp_name
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM employees
    WHERE emp_name = 'John'
)
AND emp_name = 'John';


