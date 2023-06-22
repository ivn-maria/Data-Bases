-- 1

SELECT CONVERT(DECIMAL(7, 2), AVG(speed)) AS AvgSpeed
FROM pc;

-- 2

SELECT maker, AVG(screen) AS AvgScreen
FROM laptop JOIN product ON laptop.model = product.model
GROUP BY maker;

-- 3

SELECT CONVERT(DECIMAL(4, 0), AVG(speed)) AS AvgSpeed
FROM laptop
WHERE price > 1000;

-- 4

SELECT maker, CONVERT(DECIMAL(6, 2), AVG(price)) AS AvgPrice
FROM pc JOIN product ON pc.model = product.model
WHERE maker = 'A'
GROUP BY maker;

-- 5

SELECT maker, AVG(price) AS AvgPrice
FROM (SELECT price, model
        FROM pc 
        UNION ALL
        SELECT price, model
        FROM laptop) AS prices JOIN product ON prices.model = product.model
WHERE maker = 'B' 
GROUP BY maker;

-- 6

SELECT speed, AVG(price) AS AvgPrice
FROM pc 
GROUP BY speed;

-- 7

SELECT maker, COUNT(code) AS number_of_pc
FROM product JOIN pc ON product.model = pc.model
GROUP BY maker
HAVING COUNT(code) > 2;

-- 8

SELECT maker, MAX(price) AS price
FROM product JOIN pc ON product.model = pc.model
WHERE price >=ALL (SELECT price 
                        FROM pc)
GROUP BY maker;

-- 9

SELECT speed, AVG(price) AS AvgPrice
FROM pc
WHERE speed > 800
GROUP BY speed;
 
-- 10
SELECT maker, CONVERT(DECIMAL(5, 2), AVG(hd)) AS AvgHDD 
FROM pc JOIN product ON pc.model = product.model
WHERE maker IN (SELECT maker
                FROM product
                WHERE TYPE = 'Printer')
GROUP BY maker;