USE littlelemondb;

SELECT MenuName FROM Menus as m
JOIN Orders as o ON m.MenuID = o.MenuID
WHERE o.OrderID = ANY(SELECT OrderID FROM Orders WHERE Quantity > 2);