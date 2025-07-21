-- ===========================================
-- Step 1: Create a database if it doesn't exist
-- ===========================================

-- This statement creates a database named 'my_db' if it does not already exist.
-- It helps to ensure that we don't attempt to create a database that already exists, avoiding errors.
CREATE DATABASE IF NOT EXISTS my_db;

-- ===========================================
-- Step 2: Use the created database
-- ===========================================

-- This command sets 'my_db' as the current working database for all subsequent operations.
USE my_db;

-- ===========================================
-- Step 3: Create the 'employees' table
-- ===========================================

-- This statement creates a new table called 'employees' with the following columns:
-- - employee_id: Integer type, used to uniquely identify each employee.
-- - first_name: A string (varchar) with a maximum length of 30 characters to store the employee's first name.
-- - last_name: A string (varchar) with a maximum length of 30 characters to store the employee's last name.
-- - hourly_pay: A decimal (with precision 5 and scale 2) to store the employee's hourly pay rate.
-- - hire_date: Date type to store the employee's date of hire.
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
);

-- ===========================================
-- Step 4: Select all data from the employees table
-- ===========================================

-- This query retrieves all the rows from the 'employees' table to view its structure and data.
SELECT * FROM employees;

-- ===========================================
-- Step 5: Add a new column 'phone_number' to the employees table
-- ===========================================

-- This statement adds a new column 'phone_number' to the 'employees' table.
-- The 'phone_number' column will store a string of up to 15 characters, suitable for phone numbers.
ALTER TABLE employees 
ADD phone_number VARCHAR(15);

-- ===========================================
-- Step 6: View the table after adding the phone_number column
-- ===========================================

-- This query retrieves all data again from the 'employees' table, 
-- now including the newly added 'phone_number' column.
SELECT * FROM employees;

-- ===========================================
-- Step 7: Rename the 'phone_number' column to 'email'
-- ===========================================

-- This statement renames the 'phone_number' column to 'email'.
-- It is useful when you need to update column names to better reflect the data they store.
ALTER TABLE employees 
RENAME COLUMN phone_number TO email;

-- ===========================================
-- Step 8: Change the datatype of the 'email' column
-- ===========================================

-- This statement modifies the 'email' column's data type, increasing its maximum length from 15 to 100 characters.
-- This is done to accommodate longer email addresses.
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100);

-- ===========================================
-- Step 9: Change the position of the 'email' column
-- ===========================================

-- This statement changes the position of the 'email' column by moving it after the 'last_name' column.
-- This is purely cosmetic, rearranging the order in which columns appear in the table.
ALTER TABLE employees
MODIFY email VARCHAR(100) 
AFTER last_name;

-- ===========================================
-- Step 10: Drop the 'email' column from the table
-- ===========================================

-- This statement drops (removes) the 'email' column from the 'employees' table.
-- Use this command carefully, as it deletes the column and all the data stored in it.
ALTER TABLE employees
DROP COLUMN email;

-- ===========================================
-- Step 11: Inserting records into the employees table
-- ===========================================

-- This command inserts a single row into the 'employees' table with the following data:
-- employee_id = 1, first_name = "Eugene", last_name = "Crabs", hourly_pay = 13, hire_date = "2023-08-12"
INSERT INTO employees
VALUES (1, "Eugene", "Crabs", 13, "2023-08-12");

-- ===========================================
-- Step 12: Inserting multiple records into the employees table
-- ===========================================

-- This command inserts multiple rows at once into the 'employees' table.
-- Each row represents a different employee with their respective details (ID, first name, last name, hourly pay, hire date).
INSERT INTO employees
VALUES 
    (2, "Squidward", "Tentacles", 15, "2023-01-03"), 
    (3, "SpongeBob", "SquarePants", 12.50, "2023-01-04"), 
    (4, "Patrick", "Star", 12.50, "2023-01-05"),
    (5, "Sandy", "Cheeks", 17.25, "2023-01-06");

-- ===========================================
-- Step 13: View the table after inserting multiple records
-- ===========================================

-- This query retrieves all rows from the 'employees' table, 
-- now including the multiple records we just inserted.
SELECT * FROM employees;

-- ===========================================
-- Step 14: Inserting data into specific columns
-- ===========================================

-- This statement inserts data into specific columns: 'employee_id', 'first_name', and 'last_name'.
-- The 'hourly_pay' and 'hire_date' columns are omitted and will be set to NULL or default values.
INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton");

