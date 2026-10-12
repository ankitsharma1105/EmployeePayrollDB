--Task : 1

CREATE OR ALTER PROCEDURE GetEmployeeSalaryReport
    @department_name VARCHAR(50),
    @minimum_salary DECIMAL(10,2)
AS
BEGIN
    SELECT
        employee_id,
        employee_name,
        department,
        designation,
        basic_salary,
        joining_date
    FROM employees
    WHERE department = @department_name
      AND basic_salary >= @minimum_salary
      AND status = 'Active';
END;
GO

EXEC GetEmployeeSalaryReport
    @department_name = 'IT',
    @minimum_salary = 50000;
GO


--Task:2

CREATE OR ALTER PROCEDURE CalculateEmployeeSalary
    @employee_id INT
AS
BEGIN
    SELECT
        employee_name,
        basic_salary AS Basic_Salary,
        basic_salary * 0.20 AS HRA,
        basic_salary * 0.10 AS DA,
        basic_salary * 0.12 AS PF,
        basic_salary
          + (basic_salary * 0.20)
          + (basic_salary * 0.10)
          - (basic_salary * 0.12) AS Net_Salary
    FROM employees
    WHERE employee_id = @employee_id;
END;
GO

EXEC CalculateEmployeeSalary @employee_id = 101;
GO

--Task : 3

CREATE OR ALTER PROCEDURE EmployeeSalaryGrade
    @employee_id INT
AS
BEGIN
    SELECT
        employee_name,
        basic_salary AS Basic_Salary,
        CASE
            WHEN basic_salary < 30000 THEN 'C'
            WHEN basic_salary <= 60000 THEN 'B'
            ELSE 'A'
        END AS Salary_Grade
    FROM employees
    WHERE employee_id = @employee_id;
END;
GO

EXEC EmployeeSalaryGrade @employee_id = 101;
GO

--Task :4

CREATE OR ALTER PROCEDURE GetDepartmentSummary
    @department_name VARCHAR(50)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM employees
        WHERE department = @department_name
    )
    BEGIN
        SELECT
            department,
            COUNT(*) AS Total_Employees,
            AVG(basic_salary) AS Average_Salary,
            MAX(basic_salary) AS Highest_Salary,
            MIN(basic_salary) AS Lowest_Salary,
            SUM(basic_salary) AS Total_Salary_Expenditure
        FROM employees
        WHERE department = @department_name
        GROUP BY department;
    END
    ELSE
    BEGIN
        PRINT 'Department does not exist.';
    END
END;
GO

EXEC GetDepartmentSummary @department_name = 'IT';
GO