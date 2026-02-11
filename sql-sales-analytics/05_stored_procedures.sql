-- ==========================================================
-- File: 05_stored_procedures.sql
-- Purpose: Common operational stored procedures
-- ==========================================================

-- Add new order procedure
CREATE PROCEDURE AddNewOrder
    @CustomerID INT,
    @PaymentMethod VARCHAR(30),
    @TotalAmount DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Orders (CustomerID, PaymentMethod, TotalAmount)
    VALUES (@CustomerID, @PaymentMethod, @TotalAmount);
END;
GO