-- ===========================================
-- Step 15: Select everything from the table
-- ===========================================

-- The SELECT * command retrieves all columns and all rows from the 'employees' table.
-- It is useful when you want to see all the data in the table without specifying particular columns.
SELECT * FROM employees;

-- ===========================================
-- Step 16: Select specific columns from the table
-- ===========================================

-- The SELECT statement allows you to specify which columns to retrieve.
-- In this case, we are selecting only the 'first_name' and 'last_name' columns from the 'employees' table.
-- This is helpful when you only need data from certain columns and want to avoid retrieving unnecessary information.
SELECT first_name, last_name FROM employees;


-- ===========================================
-- Step 16: Select data using WHERE clause
-- ===========================================

-- The WHERE clause is used to filter records based on specific conditions.
-- In this example, we are selecting all the data (all columns) from the 'employees' table 
-- where the employee_id is equal to 5. This helps us retrieve only the employee 
-- with the ID of 5 from the table.
SELECT * FROM employees
WHERE employee_id = 5;

-- ===========================================
-- Step 17: Select data using WHERE clause with specific condition
-- ===========================================

-- This query selects all columns from the 'employees' table where the 'first_name' is equal to "Spongrbob".
-- The WHERE clause helps to filter records based on the specified condition.
SELECT * FROM employees
WHERE first_name = "Spongebob";


-- ===========================================
-- Step 18: Select data where hourly_pay is greater than 15
-- ===========================================

-- This query selects all columns from the 'employees' table where the 'hourly_pay' is greater than 15.
-- The WHERE clause filters the records to include only employees who earn more than 15 per hour.
SELECT * FROM employees
WHERE hourly_pay >= 15;

-- ===========================================
-- Step 19: Select data where hire_date is NULL
-- ===========================================

-- This query selects all columns from the 'employees' table where the 'hire_date' is NULL.
-- The WHERE clause filters the records to include only those employees who do not have a 'hire_date' value (i.e., NULL).
SELECT * FROM employees
WHERE hire_date IS NULL;


-- ===========================================
-- Step 20: Disable Safe Update Mode Temporarily
-- ===========================================

-- The following command disables safe update mode for the current session. 
-- This allows the user to run an UPDATE query without the restriction of using a WHERE clause with a key column.
-- Safe update mode is useful to prevent accidental updates to the entire table, but it can be bypassed for specific use cases.
SET SQL_SAFE_UPDATES = 0;

-- ===========================================
-- Step 21: Update the hourly pay for employee with ID 6
-- ===========================================

-- This UPDATE statement sets the 'hourly_pay' to 10.25 for the employee with 'employee_id' = 6.
-- After disabling safe update mode, we are able to execute this query to update a specific employee's hourly pay.
UPDATE employees
SET hourly_pay = 10.25
WHERE employee_id = 6;

-- ===========================================
-- Step 22: Update multiple columns for employee_id = 6
-- ===========================================

-- This query updates two columns for the employee with 'employee_id' = 6:
-- 1. The 'hourly_pay' is set to 10.50.
-- 2. The 'hire_date' is set to "2023-01-07".
-- This allows you to modify multiple columns in one update statement.
UPDATE employees
SET hourly_pay = 10.50,
    hire_date = "2023-01-07"
WHERE employee_id = 6;


-- ===========================================
-- Step 23: Update the 'hourly_pay' for all employees
-- ===========================================

-- This query updates the 'hourly_pay' column for **all** rows in the 'employees' table.
-- The 'hourly_pay' is set to 10.50 for every employee in the table, as no WHERE clause is provided to filter the records.
-- Be cautious with this query, as it will apply the update to all employees, potentially overwriting existing values for hourly pay.
UPDATE employees
SET hourly_pay = 10.50;


-- ===========================================
-- Step 24: Delete an employee record by employee_id
-- ===========================================

-- This query deletes the record from the 'employees' table where the 'employee_id' is equal to 6.
-- It removes all columns for the employee with employee_id = 6 from the table permanently.
-- Be cautious, as this action cannot be undone unless there is a backup or transaction support.
DELETE FROM employees
WHERE employee_id = 6;


-- =================================================================================================================================
-- Step 1: Autocommit
-- ===========================================
-- Autocommit is a feature that automatically commits every individual SQL statement 
-- as soon as it's executed. When autocommit is enabled, changes (like INSERT, UPDATE, DELETE) 
-- are immediately saved to the database without the need for an explicit COMMIT command.

