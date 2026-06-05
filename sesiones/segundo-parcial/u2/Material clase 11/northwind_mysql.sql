-- ============================================================
--  NORTHWIND DATABASE — MySQL
--  Dataset clásico de negocio: empresa distribuidora de alimentos
--  Tablas: Categories, Suppliers, Products, Customers,
--           Employees, Shippers, Orders, OrderDetails
-- ============================================================

DROP DATABASE IF EXISTS northwind;
CREATE DATABASE northwind CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE northwind;

-- ============================================================
-- TABLA 1: Categories
-- ============================================================
CREATE TABLE Categories (
    CategoryID   INT          NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(50)  NOT NULL,
    Description  TEXT,
    PRIMARY KEY (CategoryID)
);

INSERT INTO Categories (CategoryName, Description) VALUES
('Beverages',       'Soft drinks, coffees, teas, beers and ales'),
('Condiments',      'Sweet and savory sauces, relishes, spreads and seasonings'),
('Confections',     'Desserts, candies and sweet breads'),
('Dairy Products',  'Cheeses'),
('Grains/Cereals',  'Breads, crackers, pasta and cereal'),
('Meat/Poultry',    'Prepared meats'),
('Produce',         'Dried fruit and bean curd'),
('Seafood',         'Seaweed and fish');

-- ============================================================
-- TABLA 2: Suppliers
-- ============================================================
CREATE TABLE Suppliers (
    SupplierID   INT          NOT NULL AUTO_INCREMENT,
    CompanyName  VARCHAR(100) NOT NULL,
    ContactName  VARCHAR(100),
    ContactTitle VARCHAR(100),
    City         VARCHAR(50),
    Country      VARCHAR(50),
    Phone        VARCHAR(30),
    PRIMARY KEY (SupplierID)
);

INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, City, Country, Phone) VALUES
('Exotic Liquids',              'Charlotte Cooper',  'Purchasing Manager',  'London',        'UK',          '(171) 555-2222'),
('New Orleans Cajun Delights',  'Shelley Burke',     'Order Administrator', 'New Orleans',   'USA',         '(100) 555-4822'),
('Grandma Kellys Homestead',    'Regina Murphy',     'Sales Representative','Ann Arbor',     'USA',         '(313) 555-5735'),
('Tokyo Traders',               'Yoshi Nagase',      'Marketing Manager',   'Tokyo',         'Japan',       '(03) 3555-5011'),
('Cooperativa de Quesos',       'Antonio del Valle', 'Export Administrator','Oviedo',        'Spain',       '(98) 598 76 54'),
('Mayumis',                     'Mayumi Ohno',       'Marketing Representative','Osaka',     'Japan',       '(06) 431-7877'),
('Pavlova Ltd.',                'Ian Devling',       'Marketing Manager',   'Melbourne',     'Australia',   '(03) 444-2343'),
('Specialty Biscuits Ltd.',     'Peter Wilson',      'Sales Representative','Manchester',    'UK',          '(161) 555-4448'),
('PB Knäckebröd AB',            'Lars Peterson',     'Sales Agent',         'Göteborg',      'Sweden',      '031-987 65 43'),
('Refrescos Americanas LTDA',   'Carlos Diaz',       'Marketing Manager',   'Sao Paulo',     'Brazil',      '(11) 555 4640');

