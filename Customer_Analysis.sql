---------------------------------------------------------------------
----------------------- Customer Analysis ---------------------------
---------------------------------------------------------------------


--1. How many unique customer types does the data have?
	
	select DISTINCT(Customer_type)  AS Customer_Type
	from WalmartSalesData

--2. How many unique payment methods does the data have?
	
	select DISTINCT(Payment)  AS Customer_Type
	from WalmartSalesData


--3. What is the most common customer type?
	
	select Customer_type
		,COUNT(Invoice_ID) AS Total_Transaction
	from WalmartSalesData
	group by Customer_type
	order by Total_Transaction DESC

--4. Which customer type buys the most?

	select Customer_type
		,ROUND(SUM(Total),2) Total_Amount
	from WalmartSalesData
	group by Customer_type
	order by Total_Amount DESC

--5. What is the gender of most of the customers?
		
		select Gender
			,COUNT(DISTINCT(Invoice_ID)) AS Total_Customer
		from WalmartSalesData
		group by Gender
		order by Total_Customer DESC

--6. What is the gender distribution per branch?

		select Branch 
			,Gender
			,COUNT(DISTINCT(Invoice_ID)) AS Total_Customer
		from WalmartSalesData
		group by Branch,Gender
		order by Branch 
	
--7. Which time of the day do customers give most ratings?
	
	select * from WalmartSalesData

	select day_name
		,COUNT(Rating) AS Total_Count_Of_Rating
	from WalmartSalesData
	group by day_name
	order by Total_Count_Of_Rating DESC

--8. Which time of the day do customers give most ratings per branch?
	
	WITH SubQuery AS
	(
		select Branch 
			,day_name
			,COUNT(Rating) AS Total_Count_Of_Rating
		from WalmartSalesData
		group by Branch,day_name
	) 
	select *
		,Rank() OVER(partition by Branch order by Total_Count_Of_Rating DESC) AS RankRating
	from SubQuery
	--WHERE ra
	

	----------------------------------------------------------------------------------------------------
	
	select --Branch
		--,day_name
		--,Total_Count_Of_Rating
		*,Rank() OVER(partition by Branch order by Total_Count_Of_Rating DESC) AS Rank_Rating
	FROM
	(
		select Branch 
			,day_name
			,COUNT(Rating) AS Total_Count_Of_Rating
		from WalmartSalesData
		group by Branch,day_name
	) As Tanble_outer
	
	
	

--9. Which day fo the week has the best avg ratings?
	
	select day_name
		,AVG(Rating) AS Avg_Rating
	from WalmartSalesData
	group by day_name
	order by Avg_Rating DESC

--10. Which day of the week has the best average ratings per branch?

	WITH SubQuery AS
	(
		select Branch
			,day_name
			,AVG(Rating) AS Avg_Rating
		from WalmartSalesData
		group by day_name,Branch
	)
	select *
		,RANK() OVER(partition by Branch ORDER BY Avg_Rating DESC) AS RankRating
	from SubQuery
	order by Branch
	