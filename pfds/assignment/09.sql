-- Products table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName TEXT NOT NULL,
  Category TEXT NOT NULL,
  Price FLOAT NOT NULL,
  StockQuantity INT NOT NULL
);

INSERT INTO
  Products
VALUES
  (1, 'Pen', 'Stationery', 1.99, 100),
  (2, 'T-Shirt', 'Apparel', 9.99, 50),
  (3, 'Phone', 'Electronics', 599.99, 20),
  (4, 'Phone Case', 'Accessories', 4.99, 200),
  (5, 'Socks', 'Apparel', 2.49, 150),
  (6, 'Pencil', 'Stationery', 3.99, 80),
  (7, 'Speaker', 'Electronics', 7.99, 10),
  (8, 'Headphones', 'Electronics', 19.99, 40),
  (9, 'Watch', 'Accessories', 14.99, 100),
  (10, 'Keychain', 'Accessories', 1.49, 120);

-- Discontinued products table
DROP TABLE IF EXISTS DiscontinuedProducts;
CREATE TABLE DiscontinuedProducts (
  ProductID INT PRIMARY KEY,
  ProductName TEXT NOT NULL,
  Price FLOAT NOT NULL,
  Stock INT NOT NULL,
  DiscontinuedDate DATE NOT NULL, -- YYYY-MM-DD
  Reason TEXT NOT NULL
);

INSERT INTO
  DiscontinuedProducts
VALUES
  (11, 'Torch', '4.99', 0, '2022-06-01', 'Low sales'),
  (12, 'Milkshake', '2.99', 0, '2023-01-31', 'Sold at loss'),
  (13, 'Glitter', '0.99', 0, '2023-06-01', 'Low sales');

-- Part A
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM DiscontinuedProducts;

-- Part B
SELECT
  Products.Category,
  SUM(StockQuantity) AS Frequency
FROM
  Products
GROUP BY
  Products.Category;

-- Part C
SELECT
  Products.Category,
  SUM(StockQuantity) AS Frequency
FROM
  Products
GROUP BY
  Products.Category
HAVING
  SUM(StockQuantity) > 100;

-- Part D
SELECT EXISTS (SELECT * FROM DiscontinuedProducts);

-- Part E || NOTE: SQLite does not support ANY
SELECT * FROM
  Products
WHERE
  Price > ANY (SELECT MAX(Price) FROM DiscontinuedProducts);

-- Part F || NOTE: SQLite does not support ALL
SELECT * FROM
  Products
WHERE
  Quantity > ALL (SELECT Quantity FROM DiscontinuedProducts);

-- Part G || NOTE: SQLite does not support INTO
SELECT * INTO
  HighPricedProducts
FROM
  Products
WHERE
  Price > 100;

-- Part H
DROP TABLE IF EXISTS ArchivedProducts;
CREATE TABLE ArchivedProducts (
  ProductID INT PRIMARY KEY,
  ProductName TEXT NOT NULL,
  Price FLOAT NOT NULL,
  Stock INT NOT NULL,
  DiscontinuedDate DATE NOT NULL, -- YYYY-MM-DD
  Reason TEXT NOT NULL
);

INSERT INTO
  ArchivedProducts
SELECT * FROM DiscontinuedProducts;
