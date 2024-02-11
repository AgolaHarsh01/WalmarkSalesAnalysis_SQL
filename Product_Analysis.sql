--	-------------------------------------------------------------------
--	---------------------------- Generic ------------------------------
--  -------------------------------------------------------------------

--1. How many unique cities does the data have?

SELECT 
	DISTINCT(City) 
FROM WalmartSalesData

--2. In which city is each branch?

SELECT 
	DISTINCT(city)
	,branch
FROM WalmartSalesData;


--	-------------------------------------------------------------------
--	------------------- Product Analysis ------------------------------
--  -------------------------------------------------------------------

--1. How many unique product lines does the data have?

	SELECT DISTINCT(Product_line) 
	FROM WalmartSalesData

--2. What is the most common payment method?
	
	SELECT payment
		,COUNT(payment) AS Number_Of_Taransacation  
	FROM WalmartSalesData
	GROUP BY Payment
	ORDER BY Number_Of_Taransacation DESC

--3. What is the most selling product line?

	SELECT * FROM WalmartSalesData

--4. What is the total revenue by month?
	
	SELECT month_name
		,round(SUM(Total),2) AS Revenu
	FROM WalmartSalesData 
	GROUP BY month_name

--5. What month had the largest COGS?

	SELECT month_name
		,round(SUM(cogs),1) AS COGS 
	FROM WalmartSalesData
	GROUP BY month_name
	ORDER BY COGS DESC

--6. What product line had the largest revenue?

	SELECT Product_line
		,ROUND(sum(Total),2) Total_Revunue
	FROM WalmartSalesData
	GROUP BY Product_line
	ORDER BY Total_Revunue DESC

--7. What is the city with the largest revenue?
	
	select City
		,ROUND(SUM(Total),2) AS Total_Revenue 
	FROM WalmartSalesData
	GROUP BY City
	ORDER BY Total_Revenue DESC
--8. What product line had the largest VAT?

	select Product_line
		,AVG(Tax_5) AS Avg_VAT
	FROM WalmartSalesData
	GROUP BY Product_line
	ORDER BY Avg_VAT DESC

--9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

	SELECT Product_line
		,AVG(Quantity) As Avg_Quantity
		,CASE
			WHEN AVG(Quantity) > 6 THEN 'GOOD'
			ELSE 'BED'
		END
		AS REMARK
	FROM WalmartSalesData
	GROUP BY Product_line
	
--10. Which branch sold more products than average product sold?
	
	select Branch
		,SUM(Quantity) AS Quantity
		,AVG(Quantity) AS Avg_Quantity
	FROM WalmartSalesData
	GROUP BY Branch

--11. What is the most common product line by gender?
		
	select Product_line
		,Gender
		,count(Gender) AS Total_Count
	FROM WalmartSalesData
	GROUP BY Product_line,Gender
	ORDER BY Total_Count DESC


--12. What is the average rating of each product line?
	
	select Product_line
		,ROUND(AVG(Rating),1) AS Avg_Rating 
	FROM WalmartSalesData
	GROUP BY Product_line