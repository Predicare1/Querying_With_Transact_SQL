
--Challenge One: Retrieve Customers Data

-- Question 1: Retrieve Customers details
SELECT * FROM SalesLT.Customer;

--Question 2: Retrieve Customer name data 
SELECT Title, FirstName, MiddleName, lastName, Suffix
FROM SalesLT.Customer;

--Question 3: Retrieve Customers names and phone numbers
SELECT SalesPerson, Title + ' ' + LastName AS CustomerName, Phone
FROM SalesLT.Customer;

-- Challenge Two: Retrieve Customers Data and Sales Data

-- Question 1: Retrieve as list of company names

SELECT CAST(CustomerID AS varchar(5)) + ': ' + CompanyName
FROM SalesLT.Customer;

--Question 2:Retrieve a list of sales order revision

SELECT SalesOrderNumber + 
' (' + CAST(RevisionNumber AS varchar(5)) + ')',
CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

-- Challenge Three: Retrieve Customer Contact details

--Question 1: Retrieve customers contact names with middle names known
SELECT
	CASE
		WHEN MiddleName IS NULL THEN FirstName + ' ' + LastName
		ELSE FirstName + ' ' + MiddleName + ' ' + LastName
	END
FROM SalesLT.Customer;

Question 2: Retrieve primary contact details
-- Update statement
UPDATE SalesLT.Customer 
SET EmailAddress = NULL 
WHERE CustomerID % 7 = 1;

-- My Query
SELECT CustomerID,
COALESCE (EmailAddress, Phone) as PrimaryContact
from SalesLT.Customer;

-- Question 3: Retrieve shipping status 
-- Update statement
UPDATE SalesLT.SalesOrderHeader 
SET ShipDate = NULL 
WHERE SalesOrderID > 71899;

-- My Query
SELECT SalesOrderID, OrderDate,
		CASE
			WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
			ELSE 'Shipped'
		END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;










