-- 1

SELECT maker, model, type
FROM product 
WHERE model NOT IN (SELECT model
                    FROM laptop 
                    WHERE product.model = laptop.model
                    UNION
                    SELECT model
                    FROM pc 
                    WHERE product.model = pc.model
                    UNION
                    SELECT model
                    FROM printer 
                    WHERE product.model = printer.model);

-- 2

SELECT maker
FROM product JOIN printer ON product.model = printer.model
INTERSECT
SELECT maker
FROM product JOIN laptop ON product.model = laptop.model;

-- 3

SELECT DISTINCT l1.hd 
FROM laptop AS l1 JOIN laptop AS l2 ON l1.hd = l2.hd AND l1.model != l2.model;

-- 4

SELECT pc.model
FROM pc JOIN product ON pc.model = product.model
WHERE maker IS NULL;