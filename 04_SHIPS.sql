-- 1

SELECT ships.*, classes.*
FROM ships JOIN classes ON ships.class = classes.class 
ORDER BY name;

-- 2

SELECT ships.*, classes.*
FROM ships RIGHT JOIN classes ON ships.class = classes.class 
ORDER BY name;

-- 3

SELECT country, name
FROM classes JOIN ships ON ships.class = classes.class
WHERE name NOT IN (SELECT ship
                    FROM outcomes) 
ORDER BY country;

-- 4

SELECT name AS 'Ship Name'
FROM classes JOIN ships ON ships.class = classes.class
WHERE numguns >= 7 AND launched = 1916;

-- 5

SELECT ship, battle, date
FROM outcomes JOIN battles ON battle = name
WHERE result = 'sunk' 
ORDER BY battle; 

-- 6

SELECT name, displacement, launched 
FROM ships JOIN classes ON ships.class = classes.class AND ships.name = classes.class;

-- 7

SELECT *
FROM classes 
WHERE class NOT IN (SELECT class
                    FROM ships);

-- 8

SELECT name, displacement, numGuns, result
FROM classes RIGHT JOIN ships ON classes.class = ships.class JOIN outcomes ON name = ship
WHERE battle = 'North Atlantic';