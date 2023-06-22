-- 1

USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name='Printers')
	DROP DATABASE Printers
GO

CREATE DATABASE Printers
GO
USE Printers
GO

-- а)

CREATE TABLE Product
( 
    maker CHAR(1),
    model CHAR(4),
    type CHAR(7)
);

CREATE TABLE Printer
(
    code INT,
    model CHAR(4),
    price DECIMAL(6,2)
);

-- б)

INSERT INTO Product(maker, model, type)
VALUES ('A', '1111', 'Printer');

INSERT INTO Printer(code, model, price)
VALUES(1, '1111', 349.99)

-- в)

ALTER TABLE Printer
ADD type CHAR(6),
    color CHAR(1);

-- г)

ALTER TABLE Printer
DROP COLUMN price;

-- д)

DROP TABLE Product, Printer;