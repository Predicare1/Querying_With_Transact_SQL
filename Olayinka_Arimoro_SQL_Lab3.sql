
-- Challenge 1: Generate Invoice Reports
--  Question 1: Retrieve customer orders
SELECT * FROM SalesLT.Customer; -- Checking all columns of the customers table
SELECT * FROM SalesLT.SalesOrderHeader;  -- Checking all columns of the sales order header table

SELECT c.CompanyName, oh.SalesOrderID, oh.TotalDue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID;

Question 2: Retrieve customer orders with addresses

SELECT c.CompanyName, oh.SalesOrderID, oh.TotalDue, 
		a.AddressLine1+', '+ISNULL(a.AddressLine2+', ', '')+a.City+', '+a.StateProvince+', 
		'+a.PostalCode+', '+a.CountryRegion AS MainOfficeAddress
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON ca.CustomerID = c.CustomerID AND ca.AddressType = 'Main Office'
LEFT JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = s.CustomerID;

Challenge 2: Retrieve Sales Data

-- Question 1: Retrieve a list of all customers and their orders
SELECT c.CompanyName, c.FirstName, c.LastName, oh.SalesOrderID, oh.TotalDue
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY oh.SalesOrderID DESC;

-- Question 2: Retrieve a list of customers with no address
SELECT c.CustomerID, c.CompanyName, c.FirstName AS ContactFirstName, c.LastName AS ContactLastName, c.Phone
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE c.CustomerID IS NULL;

Question 3: Retrieve a list of customers and products without orders
SELECT c.CustomerID, p.ProductID 
FROM SalesLT.Customer AS c
FULL OUTER JOIN SalesLT.SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
FULL OUTER JOIN SalesLT.SalesOrderDetail AS od
ON oh.SalesOrderID = od.SalesOrderID
FULL OUTER JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
WHERE od.SalesOrderID IS NULL;






