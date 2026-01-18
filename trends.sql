SELECT * FROM pizza_sales

--daily trend
SELECT 
	DATENAME(DW, order_date) as order_day,
	COUNT(DISTINCT order_id) As Total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


--hourly trend
SELECT 
	DATEPART(HOUR, order_time) AS order_hours,
	COUNT(DISTINCT order_id) As Total_orders 
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--percentage of sales by pizza category
SELECT 
	pizza_category,
	SUM(total_price) as Total_sales,
	SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales) AS percentage_total_sales
FROM pizza_sales
GROUP BY pizza_category

--percentage of sales by pizza size
SELECT 
	pizza_size,
	SUM(total_price) as Total_sales,
	SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales) AS percentage_total_sales
FROM pizza_sales
GROUP BY pizza_size

-- total pizza sold by pizza category
SELECT 
	pizza_category,
	SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category

--top 5 best sellers by total pizza sold
SELECT TOP 5
	pizza_name,
	SUM(quantity) AS Total_Pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

--bottom 5 worst seller by total pizza sold
SELECT TOP 5
	pizza_name,
	SUM(quantity) AS Total_Pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity)ASC


