-- ==========================================================
-- File: 06_triggers.sql
-- Purpose: Data quality triggers
-- ==========================================================

-- Prevent negative quantities
CREATE TRIGGER trg_NoNegativeQuantity
ON OrderDetails
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Quantity <= 0)
    BEGIN
        RAISERROR ('Quantity must be positive.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
