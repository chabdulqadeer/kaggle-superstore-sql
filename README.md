1. Author: Abdul Qadeer
2. Dataset: Kaggle - Superstore Sales by Himanshu Uike
3. Objective: Answer business questions using T-SQL
4. Date: April 2026
# Superstore Sales Analysis - SQL Server

## Business Problem
Analyze 9,994 sales records from Kaggle Superstore dataset to find top products, regions, and customers driving revenue.

## Tools Used
SQL Server, T-SQL, SSMS

## Key SQL Skills Demonstrated
- Aggregation: GROUP BY, SUM, AVG, COUNT
- Filtering: WHERE, HAVING  
- Window Functions: RANK()
- Date Functions: YEAR()
- Sorting: ORDER BY, TOP

## Key Findings
1.	Q1. Show all columns for the first 10 orders
2.	Q2. Find all orders from the 'West' region with Sales greater than 500
3.	Q3: List all unique Ship Mode values
4.	Q4: Separate each shipping mode and count total order by each mode
5.	Q5: What is total Sales and total Profit for each Category?
6.	Q6: Top 5 SubCategory items by total Quantity sold
7.	Q7: Which Region has the highest average Discount?
8.	Q8: Show total Sales by Year. Which year made the most money?
9.	Q9:  Find all Customer Names who placed more than 10 orders, and rank them by total Sales 
10.	Q10:  what is average delay in shipping period for different shipping mode
11.	Q11: Now, The task to find total no.of order by segment
12.	Q12: Now, The task to find total no.of order by city
13.	Q13: Now, The task to find total no.of order by State
14.	Q14: This Code shows that how many are placed per product
15.	Q15: Now, The Task is to find the discounted price of each product to whom discount is zero
16.	Q16: The code shows that how much each city contribute in total orders
17.	Q17: The code shows that how much each country contribute in total orders
18.	Q18: The code shows that how much each region contribute in total orders
19.	Q19: The code shows that how much each state contribute in total orders
20.	Q20: Count Total No of order partition by shipping mode in each state
21.	Q21: find the most selling category and sub category 
22.	Q22: Now, the question is to see which category and sub category are most profitable
23.	Q23: Now, The task is to find which state generate most of the sales and Profit and its Return on Sales

## How to Run
1. Download dataset from Kaggle: Superstore Sales by Himanshu Uike
2. Import to SQL Server as `store.superstore`
3. Run queries in `superstore data queries.sql`

## Files
- `superstore data queries.sql` - All  business questions with solutions
