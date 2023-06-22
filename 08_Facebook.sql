-- 2

USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name='Facebook')
	DROP DATABASE Facebook
GO

CREATE DATABASE Facebook
GO
USE Facebook
GO

-- а)

CREATE TABLE Users
(
    id INT IDENTITY,
    email VARCHAR(30),
    password VARCHAR(20),
    date_of_creation date DEFAULT getdate()
);

CREATE TABLE Friends
(
    id1 INT,
    id2 INT
);

CREATE TABLE Walls
(
    id1 INT,
    id2 INT,
    message VARCHAR(100),
    time_sent datetime DEFAULT getdate()
);

CREATE TABLE Groups
(
    unique_num INT IDENTITY,
    name VARCHAR(30),
    description VARCHAR(100) DEFAULT ' '
);

CREATE TABLE GroupMembers
(
    unique_num INT,
    id INT
);

-- б)

INSERT INTO Users(email, password)
VALUES ('maria@abv.bv', 'herpassword');

INSERT INTO Users(email, password)
VALUES ('dimitar@abv.bv', 'hispassword');

INSERT INTO Friends(id1, id2)
VALUES (1, 2);

INSERT INTO Walls(id1, id2, message)
VALUES (1, 2, 'Hi! How are you?');

INSERT INTO Walls(id1, id2, message)
VALUES (2, 1, 'Hi! I am okay!');

INSERT INTO Groups(name, description)
VALUES ('Movies', 'Group for people who like movies!');

INSERT INTO GroupMembers(unique_num, id)
VALUES (1, 1);

INSERT INTO GroupMembers(unique_num, id)
VALUES (1, 2);