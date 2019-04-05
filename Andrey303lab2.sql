USE Sales;

SELECT *
FROM Product AS prod
 INNER JOIN Supplier AS sup ON prod.SupplierId = sup.Id
			 WHERE prod.UnitPrice > 30 AND (sup.Country = N'Canada' OR sup.Country = N'USA');


SELECT TOP(10)
	ord.Id, 			   
	ord.OrderDate, 
	ord.OrderNumber, 
	ord.CustomerId, 
	cust.Country  
FROM [Order] AS ord
 INNER JOIN Customer AS cust ON ord.CustomerId = cust.Id WHERE cust.Country = N'France' 
 ORDER BY ord.OrderDate ASC;


SELECT 
	cust.FirstName,
	cust.LastName, 
	ord.CustomerId, 
	COUNT(ord.CustomerId) AS [Count] 
FROM [Order] AS ord
	INNER JOIN Customer AS cust ON ord.CustomerId = cust.Id
GROUP BY cust.FirstName, cust.LastName, ord.CustomerId
ORDER BY cust.FirstName, cust.LastName;


SELECT 
	cust.FirstName, 
	cust.LastName, 
	CASE WHEN c.countCust IS NOT NULL THEN c.countCust ELSE 0 END AS [Count] 
FROM Customer AS cust
	OUTER APPLY (SELECT COUNT(ord.CustomerId) AS [countCust] 
				FROM [Order] AS ord WHERE ord.CustomerId = cust.Id)c
ORDER BY cust.FirstName, cust.LastName;


SELECT 
	prod.Id,
	prod.ProductName,
	prod.Package,
	prod.IsDiscontinued,
	ordi.Quantity,
	ordi.Quantity * ordi.UnitPrice AS TotalAmount
FROM Product AS prod
	INNER JOIN
		[OrderItem] AS ordi ON prod.Id = ordi.ProductId
ORDER BY ordi.Quantity;