-- Example: If autocommit is enabled, each INSERT statement is automatically committed.
-- INSERT INTO employees (employee_id, first_name, last_name, hourly_pay) 
-- VALUES (1, "John", "Doe", 25.00);  -- Automatically committed after execution.

-- Autocommit is usually enabled by default in most DBMS, but it can be toggled off when 
-- working with multiple queries in a single transaction (when you need manual control over commits).

-- ===========================================
-- Step 2: Commit
-- ===========================================
-- The COMMIT command is used to make all the changes in a transaction permanent.
-- When you issue a COMMIT, all changes (like INSERT, UPDATE, DELETE) made during the transaction 
-- are saved to the database and cannot be undone unless you have a backup.

-- Example: 
-- START TRANSACTION;
-- INSERT INTO employees (employee_id, first_name, last_name, hourly_pay)
-- VALUES (2, "Alice", "Smith", 30.00);
-- COMMIT;  -- The INSERT is now permanent and saved in the database.

-- COMMIT ensures that the transaction is finalized, making the changes permanent and visible to other users.

-- ===========================================
-- Step 3: Rollback
-- ===========================================
-- The ROLLBACK command is used to undo changes made during a transaction.
-- When you issue a ROLLBACK, all changes made since the last COMMIT or transaction start 
-- are discarded. It's useful when there are errors, or if you simply want to discard the 
-- changes made within the transaction.

-- Example: 
-- START TRANSACTION;
-- INSERT INTO employees (employee_id, first_name, last_name, hourly_pay)
-- VALUES (3, "Bob", "Brown", 22.50);
-- ROLLBACK;  -- The INSERT is undone, and no data is saved to the database.

-- ROLLBACK allows you to revert changes, making sure no incorrect or unwanted data is saved.

-- ===========================================
-- Summary of Transaction Control Commands
-- ===========================================
-- Autocommit: Automatically commits changes after each SQL statement (no need for manual COMMIT).
-- Commit: Finalizes the changes and makes them permanent in the database.
-- Rollback: Cancels all changes made during the current transaction, undoing any modifications.

 -- =================================================================================================================================
 
-- ===========================================
-- Step 25: Date and Time Functions
-- ===========================================

-- The following SQL functions retrieve the current date and time from the system.
-- They can be used for logging, filtering data by date/time, or calculating date/time differences.

-- 1. CURRENT_DATE(): Returns the current date (without the time part).
--    This is useful when you only need the date and not the time.
SELECT CURRENT_DATE();  -- Example: Returns today's date in 'YYYY-MM-DD' format.

-- 2. CURRENT_TIME(): Returns the current time (without the date part).
--    Use this when you only need the current time, with no date information.
SELECT CURRENT_TIME();  -- Example: Returns the current time in 'HH:MM:SS' format.

-- 3. NOW(): Returns both the current date and time together.
--    This is the most common function used to capture the complete current timestamp.
SELECT NOW();  -- Example: Returns both the date and time in 'YYYY-MM-DD HH:MM:SS' format.

-- Use cases for date/time functions:
-- - Storing timestamps when records are created or updated.
-- - Filtering data based on a specific date or time (e.g., transactions made today).
-- - Calculating time differences, such as the time between a record's creation and the current time.


-- ===========================================
-- Step 26: Create the 'products' table
-- ===========================================

-- This statement creates a new table called 'products' with the following columns:
-- 1. product_id: An integer column used to uniquely identify each product. 
--    It’s commonly used as the primary key but is not specified as a primary key here.
-- 2. product_name: A varchar (string) column with a maximum length of 25 characters to store the name of the product. 
--    A unique constraint is applied to this column, ensuring no two products have the same name.
-- 3. price: A decimal column with a precision of 4 and a scale of 2. This means the price can have up to 2 digits after the decimal point (e.g., 99.99).

CREATE TABLE products (
    product_id INT,                -- Column to store product ID (integer type)
    product_name VARCHAR(25) UNIQUE, -- Column to store product name, with a unique constraint (no duplicate product names allowed)
    price DECIMAL(4, 2)            -- Column to store the product price, with a total of 4 digits, 2 after the decimal point (e.g., 999.99)
); 


-- ===========================================
-- Step 27: Add UNIQUE constraint to the 'product_name' column
-- ===========================================

