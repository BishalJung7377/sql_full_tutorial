# 📘 Ultimate SQL Tutorial Repository

Welcome to the **Ultimate SQL Tutorial Repository** — your step-by-step, beginner-friendly guide to mastering SQL with real-world examples and fully annotated queries. Whether you're a student, aspiring data analyst, or someone looking to brush up on their SQL skills, this repo is built to **teach you SQL the right way**.

---

## 🚀 What You'll Learn

### ✅ Database Fundamentals

- Create and use databases
- Define and alter tables
- Insert, update, and delete data

### ✅ Filtering and Selection

- Use `SELECT`, `WHERE`, `BETWEEN`, `IN`, `IS NULL`
- Apply logical operators: `AND`, `OR`, `NOT`

### ✅ Joins & Relationships

- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Understand foreign keys and referential integrity

### ✅ Aggregate & String Functions

- Use `SUM`, `AVG`, `MIN`, `MAX`, `COUNT`
- Use `CONCAT`, `UPPER`, `LOWER`, `TRIM`, `REPLACE`

### ✅ Date and Time

- Use `NOW()`, `CURRENT_DATE()`, `DATEDIFF()`
- Perform time-based analysis


### ✅ Transactions & Constraints

- Learn about `AUTO_INCREMENT`, `PRIMARY KEY`, `UNIQUE`, `CHECK`
- Use `COMMIT`, `ROLLBACK`, and `AUTOCOMMIT`

### ✅ Real-World Use Cases

- Employee management system
- Product catalog with constraints
- Customer transactions with relational models

### ✅ Triggers & Automation

- Create `BEFORE` and `AFTER` triggers for `INSERT`, `UPDATE`, and `DELETE`
- Automatically update related tables using triggers
- Maintain running totals and audit logs without manual input

### ✅ Stored Procedures

- Define reusable blocks of logic with `CREATE PROCEDURE`
- Use `CALL` to execute logic with or without parameters
- Simplify complex business logic (e.g., salary calculation, reporting)

### ✅ Subqueries & Nested Logic

- Use subqueries in `SELECT`, `WHERE`, and `FROM` clauses
- Compare results using nested `IN`, `EXISTS`, and `NOT EXISTS`
- Filter data based on aggregated or conditional subresults

### ✅ Views

- Create and manage virtual tables using `CREATE VIEW`
- Simplify repetitive queries and secure access to sensitive columns
- Filter, sort, and join within views

### ✅ Advanced SQL Concepts

- Implement `GROUP BY`, `HAVING`, `ROLLUP` for multi-level summaries
- Use conditional logic with `CASE WHEN THEN END`
- Apply indexing and understand performance implications


## 📂 File Structure

```
SQL-Tutorial/
├── tutorial.sql          # Full SQL walkthrough with inline comments
├── README.md             # You're here!
```

---

## 📦 How to Use This Repository

1. Clone or download the repo.
2. Open `tutorial.sql` in your SQL editor (MySQL Workbench, DBeaver, etc).
3. Run the queries **step-by-step** to practice creating databases, tables, inserting data, and running real-world queries.
4. Modify the queries or insert your own data to experiment and learn interactively.

---

## 🔍 Highlight Queries

```sql
-- Get full name of employees
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- See all transactions with customer names
SELECT t.transaction_id, c.first_name, c.last_name, t.amount
FROM transactions t
INNER JOIN customers c
ON t.customer_id = c.customer_id;

-- Flag transactions by value level
SELECT amount,
  CASE
    WHEN amount > 4 THEN 'High Value'
    WHEN amount BETWEEN 2 AND 4 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS transaction_type
FROM transactions;
```

---

## 📚 Prerequisites

- Basic SQL environment (MySQL preferred)
- Familiarity with SQL clients like MySQL Workbench or VSCode + SQL extension

---

## 👨‍💻 Author

**Bishal Jung Thapa Chhetri** | Data Analyst | Software Developer | [LinkedIn](https://www.linkedin.com/in/bishal-jung23/)

---

## ⭐️ Contribute or Follow Along

If you'd like to:

- Add new real-world queries
- Build challenges on top of this
- Request a JOIN cheat sheet or visual EER diagram

Feel free to open an issue or star the repo! 🚀

---

## 📌 License

This project is open for learning and collaboration. Just give credit when you use or share!

> Happy Querying! 🧠💻
