# 📚 Advanced Database Management Systems (ADBMS)

> **Student:** Nikhil Marwaha — `24BCS80404`  
> **Course:** Advanced Database Management Systems

A comprehensive repository of SQL experiments, homework assignments, and coursework for the ADBMS course. Each module covers core database concepts — from basic CRUD and set operations to aggregate functions, subqueries, and data modelling.

---

## 📁 Repository Structure

```
24BCS80404_Nikhil_ADBMS/
├── Experiment/
│   ├── Experiment1/    # Data population & basic retrieval (Hospital DB)
│   ├── Experiment2/    # SQL set operations (UNION, INTERSECT, EXCEPT)
│   └── Experiment3/    # Aggregate functions, GROUP BY, HAVING, DISTINCT & subqueries
│
├── Homework/
│   ├── Overview of Databases/       # Fundamentals of database systems
│   ├── Data Models/                 # Hierarchical, Network, Relational models
│   ├── ER-Model/                    # Entity-Relationship modelling
│   ├── Relational Data Structure/   # Relational algebra & structure
│   └── DBA Responsibilities/        # Database administrator roles
│
├── Assignment/                      # (Upcoming)
└── README.md                        # ← You are here
```

---

## 🧪 Experiments

### Experiment 1 — Hospital Database: Data Population & Basic Retrieval

| Detail        | Value                                                  |
|---------------|--------------------------------------------------------|
| **Aim**       | Populate a hospital management database and retrieve first records |
| **Topics**    | `INSERT INTO`, `SELECT`, `LIMIT`                       |
| **Tables**    | Doctors, Patients, Appointments, Treatments, MedicalRecords, Billing |
| **Readme**    | [Experiment1/Readme.md](./Experiment/Experiment1/Readme.md) |

**Key Tasks:**
- Insert sample data across 6 interrelated hospital tables
- Retrieve the first record from the Doctors, Patients, and Appointments tables

---

### Experiment 2 — SQL Set Operations

| Detail        | Value                                                  |
|---------------|--------------------------------------------------------|
| **Aim**       | Perform SQL set operations and observe outputs         |
| **Topics**    | `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT`            |
| **Readme**    | [Experiment2/readme.md](./Experiment/Experiment2/readme.md) |

**Key Queries:**

| # | Operation     | Description                                              |
|---|---------------|----------------------------------------------------------|
| 1 | `UNION`       | Stack `Arts` over `Science` (removes duplicates)         |
| 2 | `UNION ALL`   | Combine employee names without removing duplicates       |
| 3 | `INTERSECT`   | Find fruits available in both `fruit` and `inventory`    |
| 4 | `EXCEPT`      | Find fruits in `fruit` that are absent from `inventory`  |

---

### Experiment 3 — Aggregate Functions, GROUP BY, HAVING, DISTINCT & Subqueries

| Detail        | Value                                                  |
|---------------|--------------------------------------------------------|
| **Aim**       | Explore aggregate functions, conditional counting, grouping, filtering, and subqueries |
| **Topics**    | `COUNT`, `SUM`, `MIN`, `MAX`, `GROUP BY`, `HAVING`, `DISTINCT`, `CASE`, `NOT IN`, Subqueries |
| **Readme**    | [Experiment3/Readme.md](./Experiment/Experiment3/Readme.md) |

**Sub-experiments:**

| #   | Title                                 | Source                       |
|-----|---------------------------------------|------------------------------|
| 3.1 | COUNT with CASE (conditional counting) | CodeChef SQL Intermediate   |
| 3.2 | Aggregate functions on `employees` table | Programiz Online SQL Compiler |
| 3.3 | Customers Who Never Order (Subquery) | LeetCode 183                 |

---

## 📝 Homework

Homework modules cover theoretical foundations of database systems. Each folder contains problem screenshots (Easy / Medium / Hard difficulty).

| Topic                      | Contents                                      |
|----------------------------|-----------------------------------------------|
| **Overview of Databases**  | Fundamentals — what databases are and why they matter |
| **Data Models**            | Hierarchical, Network, and Relational models  |
| **ER-Model**               | Entity-Relationship diagrams and modelling    |
| **Relational Data Structure** | Relational algebra, keys, and constraints  |
| **DBA Responsibilities**   | Roles and responsibilities of a Database Administrator |

---

## 🔑 Key SQL Concepts Covered

| Concept          | Description                                                        |
|------------------|--------------------------------------------------------------------|
| `INSERT INTO`    | Adds new rows to a table                                           |
| `SELECT`         | Retrieves data from one or more tables                             |
| `GROUP BY`       | Groups rows sharing a value for per-group aggregation              |
| `HAVING`         | Filters groups based on aggregate conditions (post-grouping)       |
| `ORDER BY`       | Sorts the result set by one or more columns                        |
| `DISTINCT`       | Removes duplicate values from the result set                       |
| `COUNT()`        | Counts non-null values (or all rows with `*`)                      |
| `SUM()`          | Returns the total sum of a numeric column                          |
| `MIN()` / `MAX()`| Returns the smallest / largest value in a column                   |
| `CASE`           | Enables conditional logic inside queries and aggregate functions   |
| `UNION`          | Combines results of two queries, removing duplicates               |
| `UNION ALL`      | Combines results of two queries, keeping duplicates                |
| `INTERSECT`      | Returns rows common to both queries                                |
| `EXCEPT`         | Returns rows in the first query but not in the second              |
| `NOT IN`         | Filters rows whose value is absent from a subquery result set      |
| Subquery         | A nested query used inside `WHERE`, `FROM`, or `SELECT`            |

---

## 🛠 Tools & Platforms

| Tool                          | Used In        |
|-------------------------------|----------------|
| CodeChef SQL Intermediate     | Experiment 3.1 |
| Programiz Online SQL Compiler | Experiment 3.2 |
| LeetCode                      | Experiment 3.3 |

---

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd 24BCS80404_Nikhil_ADBMS
   ```

2. **Navigate to any experiment** and open the corresponding `README.md` for detailed explanations, queries, and output screenshots.

3. **Run SQL queries** using any SQL-compatible tool:
   - [DB Fiddle](https://www.db-fiddle.com/)
   - [Programiz SQL Online](https://www.programiz.com/sql/online-compiler/)
   - MySQL / PostgreSQL local installation

---

## 📄 License

This repository is for academic and educational purposes.

---

<p align="center">
  <em>Made with ❤️ for ADBMS coursework</em>
</p>
