-- ==========================================================
-- File: 04_views.sql
-- Purpose: Create useful BI Views
-- ==========================================================

-- Customer Spend View
CREATE VIEW vw_CustomerSales AS
SELECT c.FullName, c.Email, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
GROUP BY c.FullName, c.Email;

-- Product Performance View
CREATE VIEW vw_ProductPerformance AS
SELECT p.ProductName, p.Category, SUM(od.Quantity) AS UnitsSold
FROM Products p
JOIN OrderDetails od ON od.ProductID = p.ProductID
GROUP BY p.ProductName, p.Category;
