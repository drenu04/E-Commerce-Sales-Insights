create database sales_data;
use sales_data;

DESCRIBE online_sales_data;
SHOW COLUMNS FROM online_sales_data;

SELECT Date FROM online_sales_data LIMIT 10;

ALTER TABLE online_sales_data
MODIFY COLUMN Date DATE;

SELECT Date, DAYNAME(Date) AS Day, MONTHNAME(Date) AS Month
FROM online_sales_data
LIMIT 10;

SELECT SUM(`Total Revenue`) AS Total_Revenue
FROM online_sales_data;

SELECT SUM(`Units Sold`) AS Total_Units_Sold
FROM online_sales_data;

SELECT SUM(`Total Revenue`)/COUNT(DISTINCT `Transaction ID`) AS Avg_Order_Value
FROM online_sales_data;

SELECT DATE_FORMAT(Date, '%Y-%m') AS Month,
       SUM(`Total Revenue`) AS Revenue
FROM online_sales_data
GROUP BY Month
ORDER BY Month;

SELECT Region, SUM(`Total Revenue`) AS Revenue
FROM online_sales_data
GROUP BY Region
ORDER BY Revenue DESC;

SELECT `Product Name`, SUM(`Total Revenue`) AS Revenue
FROM online_sales_data
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 5;

SELECT `Payment Method`, SUM(`Total Revenue`) AS Revenue
FROM online_sales_data
GROUP BY `Payment Method`
ORDER BY Revenue DESC;

SELECT Date, SUM(`Total Revenue`) AS Daily_Revenue
FROM online_sales_data
GROUP BY Date
ORDER BY Date;

-- optimization in SQL
-- Bad
SELECT * FROM online_sales_data WHERE Region='Asia';

-- Good
SELECT `Product Name`, `Total Revenue`
FROM online_sales_data
WHERE Region='Asia';

-- Instead of calculating total revenue for each row with a subquery
SELECT SUM(`Units Sold` * `Unit Price`) AS Revenue
FROM online_sales_data;

SELECT Region, SUM(`Total Revenue`) AS Revenue
FROM online_sales_data
WHERE Date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY Region;

EXPLAIN SELECT SUM(`Total Revenue`) AS Revenue FROM online_sales_data WHERE Region='Asia';

SELECT SUM(`Total Revenue`) 
FROM online_sales_data 
WHERE Date BETWEEN '2024-01-01' AND '2024-12-31';

EXPLAIN
SELECT SUM(`Total Revenue`) AS Revenue
FROM online_sales_data
WHERE Region='Asia';

CREATE INDEX idx_region ON online_sales_data(Region(50));
CREATE INDEX idx_date ON online_sales_data(Date);

CREATE INDEX idx_product_name ON online_sales_data(`Product Name`(100));
CREATE INDEX idx_product_category ON online_sales_data(`Product Category`(50));


SELECT DATE_FORMAT(Date, '%Y-%m') AS Month,
       SUM(`Total Revenue`) AS Revenue
FROM online_sales_data
WHERE Date BETWEEN '2024-01-01' AND '2024-08-31'
GROUP BY Month
ORDER BY Month;

SELECT Region, SUM(`Total Revenue`) AS Revenue
FROM online_sales_data
WHERE Region IS NOT NULL
GROUP BY Region
ORDER BY Revenue DESC;
