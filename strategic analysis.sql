-- startegic_analysis_sql
-- Mint Classics Database Strategic analysis 
-- Purose : To identify the underperfoming warehouse and suggest recommendations 

USE mintclassics;

-- 1. Sales to stock ratio per warehouse 
 SELECT p.warehouseCode ,
       SUM(od.quantityOrdered) AS total_sold,
       SUM(p.quantityInStock) AS total_stock,
   (SUM(od.quantityOrdered)/ SUM(p.quantityInStock)) AS sales_to_stock_ratio
FROM products p 
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.warehouseCode 
ORDER BY sales_to_stock_ratio ASC;   

-- By doing this we can get how much product is sold and how much inventory is left . 


-- 2. Identify warehouse with lowest ratio
SELECT p.warehouseCode ,
       SUM(od.quantityOrdered) AS total_sold ,
       SUM(p.quantityInStock) AS total_stock,
       (SUM(od.quantityOrdered) / SUM(p.quantityInStock)) AS sales_to_stock_ratio 
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode 
GROUP BY p.warehouseCode 
ORDER BY sales_to_stock_ratio ASC
LIMIT 1;
       
-- By doing this we can get the lowest ratio of sales stock .



SELECT DISTINCT warehouseCode 
FROM products;

-- 3. Identify the products which are in underperforming of warehouse 
SELECT p.warehouseCode,
       SUM(od.quantityOrdered) AS total_sold,
       SUM(p.quantityInStock) AS total_stock,
       ROUND(SUM(od.quantityOrdered) / SUM(p.quantityInStock), 2 ) AS avg_sales_to_stock_ratio
FROM products p 
LEFT JOIN orderdetails od ON p.productCode = od.productCode
WHERE p.warehouseCode = 'B'
GROUP BY p.warehouseCode;

-- By doing this we will get to know the lists of products in that warehouse for redistribution.


-- 4. Compare demand vs. inventory for redistribution 
SELECT p.productCode , p.productName ,
       SUM(od.quantityOrdered) AS total_sold,
       p.quantityInStock
FROM products p 
JOIN orderdetails od ON p.productCode = od.productCode 
WHERE p.warehouseCode = 'B'       
GROUP BY p.productCode , p.productName , p.quantityInStock 
ORDER BY total_sold DESC;
       
-- By doing this we will get to know about which products should be moved to other warehouses with higher demand.

-- End of stategic_analysis_sql