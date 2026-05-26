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

## 7. Sample Query 
```sql
- Identify slow-moving products
SELECT product_id , product_name , SUM(quantity) AS total_sold
FROM sales
GROUP BY product_id , product_name
HAVING SUM(quantity) < 50
ORDER BY total_sold ASC;  ```

## 8. Sales and Inventory Dashboard Screenshot.

  













