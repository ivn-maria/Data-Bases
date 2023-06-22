-- 1

USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name='FurnitureCompany')
	DROP DATABASE FurnitureCompany
GO

CREATE DATABASE FurnitureCompany
GO
USE FurnitureCompany
GO

CREATE TABLE Product
(
    Product_ID INT NOT NULL CONSTRAINT pk_product_id PRIMARY KEY,
    Product_Description VARCHAR(100) NOT NULL,
    Product_Finish VARCHAR(20) NOT NULL,
    Standart_Price DECIMAL (9,2) NOT NULL,
    Product_Line_ID INT,
    CHECK (Product_Finish IN ('череша', 'естествен ясен', 'бял ясен', 'червен дъб', 'естествен дъб', 'орех'))
);

CREATE TABLE Customer
(
    Customer_ID INT NOT NULL IDENTITY (1,1) CONSTRAINT pk_customer_id PRIMARY KEY,
    Customer_Name VARCHAR(60) NOT NULL,
    Customer_Address VARCHAR(60) NOT NULL,
    Customer_City VARCHAR(20),
    City_Code CHAR(4)
);

CREATE TABLE Order_T
(
    Order_ID INT NOT NULL CONSTRAINT pk_order_id PRIMARY KEY,
    Order_Date DATE NOT NULL,
    Customer_ID INT NOT NULL CONSTRAINT fk_customer_id FOREIGN KEY REFERENCES Customer(Customer_ID),
);

CREATE TABLE Order_Line
(
    Order_ID INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES Order_T(Order_ID),
    Product_ID INT NOT NULL CONSTRAINT fk_product_id FOREIGN KEY REFERENCES Product(Product_ID),
    Ordered_Quantity INT NOT NULL,
);

-- insert data

INSERT INTO Customer (Customer_Name, Customer_Address, Customer_City, City_Code)
VALUES ('Иван Петров', 'ул. Лавеле 8', 'София', '1000'),
        ('Камелия Янева', 'ул. Иван Шишман 3', 'Бургас', '8000'), 
        ('Васил Димитров', 'ул. Абаджийска 87', 'Пловдив', '4000'), 
        ('Ани Милева', 'бул. Владислав Варненчик 56', 'Варна','9000');

INSERT INTO Product 
VALUES (1000, 'офис бюро', 'череша', 195, 10),
        (1001, 'директорско бюро', 'червен дъб', 250, 10), 
        (2000, 'офис стол', 'череша', 75, 20),
        (2001, 'директорски стол', 'естествен дъб', 129, 20),
        (3000, 'етажерка за книги', 'естествен ясен', 85, 30), 
        (4000, 'настолна лампа', 'естествен ясен', 35, 40);

INSERT INTO Order_T 
VALUES (100, '2013-01-05', 1), 
        (101, '2013-12-07', 2), 
        (102, '2014-10-03', 3), 
        (103, '2014-10-08', 2), 
        (104, '2015-10-05', 1), 
        (105, '2015-10-05', 4), 
        (106, '2015-10-06', 2), 
        (107, '2016-01-06', 1);

INSERT INTO Order_Line 
VALUES  (100, 4000, 1),
        (101, 1000, 2),
        (101, 2000, 2),
        (102, 3000, 1),
        (102, 2000, 1),
        (106, 4000, 1),
        (103, 4000, 1),
        (104, 4000, 1),
        (105, 4000, 1),
        (107, 4000, 1);

-- 2

SELECT Product.Product_ID, Product.Product_Description, COUNT(Order_ID) AS TimesOrdered
FROM Order_Line JOIN Product ON Order_Line.Product_ID = Product.Product_ID
GROUP BY Product.Product_ID, Product.Product_Description;

-- 3 

SELECT Product.Product_ID, Product.Product_Description, SUM(Ordered_Quantity) AS Total_Quantity_Ordered
FROM Order_Line JOIN Product ON Order_Line.Product_ID = Product.Product_ID
GROUP BY Product.Product_ID, Product.Product_Description
UNION
SELECT Product_ID, Product_Description, 0 AS Total_Quantity_Ordered
FROM Product
WHERE Product_ID NOT IN (SELECT Product_ID
                        FROM Order_Line);

-- 4 
SELECT Customer_Name, SUM(Standart_Price * Ordered_Quantity) AS OrderAmount
FROM Customer JOIN Order_T ON Customer.Customer_ID = Order_T.Customer_ID
    JOIN Order_Line ON Order_T.Order_ID = Order_Line.Order_ID
    JOIN Product ON Order_Line.Product_ID = Product.Product_ID
GROUP BY Customer.Customer_Name;