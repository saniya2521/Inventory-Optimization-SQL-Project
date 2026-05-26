# Inventory-Optimization-SQL-Project
Data analytics project using SQL to evaluate warehouse efficiency , identify slow-moving products , and recommend inventory optimization strategies 

## 1. Overview 
SQL project analyzing warehouse inventory data to optimize stock levels and improve efficiency.

## 2. Tools and Technologies 
- SQL (Joins , Subqueries , Aggregations)
- MySQL Workkbench
- Excel 
- Power BI

## 3. Project Structure 
- exploration.sql   
- analysis.sql
- strategic_analysis.sql
- results 
- README.md 

## 4. Key Insights 
- Inventory distribution across warehouse 
- Identification of slow-moving products 
- Sales trend analysis 
- Strategic analysis and optimization

## 5. Resume-Ready Highlight 
* Designed and executed SQL queries to analyze inventory distribution , sales trends , and warehouse efficiency . Deliver actionable inventory reduction , supported by query outputs and business insights .*

## 6. Results and recommendations 
- Warehouse B shows redundant inventory with low turnover.
- Reallocate fast-moving products from Warehouse B to Warehouse A and C.
- Bundle slow-moving products with popular items to increase turnover.
- Offer discounts on aging inventory to free up warehouse space.
- Use productive analytics to forecast seasonal demand more accurately.

## 7. Sales and Inventory Dashboard Screenshot.
[image alt] (image_url) https://github.com/saniya2521/Inventory-Optimization-SQL-Project/blob/a09f142a22e12ab8d17ad6ed047666d013c0d7d5/sales%20and%20inventory.png

## 📊 Results & Recommendations

### Results
- Total Customers: 122
- Total Orders: 326
- Total Products Sold: 106K
- Total Revenue: 9.60M
- Sales Peak: 717 units in a single order

### Recommendations
- Promote top sellers (Ferrari 360 Spider, Harley Davidson Utility).
- Discount or bundle slow movers (Jaguar XK 120, Lancia Delta).
- Monitor seasonal demand peaks (Q4 2004).
- Balance stock vs sales to reduce holding costs.

**Findings:**  
The dashboard highlights strong performers like the Ferrari 360 Spider, seasonal peaks in late 2004, and clear gaps between inventory and sales for certain models. These insights support targeted promotions, inventory adjustments, and seasonal planning.

## 8. Sample Query 
```sql
- Identify slow-moving products
SELECT 
    p.productCode,
    p.productName,
    SUM(od.quantityOrdered) AS total_sold
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName
HAVING SUM(od.quantityOrdered) < 5000
ORDER BY total_sold ASC; ```
Result:  
This query highlights products with fewer than 5000 units sold, flagging them as slow movers. These insights support inventory reduction strategies such as discounting, bundling with popular items, or reallocation across warehouses.

  













