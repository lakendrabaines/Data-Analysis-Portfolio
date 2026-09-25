/*
===========================================================
WORKFORCE ATTRITION ANALYSIS
Author: Lakendra Baines
Database: PostgreSQL
Project: Workforce Analytics & Employee Attrition

Purpose:
Analyze employee attrition patterns across workforce
characteristics including overtime, job role, compensation,
tenure, and job satisfaction.
===========================================================
*/

-- =========================================================
-- 1. DATA VALIDATION
-- =========================================================

-- Confirm total number of employee records
SELECT COUNT(*) AS total_employees
FROM employee_attrition;

-- Check for duplicate employee records
SELECT employeenumber, COUNT(*) AS record_count
FROM employee_attrition
GROUP BY employeenumber
HAVING COUNT(*) > 1;

-- Validate attrition categories and employee counts
SELECT 
    attrition,
    COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY attrition
ORDER BY employee_count DESC;

-- =========================================================
-- 2. OVERALL ATTRITION ANALYSIS
-- =========================================================

-- Calculate overall employee attrition rate
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) 
        / COUNT(*),
        1
    ) AS attrition_rate_pct
FROM employee_attrition;

-- =========================================================
-- 3. ATTRITION BY OVERTIME
-- =========================================================

-- Compare attrition rates for employees who work overtime
-- versus employees who do not
SELECT
    overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        1
    ) AS attrition_rate_pct
FROM employee_attrition
GROUP BY overtime
ORDER BY attrition_rate_pct DESC;

-- =========================================================
-- 4. ATTRITION BY JOB ROLE
-- =========================================================

-- Identify job roles with the highest attrition rates
SELECT
    jobrole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        1
    ) AS attrition_rate_pct
FROM employee_attrition
GROUP BY jobrole
ORDER BY attrition_rate_pct DESC;

-- =========================================================
-- 5. ATTRITION BY JOB ROLE AND OVERTIME
-- =========================================================

-- Examine whether the relationship between overtime and
-- attrition differs across job roles
SELECT
    jobrole,
    overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        1
    ) AS attrition_rate_pct
FROM employee_attrition
GROUP BY jobrole, overtime
ORDER BY attrition_rate_pct DESC;

-- =========================================================
-- 6. COMPENSATION AND ATTRITION
-- =========================================================

-- Compare average monthly income between employees
-- who stayed and employees who left
SELECT
    attrition,
    ROUND(AVG(monthlyincome), 2) AS avg_monthly_income
FROM employee_attrition
GROUP BY attrition
ORDER BY attrition;

-- Compare average monthly income by job role and attrition status
-- to account for differences in compensation across roles
SELECT
    jobrole,
    attrition,
    COUNT(*) AS employee_count,
    ROUND(AVG(monthlyincome), 2) AS avg_monthly_income
FROM employee_attrition
GROUP BY jobrole, attrition
ORDER BY jobrole, attrition;

-- =========================================================
-- 7. TENURE AND ATTRITION
-- =========================================================

-- Compare average company tenure between employees
-- who stayed and employees who left
SELECT
    attrition,
    ROUND(AVG(yearsatcompany), 2) AS avg_years_at_company
FROM employee_attrition
GROUP BY attrition
ORDER BY attrition;

-- Create tenure groups and calculate attrition rate
-- for each stage of the employee lifecycle
WITH tenure_groups AS (
    SELECT
        attrition,
        CASE
            WHEN yearsatcompany = 0 THEN '<1 Year'
            WHEN yearsatcompany BETWEEN 1 AND 2 THEN '1-2 Years'
            WHEN yearsatcompany BETWEEN 3 AND 5 THEN '3-5 Years'
            WHEN yearsatcompany BETWEEN 6 AND 10 THEN '6-10 Years'
            ELSE '11+ Years'
        END AS tenure_group,
        CASE
            WHEN yearsatcompany = 0 THEN 1
            WHEN yearsatcompany BETWEEN 1 AND 2 THEN 2
            WHEN yearsatcompany BETWEEN 3 AND 5 THEN 3
            WHEN yearsatcompany BETWEEN 6 AND 10 THEN 4
            ELSE 5
        END AS tenure_order
    FROM employee_attrition
)

SELECT
    tenure_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        1
    ) AS attrition_rate_pct
FROM tenure_groups
GROUP BY tenure_group, tenure_order
ORDER BY tenure_order;

-- =========================================================
-- 8. JOB SATISFACTION AND ATTRITION
-- =========================================================

-- Compare attrition rates across job satisfaction levels
-- where 1 represents the lowest satisfaction and 4 the highest
SELECT
    jobsatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        1
    ) AS attrition_rate_pct
FROM employee_attrition
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction;