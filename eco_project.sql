create database ecommers;
drop database ecommers;
create database ecommerce;
drop database ecommerce;
use ecommerce;
select * from ecommerce.orders;
-- tolal orders
select count(*) as total_orders from ecommerce.orders;
-- Total Quantity Sold
select sum(Qty) as total_quantity_sold from ecommerce.orders;
-- Average Order Value
select sum(Net_Account) / count(distinct Order_ID) as AOV from ecommerce.orders;
-- total sales
select sum(Net_Account) as Total_Sales from ecommerce.orders;
-- Profit Margin
select sum(Profit) / sum(Net_Account) * 100 as profit_margin 
FROM ecommerce.orders;
-- Category Performance
select Category,count(distinct Order_ID) as Orders,sum(Qty) as Units_Sold,
sum(Net_Account) as Revenue,sum(Profit) AS Profit,sum(Profit) / sum(Net_Account) * 100 as Profit_Margin 
from ecommerce.orders group by Category order by Revenue desc;
-- top product profitability analysis
select Product,sum(Qty) as Units_Sold,sum(Net_Account) as Revenue,sum(Profit) as Profit,
sum(Profit) / sum(Net_Account) * 100 as Profit_Margin from ecommerce.orders
group by Product order by Profit desc;
-- Discount vs Profit
select Discount,count(*) as Orders,sum(Net_Account) as Revenue,sum(Profit) as Profit,
avg(Profit) as Avg_Profit from ecommerce.orders group by Discount 
order by Discount;
-- Order-status analysis
select Order_Status,count(*) as Orders,sum(Net_Account) as Revenue,sum(Profit) as Profit
from ecommerce.orders group by Order_Status order by Orders desc;
-- Cancellation Rate
select sum(case when Order_Status = 'Cancelled' then 1 else 0 end) * 100.0/ COUNT(*) as cancellation_rate
from ecommerce.orders;
-- Return Rate
select sum(case when Order_Status = 'Returned' then 1 else 0 end) * 100.0/ COUNT(*) as return_rate
from ecommerce.orders;
-- Customer analysis
select Customer_Name,count(distinct Order_ID) as Orders,sum(Net_Account) as Revenue,
sum(Profit) as Profit from ecommerce.orders group by Customer_Name order by Revenue desc;
-- Repeat Customers
select Customer_Name,count(distinct Order_ID) as Order_Count from ecommerce.orders
group by Customer_Name having count(distinct Order_ID) > 1
order by Order_Count desc;
-- top cityes
select City,sum(Net_Account) as Sales from ecommerce.orders
group by City order by Sales desc;
-- Geographic analysis
select State,count(distinct Order_ID) as Orders,sum(Net_Account) as Revenue,
sum(Profit) as Profit,sum(Profit) / sum(Net_Account) * 100 as Profit_Margin
from ecommerce.orders group by State order by Revenue desc;
-- monthly analysis
with monthly as (select
        Order_Year,
        Order_Month,
        SUM(Net_Account) as Revenue
    from ecommerce.orders
    group by Order_Year, Order_Month
)
select *,
       lag(Revenue) over (
           order by Order_Year, Order_Month
       ) as Previous_Revenue
from monthly;
-- delivery duration days
select Order_ID, datediff(Delivery_Date, Order_Date) as Delivery_Days
from ecommerce.orders;
-- avg duration 
select avg(datediff(Delivery_Date, Order_Date)) AS Avg_Delivery_Days
from ecommerce.orders;
-- avg duration city wise 
select City,avg(datediff(Delivery_Date, Order_Date)) as Avg_Delivery_Days
from ecommerce.orders group by City order by Avg_Delivery_Days desc;
-- payment mode distribution
select Payment_Mode, count(distinct Order_ID) as Orders, sum(Net_Account) as Revenue,
sum(Profit) as Profit, avg(Net_Account) as AOV from ecommerce.orders
group by Payment_Mode order by Revenue desc;


