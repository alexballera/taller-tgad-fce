-- MySQL Northwind Database
-- This script creates the Northwind database and populates it with sample data.
USE northwind;

-- Sample Queries
SELECT * FROM Products LIMIT 10;

SELECT ProductName,
    UnitPrice,
    UnitsInStock,
    Discontinued
FROM Products
ORDER BY UnitPrice DESC
LIMIT 10;