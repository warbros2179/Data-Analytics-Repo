/* Write a query to list the product id, product name, and unit price of every product 
that Northwind sells. (Hint: To help set up your query, look at the schema preview to see 
what column names belong to each table. Or use SELECT * to query all columns first, 
then refine your query to just the columns you want.) */

USE northwind;
SELECT ProductID, ProductName, UnitPrice
FROM  products

-- 2. Write a query to identify the products where the unit price is $7.50 or less.
USE northwind;
SELECT ProductID, ProductName, UnitPrice
FROM  products
WHERE UnitPrice <= 7.50

-- 3. What are the products that we carry where we have no units on hand, but 1 or more units are on backorder? Write a query that answers this question.
USE northwind;
SELECT *
FROM  products
WHERE UnitsInStock = 0
	AND UnitsOnOrder >= 1
    
 /* 4. Examine the products table. How does it identify the type (category) of each item sold? Where can you find a list of all categories?
 Write a set of queries to answer these questions, ending with a query that creates a list of all the seafood items we carry. */
 -- In the products table under CategoryID there is a number which is a FK from the table categories where the CategoryID there is the PK. 
 -- In the categories table you can find the list of all categories. 

USE northwind;
SELECT ProductID, ProductName, CategoryID
FROM products

USE northwind;
SELECT *
FROM categories
    
USE northwind;
SELECT  *
FROM categories
JOIN products
    ON categories.CategoryID = products.CategoryID
WHERE categories.CategoryName LIKE 'Sea%';

/* 5. Examine the products table again. How do you know what supplier each product comes from? Where can you find info on suppliers? 
Write a set of queries to find the specific identifier for "Tokyo Traders" and then find all products from that supplier.
I know which supplier is for every product by the SupplierID (FK) which is the PK for the table suppliers. You can find the info on suppliers in the suppliers table.*/
USE northwind;
SELECT  *

USE northwind;
SELECT *
FROM suppliers
    
USE northwind;
SELECT  *
FROM products
JOIN suppliers
    ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.CompanyName LIKE 'Tokyo%';

-- 6. How many employees work at northwind? 9 employees
-- What employees have "manager" somewhere in their job title? Steven Buchanan
USE northwind;
SELECT  *
FROM employees

USE northwind;
SELECT  *
FROM employees
WHERE Title LIKE '%Manager%'
