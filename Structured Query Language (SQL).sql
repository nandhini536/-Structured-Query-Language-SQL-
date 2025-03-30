--  Structured Query Language (SQL)
--  Creating a Database and Table
-- Create a database called "company_db"
CREATE DATABASE company_db;

-- Use the database
USE company_db;

-- Create a table called "employees"
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Insert data into the "employees" table
INSERT INTO employees (first_name, last_name, email, salary, hire_date)
VALUES 
('John', 'Doe', 'john.doe@example.com', 55000, '2022-06-01'),
('Jane', 'Smith', 'jane.smith@example.com', 60000, '2021-09-15'),
('Alice', 'Johnson', 'alice.johnson@example.com', 45000, '2023-01-10');

-- Select all data from the "employees" table
SELECT * FROM employees;

-- Select specific columns (e.g., first name, last name, and salary)
SELECT first_name, last_name, salary FROM employees;

-- Select employees with a salary greater than $50,000
SELECT * FROM employees WHERE salary > 50000;

-- Update the salary of the employee with employee_id = 1
UPDATE employees 
SET salary = 60000
WHERE employee_id = 1;

-- Delete the employee with employee_id = 3
DELETE FROM employees WHERE employee_id = 3;

-- Find the average salary of all employees
SELECT AVG(salary) AS average_salary FROM employees;

-- Find the total salary of all employees
SELECT SUM(salary) AS total_salary FROM employees;

-- Find the highest and lowest salary
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary FROM employees;

--  Using GROUP BY and HAVING
SELECT department, COUNT(*) AS number_of_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- Joining Tables (Assuming a second table 'departments')

-- Create a departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100)
);
-- Insert data into the departments table
INSERT INTO departments (department_name)
VALUES 
('HR'),
('Finance'),
('IT');

-- Add a foreign key column to the employees table (department_id)
ALTER TABLE employees ADD COLUMN department_id INT;

-- Update employee records with department ids (for demonstration)
UPDATE employees SET department_id = 1 WHERE employee_id = 1;
UPDATE employees SET department_id = 2 WHERE employee_id = 2;
UPDATE employees SET department_id = 3 WHERE employee_id = 3;

-- Perform an INNER JOIN to get employee names with their department names
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;
9. Using LIKE, BETWEEN, and OR:
sql
Copy code
-- Find employees whose first name starts with 'J'
SELECT * FROM employees WHERE first_name LIKE 'J%';

-- Find employees who were hired between two dates
SELECT * FROM employees WHERE hire_date BETWEEN '2021-01-01' AND '2022-01-01';

-- Find employees who either have a salary greater than $55,000 or were hired before 2021
SELECT * FROM employees WHERE salary > 55000 OR hire_date < '2021-01-01';

-- Get the first 2 employees from the table
SELECT * FROM employees LIMIT 2;