-- If you forget to add the UNIQUE constraint when creating the table, you can add it later using ALTER TABLE.
-- This will ensure that the 'product_name' column has unique values across all rows in the 'products' table.
-- The following query adds a UNIQUE constraint to the 'product_name' column in the 'products' table.

ALTER TABLE products
ADD CONSTRAINT
UNIQUE (product_name);

-- ===========================================
-- Step 28: Insert multiple products into the 'products' table
-- ===========================================

-- This statement attempts to insert multiple rows into the 'products' table. 
-- Each row represents a product with a unique 'product_id', 'product_name', and 'price'.
-- The following products are being inserted:


-- However, we will be encountering an error because of the UNIQUE constraint on the 'product_name' column.
-- The 'product_name' column must have unique values for each row, but the name 'fries' appears twice.
-- This violates the UNIQUE constraint, which prevents the insertion of duplicate product names.

INSERT INTO products 
VALUES 
    (100, 'hamburger', 3.99),      -- Product: hamburger
    (101, 'fries', 1.89),           -- Product: fries
    (102, 'soda', 1.00),            -- Product: soda
    (103, 'ice cream', 1.4),        -- Product: ice cream
    (104, 'fries', 1.75);          -- Error: Duplicate entry 'fries' for product_name


-- The insert statement below will not throw any error because it do not contains any duplicate row.

INSERT INTO products 
VALUES 
    (100, 'hamburger', 3.99),
    (101, 'fries', 1.89),
    (102, 'soda', 1.00), 
    (103, 'ice cream', 1.49); 


-- ===========================================
-- Step 32: Add a new column 'product_category' to the 'products' table
-- ===========================================

-- This ALTER TABLE statement adds a new column called 'product_category' to the 'products' table. 
-- The column is defined as 'VARCHAR(50)' to store product categories (e.g., Food, Snack, Drinks, etc.).
-- The 'NOT NULL' constraint ensures that the 'product_category' must always have a value when inserting or updating records.
ALTER TABLE products 
ADD COLUMN product_category VARCHAR(50) NOT NULL;

-- ===========================================
-- Step 33: Update the 'product_category' column based on 'product_id'
-- ===========================================

-- This UPDATE statement updates the 'product_category' column for each product in the table 
-- based on its 'product_id'. The categories are set using a CASE expression:
-- 1. If 'product_id' = 100, set the category to 'food'.
-- 2. If 'product_id' = 101, set the category to 'snack'.
-- 3. If 'product_id' = 102, set the category to 'drinks'.
-- 4. If 'product_id' = 103, set the category to 'dessert'.
-- 5. For any other products, the category remains the same (using ELSE).
UPDATE products 
SET product_category = CASE
    WHEN product_id = 100 THEN 'food'       -- Category for product_id 100 (hamburger)
    WHEN product_id = 101 THEN 'snack'      -- Category for product_id 101 (fries)
    WHEN product_id = 102 THEN 'drinks'     -- Category for product_id 102 (soda)
    WHEN product_id = 103 THEN 'dessert'    -- Category for product_id 103 (ice cream)
    ELSE product_category                    -- Retain the current category for other products
END;

-- ===========================================
SELECT * FROM products;
-- ===========================================


-- ===========================================
-- Step 36: Modify the 'product_id' column to enforce NOT NULL constraint
-- ===========================================

-- This ALTER TABLE statement modifies the 'product_id' column in the 'products' table 
-- to enforce the 'NOT NULL' constraint. 
-- This ensures that every product must have a valid (non-null) 'product_id' value.
-- It prevents the insertion of rows where 'product_id' is NULL.
ALTER TABLE products
MODIFY product_id INT NOT NULL;


insert into products 
values (null, "cookie", 2.24);

-- ===========================================
-- Step 37: Modify the 'price' column to add a CHECK constraint
-- ===========================================

-- This ALTER TABLE statement modifies the 'price' column in the 'products' table.
-- It changes the column definition to ensure that the 'price' value is always greater than 0.
-- The 'CHECK(price > 0)' constraint ensures that no product can have a price that is zero or negative. 
-- This helps enforce data integrity by ensuring that only valid, positive prices can be inserted or updated for products.

ALTER TABLE products
MODIFY COLUMN price DECIMAL(4, 2) CHECK(price > 0);

-- ===========================================
-- Step 38: Inserting a product with price 0
-- ===========================================
 
