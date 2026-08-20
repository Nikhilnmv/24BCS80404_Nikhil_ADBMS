# Experiment 4: SQL JOIN Operations

**Name:** Nikhil Marwaha  
**UID:** 24BCS80404

## Aim

To practice the full range of SQL JOIN operations — `INNER`, `LEFT`, `RIGHT`,
`FULL OUTER`, `CROSS`, and `SELF` joins — across multiple related tables and display
the required results.

---

## 4.1 — INNER JOIN and LEFT JOIN on Customers, Orders & Products

### Problem Statements

1. List the `customer_name` and `order_date` for all customers who have placed orders.
2. List all customer names and their corresponding `product_name` from orders, including
   customers who have not placed any orders.
3. Display `product_name` and `order_date` for all products that are ordered.

### Queries

```sql
-- 1) Customers who have placed orders
select cust.customer_name, od.order_date
from customers as cust
inner join orders as od
on cust.customer_id = od.customer_id;

-- 2) All customers with products, including those with no orders
select cust.customer_name, p.product_name
from customers as cust
left join orders as od
on cust.customer_id = od.customer_id
left join products p
on od.product_name = p.product_name;

-- 3) Products and their order dates
select p.product_name, od.order_date
from products as p
inner join orders as od
on p.product_name = od.product_name;
```

> **Why the second query joins twice with `LEFT`:** the first `LEFT JOIN` keeps customers
> that have no matching order; the second keeps that row alive through the products
> lookup. An `INNER JOIN` at either step would silently drop the order-less customers the
> problem asks for.

**Output:**  
![Output 4.1](<4.1(24BCS80404).png>)

---

## 4.2 — JOIN and LEFT JOIN on Student & Course

### Problem Statement

> - `JOIN` the tables `student` and `course` using `Course_id` and output the joined table.
> - `LEFT JOIN` the same tables using `Course_id` and output the joined table.

### Queries

```sql
select *
from student
join course
on student.Course_id = course.Course_id;

select *
from student
left join course
on student.Course_id = course.Course_id;
```

**Output:**  
![Output 4.2](<4.2(24BCS80404).png>)

---

## 4.3 — RIGHT JOIN and FULL OUTER JOIN

### Problem Statements

1. **All orders with customer details:** get all rows of the `orders` table plus the
   details of the respective customers where they exist.
2. **Products and categories:** create a combined list of all product names and all
   category names — show both where they match, otherwise `NULL`.
3. **All category names with product details:** display `category_name` along with all
   product names and prices for every category in the `categories` table.

### Queries

```sql
select customers.customer_name, orders.*
from customers
right join orders on customers.customer_id = orders.customer_id;

select products.product_name, categories.category_name
from products
full outer join categories on products.category_id = categories.category_id;

select categories.category_name, products.product_name, products.price
from products
right join categories on categories.category_id = products.category_id;
```

**Output:**  
![Output 4.3](<4.3(24BCS80404).png>)

---

## 4.4 — FULL OUTER JOIN on Student & Course

### Problem Statement

> `FULL OUTER JOIN` the `student` and `course` tables using `Course_id` and output the
> joined table.

### Query

```sql
select * from student
full outer join course
on student.Course_id = course.Course_id;
```

**Output:**  
![Output 4.4](<4.4(24BCS80404).png>)

---

## 4.5 — SELF JOIN and CROSS JOIN

### Problem Statements

1. **Employee and manager names:** display a list of employee names along with their
   manager's names, using the `employees` table.
2. **Every possible combination:** show every combination of `customer_name` from
   `customers` and `product_name` from `products`.

### Queries

```sql
select e1.employee_name as Employee, e2.employee_name as Manager
from employees e1
left join employees e2 on e1.manager_id = e2.employee_id;

select customer_name, product_name
from customers
cross join products;
```

> **Note:** the manager query joins `employees` to *itself* under two aliases — `e1` as the
> employee, `e2` as the manager. `LEFT JOIN` is used so employees with no manager (a `NULL`
> `manager_id`, typically the top of the hierarchy) still appear in the result.

**Output:**  
![Output 4.5](<4.5(24BCS80404).png>)

---

## 4.6 — SELF JOIN on the Student Table

### Problem Statements

1. Find pairs of students that belong to the same department.
2. Identify students who have chosen the same `Course_id` as their favourite. Display
   `St_id`, `St_Name`, and `Course_id`, ordered by increasing `Course_id`.

### Queries

```sql
select s1.st_id, s1.st_name, s1.department, s2.st_id, s2.st_name, s2.department
from student s1
join student s2
on s1.department = s2.department
and s1.st_id <> s2.st_id;

select distinct s1.st_id, s1.st_name, s1.course_id
from student s1
join student s2
on s1.course_id = s2.course_id
and s1.st_id <> s2.st_id
order by s1.course_id;
```

> **Why `s1.st_id <> s2.st_id`:** without it, every student would pair with themselves,
> since a row trivially matches its own department. The `DISTINCT` in the second query
> collapses the duplicates that arise when one student shares a course with several others.

**Output:**  
![Output 4.6](<4.6(24BCS80404).png>)

---

## JOIN Types Summary

| JOIN Type         | Rows Returned                                                      |
|-------------------|--------------------------------------------------------------------|
| `INNER JOIN`      | Only rows with a match in both tables                              |
| `LEFT JOIN`       | All rows from the left table, `NULL`-padded where no match exists   |
| `RIGHT JOIN`      | All rows from the right table, `NULL`-padded where no match exists  |
| `FULL OUTER JOIN` | All rows from both tables, `NULL`-padded on either side             |
| `CROSS JOIN`      | Every possible combination of rows (Cartesian product)             |
| `SELF JOIN`       | A table joined to itself under two aliases                         |

## Result

All required JOIN queries were executed successfully, and the outputs matched the
expected results.
