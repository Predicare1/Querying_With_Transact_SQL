
-- Challenge 1: Retrieve Data for Transportation reports

-- Question 1: Retrieve a list of distinct cities
SELECT DISTINCT City, StateProvince 
FROM SalesLT.Address;

-- Question 2: Retrieve the heaviest products
SELECT TOP 10 PERCENT Name 
FROM SalesLT.Product
ORDER BY Weight DESC; 

-- Question 3: Retrieve the heaviest 100 products not including the heaviest ten
SELECT Name 
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS
FETCH NEXT 100 ROWS ONLY;

Challenge Two: Retrieve Product Data
SELECT * FROM SalesLT.Product;  -- Checking all columns

-- Question 1: Retrieve product details for product model 1
SELECT Name, Color, Size FROM SalesLT.Product
WHERE ProductModelID = 1;

-- Question 2: Filter products by color and size
SELECT ProductNumber, Name
FROM SalesLT.Product
WHERE Color IN ('Black','Red','White') AND Size IN ('S','M');

-- Question 3: Filter products by product number
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

-- Question 4: Retrieve specific products by product number
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';


