-- This statement attempts to insert a new product with 'product_id' = 104, 'product_name' = 'choco bar', and 'price' = 0.
-- However, this will fail due to the CHECK constraint on the 'price' column, which ensures that the price must be greater than 0.
-- Since 'price = 0' does not satisfy the condition 'price > 0', this insert operation will violate the CHECK constraint and will be rejected.
INSERT INTO products
VALUES (104, 'choco bar', 0, 'Snacks');

-- ===========================================
-- Step 39: Inserting a product with price 1.35
-- ===========================================

-- This statement inserts a new product with 'product_id' = 104, 'product_name' = 'choco bar', and 'price' = 1.35.
-- This insert operation will succeed because the price value (1.35) satisfies the condition 'price > 0', which is enforced by the CHECK constraint.
-- This value passes the validation check and will be inserted into the 'products' table successfully.
INSERT INTO products
VALUES (104, 'choco bar', 1.35,'Snacks');

-- ===========================================
-- Step 40: Set a default value for the 'price' column
-- ===========================================

-- This ALTER TABLE statement modifies the 'price' column in the 'products' table 
-- to set a default value of 0. This means that if no value is provided for the 'price' column
-- when inserting a new product, it will automatically be set to 0 unless specified otherwise.
-- This is useful for cases where you want to ensure that a product has a default price, 
-- rather than leaving it as NULL or requiring manual input for every new record.

ALTER TABLE products
ALTER price SET DEFAULT 0;

-- ===========================================
-- Step 41: Insert multiple rows into the 'products' table
-- ===========================================

-- This INSERT INTO statement inserts three new products into the 'products' table.
-- We are specifying values for 'product_id', 'product_name', and 'product_category'.
-- The 'price' column is not mentioned, so it will use the default value set previously (which is 0).

INSERT INTO products (product_id, product_name, product_category)
VALUES 
    (105, 'straw', 'tools'),  -- Product with product_id 105, name 'straw', and category 'tools'
    (106, 'fork', 'tools'),   -- Product with product_id 106, name 'fork', and category 'tools'
    (107, 'spoon', 'tools');  -- Product with product_id 107, name 'spoon', and category 'tools'


-- ===========================================
-- Step 42: Add Primary Key Constraint to 'product_id'
-- ===========================================

-- This ALTER TABLE statement adds a **primary key** constraint to the 'product_id' column in the 'products' table.
-- The primary key ensures that the 'product_id' values are unique and not NULL. 
-- It enforces the rule that every product must have a unique 'product_id', and there can be no duplicate or NULL values in this column.
-- The primary key also automatically creates an index on the 'product_id' column, which helps speed up queries that search by 'product_id'.

ALTER TABLE products
ADD CONSTRAINT PRIMARY KEY (product_id);

-- ===========================================
-- ===========================================
-- ===========================================

create table transactions(
	transaction_id int primary key ,
    amount decimal(5,2)
    );
    
select amount from transactions where transaction_id = 1003;

-- ===========================================
-- ===========================================



-- ===========================================
-- Step 43: Modify the 'transaction_id' column to auto-increment
-- ===========================================

-- This ALTER TABLE statement modifies the 'transaction_id' column to add the 'AUTO_INCREMENT' constraint.
-- This means that for every new row inserted, the 'transaction_id' will be automatically generated by the database.
-- The 'AUTO_INCREMENT' constraint is useful to automatically assign a unique ID for each transaction.
ALTER TABLE transactions 
MODIFY transaction_id INT AUTO_INCREMENT;

-- ===========================================
-- ===========================================


insert into transactions (amount)
values (4.39);

select * from transactions;
-- ===========================================
-- ===========================================


-- ===========================================
-- ===========================================
-- ===========================================
-- ===========================================
-- ===========================================
-- ===========================================

-- ============================================
-- Create the 'customers' table
-- ============================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,  -- PRIMARY KEY: Uniquely identifies each customer. Auto-increments with every new record.
    first_name VARCHAR(50),                      -- Stores customer's first name.
    last_name VARCHAR(50)                        -- Stores customer's last name.
);

-- ============================================
-- Insert sample customer data
-- ============================================

INSERT INTO customers (first_name, last_name)
VALUES 
    ("Fred", "Fish"),
    ("Larry", "Lobster"),
    ("Bubble", "Bass");

-- View all customers
SELECT * FROM customers;

