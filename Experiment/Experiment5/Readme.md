# Experiment 5: Conditional Aggregation, String Filtering & PL/pgSQL Control Flow

**Name:** Nikhil Marwaha  
**UID:** 24BCS80404

## Aim

To compute a percentage share using conditional aggregation, filter rows on string
length, and write procedural `IF` / `ELSIF` control flow inside anonymous PL/pgSQL blocks.

---

## Experiment 5.1 — Revenue Share by Cuisine

### Problem Statement

> Find out what percentage of the total revenue (sum of all orders) is contributed by
> American Cuisine. Alias the percentage calculation as `American_Revenue` and round
> the final value to 2 decimal places.

**Source:** CodeChef SQL Intermediate — Practice Problem 4 (GSQ85D)

### Table Schema — `Orders`

| Column     | Type            |
|------------|-----------------|
| order_id   | INT PRIMARY KEY |
| item_name  | VARCHAR(255)    |
| cuisine    | VARCHAR(255)    |
| category   | VARCHAR(255)    |
| price      | DECIMAL(10,2)   |
| status     | VARCHAR(255)    |

### Solution

```sql
SELECT ROUND((SUM(CASE WHEN Cuisine = "American" THEN price ELSE 0 END) * 100.0)
             / SUM(price), 2) AS American_Revenue
FROM   orders;
```

### How It Works

1. The `CASE` expression keeps `price` for American rows and contributes `0` for every
   other cuisine, so `SUM(...)` totals American revenue alone.
2. That total is multiplied by `100.0` — a decimal literal, which forces floating-point
   division instead of integer truncation.
3. Dividing by `SUM(price)` (revenue across *all* rows) gives the percentage share.
4. `ROUND(..., 2)` trims the result to two decimal places.

### Output

| American_Revenue |
|------------------|
| 27.75            |

**Output Screenshot:**  
![Experiment 5.1 Output](<5.1(24BCS80404).png>)

---

## Experiment 5.2 — Invalid Tweets

### Problem Statement

> Find the IDs of the invalid tweets. A tweet is invalid if the number of characters used
> in its content is **strictly greater than 15**. Return the result table in any order.

**Source:** [LeetCode 1683 — Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)

**Difficulty:** Easy

### Table Schema — `Tweets`

| Column Name | Type    |
|-------------|---------|
| tweet_id    | int     |
| content     | varchar |

`tweet_id` is the primary key. `content` consists of alphanumeric characters, `'!'`, or
`' '` and no other special characters.

### Solution

```sql
SELECT tweet_id
FROM   Tweets
WHERE  LENGTH(content) > 15;
```

### How It Works

1. `LENGTH(content)` returns the character count of each tweet's body.
2. The `WHERE` clause keeps only rows above the threshold — `> 15`, not `>= 15`, because
   the problem says *strictly* greater.

### Result

**Status:** ✅ Accepted — 22 / 22 testcases passed (Runtime: 709 ms)

**Output Screenshot:**  
![Experiment 5.2 Output](<5.2(24BCS80404).png>)

---

## Experiment 5.3 — PL/pgSQL Control Flow (`DO` Blocks)

### Objective

Use anonymous `DO` blocks in PostgreSQL to declare variables and branch with
`IF` / `ELSIF`, reporting results through `RAISE NOTICE`.

### Block 1 — `IF` / `ELSIF` Admission Eligibility

```sql
DO $$
DECLARE
    AGE INT := 22;
BEGIN
    IF AGE >= 18 AND AGE < 21 THEN
        RAISE NOTICE 'YOUR AGE IS % AND YOU ARE ELIGIBLE TAKE ADMISSION IN BACHELORS', AGE;
    ELSIF AGE >= 21 THEN
        RAISE NOTICE 'YOUR AGE IS % AND YOU ARE ELIGIBLE TAKE ADMISSION IN MASTERS', AGE;
    END IF;
END;
$$
```

### Block 2 — `IF` Inside a `BEGIN … END` Block

```sql
DO $$
DECLARE
    VAL INT := 22;
BEGIN
    IF VAL >= 18 THEN
        RAISE NOTICE 'YOU ARE INSIDE IF STATEMENT';
    END IF;

    RAISE NOTICE 'YOU ARE INSIDE BEGIN END BLOCK';
END;
$$
```

### How It Works

1. `DO $$ … $$` runs an anonymous code block — procedural logic without creating a stored
   function. The `$$` dollar-quoting lets the body contain quotes freely.
2. `DECLARE` introduces block-local variables; `:=` is the PL/pgSQL assignment operator.
3. The branches are evaluated top-down and only the **first** matching arm runs. With
   `AGE := 22`, the first condition (`>= 18 AND < 21`) is false, so the `ELSIF` arm fires
   and reports the Masters message.
4. `RAISE NOTICE` writes to the client message channel; `%` is the placeholder substituted
   by the argument that follows.
5. In Block 2 the final `RAISE NOTICE` sits *outside* the `IF`, so it runs unconditionally —
   which is why both notices appear.

### Output

```text
NOTICE:  YOUR AGE IS 22 AND YOU ARE ELIGIBLE TAKE ADMISSION IN MASTERS
NOTICE:  YOU ARE INSIDE IF STATEMENT
NOTICE:  YOU ARE INSIDE BEGIN END BLOCK
DO

Query returned successfully in 53 msec.
```

**Output Screenshot:**  
![Experiment 5.3 Output](<5.3(24BCS80404).png>)

---

## Key Concepts Summary

| Concept              | Purpose                                                             |
|----------------------|---------------------------------------------------------------------|
| `CASE` inside `SUM()`| Conditional aggregation — total only the rows meeting a condition    |
| `ROUND(value, n)`    | Rounds a numeric result to `n` decimal places                        |
| `100.0` multiplier   | Forces decimal division, avoiding integer truncation                 |
| `LENGTH()`           | Returns the character count of a string                              |
| `DO $$ … $$`         | Executes an anonymous procedural block                               |
| `DECLARE` / `:=`     | Declares and assigns block-local variables                           |
| `IF` / `ELSIF`       | Branches execution; only the first matching arm runs                 |
| `RAISE NOTICE`       | Emits a message to the client, `%` substituting arguments            |

---

## Tools Used

- **CodeChef SQL Intermediate** (Experiment 5.1)
- **LeetCode** (Experiment 5.2)
- **pgAdmin 4 / PostgreSQL 18** (Experiment 5.3)

## Result

All three tasks executed successfully. The revenue-share query matched the expected
`27.75`, the Invalid Tweets solution was accepted on all 22 testcases, and both PL/pgSQL
blocks raised the expected notices.
