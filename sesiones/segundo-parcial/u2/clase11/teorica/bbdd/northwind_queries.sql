-- MySQL Northwind Database
USE northwind;

-- Queries for the Northwind Database
-- Mostrar las tablas disponibles en la base de datos
SHOW TABLES;

--- Mostrar la estructura de una tabla específica
DESCRIBE `Products`;

-- 1.1 — Ver todas las categorías de productos
SELECT * FROM `categories`;

-- 1.2 — Productos con su precio y stock
SELECT `ProductName`,
       `UnitPrice`,
       `UnitsInStock`,
       `Discontinued`
FROM `Products`
ORDER BY `UnitPrice` DESC
LIMIT 10;

-- 1.3 — Filtrar por condición: productos caros con stock disponible
SELECT `ProductName`,
       `UnitPrice`,
       `UnitsInStock`,
       `Discontinued`
FROM `Products`
WHERE `UnitPrice` > 50 AND `Discontinued` = 0
ORDER BY `UnitPrice` DESC;

-- 1.4 — Clientes de un país específico
SELECT `CustomerID`,
       `CompanyName`,
       `ContactName`,
       `City`
FROM `Customers`
WHERE `Country` = 'Germany'
ORDER BY `CompanyName`;

-- 1.5 — Búsqueda con LIKE: productos que contienen una palabra
SELECT `ProductName`,
       `UnitPrice`
FROM `Products`
WHERE `ProductName` LIKE '%Cheese%'
OR `ProductName` LIKE '%Queso%'
ORDER BY `ProductName`;

-- 1.6 — Columnas calculadas: total en stock
SELECT `ProductName`,
       `UnitPrice`,
       `UnitsInStock`,
       ROUND(`UnitPrice` * `UnitsInStock`, 2) AS `ValorEnStock`
FROM `Products`
ORDER BY `ValorEnStock` DESC
LIMIT 10;