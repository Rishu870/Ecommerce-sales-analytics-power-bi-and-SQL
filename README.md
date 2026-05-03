# Ecommerce-sales-analytics-power-bi-and-SQL
End-to-end ecommerce sales analytics project using SQL, ETL, and Power BI. This project includes data cleaning, transformation, and an interactive dashboard to analyze revenue, profit, customer behavior, and sales trends for data-driven decision-making.

-- =========================================================
-- 📊 Ecommerce Sales SQL Analysis (Top 11 Queries)
-- Author: Rishu Raj
-- =========================================================

-- 🔹 1. Total Revenue
SELECT SUM([Net Revenue (?)]) AS Total_Revenue
FROM ecommerce_sales;


-- 🔹 2. Total Orders
SELECT COUNT(DISTINCT [Order ID]) AS Total_Orders
FROM ecommerce_sales;


-- 🔹 3. Total Profit
SELECT SUM([Profit (?)]) AS Total_Profit
FROM ecommerce_sales;


-- 🔹 4. Average Order Value (AOV)
SELECT AVG([Total Order Value (?)]) AS Avg_Order_Value
FROM ecommerce_sales;


-- 🔹 5. Revenue by Category
SELECT Category,
       SUM([Net Revenue (?)]) AS Revenue
FROM ecommerce_sales
GROUP BY Category
ORDER BY Revenue DESC;


-- 🔹 6. Top 5 Cities by Revenue
SELECT TOP 5 City,
       SUM([Net Revenue (?)]) AS Revenue
FROM ecommerce_sales
GROUP BY City
ORDER BY Revenue DESC;


-- 🔹 7. Monthly Sales Trend
SELECT Month,
       SUM([Net Revenue (?)]) AS Monthly_Revenue
FROM ecommerce_sales
GROUP BY Month
ORDER BY Monthly_Revenue DESC;


-- 🔹 8. Order Status Analysis
SELECT [Order Status],
       COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY [Order Status];


-- 🔹 9. Top 5 Products by Revenue
SELECT TOP 5 [Product Name],
       SUM([Net Revenue (?)]) AS Revenue
FROM ecommerce_sales
GROUP BY [Product Name]
ORDER BY Revenue DESC;


-- 🔹 10. Revenue by Payment Mode
SELECT [Payment Mode],
       SUM([Net Revenue (?)]) AS Revenue
FROM ecommerce_sales
GROUP BY [Payment Mode]
ORDER BY Revenue DESC;


-- 🔹 11. Rank Products by Revenue (Window Function)
SELECT [Product Name],
       SUM([Net Revenue (?)]) AS Revenue,
       RANK() OVER (ORDER BY SUM([Net Revenue (?)]) DESC) AS Rank_No
FROM ecommerce_sales
GROUP BY [Product Name];
