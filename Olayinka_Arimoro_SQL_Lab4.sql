SELECT * FROM SalesLT.Address;
SELECT * FROM SalesLT.CustomerAddress;
SELECT * FROM SalesLT.Customer;

-- Challenge 1: Retrieve Customer Addresses
-- Question 1: Retrieve billing addresses
SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;

-- Question 2: Retrieve shipping addresses
SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;

-- Question 3: Combine billing and shipping addresses
SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
UNION ALL
SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
ORDER BY CompanyName, AddressType;

Challenge 2: Filter Customer Addresses

-- Question 1: Retrieve customers with only a main office address
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
EXCEPT
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
ORDER BY CompanyName;

-- Question 2: Retrieve only customers with both a main office address and a shipping address
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
INTERSECT
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;

