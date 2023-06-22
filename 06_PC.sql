-- 1

SELECT lt1.model, lt1.code, lt1.screen
FROM laptop AS lt1 JOIN laptop AS lt2 ON lt1.model = lt2.model
WHERE (lt1.screen = 15 AND lt2.screen = 11) OR (lt1.screen = 11 AND lt2.screenvv = 15)
ORDER BY code;

-- 2

SELECT DISTINCT pc.model 
FROM pc JOIN product AS pr1 ON pc.model = pc.model
WHERE price < (SELECT price 
                FROM laptop JOIN product AS pr2 ON laptop.model = pr2.model
                WHERE price <=ALL (SELECT price 
                                    FROM laptop JOIN product AS pr3 ON laptop.model = pr3.model
                                    WHERE pr2.maker = pr3.maker) AND pr1.maker = pr2.maker);

-- 3

SELECT pr1.model, AVG(price) AS avg_price
FROM pc JOIN product AS pr1 ON pc.model = pr1.model
GROUP BY maker, pr1.model 
HAVING AVG(price) < (SELECT price 
                    FROM laptop JOIN product AS pr2 ON laptop.model = pr2.model
                    WHERE price <=ALL (SELECT price 
                                        FROM laptop JOIN product AS pr3 ON laptop.model = pr3.model
                                        WHERE pr2.maker = pr3.maker) AND pr1.maker = pr2.maker);

-- 4

SELECT pc1.code, pr1.maker, COUNT(pc2.code) AS num_pc_higher_price
FROM (pc AS pc1 JOIN product AS pr1 ON pc1.model = pr1.model) CROSS JOIN (pc AS pc2 JOIN product AS pr2 ON pc2.model = pr2.model)
WHERE pc1.price <= pc2.price
GROUP BY pc1.code, pr1.maker
ORDER BY code; 