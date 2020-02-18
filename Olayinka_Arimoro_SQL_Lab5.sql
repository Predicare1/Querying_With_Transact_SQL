-- Challenge 1: Retrieve Product Information
-- 1. Retrieve the name and approximate weight of each product
SELECT * FROM SalesLT.Product;

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight
FROM SalesLT.Product;

-- QUestion 2: Retrieve the year and month in which products were first sold
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth
FROM SalesLT.Product;

-- Question 3: Extract product types from product numbers
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth,
LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product;

-- Question 4: Retrieve only products with a numeric size
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth,
LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product
WHERE ISNUMERIC(Size)=1;

-- Challenge 2: Rank Customers by Revenue
SELECT * FROM SalesLT.SalesOrderHeader; -- Checking the columns of the SalesOrderHeader table
SELECT * FROM SalesLT.Customer; -- Checking the columns of the Customer table

-- Question 1: 1. Retrieve companies ranked by sales totals

SELECT c.CompanyName, oh.TotalDue,
	RANK() OVER (ORDER BY oh.TotalDue DESC) AS RankByTotalDue
FROM SalesLT.Customer as c
INNER JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY RankByTotalDue;

-- Challenge 3: Aggregate Product Sales
-- Question 1: Retrieve total sales by product

SELECT p.Name, SUM(od.LineTotal) TotalRevenue
FROM SalesLT.Product AS p
INNER JOIN SalesLT.SalesOrderDetail AS od
ON p.ProductID = od.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

-- Question 2: Filter the product sales list to include only products that cost over $1,000

SELECT p.Name, SUM(od.LineTotal) AS TotalRevenue
FROM SalesLT.Product AS p
INNER JOIN SalesLT.SalesOrderDetail AS od
ON p.ProductID = od.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

-- Question 3:  Filter the product sales groups to include only total sales over $20,000

SELECT p.Name, SUM(od.LineTotal) TotalRevenue
FROM SalesLT.Product AS p
INNER JOIN SalesLT.SalesOrderDetail AS od
ON p.ProductID = od.ProductID
GROUP BY p.Name
HAVING SUM(od.LineTotal) > 20000
ORDER BY TotalRevenue DESC;











