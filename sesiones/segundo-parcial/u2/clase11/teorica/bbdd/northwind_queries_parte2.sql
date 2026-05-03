-- MySQL Northwind Database
USE northwind;

/*
# PARTE 2 — Nivel Intermedio
## JOIN, GROUP BY, Subconsultas
*/

/*
### 2.1 — INNER JOIN: productos con su categoría y proveedor
*/
SELECT p.ProductName,
           c.CategoryName,
           s.CompanyName    AS Supplier,
           s.Country        AS SupplierCountry,
           p.UnitPrice
    FROM   Products   p
    JOIN   Categories c ON p.CategoryID  = c.CategoryID
    JOIN   Suppliers  s ON p.SupplierID  = s.SupplierID
    WHERE  p.Discontinued = 0
    ORDER BY c.CategoryName, p.UnitPrice DESC
    LIMIT 15;

/*
### 2.2 — JOIN con 4 tablas: detalle completo de pedidos
*/
SELECT o.OrderID,
           o.OrderDate,
           c.CompanyName                                  AS Cliente,
           CONCAT(e.FirstName, ' ', e.LastName)           AS Empleado,
           p.ProductName,
           od.Quantity                                    AS Cantidad,
           od.UnitPrice                                   AS PrecioUnit,
           od.Discount                                    AS Descuento,
           ROUND(od.Quantity * od.UnitPrice * (1 - od.Discount), 2) AS Total
    FROM   Orders      o
    JOIN   Customers   c  ON o.CustomerID  = c.CustomerID
    JOIN   Employees   e  ON o.EmployeeID  = e.EmployeeID
    JOIN   OrderDetails od ON o.OrderID    = od.OrderID
    JOIN   Products    p  ON od.ProductID  = p.ProductID
    ORDER BY o.OrderDate DESC
    LIMIT 15;

/*
### 2.3 — GROUP BY: ventas totales por país
*/
SELECT  c.Country,
            COUNT(DISTINCT o.OrderID)                                AS TotalPedidos,
            COUNT(DISTINCT o.CustomerID)                             AS Clientes,
            ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS RevenueTotal,
            ROUND(AVG(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS TicketPromedio
    FROM    Orders      o
    JOIN    Customers   c  ON o.CustomerID  = c.CustomerID
    JOIN    OrderDetails od ON o.OrderID    = od.OrderID
    GROUP BY c.Country
    ORDER BY RevenueTotal DESC;

/*
### 2.4 — HAVING: filtrar grupos
*/
SELECT  c.Country,
            COUNT(DISTINCT o.OrderID) AS TotalPedidos,
            ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Revenue
    FROM    Orders       o
    JOIN    Customers    c  ON o.CustomerID  = c.CustomerID
    JOIN    OrderDetails od ON o.OrderID     = od.OrderID
    GROUP BY c.Country
    HAVING  COUNT(DISTINCT o.OrderID) >= 5    -- solo países con 5+ pedidos
    ORDER BY Revenue DESC;

/*
### 2.5 — Ranking de empleados por ventas
*/
SELECT  CONCAT(e.FirstName, ' ', e.LastName)   AS Empleado,
            e.Title,
            COUNT(DISTINCT o.OrderID)              AS TotalPedidos,
            ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS VentasTotal
    FROM    Employees    e
    JOIN    Orders       o  ON e.EmployeeID  = o.EmployeeID
    JOIN    OrderDetails od ON o.OrderID     = od.OrderID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName, e.Title
    ORDER BY VentasTotal DESC;

/**
### 2.6 — Ventas por categoría y mes
*/
SELECT  DATE_FORMAT(o.OrderDate, '%Y-%m') AS Mes,
            cat.CategoryName,
            ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS Revenue
    FROM    Orders       o
    JOIN    OrderDetails od  ON o.OrderID    = od.OrderID
    JOIN    Products     p   ON od.ProductID = p.ProductID
    JOIN    Categories   cat ON p.CategoryID = cat.CategoryID
    GROUP BY Mes, cat.CategoryName
    ORDER BY Mes, Revenue DESC;


/*
### 2.7 — LEFT JOIN: clientes que nunca compraron
*/
SELECT  c.CustomerID,
            c.CompanyName,
            c.Country,
            COUNT(o.OrderID) AS TotalPedidos
    FROM    Customers c
    LEFT JOIN Orders  o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CompanyName, c.Country
    HAVING  TotalPedidos = 0;

/*
### 2.8 — Subconsulta: productos con precio mayor al promedio de su categoría
*/
SELECT  p.ProductName,
            cat.CategoryName,
            p.UnitPrice,
            ROUND(prom.PromedioCat, 2) AS PromedioDeLaCategoria
    FROM    Products    p
    JOIN    Categories  cat ON p.CategoryID = cat.CategoryID
    JOIN (
        -- Subconsulta: precio promedio por categoría
        SELECT  CategoryID,
                AVG(UnitPrice) AS PromedioCat
        FROM    Products
        WHERE   Discontinued = 0
        GROUP BY CategoryID
    ) prom ON p.CategoryID = prom.CategoryID
    WHERE   p.UnitPrice > prom.PromedioCat
      AND   p.Discontinued = 0
    ORDER BY cat.CategoryName, p.UnitPrice DESC;

/*
### 2.9 — Subconsulta correlacionada: el pedido más grande de cada cliente
*/
SELECT  c.CompanyName,
            c.Country,
            o.OrderID,
            o.OrderDate,
            ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS TotalPedido
    FROM    Orders       o
    JOIN    Customers    c   ON o.CustomerID  = c.CustomerID
    JOIN    OrderDetails od  ON o.OrderID     = od.OrderID
    GROUP BY o.OrderID, c.CompanyName, c.Country, o.OrderDate
    HAVING  TotalPedido = (
        -- Subconsulta: máximo revenue para ese cliente
        SELECT MAX(sub_total)
        FROM (
            SELECT  o2.CustomerID,
                    SUM(od2.Quantity * od2.UnitPrice * (1 - od2.Discount)) AS sub_total
            FROM    Orders       o2
            JOIN    OrderDetails od2 ON o2.OrderID = od2.OrderID
            WHERE   o2.CustomerID = o.CustomerID
            GROUP BY o2.OrderID
        ) t
    )
    ORDER BY TotalPedido DESC
    LIMIT 10;

/*
### 2.10 — Usar la vista `vw_orden_detalle`
*/
SELECT * FROM vw_orden_detalle LIMIT 10;

SELECT  CustomerCountry,
            CategoryName,
            ROUND(SUM(LineTotal), 2) AS Revenue
    FROM    vw_orden_detalle
    GROUP BY CustomerCountry, CategoryName
    ORDER BY Revenue DESC
    LIMIT 15;

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