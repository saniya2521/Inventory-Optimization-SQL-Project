-- exploration.sql
-- Mint Classics Database Exploration
-- Purpose : Explore schema , relatinships , and basic distribution 

USE mintclassics;

-- 1. List all tables in database 
SHOW TABLES;


-- 2. View structure of key tables
DESCRIBE products ;
DESCRIBE warehouses ;
DESCRIBE orders ;
DESCRIBE orderdetails ;
DESCRIBE customers ;
DESCRIBE employees ;


-- 3. Count records in each table 
SELECT 'products' AS table_name , COUNT(*) AS row_count FROM products 
UNION
SELECT 'warehouses' , COUNT(*) FROM warehouses
UNION 
SELECT 'orders' , COUNT(*) FROM orders
UNION 
SELECT 'orderdetails' , COUNT(*) FROM orderdetails 
UNION
SELECT 'customers' , COUNT(*) FROM customers
UNION 
SELECT 'employees' , COUNT(*) FROM employees;


-- 4. Sample customer Data 
SELECT customerNumber , customerName , country , creditLimit
FROM customers 
LIMIT 10;


-- 5. Sample orders data 
SELECT orderNumber , customerNumber , orderDate , status
FROM orders 
LIMIT 10;


-- 6. Check products distribution across warehouses
SELECT warehouseCode , COUNT(productCode) AS product_count
FROM products
GROUP BY warehouseCode
ORDER BY product_count DESC;


-- 7. Explore product lines 
SELECT productline, COUNT(productCode) AS num_products
FROM products 
GROUP BY productline
ORDER BY num_products DESC;


-- 8. Basic relationship check of customers and orders 
SELECT c.customerName , o.orderNumber , o.orderDate , o.status 
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber 
LIMIT 10;


-- 9. Inventory levels by warehouse 
SELECT warehouseCode , SUM(quantityInStock) AS total_stock
FROM products 
GROUP BY warehouseCode 
ORDER BY total_stock DESC;


-- 10 . Top 10 products by stock 
SELECT productCode , productName , quantityInStock 
FROM products 
ORDER BY quantityInStock DESC
LIMIT 10;


-- End of exploration.sql

