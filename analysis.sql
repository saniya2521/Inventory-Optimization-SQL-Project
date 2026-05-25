-- analysis.sql
-- Mint Classics Database Analysis 
-- Purpose : Investigate warehouse closure decision using sales and inventory data 

 USE mintclassics ; 
 
 -- 1. Total inventory by warehouse .
 SELECT warehouseCode , SUM(quantityInStock) AS total_stock 
 FROM products 
 GROUP BY warehouseCode 
 ORDER BY total_stock DESC ; 
 
 
 -- 2. Product sales volume by warehouse .
 SELECT p.warehouseCode , p.productCode , p.productName , 
		SUM(od.quantityOrdered) AS total_sold 
FROM products p 
JOIN orderdetails od ON p.productCode = od.productCode 
GROUP BY p.productCode , p.productCode , p.productName 
ORDER BY total_sold DESC ;        
        
-- By doing this the insight we get is about warehouse performance , which warehouse product is handling the most product sales overall.


-- 3. Top 10 best - selling prooducts overall .
SELECT p.productCode , p.productName ,
       SUM(quantityOrdered) AS total_sold
FROM products p 
JOIN orderdetails od ON p.productCode = od.productCode 
GROUP BY p.productCode , p.productName 
ORDER BY total_sold DESC 
LIMIT 10 ;


-- 4. Identify slow-moving product sales (lowest) .
SELECT p.productCode , p.productName , p.warehouseCode ,
	   SUM(quantityOrdered) AS total_sold
FROM products P 
JOIN orderdetails od ON p.productCode = od.productCode 
GROUP BY p.productCode , p.productName , p.warehouseCode 
ORDER BY total_sold ASC
LIMIT 10;


-- 5. What if analysis : reduce stock by 10% .
SELECT warehouseCode ,
	SUM(quantityInStock) AS current_stock ,
	SUM(quantityInStock * 0.90 ) AS reduced_stock
FROM products 
GROUP BY warehouseCode;


-- 6.  Count shipped orders .
SELECT COUNT(status )  AS shipped_orders
FROM orders 
WHERE status = 'shipped' ; 

-- 7. Customer recent order activity .
SELECT c.customerName , o.orderNumber , o.orderDate , o.status
FROM customers c 
JOIN orders o ON c.customerNumber = o.customerNumber
ORDER BY o.orderDate DESC
LIMIT 10;


-- End of analysis.sql