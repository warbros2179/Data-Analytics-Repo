/* 1. What is the product name(s) of the most expensive products? Cte de Blaye
∗ HINT: Find the max price in a subquery and then use that value to find products whose price equals that value. 
(Some of your answers from Exercise 3.A may offer a useful starting point.) */ 
USE northwind;
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM products);

/* 2. What is the product name(s) and categories of the least expensive products? Geitost, 2.50, Dairy Products
∗ HINT: Find the min price in a subquery and then use that in your more complex query that joins products with categories. */
USE northwind;
SELECT products.ProductName, products.UnitPrice, categories.CategoryName
FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM products);

/* 3. What is the order id, shipping name and shipping address of all orders shipped via "Federal Shipping"? 255
∗ HINT: Find the shipper id of "Federal Shipping" in a subquery and then use that value to find the orders that used that shipper. 
∗ You do not need "Federal Shipping" to display in the results. */
USE northwind;
SELECT orders.OrderID, orders.ShipName, orders.ShipAddress
FROM orders
JOIN shippers ON orders.ShipVia = shippers.ShipperID
WHERE ShipVia = (SELECT ShipperID FROM shippers WHERE CompanyName LIKE 'Federa%')

/* 4. What are the order ids of the orders that included "Sasquatch Ale"? 19 IDs: 10287, 10315, 10358, 10367, 10386, 10438, 10483, 10548, 10573, 10688, 10700, 10757...
∗ HINT: Find the product id of "Sasquatch Ale" in a subquery and then use that value to find the matching orders from the `order details` table.
∗ Your final results only need to display OrderID, but you may find it helpful to include additional columns as you work on creating the query 
to better understand how the query is working. */
USE northwind;
SELECT OrderID
FROM `order details`
WHERE ProductID = (SELECT ProductID FROM products WHERE ProductName LIKE 'Sasqu%') Janet Leverling

-- 5. What is the name of the employee that sold order 10266?
USE northwind;
SELECT employees.LastName, employees.FirstName, orders.OrderID
FROM employees
JOIN orders ON employees.EmployeeID = orders.EmployeeID
WHERE OrderID = 10266

-- 6. What is the name of the customer that bought order 10266? Pirkko Koskitalo
USE northwind;
SELECT customers.ContactName, orders.OrderID
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE OrderID = 10266