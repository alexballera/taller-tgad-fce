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

-- 1.7 — Pedidos en un rango de fechas
SELECT  `CustomerID`,
        `OrderDate`,
         `ShipCountry`,
         `Freight`,
         `OrderDate`
FROM `Orders`
WHERE `OrderDate` BETWEEN '2023-10-01' AND '2023-10-31'
ORDER BY `OrderDate`
LIMIT 10;

-- 1.8 — Productos descontinuados vs activos
SELECT 
        CASE
            WHEN `Discontinued` = 1 THEN 'Descontinuado'
            ELSE 'Activo'
        END AS `Estado`,
        COUNT(*) AS `Cantidad`
FROM `Products`
GROUP BY `Discontinued`;

/*
**Ejercicio 1.** Listá todos los empleados ordenados por fecha de contratación
(más antiguos primero). Mostrá nombre, apellido, cargo y fecha.
*/
SELECT `FirstName`,
       `LastName`,
       `Title`,
       `HireDate`
FROM `Employees`
ORDER BY `HireDate` ASC;

/*
**Ejercicio 2.** ¿Cuántos clientes hay en cada país? Mostrá los 10 países con más clientes.
*/
SELECT `Country`,
       COUNT(*) AS `CantidadClientes`
FROM `Customers`
GROUP BY `Country`
ORDER BY `CantidadClientes` DESC
LIMIT 10;

/*
**Ejercicio 3.** Encontrá los productos cuyo stock está por debajo del nivel de reposición
(`ReorderLevel`). Mostrá nombre, stock actual y nivel de reposición, ordenados por la diferencia.
*/
SELECT `ProductName`,
       `UnitsInStock`,
       `ReorderLevel`,
       (`ReorderLevel` - `UnitsInStock`) AS `Diferencia`
FROM `Products`
WHERE `UnitsInStock` < `ReorderLevel`
ORDER BY `Diferencia` DESC
LIMIT 10;

/*
**Ejercicio 4.** Listá los pedidos enviados a Brasil. ¿Cuál fue el flete más caro?
*/
SELECT `OrderID`,
       `CustomerID`,
       `OrderDate`,
       `ShipCountry`,
       `Freight`
FROM `Orders`
WHERE `ShipCountry` = 'Brazil'
ORDER BY `Freight` DESC
LIMIT 1;

/*
**Ejercicio 5.** Mostrá los pedidos del mes de noviembre 2023,
incluyendo una columna calculada que indique cuántos días tardó
en enviarse (`ShippedDate - OrderDate`).
*/
SELECT `OrderId`,
       `CustomerId`,
       `OrderDate`,
       `ShippedDate`,
       (DATEDIFF(`ShippedDate`, `OrderDate`)) AS `DiasRetrasoEnvio`
FROM `Orders`
WHERE `OrderDate` BETWEEN '2023-11-01' AND '2023-11-30'
ORDER BY `DiasRetrasoEnvio` DESC;