select top(5) * from SuperStore_Data;

-- EDA
-- 1- Sales by City
-- 2- Customers by Transactions
-- 3- Sales by Segment
-- 4- Customer Segmentation Based on Sales
-- 5- Sales over Time (Years, Months, Days)

-- 1- Sales by City

Select top(5) City, Round(sum(Sales), 0) as Total_Sales
from SuperStore_Data
GROUP BY City
Order by Total_Sales desc;

-- 2- Customers by Transactions

Select top(5) Customer_Name, Count(Order_ID) as Tran_Num
from SuperStore_Data
Group By Customer_Name
Order By Tran_Num desc;

-- 4- Customer Segmentation Analysis

Create View Customer_Levels As

Select Customer_Name,Round(sum(sales),0) as Total_Sales,
  Case
    when sum(sales) > 10000 then 'VIP Customer'
    when sum(sales) > 5000 then 'AVG Customer'
    else 'Normal Customer'
End as Customer_Level

from SuperStore_Data
Group By Customer_Name;

select * from Customer_Levels;

Select Customer_Level, Count(Customer_Level) as Customer_Count
from Customer_Levels
Group By Customer_Level;