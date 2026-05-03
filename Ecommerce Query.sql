create database ecommerce_db;
use ecommerce_db;
select * from dbo.ecommerce;
#-------- i will copy this dataset because in case data Maintained data integrity by working on duplicate datasets before applying transformations to source data
select * into ecom
from dbo.ecommerce;
select * from ecom;
--Q1) Find total net revenue?
select sum(Net_Revenue) as total_revenue from ecom;

--Q2) Count total number of orders?
select count(Order_ID) as total_orders from ecom;

--Q3) Find total revenue for each category?
select category , 
sum(Net_Revenue) as total_revenue 
from ecom  
group by category 
order  by total_revenue desc;

--Q4) Which cities generate the highest revenue?
select top 5 city , sum(Net_Revenue) as total_revenue from ecom group by city order by total_revenue;

--Q5) What is the average order value?
select avg(Total_Order_value) as avg_value from ecom;

--Q6) Show revenue month-wise?
select Month ,sum(Net_Revenue) as monthly_revenue from ecom group by MONTH order by monthly_revenue DESC;

--Q7) Which states generate highest profit?
select state , sum(profit) as total_profit from ecom group by state order by total_profit desc;

select * from ecom;

--Q8) Compare repeat and new customers?
select Repeat_Customer ,count(*) as total_Repeat_customer from ecom group by Repeat_Customer;

--Q9) Which products generate most revenue?
select top 5 product_Name , sum(Net_Revenue) as total_Revenue from ecom group by product_Name order by total_Revenue DESC;

----Q10)Count orders by status (Delivered, Cancelled, etc.)
select Order_Status , count(*) as total_count from ecom group by Order_Status;

----Q11) Rank Products by Revenue
select Product_Name , sum(Net_Revenue) as total_revenue , RANK() over(order by sum(Net_Revenue) DESC) as RN from ecom
group by product_Name;
