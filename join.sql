use littlelemondb;

Select c.CustomerID, c.FullName, o.OrderID, o.TotalCost,
m.MenuName, mi.Starters, mi.Courses
FROM Customers as c JOIN Orders as o ON c.CustomerID = o.CustomerID
JOIN Menus as m ON o.MenuID = m.MenuID
JOIN mi ON m.MenuID = mi.MenuID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;