-- ============================================================
-- TABLA 3: Products
-- ============================================================
CREATE TABLE Products (
    ProductID       INT           NOT NULL AUTO_INCREMENT,
    ProductName     VARCHAR(100)  NOT NULL,
    SupplierID      INT,
    CategoryID      INT,
    UnitPrice       DECIMAL(10,2) NOT NULL DEFAULT 0,
    UnitsInStock    INT           NOT NULL DEFAULT 0,
    UnitsOnOrder    INT           NOT NULL DEFAULT 0,
    ReorderLevel    INT           NOT NULL DEFAULT 0,
    Discontinued    TINYINT(1)    NOT NULL DEFAULT 0,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO Products (ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES
('Chai',                        1, 1,  18.00, 39,  0,  10, 0),
('Chang',                       1, 1,  19.00, 17, 40,  25, 0),
('Aniseed Syrup',               1, 2,  10.00, 13, 70,  25, 0),
('Chef Anton''s Cajun',         2, 2,  22.00, 53,  0,   0, 0),
('Chef Anton''s Gumbo Mix',     2, 2,  21.35,  0,  0,   0, 1),
('Grandma''s Boysenberry',      3, 2,  25.00, 120, 0,  25, 0),
('Uncle Bob''s Organic Dried',  3, 7,  30.00, 15,  0,  10, 0),
('Northwoods Cranberry Sauce',  3, 2,  40.00,  6,  0,   0, 0),
('Mishi Kobe Niku',             4, 6,  97.00, 29,  0,   0, 1),
('Ikura',                       4, 8,  31.00, 31,  0,   0, 0),
('Queso Cabrales',              5, 4,  21.00, 22, 30,  30, 0),
('Queso Manchego La Pastora',   5, 4,  38.00, 86,  0,   0, 0),
('Konbu',                       6, 8,   6.00, 24,  0,   5, 0),
('Tofu',                        6, 7,  23.25, 35,  0,   0, 0),
('Genen Shouyu',                6, 2,  15.50, 39,  0,   5, 0),
('Pavlova',                     7, 3,  17.45, 29,  0,  10, 0),
('Alice Mutton',                7, 6,  39.00,  0,  0,   0, 1),
('Carnarvon Tigers',            7, 8,  62.50, 42,  0,   0, 0),
('Teatime Chocolate Biscuits',  8, 3,   9.20, 25,  0,   5, 0),
('Sir Rodney''s Marmalade',     8, 3,  81.00, 40,  0,   0, 0),
('Sir Rodney''s Scones',        8, 3,  10.00,  3,  40, 10, 0),
('Tunnbröd',                    9, 5,   9.00, 61,  0,  25, 0),
('Guaraná Fantástica',          10, 1,  4.50, 20,  0,   0, 1),
('NuNuCa Nuß-Nougat',           6, 3,  14.00, 76,  0,  30, 0),
('Gumbär Gummibärchen',         6, 3,  31.23, 15,  0,   0, 0),
('Schoggi Schokolade',          7, 3,  43.90, 49,  0,  30, 0),
('Rössle Sauerkraut',           9, 7,  45.60, 26,  0,   0, 1),
('Thüringer Rostbratwurst',     9, 6, 123.79,  0,  0,   0, 1),
('Nord-Ost Matjeshering',       9, 8,  25.89, 10,  0,  15, 0),
('Gorgonzola Telino',           5, 4,  12.50,  0, 70,  20, 0),
('Mascarpone Fabioli',          5, 4,  32.00,  9, 40,  25, 0),
('Geitost',                     7, 4,   2.50, 112, 0,  20, 0),
('Sasquatch Ale',               2, 1,  14.00, 111, 0,  15, 0),
('Steeleye Stout',              2, 1,  18.00, 20,  0,  15, 0),
('Inlagd Sill',                 9, 8,  19.00, 112, 0,  20, 0),
('Gravad lax',                  9, 8,  26.00, 11, 50,  25, 0),
('Côte de Blaye',               1, 1, 263.50, 17, 0,   15, 0),
('Chartreuse verte',            1, 1,  18.00, 69,  0,   5, 0),
('Boston Crab Meat',            2, 8,  18.40, 123, 0,  30, 0),
('Jack''s New England Clam',    2, 8,   9.65, 85,  0,  10, 0),
('Singaporean Hokkien',         6, 5,  14.00, 26,  0,   0, 1),
('Ipoh Coffee',                 6, 1,  46.00, 17, 10,  25, 0),
('Lakkalikööri',                6, 1,  18.00, 57,  0,  20, 0),
('Longlife Tofu',               6, 7,  10.00,  4, 20,   5, 0),
('Rhönbräu Klosterbier',        9, 1,   7.75, 125, 0,  25, 0),
('Röd Kaviar',                  9, 8,  15.00, 101, 0,  5,  0),
('Flotemysost',                 7, 4,  21.50, 26,  0,  0,  0),
('Mozzarella di Giovanni',      5, 4,  34.80, 14,  0,  0,  0),
('Rösti',                       3, 5,  45.60, 26,  0,  0,  0),
('Perth Pasties',               7, 6,  32.80, 0,   0,  0,  1);

-- ============================================================
-- TABLA 4: Customers
-- ============================================================
CREATE TABLE Customers (
    CustomerID   CHAR(5)      NOT NULL,
    CompanyName  VARCHAR(100) NOT NULL,
    ContactName  VARCHAR(100),
    ContactTitle VARCHAR(100),
    City         VARCHAR(50),
    Country      VARCHAR(50),
    PRIMARY KEY (CustomerID)
);

INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, City, Country) VALUES
('ALFKI', 'Alfreds Futterkiste',          'Maria Anders',       'Sales Representative',  'Berlin',        'Germany'),
('ANATR', 'Ana Trujillo Emparedados',     'Ana Trujillo',       'Owner',                 'Mexico D.F.',   'Mexico'),
('ANTON', 'Antonio Moreno Taquería',      'Antonio Moreno',     'Owner',                 'Mexico D.F.',   'Mexico'),
('AROUT', 'Around the Horn',              'Thomas Hardy',       'Sales Representative',  'London',        'UK'),
('BERGS', 'Berglunds snabbköp',           'Christina Berglund', 'Order Administrator',   'Luleå',         'Sweden'),
('BLAUS', 'Blauer See Delikatessen',      'Hanna Moos',         'Sales Representative',  'Mannheim',      'Germany'),
('BLONP', 'Blondesddsl père et fils',     'Frédérique Citeaux', 'Marketing Manager',     'Strasbourg',    'France'),
('BOLID', 'Bólido Comidas preparadas',    'Martín Sommer',      'Owner',                 'Madrid',        'Spain'),
('BONAP', "Bon app'",                     'Laurence Lebihan',   'Owner',                 'Marseille',     'France'),
('BOTTM', 'Bottom-Dollar Markets',        'Elizabeth Lincoln',  'Accounting Manager',    'Tsawassen',     'Canada'),
('BSBEV', "B's Beverages",               'Victoria Ashworth',  'Sales Representative',  'London',        'UK'),
('CACTU', 'Cactus Comidas para llevar',   'Patricio Simpson',   'Sales Agent',           'Buenos Aires',  'Argentina'),
('CENTC', 'Centro comercial Moctezuma',   'Francisco Chang',    'Marketing Manager',     'Mexico D.F.',   'Mexico'),
('CHOPS', 'Chop-suey Chinese',            'Yang Wang',          'Owner',                 'Bern',          'Switzerland'),
('COMMI', 'Comércio Mineiro',             'Pedro Afonso',       'Sales Associate',       'Sao Paulo',     'Brazil'),
('CONSH', 'Consolidated Holdings',        'Elizabeth Brown',    'Sales Representative',  'London',        'UK'),
('DRACD', 'Drachenblut Delikatessen',     'Sven Ottlieb',       'Order Administrator',   'Aachen',        'Germany'),
('DUMON', 'Du monde entier',              'Janine Labrune',     'Owner',                 'Nantes',        'France'),
('EASTC', 'Eastern Connection',           'Ann Devon',          'Sales Agent',           'London',        'UK'),
('ERNSH', 'Ernst Handel',                'Roland Mendel',      'Sales Manager',         'Graz',          'Austria'),
('FAMIA', 'Familia Arquibaldo',           'Aria Cruz',          'Marketing Assistant',   'Sao Paulo',     'Brazil'),
('FISSA', 'FISSA Fabrica Inter.',         'Diego Roel',         'Accounting Manager',    'Madrid',        'Spain'),
('FOLIG', 'Folies gourmandes',            'Martine Rancé',      'Assistant Sales Agent', 'Lille',         'France'),
('FOLKO', 'Folk och fä HB',              'Maria Larsson',      'Owner',                 'Bräcke',        'Sweden'),
('FRANK', 'Frankenversand',               'Peter Franken',      'Marketing Manager',     'München',       'Germany'),
('FRANR', 'France restauration',          'Carine Schmitt',     'Marketing Manager',     'Nantes',        'France'),
('FRANS', 'Franchi S.p.A.',              'Paolo Accorti',      'Sales Representative',  'Torino',        'Italy'),
('FURIB', 'Furia Bacalhau e Frutos',     'Lino Rodriguez',     'Sales Manager',         'Lisboa',        'Portugal'),
('GALED', 'Galería del gastrónomo',       'Eduardo Saavedra',   'Marketing Manager',     'Barcelona',     'Spain'),
('GODOS', 'Godos Cocina Típica',         'José Pedro Freyre',  'Sales Manager',         'Sevilla',       'Spain'),
('GOURL', 'Gourmet Lanchonetes',          'André Fonseca',      'Sales Associate',       'Campinas',      'Brazil'),
('GREAL', 'Great Lakes Food Market',      'Howard Snyder',      'Marketing Manager',     'Eugene',        'USA'),
('GROSR', 'GROSELLA-Restaurante',         'Manuel Pereira',     'Owner',                 'Caracas',       'Venezuela'),
('HANAR', 'Hanari Carnes',               'Mario Pontes',       'Accounting Manager',    'Rio de Janeiro','Brazil'),
('HILAA', 'HILARION-Abastos',             'Carlos Hernández',   'Sales Representative',  'San Cristóbal', 'Venezuela'),
('HUNGC', 'Hungry Coyote Import Store',   'Yoshi Latimer',      'Sales Representative',  'Elgin',         'USA'),
('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna',   'Sales Associate',       'Cork',          'Ireland'),
('ISLAT', 'Island Trading',              'Helen Bennett',      'Marketing Manager',     'Cowes',         'UK'),
('KOENE', 'Königlich Essen',              'Philip Cramer',      'Sales Associate',       'Brandenburg',   'Germany'),
('LACOR', 'La corne d''abondance',        'Daniel Tonini',      'Sales Representative',  'Versailles',    'France');

-- ============================================================
-- TABLA 5: Employees
-- ============================================================
CREATE TABLE Employees (
    EmployeeID  INT          NOT NULL AUTO_INCREMENT,
    LastName    VARCHAR(50)  NOT NULL,
    FirstName   VARCHAR(50)  NOT NULL,
    Title       VARCHAR(100),
    HireDate    DATE,
    City        VARCHAR(50),
    Country     VARCHAR(50),
    ReportsTo   INT,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (LastName, FirstName, Title, HireDate, City, Country, ReportsTo) VALUES
('Davolio',   'Nancy',    'Sales Representative',       '1992-05-01', 'Seattle',  'USA',  2),
('Fuller',    'Andrew',   'Vice President of Sales',    '1992-08-14', 'Tacoma',   'USA',  NULL),
('Leverling', 'Janet',    'Sales Representative',       '1992-04-01', 'Kirkland', 'USA',  2),
('Peacock',   'Margaret', 'Sales Representative',       '1993-05-03', 'Redmond',  'USA',  2),
('Buchanan',  'Steven',   'Sales Manager',              '1993-10-17', 'London',   'UK',   2),
('Suyama',    'Michael',  'Sales Representative',       '1993-10-17', 'London',   'UK',   5),
('King',      'Robert',   'Sales Representative',       '1994-01-02', 'London',   'UK',   5),
('Callahan',  'Laura',    'Inside Sales Coordinator',   '1994-03-05', 'Seattle',  'USA',  2),
('Dodsworth', 'Anne',     'Sales Representative',       '1994-11-15', 'London',   'UK',   5);

-- ============================================================
-- TABLA 6: Shippers
-- ============================================================
CREATE TABLE Shippers (
    ShipperID   INT          NOT NULL AUTO_INCREMENT,
    CompanyName VARCHAR(100) NOT NULL,
    Phone       VARCHAR(30),
    PRIMARY KEY (ShipperID)
);

INSERT INTO Shippers (CompanyName, Phone) VALUES
('Speedy Express',  '(503) 555-9831'),
('United Package',  '(503) 555-3199'),
('Federal Shipping','(503) 555-9931');

-- ============================================================
-- TABLA 7: Orders
-- ============================================================
CREATE TABLE Orders (
    OrderID      INT           NOT NULL AUTO_INCREMENT,
    CustomerID   CHAR(5),
    EmployeeID   INT,
    OrderDate    DATE,
    RequiredDate DATE,
    ShippedDate  DATE,
    ShipperID    INT,
    ShipCity     VARCHAR(50),
    ShipCountry  VARCHAR(50),
    Freight      DECIMAL(10,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID)  REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID)  REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID)   REFERENCES Shippers(ShipperID)
);

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipperID, ShipCity, ShipCountry, Freight) VALUES
('VINET', 5, '2023-07-04', '2023-08-01', '2023-07-16', 3, 'Reims',          'France',      32.38),
('TOMSP', 6, '2023-07-05', '2023-08-16', '2023-07-10', 1, 'Münster',        'Germany',     11.61),
('HANAR', 4, '2023-07-08', '2023-08-05', '2023-07-12', 2, 'Rio de Janeiro', 'Brazil',      65.83),
('VICTE', 3, '2023-07-08', '2023-08-05', '2023-07-15', 1, 'Lyon',           'France',      41.34),
('SUPRD', 4, '2023-07-09', '2023-08-06', '2023-07-11', 2, 'Charleroi',      'Belgium',     51.30),
('HANAR', 3, '2023-07-10', '2023-07-24', '2023-07-16', 2, 'Rio de Janeiro', 'Brazil',      58.17),
('CHOPS', 5, '2023-07-11', '2023-08-08', '2023-07-23', 2, 'Bern',           'Switzerland', 22.98),
('RICSU', 9, '2023-07-12', '2023-08-09', '2023-07-15', 1, 'Genève',         'Switzerland', 148.33),
('WELLI', 3, '2023-07-15', '2023-08-12', '2023-07-17', 2, 'Resende',        'Brazil',      13.97),
('HILAA', 4, '2023-07-16', '2023-08-13', '2023-07-22', 3, 'San Cristóbal',  'Venezuela',   81.91),
('ERNSH', 1, '2023-07-17', '2023-08-14', '2023-07-23', 1, 'Graz',           'Austria',     140.51),
('CENTC', 4, '2023-07-18', '2023-08-15', '2023-07-25', 3, 'Mexico D.F.',    'Mexico',      3.25),
('OTTIK', 2, '2023-07-19', '2023-08-16', '2023-07-29', 1, 'Köln',           'Germany',     55.09),
('QUEDE', 8, '2023-07-19', '2023-08-16', '2023-07-30', 2, 'Rio de Janeiro', 'Brazil',      3.05),
('RATTC', 5, '2023-07-22', '2023-08-19', '2023-07-25', 1, 'Albuquerque',    'USA',         48.29),
('ERNSH', 9, '2023-07-23', '2023-08-20', '2023-07-31', 3, 'Graz',           'Austria',     146.06),
('FOLKO', 8, '2023-07-24', '2023-08-21', '2023-08-23', 1, 'Bräcke',         'Sweden',      3.67),
('BLONP', 6, '2023-07-25', '2023-08-22', '2023-07-30', 1, 'Strasbourg',     'France',      55.28),
('WARTH', 8, '2023-07-26', '2023-08-23', '2023-07-31', 2, 'Cunewalde',      'Germany',     125.77),
('FRANK', 9, '2023-07-29', '2023-08-26', '2023-08-06', 1, 'München',        'Germany',     26.93),
('MEREP', 1, '2023-07-30', '2023-08-27', '2023-08-02', 2, 'Montréal',       'Canada',      44.12),
('BONAP', 2, '2023-07-31', '2023-08-28', '2023-08-07', 2, 'Marseille',      'France',      11.51),
('SIMOB', 4, '2023-08-01', '2023-08-29', '2023-08-09', 3, 'Oulu',           'Finland',     11.11),
('FRANK', 3, '2023-08-02', '2023-08-30', '2023-08-11', 3, 'München',        'Germany',     65.83),
('GROSR', 2, '2023-08-05', '2023-09-02', '2023-08-12', 1, 'Caracas',        'Venezuela',   36.71),
('WHITC', 7, '2023-08-06', '2023-09-03', '2023-08-15', 2, 'Seattle',        'USA',         149.00),
('ERNSH', 3, '2023-08-07', '2023-09-04', '2023-08-15', 1, 'Graz',           'Austria',     32.00),
('BLONP', 6, '2023-08-08', '2023-09-05', '2023-08-13', 1, 'Strasbourg',     'France',      7.09),
('BLONP', 6, '2023-08-09', '2023-09-06', '2023-08-14', 2, 'Strasbourg',     'France',      22.46),
('BLONP', 6, '2023-08-12', '2023-09-09', '2023-08-21', 3, 'Strasbourg',     'France',      12.69),
('BONAP', 3, '2023-08-13', '2023-09-10', '2023-08-27', 2, 'Marseille',      'France',      7.36),
('AROUT', 4, '2023-08-14', '2023-09-11', '2023-08-27', 2, 'London',         'UK',          123.83),
('HUNGO', 4, '2023-08-15', '2023-09-12', '2023-09-05', 2, 'Cork',           'Ireland',     10.64),
('SUPRD', 1, '2023-08-16', '2023-09-13', '2023-08-26', 2, 'Charleroi',      'Belgium',     98.03),
('BOLID', 8, '2023-08-19', '2023-09-16', '2023-08-30', 3, 'Madrid',         'Spain',       25.00),
('FURIB', 6, '2023-08-20', '2023-09-17', '2023-09-03', 1, 'Lisboa',         'Portugal',    5.90),
('WARTH', 6, '2023-08-21', '2023-09-18', '2023-08-29', 2, 'Cunewalde',      'Germany',     78.73),
('FRANK', 4, '2023-08-22', '2023-09-19', '2023-09-03', 3, 'München',        'Germany',     15.26),
('GODOS', 3, '2023-08-23', '2023-09-20', '2023-09-16', 3, 'Sevilla',        'Spain',       12.43),
('LEHMS', 3, '2023-08-26', '2023-09-23', '2023-09-02', 2, 'Frankfurt',      'Germany',     70.94),
('ERNSH', 4, '2023-08-27', '2023-09-24', '2023-09-02', 1, 'Graz',           'Austria',     1.35),
('WHITC', 7, '2023-08-28', '2023-09-25', '2023-09-03', 1, 'Seattle',        'USA',         3.01),
('HANAR', 3, '2023-08-29', '2023-09-26', '2023-09-05', 2, 'Rio de Janeiro', 'Brazil',      22.77),
('RATTC', 8, '2023-08-30', '2023-09-27', '2023-09-13', 3, 'Albuquerque',    'USA',         25.22),
('MEREP', 9, '2023-09-02', '2023-09-30', '2023-09-11', 1, 'Montréal',       'Canada',      152.30),
('BONAP', 2, '2023-09-03', '2023-10-01', '2023-09-10', 2, 'Marseille',      'France',      13.00),
('SIMOB', 7, '2023-09-04', '2023-10-02', '2023-09-23', 2, 'Oulu',           'Finland',     32.00),
('FRANK', 2, '2023-09-05', '2023-10-03', '2023-09-11', 1, 'München',        'Germany',     20.12),
('ROMEY', 4, '2023-09-06', '2023-10-04', '2023-09-11', 3, 'Madrid',         'Spain',       6.01),
('LILAS', 8, '2023-09-09', '2023-10-07', '2023-09-11', 2, 'Barquisimeto',   'Venezuela',   48.22),
('ERNSH', 1, '2023-09-10', '2023-10-08', '2023-09-16', 1, 'Graz',           'Austria',     110.37),
('FOLKO', 7, '2023-09-11', '2023-10-09', '2023-09-30', 2, 'Bräcke',         'Sweden',      110.37),
('HUNGO', 3, '2023-09-12', '2023-10-10', '2023-09-17', 2, 'Cork',           'Ireland',     33.97),
('ERNSH', 4, '2023-09-13', '2023-10-11', '2023-09-19', 1, 'Graz',           'Austria',     93.63),
('ROMEY', 4, '2023-09-16', '2023-10-14', '2023-09-24', 3, 'Madrid',         'Spain',       41.95),
('ALFKI', 6, '2023-09-17', '2023-10-15', '2023-09-27', 2, 'Berlin',         'Germany',     46.00),
('FRANK', 1, '2023-09-18', '2023-10-16', '2023-10-02', 3, 'München',        'Germany',     55.26),
('CACTU', 4, '2023-09-19', '2023-10-17', '2023-09-26', 3, 'Buenos Aires',   'Argentina',   1.51),
('BERGS', 3, '2023-09-20', '2023-10-18', '2023-10-01', 3, 'Luleå',          'Sweden',      262.00),
('FOLIG', 7, '2023-09-23', '2023-10-21', '2023-10-01', 1, 'Lille',          'France',      49.29),
('BONAP', 5, '2023-09-24', '2023-10-22', '2023-09-30', 1, 'Marseille',      'France',      191.67),
('SIMOB', 4, '2023-09-25', '2023-10-23', '2023-09-30', 3, 'Oulu',           'Finland',     4.54),
('FAMIA', 4, '2023-09-26', '2023-10-24', '2023-10-03', 2, 'Sao Paulo',      'Brazil',      35.12),
('HANAR', 1, '2023-09-27', '2023-10-25', '2023-10-01', 3, 'Rio de Janeiro', 'Brazil',      6.40),
('HILAA', 7, '2023-09-30', '2023-10-28', '2023-10-16', 3, 'San Cristóbal',  'Venezuela',   21.72),
('ERNSH', 9, '2023-10-01', '2023-10-29', '2023-10-07', 1, 'Graz',           'Austria',     23.94),
('FOLKO', 8, '2023-10-02', '2023-10-30', '2023-10-07', 2, 'Bräcke',         'Sweden',      66.29),
('BOLID', 4, '2023-10-03', '2023-10-31', '2023-10-10', 2, 'Madrid',         'Spain',       23.29),
('AROUT', 3, '2023-10-04', '2023-11-01', '2023-10-10', 2, 'London',         'UK',          13.34),
('ERNSH', 1, '2023-10-07', '2023-11-04', '2023-10-15', 1, 'Graz',           'Austria',     60.26),
('RATTC', 3, '2023-10-08', '2023-11-05', '2023-10-14', 3, 'Albuquerque',    'USA',         2.10),
('FAMIA', 7, '2023-10-09', '2023-11-06', '2023-10-14', 1, 'Sao Paulo',      'Brazil',      37.52),
('GOURL', 3, '2023-10-10', '2023-11-07', '2023-10-22', 2, 'Campinas',       'Brazil',      51.00),
('LETSS', 1, '2023-10-11', '2023-11-08', '2023-10-14', 2, 'San Francisco',  'USA',         7.56),
('ERNSH', 4, '2023-10-14', '2023-11-11', '2023-10-17', 3, 'Graz',           'Austria',     48.77),
('ALFKI', 4, '2023-10-15', '2023-11-12', '2023-10-22', 1, 'Berlin',         'Germany',     29.46),
('FRANK', 2, '2023-10-16', '2023-11-13', '2023-10-25', 1, 'München',        'Germany',     47.45),
('FOLIG', 8, '2023-10-17', '2023-11-14', '2023-10-22', 1, 'Lille',          'France',      80.05),
('BONAP', 5, '2023-10-18', '2023-11-15', '2023-10-22', 2, 'Marseille',      'France',      75.89),
('BERGS', 2, '2023-10-21', '2023-11-18', '2023-10-25', 2, 'Luleå',          'Sweden',      94.08),
('GREAL', 6, '2023-10-22', '2023-11-19', '2023-10-31', 2, 'Eugene',         'USA',         4.42),
('ALFKI', 1, '2023-10-23', '2023-11-20', '2023-10-29', 3, 'Berlin',         'Germany',     1.21),
('RATTC', 3, '2023-10-24', '2023-11-21', '2023-11-04', 3, 'Albuquerque',    'USA',         39.77),
('SPECD', 7, '2023-10-25', '2023-11-22', '2023-11-04', 3, 'Paris',          'France',      45.03),
('SAVEA', 8, '2023-10-28', '2023-11-25', '2023-11-01', 2, 'Boise',          'USA',         4.22),
('HUNGO', 3, '2023-10-29', '2023-11-26', '2023-11-07', 2, 'Cork',           'Ireland',     79.25),
('HANAR', 6, '2023-10-30', '2023-11-27', '2023-11-05', 3, 'Rio de Janeiro', 'Brazil',      3.17),
('BERGS', 7, '2023-10-31', '2023-11-28', '2023-11-07', 3, 'Luleå',          'Sweden',      93.00),
('HANAR', 6, '2023-11-01', '2023-11-29', '2023-11-12', 1, 'Rio de Janeiro', 'Brazil',      33.63),
('FOLKO', 1, '2023-11-04', '2023-12-02', '2023-11-14', 2, 'Bräcke',         'Sweden',      50.95),
('HUNGO', 2, '2023-11-05', '2023-12-03', '2023-11-14', 2, 'Cork',           'Ireland',     167.05),
('ALFKI', 4, '2023-11-06', '2023-12-04', '2023-11-14', 3, 'Berlin',         'Germany',     1.27),
('GROSR', 2, '2023-11-07', '2023-12-05', '2023-11-21', 1, 'Caracas',        'Venezuela',   22.22),
('BERGS', 9, '2023-11-08', '2023-12-06', '2023-11-14', 3, 'Luleå',          'Sweden',      93.00);

