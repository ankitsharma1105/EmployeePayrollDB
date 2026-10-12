CREATE DATABASE EmployeePayrollDB;
USE EmployeePayrollDB;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    basic_salary DECIMAL(10,2) NOT NULL,
    joining_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active'
);

Select * From employees;

-- Insert 10 Sample Employees

INSERT INTO employees
(employee_id, employee_name, department, designation,
 basic_salary, joining_date, status)
VALUES
(101, 'Rahul Sharma', 'IT', 'SQL Developer', 55000, '2024-01-15', 'Active'),
(102, 'Priya Patel', 'IT', 'Software Developer', 65000, '2023-06-10', 'Active'),
(103, 'Amit Verma', 'HR', 'HR Executive', 35000, '2024-03-20', 'Active'),
(104, 'Sneha Gupta', 'Finance', 'Accountant', 45000, '2022-11-05', 'Active'),
(105, 'Rohit Singh', 'IT', 'Junior Developer', 28000, '2025-02-01', 'Active'),
(106, 'Neha Joshi', 'HR', 'HR Manager', 70000, '2021-08-12', 'Active'),
(107, 'Karan Mehta', 'Sales', 'Sales Executive', 30000, '2024-07-18', 'Inactive'),
(108, 'Pooja Shah', 'Finance', 'Financial Analyst', 62000, '2023-09-25', 'Active'),
(109, 'Vikas Yadav', 'Sales', 'Sales Manager', 75000, '2022-04-14', 'Active'),
(110, 'Anjali Desai', 'IT', 'System Analyst', 60000, '2023-12-01', 'Inactive');

SELECT * FROM employees;

