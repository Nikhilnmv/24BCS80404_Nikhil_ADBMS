-- Customers and Orders: List the customer_name and order_date for all customers who have placed orders.

-- All Customers and Their Orders: List all customer names and their corresponding product_name from orders, if they have any. Include customers even if they haven't placed any orders.

-- Find Products and Their Orders: Display Product Name and the order_date from all the products that are ordered.


select cust.customer_name, od.order_date
from customers as cust
inner join orders as od
on cust.customer_id=od.customer_id;

select cust.customer_name, p.product_name
from customers as cust
left join orders as od
on cust.customer_id=od.customer_id
left join products p
on od.product_name=p.product_name;

select p.product_name,od.order_date
from products as p
inner join orders as od
on p.product_name=od.product_name;
