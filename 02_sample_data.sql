-- ==========================================================
-- File: 02_sample_data.sql
-- Purpose: Insert sample data into all tables
-- ==========================================================

-- Customers
INSERT INTO Customers (FullName, Email, City, State)
VALUES
('John Doe', 'john@example.com', 'Austin', 'TX'),
('Sarah Smith', 'sarah@example.com', 'Dallas', 'TX'),
('Kevin Johnson', 'kevin@example.com', 'Phoenix', 'AZ'),
('Emily Davis', 'emily@example.com', 'Miami', 'FL'),
('Michael Brown', 'michael@example.com', 'Denver', 'CO');

-- Products
INSERT INTO Products (ProductName, Category, Price)
VALUES
('Laptop', 'Electronics', 1200.00),
('Headphones', 'Electronics', 150.00),
('Office Chair', 'Furniture', 320.00),
('Standing Desk', 'Furniture', 550.00),
('Water Bottle', 'Accessories', 25.00);

-- Orders
INSERT INTO Orders (CustomerID, PaymentMethod, TotalAmount)
VALUES
(1, 'Credit Card', 1200.00),
(2, 'PayPal', 470.00),
(1, 'Credit Card', 175.00),
(3, 'Debit Card', 550.00),
(4, 'Credit Card', 345.00);

-- OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 1200.00),
(2, 2, 2, 150.00),
(2, 5, 2, 25.00),
(3, 2, 1, 150.00),
(4, 4, 1, 550.00),
(5, 3, 1, 320.00),
(5, 5, 1, 25.00);

-- Payments
INSERT INTO Payments (OrderID, Amount, Status)
VALUES
(1, 1200.00, 'Completed'),
(2, 470.00, 'Completed'),
(3, 175.00, 'Completed'),
(4, 550.00, 'Completed'),
(5, 345.00, 'Completed');
