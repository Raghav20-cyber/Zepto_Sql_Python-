USE startersql;
/*DROP TABLE IF EXISTS zepto;
CREATE TABLE zepto(

Category VARCHAR(180),
name VARCHAR(100) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(7,5),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,3),
weightInGms INTEGER,
outOfStock VARCHAR(10),
quantity INTEGER
);*/

-- Count rows for confirmation of data importing
-- SELECT COUNT(*) FROM zepto;

-- Sample data
/*SELECT * FROM zepto
LIMIT 10;*/

-- NULL values
/*SELECT * FROM zepto
WHERE name IS NULL
or
mrp IS NULL
or
discountPercent IS NULL
or
Category IS NULL
or
availableQuantity IS NULL
or
discountedSellingPrice IS NULL
or
weightInGms IS NULL
or
outOfStock IS NULL
or
quantity IS NULL*/

-- Different product categories
/*SELECT DISTINCT Category 
FROM zepto
ORDER BY Category;*/

-- Products in stock vs out of stock
/*SELECT outOfStock, COUNT(*)
FROM zepto
GROUP BY outOfStock;*/

-- Repeating products name
/*SELECT name, COUNT(*) AS total_count
FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;*/

-- DATA CLEANING
-- Products with price 0
/*SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto 
WHERE mrp = 0;*/

-- Convert paise into Inr
/*UPDATE zepto
SET mrp = mrp/100,
discountedSellingPrice = discountedSellingPrice/100;
 SELECT mrp FROM zepto*/
 
 -- data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
/*SELECT name, discountPercent
 FROM zepto
 ORDER BY discountPercent DESC 
 LIMIT 10;*/
 
 -- Q2.What are the Products with High MRP but Out of Stock
/* SELECT DISTINCT name,mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;*/

-- Q3.Calculate Estimated Revenue for each category
/* SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;*/

/*UPDATE zepto
SET category = 'Dairy,Bread&Butter'
WHERE category = 'Dairy,Bread&Batter';*/

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

-- Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
-- Using window function to give ranks
SELECT name,
       category,
       discountedSellingPrice,
       RANK() OVER (PARTITION BY category ORDER BY discountedSellingPrice DESC) AS price_rank
FROM zepto;






 
 
 




