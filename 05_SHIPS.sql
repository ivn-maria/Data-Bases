-- 1

SELECT COUNT(*) AS NO_Classes
FROM classes
WHERE TYPE = 'bb';

-- 2

SELECT class, AVG(numguns) AS avgGuns
FROM classes
WHERE TYPE = 'bb'
GROUP BY class;

-- 3

SELECT AVG(numguns) AS avgGuns
FROM classes
WHERE TYPE = 'bb';

-- 4

SELECT classes.class, MIN(launched) AS FirstYear, MAX(launched) AS LastYear
FROM classes JOIN ships ON classes.class=ships.class
GROUP BY classes.class;

-- 5

SELECT class, COUNT(*) AS NO_Sunk
FROM ships JOIN outcomes ON name = ship
WHERE result = 'sunk'
GROUP BY class;

-- 6

SELECT class, COUNT(*) AS NO_Sunk
FROM ships JOIN outcomes ON name = ship
WHERE result = 'sunk' AND class IN (SELECT classes.class
                                    FROM classes JOIN ships ON classes.class=ships.class
                                    GROUP BY classes.class
                                    HAVING COUNT(name) > 2)
GROUP BY class;

-- 7

SELECT country, CONVERT(DECIMAL(5, 2), AVG(BORE)) AS avg_bore
FROM classes JOIN ships ON classes.class = ships.class
GROUP BY country;