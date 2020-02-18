
-- Challenge 1: Retrieve Product Price Information
-- Question 1. Retrieve products whose list price is higher than the average unit price

SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice > (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail);

-- Question 2. Retrieve Products with a list price of $100 or more that have been sold for less than $100
    
SELECT ProductID, Name, ListPrice 
FROM SalesLT.Product
WHERE ListPrice >= 100
AND ProductID IN 
(SELECT ProductID
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice < 100);

-- Question 3: Retrieve the cost, list price, and average selling price for each product
SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice, 
(SELECT AVG(od.UnitPrice) 
FROM SalesLT.SalesOrderDetail AS od
WHERE od.ProductID = p.ProductID) AS AverageUnitPrice
FROM SalesLT.Product AS p;

-- Question 4: Retrieve products that have an average selling price that is lower than the cost

SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice, 
(SELECT AVG(od.UnitPrice)
FROM SalesLT.SalesOrderDetail AS od
WHERE od.ProductID = p.ProductID) AS AverageUnitPrice
FROM SalesLT.Product AS p
WHERE p.StandardCost > 
(SELECT AVG(od.UnitPrice)
FROM SalesLT.SalesOrderDetail AS od
WHERE od.ProductID = p.ProductID);

-- Challenge 2: Retrieve Customer Information
-- Question 1: Retrieve customer information for all sales orders

SELECT oh.SalesOrderID, ci.CustomerID, ci.FirstName, ci.LastName, oh.TotalDue
FROM SalesLT.SalesOrderHeader AS oh
CROSS APPLY dbo.ufnGetCustomerInformation(oh.CustomerID) AS ci
ORDER BY oh.SalesOrderID;

-- Question 2: Retrieve customer address information
SELECT ci.CustomerID, ci.FirstName, ci.LastName, a.AddressLine1, a.City
FROM SalesLT.CustomerAddress AS ca
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
OUTER APPLY dbo.ufnGetCustomerInformation(ca.CustomerID) AS ci
ORDER BY ci.CustomerID;


