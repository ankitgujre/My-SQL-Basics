drop database pizza_sales;
use pizza_sales;
select * from order_details;
select * from orders;
select * from pizza_types;
select * from pizzas;
select category, name, count(category) over (partition by category) from pizza_types;