-- ============================================================
-- TABLA 8: OrderDetails
-- ============================================================
CREATE TABLE OrderDetails (
    OrderID    INT           NOT NULL,
    ProductID  INT           NOT NULL,
    UnitPrice  DECIMAL(10,2) NOT NULL DEFAULT 0,
    Quantity   SMALLINT      NOT NULL DEFAULT 1,
    Discount   FLOAT         NOT NULL DEFAULT 0,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID)   REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
(1,  11, 14.00, 12, 0.00), (1,  42, 9.80,  10, 0.00), (1,  72, 34.80,  5, 0.00),
(2,  14, 18.60,  9, 0.00), (2,  51, 42.40, 40, 0.00),
(3,  41, 7.70,  10, 0.00), (3,  51, 42.40, 35, 0.15), (3,  65, 16.80,  15, 0.15),
(4,  65, 16.80, 20, 0.05), (4,  66, 17.00, 12, 0.05),
(5,  17, 39.00, 40, 0.05), (5,  62, 49.30, 25, 0.05),
(6,  38, 210.80,  5, 0.00), (6,  73, 15.00, 14, 0.00),
(7,  19, 7.30,   8, 0.00), (7,  24, 3.60,  15, 0.15), (7,  38, 210.80,  3, 0.05), (7,  71, 17.20, 14, 0.05),
(8,  24, 3.60,  21, 0.00), (8,  71, 17.20, 40, 0.00),
(9,  35, 14.40, 10, 0.00),
(10, 28, 36.40, 10, 0.00), (10, 36, 19.00, 20, 0.25), (10, 63, 43.90,  2, 0.25),
(11, 39, 18.00,  3, 0.00),
(12, 40, 18.40, 30, 0.00), (12, 41, 7.70, 30, 0.00),
(13, 14, 18.60, 12, 0.00), (13, 62, 49.30, 10, 0.00),
(14, 20, 81.00, 30, 0.00), (14, 42, 9.80,  15, 0.00),
(15, 11, 14.00,  6, 0.00), (15, 50, 13.00, 15, 0.05),
(16, 28, 36.40, 10, 0.00), (16, 43, 46.00, 10, 0.00), (16, 62, 49.30,  5, 0.00),
(17, 29, 99.00,  6, 0.00), (17, 43, 46.00, 18, 0.05),
(18,  1, 14.40, 20, 0.00), (18, 42, 9.80, 20, 0.00),
(19,  6, 25.00, 21, 0.00), (19, 11, 14.00, 30, 0.00),
(20, 18, 50.00,  6, 0.05), (20, 57, 15.60, 40, 0.00),
(21,  5, 17.00, 20, 0.00), (21, 68, 12.50, 10, 0.00),
(22, 22, 16.80,  6, 0.00), (22, 57, 15.60,  5, 0.05),
(23, 17, 39.00, 14, 0.00), (23, 62, 49.30, 12, 0.00),
(24, 28, 36.40, 12, 0.00), (24, 41, 7.70, 10, 0.00), (24, 48, 12.75,  5, 0.00),
(25, 11, 14.00, 15, 0.00), (25, 36, 19.00, 10, 0.00),
(26,  1, 14.40,  6, 0.00), (26, 28, 36.40, 12, 0.00),
(27, 13, 4.80, 20, 0.00), (27, 25, 11.20, 16, 0.00), (27, 52, 5.60,  15, 0.05),
(28, 16, 13.90,  3, 0.00), (28, 41, 7.70, 20, 0.00), (28, 43, 46.00, 10, 0.00),
(29, 28, 36.40,  2, 0.00), (29, 39, 18.00, 12, 0.05),
(30, 14, 18.60,  6, 0.00), (30, 21, 8.00,  6, 0.25),
(31, 11, 14.00, 10, 0.00), (31, 64, 26.60,  3, 0.25),
(32,  6, 25.00, 30, 0.00), (32, 48, 12.75, 24, 0.00),
(33, 28, 36.40, 15, 0.00), (33, 29, 99.00, 10, 0.00),
(34,  2, 15.20, 50, 0.00), (34, 11, 14.00, 30, 0.00),
(35, 17, 39.00, 15, 0.00), (35, 37, 26.00, 25, 0.00), (35, 47, 7.60,  20, 0.25),
(36, 53, 26.20, 10, 0.00), (36, 57, 15.60, 16, 0.00),
(37, 41, 7.70, 12, 0.00), (37, 62, 49.30, 10, 0.00),
(38, 23, 7.20, 10, 0.00), (38, 24, 3.60, 10, 0.00), (38, 41, 7.70,  3, 0.00),
(39, 33, 2.00, 30, 0.00), (39, 59, 55.00, 15, 0.00),
(40, 14, 18.60, 10, 0.05), (40, 55, 19.20, 15, 0.05),
(41, 35, 14.40,  6, 0.00), (41, 54, 5.90, 14, 0.20),
(42, 18, 50.00, 30, 0.00), (42, 38, 210.80, 8, 0.00),
(43, 63, 43.90, 10, 0.00), (43, 66, 17.00, 12, 0.00), (43, 71, 17.20, 50, 0.00),
(44, 22, 16.80, 15, 0.00), (44, 29, 99.00, 12, 0.00),
(45, 39, 18.00, 40, 0.00), (45, 49, 16.00, 10, 0.00), (45, 73, 15.00, 10, 0.00),
(46, 30, 20.70, 30, 0.00), (46, 36, 19.00, 15, 0.00),
(47, 11, 14.00, 15, 0.00), (47, 57, 15.60, 20, 0.00),
(48, 39, 18.00,  8, 0.00), (48, 57, 15.60, 14, 0.00), (48, 69, 28.80, 20, 0.00),
(49, 41, 7.70,  9, 0.00), (49, 68, 12.50, 25, 0.00),
(50, 22, 16.80, 30, 0.05), (50, 57, 15.60, 30, 0.05),
(51, 29, 99.00,  6, 0.00), (51, 30, 20.70, 18, 0.00),
(52, 13, 4.80, 10, 0.00), (52, 28, 36.40, 15, 0.00),
(53, 12, 30.40, 20, 0.00), (53, 73, 15.00, 30, 0.00),
(54, 44, 15.50, 24, 0.00), (54, 65, 16.80, 15, 0.00),
(55, 11, 14.00, 20, 0.00), (55, 37, 26.00, 18, 0.00),
(56, 40, 18.40, 10, 0.00), (56, 54, 5.90, 10, 0.00), (56, 60, 34.00, 5, 0.00),
(57, 28, 36.40, 14, 0.00), (57, 29, 99.00,  3, 0.00),
(58, 47, 7.60,  30, 0.00), (58, 55, 19.20, 20, 0.00),
(59, 11, 14.00, 12, 0.00), (59, 22, 16.80, 20, 0.00),
(60, 40, 18.40, 15, 0.00), (60, 64, 26.60, 10, 0.00),
(61, 24, 3.60,  24, 0.00), (61, 36, 19.00, 20, 0.05),
(62, 42, 9.80,  25, 0.00), (62, 67, 14.00, 15, 0.05),
(63, 14, 18.60,  8, 0.00), (63, 41, 7.70, 10, 0.00),
(64, 11, 14.00, 20, 0.00), (64, 30, 20.70, 15, 0.00),
(65, 41, 7.70, 15, 0.00), (65, 66, 17.00, 10, 0.00),
(66, 17, 39.00,  6, 0.00), (66, 59, 55.00, 10, 0.00),
(67, 11, 14.00, 24, 0.00), (67, 36, 19.00, 20, 0.00), (67, 40, 18.40, 14, 0.00),
(68, 33, 2.00,  10, 0.00), (68, 58, 10.60, 12, 0.00),
(69, 22, 16.80, 20, 0.00), (69, 51, 42.40, 10, 0.00),
(70, 29, 99.00,  6, 0.00), (70, 41, 7.70, 25, 0.00),
(71, 11, 14.00, 15, 0.00), (71, 28, 36.40, 10, 0.05),
(72, 42, 9.80,  30, 0.00), (72, 52, 5.60, 20, 0.00),
(73, 17, 39.00, 12, 0.00), (73, 41, 7.70, 20, 0.00),
(74, 11, 14.00, 15, 0.00), (74, 28, 36.40, 10, 0.00), (74, 55, 19.20, 30, 0.00),
(75, 41, 7.70, 40, 0.00), (75, 73, 15.00, 10, 0.00),
(76, 14, 18.60, 20, 0.00), (76, 24, 3.60, 15, 0.00),
(77, 38, 210.80,  3, 0.00), (77, 39, 18.00, 24, 0.00),
(78, 22, 16.80, 10, 0.05), (78, 57, 15.60, 18, 0.00),
(79, 33, 2.00,  25, 0.00), (79, 40, 18.40, 30, 0.00), (79, 59, 55.00,  5, 0.00),
(80, 19, 7.30,  15, 0.00), (80, 35, 14.40, 20, 0.00),
(81, 41, 7.70,  8, 0.00), (81, 67, 14.00, 30, 0.00),
(82, 11, 14.00, 12, 0.00), (82, 62, 49.30, 10, 0.00),
(83, 28, 36.40, 15, 0.00), (83, 36, 19.00, 20, 0.00),
(84, 43, 46.00,  5, 0.00), (84, 55, 19.20, 20, 0.00),
(85, 41, 7.70, 10, 0.00), (85, 42, 9.80, 25, 0.00),
(86, 14, 18.60, 12, 0.00), (86, 68, 12.50, 20, 0.00),
(87, 22, 16.80, 15, 0.00), (87, 36, 19.00, 24, 0.00), (87, 57, 15.60, 10, 0.00),
(88, 11, 14.00, 20, 0.00), (88, 29, 99.00,  4, 0.00),
(89, 40, 18.40, 15, 0.00), (89, 41, 7.70, 25, 0.00),
(90, 28, 36.40, 10, 0.05), (90, 44, 15.50, 20, 0.05),
(91, 17, 39.00, 15, 0.00), (91, 42, 9.80, 30, 0.00),
(92, 11, 14.00, 24, 0.00), (92, 22, 16.80, 12, 0.00), (92, 55, 19.20, 20, 0.00),
(93, 36, 19.00, 10, 0.00), (93, 65, 16.80, 15, 0.00),
(94, 41, 7.70, 20, 0.00), (94, 57, 15.60, 24, 0.00),
(95, 13, 4.80, 30, 0.00), (95, 28, 36.40, 15, 0.00),
(96, 22, 16.80, 10, 0.00), (96, 40, 18.40, 12, 0.05), (96, 73, 15.00, 10, 0.00),
(97, 11, 14.00, 18, 0.00), (97, 41, 7.70, 30, 0.00),
(98, 29, 99.00,  3, 0.00), (98, 39, 18.00, 20, 0.00),
(99, 42, 9.80,  15, 0.00), (99, 66, 17.00, 10, 0.00),
(100,11, 14.00, 20, 0.00), (100,17, 39.00, 12, 0.00), (100,33,  2.00, 50, 0.00);

