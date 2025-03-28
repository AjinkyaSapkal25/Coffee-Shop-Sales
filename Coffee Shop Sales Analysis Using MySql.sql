Create database if not exists coffee_sales;

select * from coffeesales;

update coffeesales
set transaction_time = str_to_date(transaction_time , '%H:%i:%s');

alter table coffeesales
modify column transaction_time time;

desc coffeesales;

alter table coffeesales
change column ï»¿transaction_id transaction_id int;


-- Total Sales Analysis

select round(sum(unit_price * transaction_qty)) as total_sales
from coffeesales
where
month(transaction_date) = 5;


SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee sales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for months of April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);


-- Total Orders Analysis

select count(transaction_id) as total_orders
from coffeesales
where month(transaction_date) = 5;


SELECT 
    MONTH(transaction_date) AS month,
    ROUND(count(transaction_id)) AS total_orders,
    (count(transaction_id) - LAG(count(transaction_id), 1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(count(transaction_id), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffeesales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for months of April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);
    
    
    
-- Total Quantity sold

select sum(transaction_qty) as total_quantity
from coffeesales
where month(transaction_date) = 5;


SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(transaction_qty)) AS total_quantity,
    (SUM(transaction_qty) - LAG(SUM(transaction_qty), 1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffeesales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for months of April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);


-- to see matrics for each day 

select 
       concat(round(sum(unit_price * transaction_qty)/1000,1),"k") as Total_Sales,
       concat(round(sum(transaction_qty)/1000,1),"k") as Total_Quantity,
       concat(round(count(transaction_id)/1000,1),"k") as Total_Orders
	from coffeesales
    where transaction_date = "2023-05-18";
    
    
-- Weekdays and Weekends
    
    
select 
      case when dayofweek(transaction_date) in (1,7) then "WeekEnds"
      else "WeekDays"
      end as Day_type,
      concat(round(sum(unit_price * transaction_qty)/1000 , 1),"k") as Total_sales
from coffeesales
where month(transaction_date)  = 5
group by Day_type;

-- total sales by store location

select 
      store_location,
      concat(round(sum(unit_price * transaction_qty)/1000 , 1),"k") as Total_sales
from coffeesales
where month(transaction_date)  = 5
group by store_location
order by Total_sales desc;


-- Avg sales according to month


SELECT concat(round(AVG(Total_Sales)/1000,1),"k") AS Average_Sales
FROM (
    SELECT 
        SUM(unit_price * transaction_qty) AS Total_Sales
    FROM 
        coffeesales
	WHERE 
        MONTH(transaction_date) = 5  -- Filter for May
    GROUP BY 
        transaction_date
) AS internal_query;


-- Dialy sales perticular month

SELECT 
    DAY(transaction_date) AS day_of_month,
    ROUND(SUM(unit_price * transaction_qty),1) AS total_sales
FROM 
    coffeesales
WHERE 
    MONTH(transaction_date) = 5  -- Filter for May
GROUP BY 
    day_of_month
ORDER BY 
    day_of_month;
    

-- above avg below avg

SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        DAY(transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffeesales
    WHERE 
        MONTH(transaction_date) = 5  -- Filter for May
    GROUP BY 
        DAY(transaction_date)
) AS sales_data
ORDER BY 
    day_of_month;


-- sales per product category

SELECT 
	product_category,
	ROUND(SUM(unit_price * transaction_qty),1) as Total_Sales
FROM coffeesales
WHERE
	MONTH(transaction_date) = 5 
GROUP BY product_category
ORDER BY SUM(unit_price * transaction_qty) DESC;


-- top 10 products by sale

SELECT 
	product_type,
	ROUND(SUM(unit_price * transaction_qty),1) as Total_Sales
FROM coffeesales
WHERE
	MONTH(transaction_date) = 5 
GROUP BY product_type
ORDER BY Total_Sales DESC
LIMIT 10;

-- sales  analysis by day and hours

SELECT 
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales,
    SUM(transaction_qty) AS Total_Quantity,
    COUNT(*) AS Total_Orders
FROM 
    coffeesales
WHERE 
    DAYOFWEEK(transaction_date) = 3 -- Filter for Tuesday (1 is Sunday, 2 is Monday, ..., 7 is Saturday)
    AND HOUR(transaction_time) = 8 -- Filter for hour number 8
    AND MONTH(transaction_date) = 5; -- Filter for May (month number 5);
    
    
    
-- TO GET SALES FOR ALL HOURS FOR MONTH OF MAY

SELECT 
    HOUR(transaction_time) AS Hour_of_Day,
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM 
    coffeesales
WHERE 
    MONTH(transaction_date) = 5 -- Filter for May (month number 5)
GROUP BY 
    HOUR(transaction_time)
ORDER BY 
    HOUR(transaction_time);


-- TO GET SALES FROM MONDAY TO SUNDAY FOR MONTH OF MAY

SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END AS Day_of_Week,
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM 
    coffeesales
WHERE 
    MONTH(transaction_date) = 5 -- Filter for May (month number 5)
GROUP BY 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END;




