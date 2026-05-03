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

/*
**Ejercicio 6.** Mostrá los 5 productos más vendidos (por cantidad total).
Incluí nombre del producto, categoría y cantidad total vendida.
*/
SELECT  p.ProductName,
        c.CategoryName,
        SUM(od.Quantity) AS CantidadTotalVendida
FROM    OrderDetails od
JOIN    Products p ON od.ProductID = p.ProductID
JOIN    Categories c ON p.CategoryID = c.CategoryID
GROUP BY p.ProductID, p.ProductName, c.CategoryName
ORDER BY CantidadTotalVendida DESC
LIMIT 5;

/*
**Ejercicio 7.** ¿Qué proveedor genera más revenue en total? Calculá el revenue por proveedor,
ordenado de mayor a menor.
*/
SELECT  s.CompanyName AS Proveedor,
        s.Country AS Pais,
        ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS RevenueTotal
FROM    Suppliers s
JOIN    Products p ON s.SupplierID = p.SupplierID
JOIN    OrderDetails od ON p.ProductID = od.ProductID
GROUP BY s.SupplierID, s.CompanyName, s.Country
ORDER BY RevenueTotal DESC
LIMIT 1;

/*
**Ejercicio 8.** Calculá el tiempo promedio de envío (días entre `OrderDate` y `ShippedDate`)
por empresa de envío (`Shippers`). ¿Cuál es más rápida?
*/
SELECT  sh.CompanyName AS EmpresaEnvio,
        ROUND(AVG(DATEDIFF(o.ShippedDate, o.OrderDate)), 2) AS TiempoPromedioEnvio
FROM    Orders o
JOIN    Shippers sh ON o.ShipperID = sh.ShipperID
WHERE   o.ShippedDate IS NOT NULL
GROUP BY sh.ShipperID, sh.CompanyName
ORDER BY TiempoPromedioEnvio ASC
LIMIT 1;

/*
**Ejercicio 9.** Encontrá los clientes que hicieron **más de 3 pedidos** y cuyo **revenue total supera £1000**.
Mostrá cliente, país, cantidad de pedidos y revenue total.
*/
SELECT  c.CustomerID,
        c.CompanyName,
        c.Country,
        COUNT(o.OrderID) AS CantidadPedidos,
        ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS RevenueTotal
FROM    Customers c
JOIN    Orders o ON c.CustomerID = o.CustomerID
JOIN    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, c.Country
HAVING  COUNT(o.OrderID) > 3
  AND   SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) > 1000
ORDER BY RevenueTotal DESC;

/*
**Ejercicio 10.** Usando la vista `vw_orden_detalle`,
encontrá el empleado con mayor revenue en cada país de
envío. *(Pista: subconsulta o CTE)*
*/
WITH RevenueEmpleados AS (
    SELECT  ShipCountry AS PaisEnvio,
            CONCAT(FirstName, ' ', LastName) AS Empleado,
            ROUND(SUM(LineTotal), 2) AS Revenue
    FROM    vw_orden_detalle
    GROUP BY ShipCountry, FirstName, LastName
)
SELECT  r.PaisEnvio,
        r.Empleado,
        r.Revenue
FROM    RevenueEmpleados r
WHERE   r.Revenue = (
    SELECT MAX(Revenue)
    FROM   RevenueEmpleados r2
    WHERE  r2.PaisEnvio = r.PaisEnvio
)
ORDER BY r.Revenue DESC;