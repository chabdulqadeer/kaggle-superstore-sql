-- Author: Abdul Qadeer
-- Dataset: Kaggle - Superstore Sales by Himanshu Uike  
-- Objective: Answer 8 business questions using T-SQL
-- Date: April 2026
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
1. **Best Sales Year**: 2017 with $733,215 total sales
2. **Top Category**: Technology at $836,154 sales
3. **Highest Avg Discount Region**: Central at 23.7%
4. **Top Customer**: Sean Miller with 17 orders, $25,043 sales

## How to Run
1. Download dataset from Kaggle: Superstore Sales by Himanshu Uike
2. Import to SQL Server as `store.superstore`
3. Run queries in `superstore data queries.sql`

## Files
- `superstore data queries.sql` - All 8 business questions with solutions
