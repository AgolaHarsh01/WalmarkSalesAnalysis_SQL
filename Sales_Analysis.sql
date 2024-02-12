--	-------------------------------------------------------------------
--	--------------------- Sales Analysis ------------------------------
--  -------------------------------------------------------------------

--1. Number of sales made in each time of the day per weekday
	
	select day_name
		,ROUND(SUM(Total),2) As Total_Revenue
	from WalmartSalesData
	group by day_name
	order by Total_Revenue DESC

	SELECT
		time_of_day
		,COUNT(*) AS total_sales
	FROM WalmartSalesData
	WHERE day_name = 'Sunday'
	GROUP BY time_of_day 
	ORDER BY total_sales DESC;

--2. Which of the customer types brings the most revenue?
	
	select Customer_type
		,ROUND(SUM(Total),2) AS Total_Revenue 
	from WalmartSalesData
	group by Customer_type
	order by Total_Revenue DESC
	
--3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
	
	select City
		,ROUND(AVG(Tax_5),2) AS Avg_Tax
	from WalmartSalesData
	group by City
	order by Avg_Tax DESC

--4. Which customer type pays the most in VAT?
	
	select Customer_type
		,ROUND(AVG(Tax_5),2) AS Avg_Tax
	from WalmartSalesData
	group by Customer_type
	order by Avg_Tax DESC