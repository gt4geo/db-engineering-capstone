use littlelemondb;

CREATE VIEW OrdersView AS

SELECT OrderID, Quantity, TotalCost
FROM ORDERS
WHERE Quantity > 2;