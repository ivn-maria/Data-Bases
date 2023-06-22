-- 1

SELECT DISTINCT ship
FROM outcomes
WHERE ship LIKE 'C%' OR ship LIKE 'K%';

-- 2

SELECT name, country
FROM classes JOIN ships ON classes.class = ships.class
WHERE name NOT IN (SELECT ship
                    FROM outcomes) OR name IN (SELECT ship
                                                FROM outcomes
                                                WHERE result != 'sunk');

-- 3

SELECT country, 0 AS num_sunk_ships
FROM classes
WHERE class NOT IN (SELECT class
                    FROM ships)
UNION
SELECT country, 0 num_sunk_ships
FROM classes JOIN ships ON classes.class = ships.class JOIN outcomes ON name = ship
WHERE country NOT IN (SELECT country
                    FROM classes JOIN ships ON classes.class = ships.class JOIN outcomes ON name = ship
                    WHERE result = 'sunk'
                    GROUP BY country)
GROUP BY country
UNION
SELECT country, COUNT(name) AS num_sunk_ships
FROM classes JOIN ships ON classes.class = ships.class JOIN outcomes ON name = ship
WHERE result = 'sunk'
GROUP BY country;

-- 4

SELECT battle
FROM outcomes
GROUP BY battle 
HAVING COUNT(ship) > (SELECT COUNT(ship)
                    FROM outcomes
                    WHERE battle = 'Guadalcanal')

-- 5

SELECT battle
FROM outcomes JOIN ships ON name = ship JOIN classes ON ships.class = classes.class
GROUP BY battle 
HAVING COUNT(DISTINCT country) > (SELECT COUNT(DISTINCT country)
                                FROM outcomes JOIN ships ON name = ship JOIN classes ON ships.class = classes.class
                                WHERE battle = 'Surigao Strait')

-- 6

SELECT name, displacement, numguns 
FROM classes AS cl JOIN ships ON cl.class = ships.class 
WHERE displacement <=ALL (SELECT displacement
                            FROM classes)       AND numguns >=ALL (SELECT numguns
                                                                FROM classes
                                                                WHERE displacement = cl.displacement);

-- 7

SELECT COUNT(ship) AS num_ships
FROM outcomes JOIN battles AS bt1 ON battle = name
WHERE result = 'damaged' AND ship IN (SELECT ship
                                    FROM outcomes JOIN battles AS bt2 ON battle = name
                                    WHERE bt1.date < bt2.date AND result = 'ok');

-- 8

SELECT ship AS ship_name
FROM outcomes AS oc1 JOIN battles AS bt1 ON battle = name
WHERE result = 'damaged' AND ship IN (SELECT ship
                                    FROM outcomes JOIN battles AS bt2 ON battle = name
                                    WHERE bt1.date < bt2.date AND result = 'ok')        AND (SELECT COUNT(ship)
                                                                                            FROM outcomes AS oc2
                                                                                            WHERE oc1.battle = oc2.battle) > (SELECT COUNT(ship)
                                                                                                                            FROM outcomes AS oc2 JOIN battles AS bt2 ON battle = name
                                                                                                                            WHERE bt1.date < bt2.date AND oc1.ship = oc2.ship);