-- ============================================================
-- VISTAS útiles para consultas frecuentes
-- ============================================================

CREATE OR REPLACE VIEW vw_orden_detalle AS
SELECT
    o.OrderID,
    o.OrderDate,
    o.ShipCountry,
    c.CompanyName       AS Customer,
    c.Country           AS CustomerCountry,
    e.FirstName,
    e.LastName,
    p.ProductName,
    cat.CategoryName,
    od.Quantity,
    od.UnitPrice,
    od.Discount,
    ROUND(od.Quantity * od.UnitPrice * (1 - od.Discount), 2) AS LineTotal
FROM Orders o
JOIN Customers   c   ON o.CustomerID  = c.CustomerID
JOIN Employees   e   ON o.EmployeeID  = e.EmployeeID
JOIN OrderDetails od  ON o.OrderID    = od.OrderID
JOIN Products    p   ON od.ProductID  = p.ProductID
JOIN Categories  cat ON p.CategoryID  = cat.CategoryID;

-- ============================================================
-- Verificación rápida
-- ============================================================
SELECT 'Categories'  AS Tabla, COUNT(*) AS Filas FROM Categories  UNION ALL
SELECT 'Suppliers',            COUNT(*)           FROM Suppliers   UNION ALL
SELECT 'Products',             COUNT(*)           FROM Products    UNION ALL
SELECT 'Customers',            COUNT(*)           FROM Customers   UNION ALL
SELECT 'Employees',            COUNT(*)           FROM Employees   UNION ALL
SELECT 'Shippers',             COUNT(*)           FROM Shippers    UNION ALL
SELECT 'Orders',               COUNT(*)           FROM Orders      UNION ALL
SELECT 'OrderDetails',         COUNT(*)           FROM OrderDetails;
