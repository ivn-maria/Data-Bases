-- 1

SELECT name 
FROM ships, classes
WHERE displacement > 50000 AND ships.class = classes.class;

-- 2

SELECT name, displacement, numguns
FROM ships, classes, outcomes
WHERE ships.class = classes.class AND ships.name = outcomes.ship AND battle = 'Guadalcanal';

-- 3

SELECT country 
FROM classes
WHERE TYPE = 'bb'
INTERSECT
SELECT country 
FROM classes
WHERE TYPE = 'bc';

-- 4

SELECT ships.name 
FROM ships, outcomes AS oc1, outcomes AS oc2, battles AS bt1, battles AS bt2
WHERE ships.name = oc1.SHIP AND oc1.BATTLE = bt1.NAME AND oc2.BATTLE = bt2.NAME AND oc1.RESULT = 'damaged' AND oc1.SHIP = oc2.SHIP AND bt1.[DATE] < bt2.[DATE];