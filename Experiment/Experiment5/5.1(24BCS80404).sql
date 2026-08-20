/* Write a query to find out what percentage of the total revenue (sum of all orders) is contributed by American Cuisine. Round the final value to 2 decimal places */


select Round((sum(case when Cuisine="American" then price else 0 end)*100.0)/sum(price),2) as American_Revenue from orders;
