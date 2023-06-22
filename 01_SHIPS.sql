-- 1

SELECT class, country 
FROM classes
WHERE numguns < 10;

-- 2

SELECT name AS shipName
FROM ships
WHERE launched < 1918;

-- 3

SELECT ship, battle
FROM outcomes
WHERE result = 'sunk';

-- 4

SELECT name 
FROM ships
WHERE name = class;

-- 5

SELECT name 
FROM ships
WHERE name LIKE 'R%';

-- 6

SELECT name 
FROM ships
WHERE name LIKE '% %';