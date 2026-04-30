select * from store.superstore;
use superstore;

-- Q1. Show all columns for the first 10 orders
select 
	top 10 
		*
from store.superstore;

-- Q2. Find all orders from the 'West' region with Sales greater than 500
select *
from store.superstore
where Region = 'West' and Sales > 500;

-- Q3: List all unique ShipMode values
select distinct 
	ship_Mode 
from store.superstore;

-- Q4: Seperate each shipping mode and count total order by each mode
select 
	ship_Mode, 
	count(*) as [Total No.of Order by Each Mode] 
from store.superstore 
group by ship_Mode;

-- Q4: What is total Sales and total Profit for each Category?
select
	round(sum(Sales),1) as 'Sum of Total Sales',
	round(sum(Profit),1) as 'Sum of Total Profit',
	Category
from store.superstore
group by Category
order by 'Sum of Total Sales' desc;

-- Q5: Top 5 SubCategory items by total Quantity sold

select top 5
	sub_category,
	round(sum(Sales),0) as 'Total Sales by Category',
	sum(quantity) as 'Top Sub category'
from store.superstore
group by Sub_Category
order by sum(quantity) desc;

-- Q6: Which Region has the highest average Discount?
select
		round(avg(discount)*100,1) as 'Average Discount',
		region 
from store.superstore
group by region
order by 'Average Discount' desc;

-- Q7: Show total Sales by Year. Which year made the most money?

select
	round(sum(sales),0) as 'Total Sales per Year' ,
	year(order_date) as 'Year'
from store.superstore
group by year(order_date)
order by 'Total Sales per Year' desc;

-- Q8:  Find all CustomerNames who placed more than 10 orders, and rank them by total Sales

select 
		rank() over(order by sum(Sales) desc) as 'Rank',
		Customer_Name,
		round(sum(Sales),0) as 'Total Sales',
		count(*) as 'Number of orders'
from store.superstore
group by customer_name
having count(*) > 10;

-- Now the what is average delay in shipping period for different shipping mode
select
	avg(datediff(day, order_date,ship_date)) as 'Average Delay in Shipping',
	Ship_Mode
from store.superstore
group by Ship_Mode
order by 'Average Delay in Shipping' desc;

-- Now, The task to find total no.of order by segment

select 
	count(Row_id) as 'Total No.of Orders',
	segment
from store.superstore
group by segment;

-- Now, The task to find total no.of order by city

select 
	sum(((count(Row_id) * 100)/count(order_id))) as 'Percentage',
	count(Row_id) as 'Total No.of Orders',
	City
from store.superstore
group by City
order by 'Total No.of Orders' desc;

-- Now, The task to find total no.of order by State

select 
	count(Row_id) as 'Total No.of Orders',
	State_Province
from store.superstore
group by State_Province
order by 'Total No.of Orders' desc
;

-- Now, The task to find total no.of order by Country

select 
	count(Row_id) as 'Total No.of Orders',
	Country_Region
from store.superstore
group by Country_Region
order by 'Total No.of Orders' desc
;

-- This Code shows that how many are placed per product

select 
	count(order_id) as 'Total No.of Order',
	Product_ID
from store.superstore
group by Product_ID;

-- Now, The Task is to find the discounted price of each product to whom discount is zero

select 
	product_id,
	round(sum(sales/quantity),1) as 'Discounted Price'
from store.superstore
where discount = 0
group by Product_ID, Discount
order by 'Discounted Price' desc;

-- The code shows that how much each city contribute in total orders

select 
	count(s1.Row_id) as 'totol no.of orders',
	round((count(s1.Row_id) * 100.0)/ (select count(s.row_id) from store.superstore s), 2) as 'Percentage',
	s1.city
from store.superstore s1
group by s1.city
order by 'totol no.of orders' desc;

-- The code shows that how much each country contribute in total orders

select 
	count(s1.Row_id) as 'Total No.of Orders',
	round((count(s1.Row_id) * 100)/ (select count(s.row_id) from store.superstore s),2) as 'Percentage',
	s1.Country_Region
from store.superstore s1
group by Country_Region
order by 'Total No.of Orders' desc;

-- The code shows that how much each region contribute in total orders

select 
	count(s1.Row_id) as 'Total No.of Orders',
	round((round(count(s1.Row_id),2) * 100)/ (select count(s.row_id) from store.superstore s),2) as 'Percentage',
	s1.Region
from store.superstore s1
group by s1.Region
order by 'Total No.of Orders' desc;

-- The code shows that how much each state contribute in total orders

select 
	count(s1.Row_id) as 'Total No.of Orders',
	round((count(s1.Row_id) * 100.0)/ 
		(select count(s.row_id) from store.superstore s),0) 
		as 'Percentage',
	s1.State_Province
from store.superstore s1
group by s1.State_Province
order by 'Total No.of Orders' desc;

-- Cout Total No of order partition by shipping mode in each state

select
	count(ship_mode) as 'Total No of Orders',
	Ship_Mode as 'Shipping Method',
	State_Province as 'State'
from store.superstore
group by State_Province, Ship_Mode
order by 'Total No of Orders' desc;

-- find the most selling category and sub category 

select
	count(row_id) as 'total no of orders',
	ROUND((count(row_id) * 100)/(
	select count(s.Row_id) from store.superstore s
	),2) as 'Percentage',
	category,
	Sub_category
from store.superstore
group by Category,Sub_Category
order by 'Percentage' desc;

-- Now, the question is to see which category and sub category are most profitable

select 
	round(sum(profit),0) as 'Profits',
	ROUND(
		(
			(sum(profit) * 100)
			/
			(select sum(s.profit) from store.superstore s)
		),1) 'Percentage',
	category,
	sub_category
from store.superstore
group by Category,Sub_Category
order by Category,Sub_Category desc;

-- Now, The task is to find which state generate most of the sales and Profit and its Return on Sales

select
	round(sum(sales),0) 'Sales',
	round(sum(profit),0) 'Profit',
	ROUND(sum(profit)/sum(sales),1) as 'Return on Sales',
	City,
	State_Province
from store.superstore
group by State_Province, City
order by 'Return on Sales' desc;

/*
The Task us the monthly sale and monthly orders of each categroy and its sub_category
and its calculate its month on month change in orders and sales as well.
*/

with monthlysale as (
	select
		year(order_date) as [Year],
		month(order_date) as [Month],
		Category,
		Sub_category,
		sum(sales) as [Current Month Sale],
		lag(sum(sales)) over(partition by Category, Sub_category order by year(order_date),month(order_date)) as [Previous Month Sale],
		count(Row_id) as [Current Month Order],
		lag(count(Row_id)) over(partition by Category, Sub_category order by year(order_date),month(order_date)) as [Previous Month Order]
	from store.superstore
	group by year(order_date),month(order_date),Category,Sub_Category
	)
	select
	[YEAR],
	[MONTH],
	Category,
	Sub_category,
	round([Current Month Sale],0),
	round([Previous Month Sale],0),
	round(100 * (([Current Month Sale] - [Previous Month Sale])/[Previous Month Sale]),2) as [MoM Change],
	[Current Month Order],
	[Previous Month Sale],
	round(100 * (([Current Month Order] - [Previous Month Order])/[Previous Month Order]),0) as [MoM Change]
	from monthlysale;



