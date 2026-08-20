# Experiment 3 — Aggregate Functions, GROUP BY, HAVING, DISTINCT & Subqueries

> **Course:** Advanced Database Management Systems (ADBMS)  
> **Student:** Nikhil Marwaha — 24BCS80404

---

## Experiment 3.1 — COUNT Using CASE Statement

### Objective

Use the `COUNT` aggregate function with a `CASE` statement to perform **conditional counting** — count only the rows that satisfy a specific condition.

### Problem Statement

> Write a query to count the number of students across departments who scored **more than 80 marks**.  
> Alias the count column as `Dept_HighScore_Count`.

**Source:** [CodeChef SQL Intermediate — GSQ82](https://www.codechef.com/learn/course/sql-intermediate/SQ00BS08/problems/GSQ82)

### Table Schema — `student`

| Column     | Description            |
|------------|------------------------|
| St_id      | Student ID             |
| St_name    | Student Name           |
| Marks      | Marks obtained         |
| Department | Department of student  |

### Solution

```sql
SELECT department,
       COUNT(CASE WHEN marks > 80 THEN 1 ELSE NULL END) AS Dept_HighScore_Count
FROM   student
GROUP BY department;
```

### How It Works

1. The `CASE` expression evaluates each row:
   - If `marks > 80` → returns `1` (a non-null value).
   - Otherwise → returns `NULL`.
2. `COUNT` ignores `NULL` values, so only students with marks above 80 are counted.
3. `GROUP BY department` produces one row per department.

### Sample Output

| department | Dept_HighScore_Count |
|------------|----------------------|
| Biology    | 0                    |
| English    | 0                    |

**Output Screenshot:**  
![Experiment 3.1 Output](<./3.1(24BCS80404).png>)

---

## Experiment 3.2 — Aggregate Functions, GROUP BY, HAVING & DISTINCT

### Objective

Explore the full suite of SQL aggregate functions (`COUNT`, `SUM`, `MIN`, `MAX`) along with `GROUP BY`, `ORDER BY`, `HAVING`, and `DISTINCT` clauses on a custom `employees` table.

### Table Schema — `employees`

```sql
CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(100) NOT NULL,
    emp_salary DECIMAL(10, 2) NOT NULL,
    emp_city   VARCHAR(100) NOT NULL
);
```

### Sample Data

| emp_id | emp_name      | emp_salary | emp_city  |
|--------|---------------|------------|-----------|
| 101    | Amit Sharma   | 85000.00   | Mumbai    |
| 102    | Priya Patel   | 95000.00   | Mumbai    |
| 103    | Rahul Verma   | 60000.00   | Delhi     |
| 104    | Ananya Iyer   | 110000.00  | Bangalore |
| 105    | Vikram Singh  | 55000.00   | Delhi     |
| 106    | Sneha Reddy   | 105000.00  | Bangalore |
| 107    | Rohan Das     | 72000.00   | Kolkata   |

---

### Queries & Explanations

#### Q1 — Total number of employees in each city

```sql
SELECT emp_city, COUNT(*) AS cnt
FROM   employees
GROUP BY emp_city;
```

| emp_city  | cnt |
|-----------|-----|
| Bangalore | 2   |
| Delhi     | 2   |
| Kolkata   | 1   |
| Mumbai    | 2   |

---

#### Q2 — Employee count per city, sorted in ascending order

```sql
-- Using COUNT(*)
SELECT emp_city, COUNT(*) AS cnt
FROM   employees
GROUP BY emp_city
ORDER BY cnt ASC;

-- Using COUNT(emp_id)
SELECT emp_city, COUNT(emp_id) AS cnt
FROM   employees
GROUP BY emp_city
ORDER BY cnt;
```

---

#### Q3 — Employees per city with salary ≥ 90,000 (conditional aggregation)

**Approach 1 — `SUM` with `CASE`:**

```sql
SELECT emp_city,
       SUM(CASE WHEN emp_salary >= 90000 THEN 1 ELSE 0 END) AS cnt
FROM   employees
GROUP BY emp_city
ORDER BY cnt DESC, emp_city DESC;
```

**Approach 2 — `COUNT` with `CASE`:**

```sql
SELECT emp_city,
       COUNT(CASE WHEN emp_salary >= 90000 THEN 1 END) AS cnt
FROM   employees
GROUP BY emp_city;
```

> **Note:** Both approaches yield the same result. `SUM(CASE … 1/0)` and `COUNT(CASE … 1/NULL)` are interchangeable patterns for conditional aggregation.

---

#### Q4 — Maximum salary in each city

```sql
SELECT emp_city, MAX(emp_salary) AS max_salary
FROM   employees
GROUP BY emp_city;
```

---

#### Q5 — Minimum salary in each city

```sql
SELECT emp_city, MIN(emp_salary) AS min_salary
FROM   employees
GROUP BY emp_city;
```

---

#### Q6 — Cities where the minimum salary ≥ 85,000 (`HAVING` clause)

```sql
SELECT emp_city, MIN(emp_salary) AS min_salary
FROM   employees
GROUP BY emp_city
HAVING MIN(emp_salary) >= 85000;
```

> **`HAVING` vs `WHERE`:** `WHERE` filters individual rows *before* grouping; `HAVING` filters groups *after* aggregation.

---

#### Q7 — Distinct cities (`DISTINCT`)

```sql
SELECT DISTINCT emp_city
FROM   employees;
```

**Output Screenshot:**  
![Experiment 3.2 Output](<./3.2(24BCS80404).png>)

---

## Experiment 3.3 — Customers Who Never Order (Subquery with NOT IN)

### Objective

Use a **subquery** with the `NOT IN` operator to find records in one table that have no matching reference in another table.

### Problem Statement

> **LeetCode 183 — Customers Who Never Order**  
> Write a SQL query to find all customers who never ordered anything.

**Source:** [LeetCode 183 — Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/)

**Difficulty:** Easy

### Table Schemas

**Table: `Customers`**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

`id` is the primary key. Each row indicates the ID and name of a customer.

**Table: `Orders`**

| Column Name | Type |
|-------------|------|
| id          | int  |
| customerId  | int  |

`id` is the primary key. `customerId` is a foreign key referencing `Customers.id`. Each row indicates the ID of an order and the ID of the customer who ordered it.

### Solution

```sql
SELECT name AS Customers
FROM   Customers
WHERE  id NOT IN (SELECT customerId FROM Orders);
```

### How It Works

1. The **inner subquery** `SELECT customerId FROM Orders` retrieves all customer IDs that have placed at least one order.
2. The **outer query** selects customer names from the `Customers` table where the `id` is **NOT IN** the result set of the subquery.
3. This effectively returns only customers who have never placed an order.

### Result

**Status:** ✅ Accepted (Runtime: 113 ms)

**Output Screenshots:**  
![Experiment 3.3 Output](<./3.3(24BCS80404).png>)  
![Experiment 3.4 Output](<./3.4(24BCS80404).png>)

---

### Key Concepts Summary

| Concept      | Purpose                                                  |
|--------------|----------------------------------------------------------|
| `GROUP BY`   | Groups rows sharing a value so aggregate functions run per group |
| `HAVING`     | Filters groups based on aggregate conditions (post-grouping) |
| `ORDER BY`   | Sorts the result set by one or more columns              |
| `DISTINCT`   | Removes duplicate values from the result set             |
| `COUNT()`    | Counts non-null values (or all rows with `*`)            |
| `SUM()`      | Returns the total sum of a numeric column                |
| `MIN()`      | Returns the smallest value in a column                   |
| `MAX()`      | Returns the largest value in a column                    |
| `CASE`       | Enables conditional logic inside aggregate functions     |
| `NOT IN`     | Filters rows whose value is absent from a subquery result set |
| `Subquery`   | A nested query used inside `WHERE`, `FROM`, or `SELECT`  |

---

### Tools Used

- **CodeChef SQL Intermediate** (Experiment 3.1)
- **Programiz Online SQL Compiler** (Experiment 3.2)
- **LeetCode** (Experiment 3.3)