-- ============================================
-- Create the 'transactions' table
-- ============================================

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,      -- PRIMARY KEY: Uniquely identifies each transaction.
    amount DECIMAL(5,2),                                -- Amount of the transaction (up to 9.99 due to 3 total digits, 2 after decimal).
    customer_id INT,                                    -- FOREIGN KEY column: Links each transaction to a customer.
    
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    -- FOREIGN KEY: Enforces referential integrity. Ensures that every transaction is tied to a valid customer in the 'customers' table.
);

select * from transactions;


-- ============================================
--  Drop the foreign key constraint from 'transactions' table
-- This command removes the foreign key constraint named 'transactions_ibfk_1' from the 'transactions' table.
-- It breaks the relationship between 'transactions.customer_id' and 'customers.customer_id'.
-- After this, 'customer_id' in 'transactions' is no longer required to match values in the 'customers' table.
-- Be cautious: This may lead to referential integrity issues (e.g., transactions referring to non-existent customers).
-- ============================================

ALTER TABLE transactions
DROP FOREIGN KEY transactions_ibfk_1;


-- ===========================================
-- Set AUTO_INCREMENT Start Value to 1000
-- ===========================================

-- This ALTER TABLE statement sets the next auto-generated value 
-- for the 'transaction_id' column in the 'transactions' table to 1000.
-- It ensures that the next inserted transaction (without a manually specified ID)
-- will begin from 1000, continuing sequentially thereafter (1001, 1002, ...).
-- This is helpful for keeping ID ranges organized or for separating batches of data logically.

ALTER TABLE transactions 
AUTO_INCREMENT = 1000;
-- ===========================================
-- ===========================================

insert into transactions (amount, customer_id)
values (4.99, 3),
	   (2.99, 2),
	    (3.39, 3),
        (1.59, 1);

select * from transactions;

DELETE FROM customers
where customer_id = 1;


insert into transactions (amount, customer_id)
values (4.99, NULL);
select * from transactions;


insert into customers (first_name,last_name)
values ("Poppy", "Puff");
select * from Customers;


-- ===========================================
-- Step: INNER JOIN between 'transactions' and 'customers'
-- ===========================================

-- This query retrieves the first name, last name, and transaction amount
-- by joining the 'transactions' table with the 'customers' table.

-- 💡 Join Logic:
-- We are using INNER JOIN to return only those rows where a customer has made a transaction.
-- That means: both the customer must exist in the 'customers' table, and a matching 'customer_id'
-- must also exist in the 'transactions' table.

