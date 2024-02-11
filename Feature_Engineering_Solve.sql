--**Feature Engineering:**--

select Time,(
	CASE
		WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
		WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'Evening' 
		ELSE 'Evenig'
	END
)AS Time_of_date
from WalmartSalesData;

---------------------------------------------------------------------------------------
ALTER TABLE [dbo].[WalmartSalesData]
ADD time_of_day VARCHAR(20) NULL;

UPDATE WalmartSalesData
set time_of_day=(
CASE
		WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
		WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'Evening' 
		ELSE 'Evenig'
	END
)
---------------------------------------------------------------------------------------
ALTER TABLE [dbo].[WalmartSalesData]
ADD day_name VARCHAR(20) NULL;

UPDATE WalmartSalesData
set day_name=(
	
	DATENAME(WEEKDAY,Date) 
)
----------------------------------------------------------------------------------------
ALTER TABLE [dbo].[WalmartSalesData]
ADD month_name VARCHAR(20) NULL;

UPDATE WalmartSalesData
set month_name=(
	DATENAME(MONTH,Date) 
)
