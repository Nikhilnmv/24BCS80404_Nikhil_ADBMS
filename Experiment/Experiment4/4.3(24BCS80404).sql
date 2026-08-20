-- 1.All orders with Customers Details: Get all of the orders table and also the details of respective customers if they exist. Use the customer and orders table.

-- 2.Products and Categories: Create a combined list of all products and all categories. Include all product names and all category names. Where there's a match, show both; otherwise, use NULLs.

-- 3.All category names with product details: display category_name, along with all product names and price from all the categories present in categories table.

select customers.customer_name,orders.*
from customers
right join orders on customers.customer_id=orders.customer_id;

select products.product_name, categories.category_name
from products
full outer join categories on products.category_id=categories.category_id;

select categories.category_name,products.product_name,products.price
from products
right join categories on categories.category_id=products.category_id;
