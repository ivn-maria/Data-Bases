-- 1

SELECT name 
FROM moviestar 
WHERE gender = 'M'
INTERSECT
SELECT starname
FROM starsin
WHERE movietitle = 'The Usual Suspects';

-- 2

SELECT DISTINCT starname
FROM starsin, movie
WHERE movieyear = 1995 AND studioname = 'MGM';

-- 3

SELECT DISTINCT name
FROM movieexec, movie
WHERE studioname = 'MGM' AND producerc# = cert#;

-- 4

SELECT mv1.title
FROM movie AS mv1, movie AS mv2
WHERE mv2.title = 'Star Wars' AND mv1.length > mv2.length;

-- 5

SELECT me1.name 
FROM movieexec AS me1, movieexec as me2
WHERE me2.name = 'Stephen Spielberg' AND me1.networth > me2.networth;