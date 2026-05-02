-- MySQL Northwind Database
-- This script creates the Northwind database and populates it with sample data.
USE northwind;

-- Queries for the Northwind Database
-- Mostrar las tablas disponibles en la base de datos
SHOW TABLES;

--- Mostrar la estructura de una tabla específica
DESCRIBE Products;

-- 1.1 — Ver todas las categorías de productos
SELECT * FROM categories;

SELECT ProductName,
    UnitPrice,
    UnitsInStock,
    Discontinued
FROM Products
ORDER BY UnitPrice DESC
LIMIT 10;
