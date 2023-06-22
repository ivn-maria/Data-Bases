-- 1

SELECT title, name
FROM movieexec JOIN movie ON cert# = producerc#
WHERE cert# = (SELECT producerc#
                FROM movie
                WHERE title = 'Star Wars');

-- 2

SELECT DISTINCT name 
FROM movieexec JOIN movie ON cert# = producerc#
WHERE title IN (SELECT movietitle
                FROM starsin
                WHERE starname = 'Harrison Ford');

-- 3

SELECT DISTINCT name, starname
FROM studio JOIN movie ON name = studioname JOIN starsin ON title = movietitle;

-- 4

SELECT starname, networth, title
FROM starsin JOIN movie ON title = movietitle JOIN movieexec ON cert# = producerc#
WHERE networth >=ALL (SELECT networth 
                        FROM movieexec);

-- 5

SELECT name, movietitle
FROM moviestar LEFT JOIN starsin ON name = starname
WHERE movietitle IS NULL;