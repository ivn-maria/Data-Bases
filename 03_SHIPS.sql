-- 1

SELECT DISTINCT country
FROM classes
WHERE numguns >=ALL (SELECT numguns 
                    FROM classes);

-- 2

SELECT DISTINCT class
FROM ships JOIN (SELECT ship
                FROM outcomes 
                WHERE result = 'sunk') AS ship ON name = ship;

-- 3

SELECT name, ships.class 
FROM ships JOIN (SELECT class 
                FROM classes 
                WHERE bore = 16) AS class ON ships.class = class.class;

-- 4

SELECT battle 
FROM outcomes JOIN (SELECT name
                    FROM ships 
                    WHERE class = 'Kongo') AS ship ON outcomes.ship = ship.name;

-- 5

SELECT cl1.class, name 
FROM classes AS cl1 JOIN ships ON cl1.class = ships.class
WHERE numguns >=ALL (SELECT cl2.numguns
                    FROM classes AS cl2
                    WHERE cl1.bore = cl2.bore) 
ORDER BY cl1.class ASC;