-- can't be executed at once

-- 8

CREATE VIEW v_battles_more_ships_Guadalcanal (battle) 
AS
SELECT battle 
FROM outcomes 
GROUP BY battle 
HAVING COUNT(ship) > (SELECT COUNT(ship)
                    FROM outcomes 
                    WHERE battle = 'Guadalcanal'
                    GROUP BY battle);

SELECT *
FROM v_battles_more_ships_Guadalcanal;

CREATE VIEW v_battles_more_countries_Guadalcanal (battle) 
AS
SELECT battle
FROM outcomes JOIN ships ON ship = name JOIN classes ON ships.class = classes.class
GROUP BY battle 
HAVING COUNT(DISTINCT country) > (SELECT COUNT(DISTINCT country)
                    FROM outcomes JOIN ships ON ship = name JOIN classes ON ships.class = classes.class
                    WHERE battle = 'Guadalcanal'
                    GROUP BY battle);

SELECT *
FROM v_battles_more_countries_Guadalcanal;

-- 9

DELETE FROM outcomes
WHERE 1 IN (SELECT COUNT(ship)
            FROM outcomes 
            GROUP BY battle);

-- 10

INSERT INTO outcomes VALUES ('Missouri','Surigao Strait', 'sunk'),
                            ('Missouri','North Cape', 'sunk'),
                            ('Missouri','North Atlantic', 'ok');

DELETE FROM outcomes
WHERE ship IN (SELECT ship
                FROM outcomes
                WHERE result = 'sunk'
                GROUP BY ship
                HAVING COUNT(battle) >= 2) AND result = 'sunk';

-- 11

CREATE VIEW v_battles_with_countries (battle, country) 
AS
SELECT DISTINCT battle, country
FROM outcomes
JOIN ships ON outcomes.ship = ships.name
JOIN classes ON ships.class = classes.class;

SELECT DISTINCT battle
FROM v_battles_with_countries
WHERE country IN (SELECT country
                FROM v_battles_with_countries
                WHERE battle = 'Guadalcanal') AND battle != 'Guadalcanal'
EXCEPT
SELECT battle
FROM v_battles_with_countries
WHERE country NOT IN (SELECT country
                FROM v_battles_with_countries
                WHERE battle = 'Guadalcanal');

SELECT * 
FROM v_battles_with_countries;

-- 12

SELECT country, COUNT(battle) AS num_battles
FROM outcomes RIGHT JOIN ships ON ship = name RIGHT JOIN classes ON ships.class = classes.class
GROUP BY country