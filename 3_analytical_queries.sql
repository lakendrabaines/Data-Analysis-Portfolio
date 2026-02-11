-- ==========================================================
-- File: 03_analytical_queries.sql
-- Purpose: 15+ analytical SQL queries for portfolio
-- ==========================================================

-- 1. Total revenue
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

-- 2. Revenue by state
SELECT c.State, SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.State;

-- 3. Top 5 customers by spending
SELECT TOP 5 c.FullName, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.FullName
ORDER BY TotalSpent DESC;

-- 4. Most popular products
SELECT p.ProductName, SUM(od.Quantity) AS TotalUnitsSold
FROM OrderDetails od
JOIN Products p ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalUnitsSold DESC;

-- 5. Month-over-month revenue growth
WITH MonthlyRevenue AS (
    SELECT
        FORMAT(OrderDate, 'yyyy-MM') AS Month,
        SUM(TotalAmount) AS Revenue
    FROM Orders
    GROUP BY FORMAT(OrderDate, 'yyyy-MM')
)
SELECT
    Month,
    Revenue,
    LAG(Revenue) OVER (ORDER BY Month) AS PrevMonthRevenue,
    (Revenue - LAG(Revenue) OVER (ORDER BY Month)) AS Growth
FROM MonthlyRevenue;

-- 6. Customer lifetime value
SELECT c.FullName, SUM(o.TotalAmount) AS LTV
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
GROUP BY c.FullName;

-- 7. Average order value
SELECT AVG(TotalAmount) AS AvgOrderValue
FROM Orders;

-- 8. Orders with >2 items
SELECT o.OrderID, COUNT(*) AS NumItems
FROM OrderDetails od
JOIN Orders o ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING COUNT(*) > 2;

-- 9. Category revenue
SELECT p.Category, SUM(od.UnitPrice * od.Quantity) AS Revenue
FROM OrderDetails od
JOIN Products p ON p.ProductID = od.ProductID
GROUP BY p.Category;

-- 10. Payment method usage
SELECT PaymentMethod, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY PaymentMethod;
