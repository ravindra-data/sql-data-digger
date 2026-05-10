-- PROJECT 1.

-- CREATE DATABASE. 

CREATE DATABASE Data_digger;
USE Data_digger;

-- ==========================================================================================================
-- CREATE TABLE Customers. 

CREATE TABLE customers(
	customerID INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    address VARCHAR(50) NOT NULL
);

-- INSERTS VALUES IN Customers TABLE.

INSERT INTO customers (customerID, name, email, address)
VALUES 
(101,'ravindra','pantherblack078@gmail.com','294/3 jam'),
(102,'jyotika','jyotika0206@gmail.com','25 arrah'),
(103,'sudhir','sudhir1@gmail.com','11 baroda'),
(104,'paul','pauldavid32@gmail.com','77 hyedrabad'),
(105,'nakul','nakultank17@gmail.com','50 dwarka');

-- RETRIEVE ALL CUSTOMERS DETAILS.

SELECT * FROM customers;

-- UPDATE ADDRESS. 

UPDATE customers
SET address = '50 ahmedabad'
WHERE customerID = 105;

SELECT * FROM customers;

-- DELETE CUSTOMER USING THEIR CustomerID.

DELETE FROM  customers
WHERE customerID = 104;

SELECT * FROM customers;

-- DISPLAY CUSTOMER WHOSE NAME IS RAVINDRA.

SELECT *
FROM customers
WHERE name = 'ravindra';

-- ===================================================================================================
-- CREATE TABLE orders;

CREATE TABLE orders(
	orderID INT PRIMARY KEY,
    customerId INT NOT NULL,
    orderdate DATE,
    totalamount INT
);

INSERT INTO orders (orderID, customerID, orderdate, totalamount)
VALUES 
(1,'101','2026-01-18',50000),
(2,'102','2025-12-30',75000),
(3,'101','2026-01-11',23000),
(4,'103','2025-12-01',47000),
(5,'101','2025-11-20',40000);

-- RETREIVE ALL ORDERS MADE BY A SPECIFIC PERSON.

SELECT *
FROM orders
WHERE customerID = 101;

-- UPDATE TOTALMOUNT FROM ORDERS TABLE.

UPDATE orders
SET totalamount = 52000
WHERE orderID = 1;

-- SHOW ALL RECORDS FROM TABLE.

SELECT * FROM orders;

-- DELETE ORDERS USING ORDERID.

DELETE FROM orders
WHERE orderID = 3;

-- RETREIVE ORDERS PLACED IN THE LAST 30 DAYS.

SELECT * 
FROM orders
WHERE orderdate >= CURDATE() - INTERVAL 30 DAY;

-- HIGHEST, LOWEST AND AVERAGE ORDER AMOUNT USING AGGREGATE FUNCTION.

SELECT 
MAX(totalamount) AS highest_amount,
MIN(totalamount) AS lowest_amount,
AVG(totalamount) AS average_amount
FROM orders;

-- ===============================================================================================
-- CREATE TABLE PRODUCTS.

CREATE TABLE products(
	productID INT PRIMARY KEY ,
    productname VARCHAR(30) NOT NULL,
    price INT NOT NULL,
    stock INT NOT NULL
);

INSERT INTO products (productID, productname, price, stock)
VALUES
(1,'MOBILE',10000,3),
(2,'DOLL',200,5),
(3,'LAPTOP',50000,2),
(4,'CHARGER',500,0),
(5,'PENDRIVE',1200,3);

-- SHOW ALL RECORDS FROM PRODUCTS TABLE.

SELECT * FROM products;

-- RETREIVE ALL PRODUCTS SORT BY PRICE IN DESC ORDER.

SELECT * 
FROM products
ORDER BY price DESC;

-- UPDATE ALL PRICE OF A SPECIFIC PRODUCT.

UPDATE products
SET price = 55000
WHERE productID = 3;

-- DELETE PRODUCT IF ITS OUT OT STOCK.

DELETE FROM products
WHERE stock = 0;

-- RETREIVE PRODUCTS WHOSE PRICE BETWEEN 500 TO 2000.

SELECT * 
FROM products
WHERE price BETWEEN 500 AND 2000;

-- MOST EXPENSIVE AND CHEAPEST PRODUCT FROM PRODUCTS TABLE.

SELECT 
MAX(price) AS expensive_product,
MIN(price) AS cheapest_product
FROM products;

-- =========================================================================================
-- CREATE TABLE ORDERDETAILS.

CREATE TABLE orderdetails(
	orderdetail_ID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT NOT NULL,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    sub_total INT 
);

INSERT INTO orderdetails (orderID, productID, quantity, sub_total)
VALUES
(1,2,5,1000),
(1,5,3,3600),
(2,1,3,30000),
(4,3,2,110000),
(5,2,5,1000);

-- SHOW ALL RECORDS FROM ORDERDEATILS TABLE.

SELECT * FROM orderdetails;

-- RETREIVE ALL ORDER DETAILS FOR A SPECIFIC ORDER.

SELECT * 
FROM orderdetails
WHERE orderID = 1;

-- CALCULATE THE TOTAL REVENUE FROM ALL ORDER USING SUM().

SELECT 
SUM(sub_total) AS total_revenue
FROM orderdetails;

-- RETREIVE THE TOP 3 MOST ORDERED PRODUCTS.

SELECT productID, SUM(quantity) AS total_quantity
FROM orderdetails
GROUP BY productID
ORDER BY total_quantity DESC
LIMIT 3;

-- COUNT HOW MANY TIMES A SPECIFIC PRODUCT HAS BEEN SOLD.

SELECT productID, COUNT(*) AS sold
FROM orderdetails
WHERE productID = 3;