CREATE TABLE sales_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_rep VARCHAR(50),
    region VARCHAR(50),
    product VARCHAR(50),
    month VARCHAR(20),
    sales_amount DECIMAL(10,2)
);



INSERT INTO sales_data (sales_rep, region, product, month, sales_amount) VALUES
('Alice', 'North', 'Laptop', 'Jan', 1200.00),
('Bob', 'South', 'Tablet', 'Jan', 800.00),
('Charlie', 'East', 'Laptop', 'Jan', 950.00),
('David', 'West', 'Phone', 'Jan', 600.00),
('Eva', 'North', 'Tablet', 'Feb', 1100.00),
('Alice', 'North', 'Laptop', 'Feb', 1300.00),
('Bob', 'South', 'Tablet', 'Feb', 850.00),
('Charlie', 'East', 'Laptop', 'Feb', 1000.00),
('David', 'West', 'Phone', 'Feb', 700.00),
('Eva', 'North', 'Tablet', 'Mar', 1200.00),
('Alice', 'North', 'Laptop', 'Mar', 1250.00),
('Bob', 'South', 'Tablet', 'Mar', 900.00),
('Charlie', 'East', 'Laptop', 'Mar', 1050.00),
('David', 'West', 'Phone', 'Mar', 650.00),
('Eva', 'North', 'Tablet', 'Apr', 1150.00),
('Alice', 'North', 'Laptop', 'Apr', 1400.00),
('Bob', 'South', 'Tablet', 'Apr', 950.00),
('Charlie', 'East', 'Laptop', 'Apr', 1100.00),
('David', 'West', 'Phone', 'Apr', 800.00),
('Eva', 'North', 'Tablet', 'May', 1180.00),
('Alice', 'North', 'Laptop', 'May', 1350.00);



use windowfunctions;
show tables;

select * from sales1;
select * from sales_data;

-- 1. Rank sales reps by their total sales within each month.
-- (Use RANK() function with PARTITION BY month) 

SELECT 
    month,
    sales_rep,
    SUM(sales_amount) AS total_sales,
    RANK() OVER(PARTITION BY month ORDER BY SUM(sales_amount) DESC) AS sales_rank
FROM 
    sales_data
GROUP BY 
    month, sales_rep;
    
    
select sales_rep,month, sales_amount, rank() over(partition by month order by sales_amount desc) 
as total_sale from sales_data;


-- 2. Show the cumulative (running) total of sales for each sales rep across months.
-- (Use SUM() as a window function ordered by month)

SELECT 
    sales_rep,
    month,
    sales_amount,
    SUM(sales_amount) OVER (
        PARTITION BY sales_rep 
        ORDER BY FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr', 'May')
    ) AS running_total
FROM 
    sales_data;
    
    
-- 3. Find the average monthly sales amount for each region.
-- (Use AVG() with PARTITION BY region)


SELECT 
    region,
    sales_rep,
    month,
    sales_amount,
    AVG(sales_amount) OVER(PARTITION BY region) AS avg_sales_by_region
FROM 
    sales_data;

-- 4. Compare each month’s sales amount with the previous month&#39;s sales for each
-- sales rep.
-- (Use LAG() window function)

SELECT 
    sales_rep,
        month,
            sales_amount,
                LAG(sales_amount) OVER(
                        PARTITION BY sales_rep 
                                ORDER BY FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr', 'May')
                                    ) AS previous_month_sales,
                                        sales_amount - LAG(sales_amount) OVER(
                                                PARTITION BY sales_rep 
                                                        ORDER BY FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr', 'May')
                                                            ) AS difference_from_previous
                                                            FROM 
                                                                sales_data;
                                                                