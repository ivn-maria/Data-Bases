-- 1

SELECT maker, speed
FROM product, laptop
WHERE product.model = laptop.model AND hd >= 9;

-- 2

SELECT laptop.model, price 
FROM laptop, product 
WHERE laptop.model = product.model AND product.maker = 'B'
UNION
SELECT pc.model, price 
FROM pc, product 
WHERE pc.model = product.model AND product.maker = 'B'
UNION
SELECT PRINTER.model, price 
FROM PRINTER, product 
WHERE PRINTER.model = product.model AND product.maker = 'B';

-- 3

SELECT maker
FROM product
WHERE type = 'Laptop'
EXCEPT
SELECT maker
FROM product
WHERE type = 'PC';

-- 4

SELECT DISTINCT pc1.hd 
FROM pc AS pc1 JOIN pc AS pc2 ON pc1.hd = pc2.hd
WHERE pc1.hd = pc2.hd AND pc1.code < pc2.code
ORDER BY pc1.hd;

-- 5

SELECT DISTINCT pc1.model, pc2.model
FROM pc AS pc1, pc AS pc2
WHERE pc1.speed = pc2.speed AND pc1.ram = pc2.ram AND pc1.model < pc2.model;

-- 6

SELECT DISTINCT maker
FROM product JOIN pc AS pc1 ON product.model = pc1.model JOIN pc AS pc2 ON product.model = pc2.model
WHERE pc1.speed > 400 AND pc2.speed > 400 AND pc1.code < pc2.code;