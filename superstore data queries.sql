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
group by Category;

-- Q5: Top 5 SubCategory items by total Quantity sold

select top 5
sub_category,
sum(quantity) as 'Top Sub category'
from store.superstore
group by Sub_Category
order by sum(quantity) desc;

-- Q6: Which Region has the highest average Discount?
select
		round(avg(discount),1) as 'Average Discount',
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
