-- 1

SELECT name
FROM moviestar
WHERE gender = 'F' AND name IN (SELECT name
                                FROM movieexec
                                WHERE networth > 10000000);

-- 2

SELECT name
FROM moviestar
WHERE name NOT IN (SELECT name
                    FROM movieexec);

-- 3

SELECT title
FROM movie
WHERE length > (SELECT length 
                FROM movie
                WHERE title = 'Star Wars');

-- 4

SELECT title, name
FROM movieexec JOIN (SELECT title, producerc#
                    FROM movie) AS movie 
                    ON cert# = producerc#
WHERE networth > (SELECT networth
                   FROM movieexec
                   WHERE name = 'Merv Griffin');