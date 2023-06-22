-- 4

INSERT INTO pc(code, model, speed, ram, hd, cd, price)
VALUES (12, '1100', 2400, 2048, 500, '52x', 299);
INSERT INTO product (model, maker, type)
VALUES ('1100', 'C', 'PC');

-- 5

DELETE FROM pc
WHERE model = '1100';
-- DELETE FROM product
-- WHERE model = '1100';

-- 6

DELETE FROM laptop 
WHERE model IN (SELECT model
                FROM product 
                WHERE type = 'Laptop' AND maker IN (SELECT maker
                                                    FROM product
                                                    WHERE type = 'Laptop'
                                                    EXCEPT
                                                    SELECT maker
                                                    WHERE type = 'Printer'));
-- DELETE FROM product
-- WHERE model in (SELECT model
--                 FROM product 
--                 WHERE type = 'Laptop' AND maker IN (SELECT maker
--                                                     FROM product
--                                                     WHERE type = 'Laptop'
--                                                     EXCEPT
--                                                     SELECT maker
--                                                     WHERE type = 'Printer'));

-- 7

UPDATE product
SET maker = 'A'
WHERE maker = 'B';

-- 8

UPDATE pc
SET price = price/2, hd = hd + 20;

-- 9

UPDATE laptop 
SET screen = screen + 1
WHERE model IN (SELECT model
                FROM product
                WHERE type = 'Laptop' AND maker = 'B');