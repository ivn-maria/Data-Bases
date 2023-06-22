-- 1

SELECT title, year, length
FROM movie
WHERE (length > 120 OR length IS NULL) AND year < 2000;

-- 2

SELECT name, gender
FROM moviestar
WHERE name LIKE 'J%' AND birthdate > 1948 
ORDER BY name DESC;

-- 3

SELECT studioname, COUNT(DISTINCT starname) AS num_actors
FROM movie JOIN starsin ON movietitle = title
GROUP BY studioname;

-- 4

SELECT starname, COUNT(movietitle) AS num_movies
FROM starsin
GROUP BY starname;

-- 5

SELECT studioname, title, year
FROM movie AS mv1
WHERE year >= ALL (SELECT year
                    FROM movie AS mv2
                    WHERE mv1.studioname = mv2.studioname)
ORDER BY studioname DESC;

-- 6

SELECT name
FROM moviestar
WHERE gender = 'M' AND birthdate >=ALL (SELECT birthdate
                                        FROM moviestar
                                        WHERE gender = 'M');

-- 7

SELECT studioname, starname, COUNT(starname)
FROM movie JOIN starsin ON movietitle = title
GROUP BY studioname, starname 
HAVING COUNT(starname) >= ALL (SELECT COUNT(starname)
                                FROM movie JOIN starsin ON movietitle = title
                                GROUP BY studioname, starname);

-- 8

SELECT title AS movietitle, year AS movieyear, COUNT(starname) AS num_actors
FROM movie JOIN starsin ON movietitle = title
GROUP BY title, year 
HAVING COUNT(DISTINCT starname) > 2;