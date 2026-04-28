-- 1. Write a query to find the price of the cheapest item that Northwind sells. Then write a second query to find the name of the product that has that price.
USE northwind;
SELECT MIN(UnitPrice)
FROM products;

USE northwind;
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = (SELECT MIN(UnitPrice)
	FROM products);

/* 2. Write a query to find the average price of all items that Northwind sells. 
(Bonus: Once you have written a working query, try asking Claude or ChatGPT for help using the ROUND function to round the average price to the nearest cent.) */
USE northwind;
SELECT AVG(UnitPrice)
FROM products; 

USE northwind;
SELECT ROUND(AVG(UnitPrice), 2)AS AvgUnitPriceRounded
FROM products;

/* 3. Write a query to find the price of the most expensive item that Northwind sells. 
Then write a second query to find the name of the product with that price, plus the name of the supplier for that product. */
USE northwind;
SELECT MAX(UnitPrice)
FROM products; 

USE northwind;
SELECT products.ProductName, products.UnitPrice, suppliers.CompanyName
FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE products.UnitPrice = (SELECT MAX(UnitPrice) FROM products);

-- 4. Write a query to find total monthly payroll (the sum of all the employees’ monthly salaries).
USE northwind;
SELECT SUM(Salary)
FROM employees;

-- 5. Write a query to identify the highest salary and the lowest salary amounts which any employee makes. (Just the amounts, not the specific employees!)
USE northwind;
SELECT Salary
FROM employees
	ORDER BY Salary DESC;
    
-- 6. Write a query to find the name and supplier ID of each supplier and the number of items they supply. Hint: Join is your friend here.
USE northwind;
SELECT suppliers.SupplierID, suppliers.CompanyName, products.QuantityPerUnit
FROM suppliers
JOIN products ON suppliers.SupplierID = products.SupplierID;

-- 7. Write a query to find the list of all category names and the average price for items in each category.
USE northwind;
SELECT categories.CategoryName, products.ProductName, AVG(products.UnitPrice)
FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
	GROUP BY categories.CategoryName, products.ProductName, products.UnitPrice;

-- 8. Write a query to find, for all suppliers that provide at least 5 items to Northwind, what is the name of each supplier and the number of items they supply.
USE northwind;
SELECT suppliers.CompanyName, COUNT(ProductID) AS ProductCount
FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
GROUP BY suppliers.CompanyName
HAVING COUNT(ProductID) >= 5;

/* 9. Write a query to list products currently in inventory by the product id, product name, and inventory value 
(calculated by multiplying unit price by the number of units on hand). Sort the results in descending order by value. 
If two or more have the same value, order by product name. If a product is not in stock, leave it off the list. */
USE northwind;
SELECT ProductID, ProductName, UnitPrice * UnitsInStock AS InventoryValue
FROM products
WHERE UnitsInStock > 0
	ORDER BY InventoryValue DESC, ProductName;