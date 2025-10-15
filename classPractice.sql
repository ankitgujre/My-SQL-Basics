use dummyClass;
select * from customers;
select * from emp;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;

-- # 1 Retrieve the customers whose creditLimit is above the average credit limit of all customers.

select customerName from customers where creditLimit > (select avg(creditLimit) from customers);

-- #using join 

# 2️ Find the customer(s) with the highest credit limit using a subquery.

select customerName from customers where creditLimit = (select max(creditLimit) from customers);

# 3 Get the customers who have placed at least one order (assuming orders table has a customerNumber foreign key).

select c.customerName, c.customerNumber from customers c where customerNumber in (select customernumber from orders);

# 4 Find the customers who haven't made any payments (assuming payments table exists).

# using join 
select c.customerName
from customers c
left join payments p
on c.customerNumber = p.customerNumber
where p.amount is null;


select customerName from customers where customerNumber not in (select customerNumber from payments);


# #5 Get the customers whose credit limit is higher than any customer's credit limit from "New York";.

select customerName from customers where creditlimit > (select max(creditlimit) from customers where city = 'New York');

select customerName from customers where creditlimit > (select max(creditlimit) from customers where city = 'Nantes');

# 6 Find the customer(s) who placed the most orders.

select c.customerName, COUNT(o.orderNumber) as total_orders
from customers c
join orders o on c.customerNumber = o.customerNumber
group by c.customerName
order by total_orders desc
LIMIT 1;