-- 🧠 How to Think About Joins:
-- 1️⃣ Start by identifying the relationship: 
--     - 'transactions.customer_id' is a FOREIGN KEY that points to 'customers.customer_id'.
-- 2️⃣ Decide which table is the LEFT and RIGHT:
--     - In this case, 'transactions' is on the left (we're interested in transaction data first),
--       and we are pulling customer info from the right (the 'customers' table).
-- 3️⃣ Use the common column to join:
--     - Here, it's 'customer_id' in both tables.

-- ✅ This query will show ONLY customers who have made at least one transaction.

SELECT transaction_id, first_name, last_name, amount
FROM transactions 
INNER JOIN customers
ON transactions.customer_id = customers.customer_id;


-- ===========================================
-- Step: LEFT JOIN between 'transactions' and 'customers'
-- ===========================================

-- This query retrieves the transaction ID, first name, last name, and amount
-- by joining the 'transactions' table with the 'customers' table.

-- 💡 Join Logic:
-- We are using LEFT JOIN to return all transactions, including those
-- where the customer no longer exists or was never assigned.

-- 🧠 How to Think About Joins:
-- 1️⃣ 'transactions' is the LEFT table — we want to keep all its rows.
-- 2️⃣ 'customers' is the RIGHT table — we bring in matching customer info if available.
-- 3️⃣ The join is done using the shared 'customer_id' column in both tables.

-- ✅ This query will show ALL transactions, with NULLs in customer columns
--     for those not linked to any existing customer.


SELECT 
    transaction_id,  
    first_name,  
    last_name, 
    amount   
FROM transactions       -- LEFT table: All transactions are shown
LEFT JOIN customers     -- RIGHT table: We try to match each transaction to a customer
ON transactions.customer_id = customers.customer_id;




-- ===========================================
-- Step: RIGHT JOIN between 'transactions' and 'customers'
-- ===========================================

-- This query retrieves the transaction ID, first name, last name, and amount
-- by joining the 'transactions' table with the 'customers' table.

-- 💡 Join Logic:
-- We are using RIGHT JOIN to return all customers, including those
-- who have not made any transactions.

-- 🧠 How to Think About Joins:
-- 1️⃣ 'transactions' is the LEFT table, 'customers' is the RIGHT.
-- 2️⃣ We keep all rows from 'customers', and match transactions if available.
-- 3️⃣ The join uses 'customer_id' from both tables.

-- ✅ This query will show ALL customers, with NULLs in transaction columns
--     for those who have no matching transaction.

SELECT 
    t.transaction_id,
    c.first_name,
    c.last_name,
    t.amount
FROM transactions t
RIGHT JOIN customers c
ON t.customer_id = c.customer_id;


-- ===========================================
-- MySQL Functions Overview
-- ===========================================
-- Functions in MySQL are operations that take input (optional),
-- perform a specific task, and return a single value.
-- They are widely used in SELECT, WHERE, GROUP BY, and ORDER BY clauses.

-- ===========================================
-- STRING FUNCTIONS
-- ===========================================
--  CONCAT(str1, str2, ...)    : Joins strings.
--  UPPER(str)                 : Converts a string to uppercase.
--  LOWER(str)                 : Converts a string to lowercase.
--  LENGTH(str)                : Returns the length of a string.
--  SUBSTRING(str, start, len) : Extracts part of a string.
--  REPLACE(str, from, to)     : Replaces occurrences of a substring.
--  TRIM(str)                  : Removes leading and trailing spaces.

-- Example: Combine first and last name into full_name
SELECT CONCAT(first_name, ' ', last_name) AS full_name 
FROM customers;

-- ===========================================
--  NUMERIC FUNCTIONS
-- ===========================================
--  ABS(x)      : Absolute value of x.
--  ROUND(x, d) : Rounds x to d decimal places.
--  CEIL(x)     : Rounds x up to the nearest integer.
--  FLOOR(x)    : Rounds x down to the nearest integer.
--  MOD(x, y)   : Returns remainder of x / y.
--  POWER(x, y) : Returns x raised to power y.

-- Example: Round transaction amounts to nearest whole number
SELECT transaction_id, ROUND(amount, 0) AS rounded_amount
FROM transactions;

-- ===========================================
-- ️DATE/TIME FUNCTIONS
-- ===========================================
--  NOW()          : Current date and time.
--  CURDATE()      : Current date.
--  CURTIME()      : Current time.
--  DATE(expr)     : Extracts date from a datetime.
--  YEAR(date)     : Extracts the year.
--  MONTH(date)    : Extracts the month.
--  DATEDIFF(d1,d2): Days between two dates.

-- Example: Get current timestamp with transactions
SELECT transaction_id, amount, NOW() AS current_time
FROM transactions;

-- ===========================================
--  AGGREGATE FUNCTIONS
-- ===========================================
--  COUNT(expr) : Number of rows (non-NULL).
--  SUM(expr)   : Sum of values.
--  AVG(expr)   : Average of values.
--  MIN(expr)   : Smallest value.
--  MAX(expr)   : Largest value.

-- ===========================
-- TYPE / CONVERSION FUNCTIONS
-- ===========================
-- CAST(expr AS type) → Convert to given type.
-- CONVERT(expr, type) → Similar to CAST.
-- BINARY expr → Force binary comparison (case-sensitive).


-- Find total and average transaction amount
SELECT 
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_amount,
    COUNT(*) AS total_transactions
FROM transactions;

-- ===========================================
-- CONTROL FUNCTIONS
-- ===========================================
--  IF(condition, true_val, false_val): Returns true_val if condition is true, else false_val.
--  IFNULL(expr, alt_val)             : Returns expr if not NULL, otherwise alt_val.
--  CASE ... WHEN ... THEN ... END    : Multi-condition control structure.

-- Label transactions based on amount
SELECT 
    transaction_id,
    amount,
    CASE 
        WHEN amount > 4 THEN 'High Value'
        WHEN amount BETWEEN 2 AND 4 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS transaction_type
FROM transactions;

-- ===========================================
-- ===========================================




select max(amount) as maximum ## as alis
from transactions;


select min(amount) as minimum
from transactions;


select sum(amount) as sum
from transactions;

select * from employees;

select concat(first_name," ",last_name) as full_name
from employees;