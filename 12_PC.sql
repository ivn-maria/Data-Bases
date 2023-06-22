-- 5

SELECT DISTINCT maker
FROM product JOIN printer ON product.model = printer.model
WHERE maker IN (SELECT maker
                        FROM product JOIN laptop ON product.model = laptop.model);

SELECT maker
FROM product JOIN printer ON product.model = printer.model
INTERSECT
SELECT maker
FROM product JOIN laptop ON product.model = laptop.model;

-- 6

UPDATE pc 
SET price = 0.95 * price
WHERE model IN (SELECT model
                FROM product AS p1
                WHERE (SELECT AVG(price)
                        FROM product AS p2 JOIN printer ON p2.model = printer.model
                        WHERE p1.maker = p2.maker
                        GROUP BY maker) > 800);

-- 7

SELECT hd, MIN(price) AS min_price
FROM pc JOIN product ON pc.model = product.model 
WHERE hd >= 10 AND hd <= 30
GROUP BY hd;