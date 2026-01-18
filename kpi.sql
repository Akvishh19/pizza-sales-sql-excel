--1
SELECT 
	SUM(total_price) AS Total_Revenue
FROM pizza_sales

--2
SELECT 
	COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales

SELECT 
	SUM(total_price)/COUNT(DISTINCT order_id) AS Average_order_value
FROM pizza_sales

--3
SELECT 
	SUM(quantity) AS Total_pizza_sold 
FROM pizza_sales

--4
SELECT 
	COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales

--5
SELECT 
	CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
	CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS Avg_pizzas_per_order FROM pizza_sales