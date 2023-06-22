-- 1

SELECT maker
FROM product
WHERE model IN (SELECT model 
                FROM pc 
                WHERE speed > 500);

-- 2

SELECT code, model, price
FROM printer
WHERE price >=ALL (SELECT price 
                    FROM printer);

-- 3

SELECT *
FROM laptop
WHERE speed <ALL (SELECT speed 
                    FROM pc);

-- 4

SELECT product.model, price
FROM product JOIN (SELECT model, price 
                    FROM laptop
                    UNION
                    SELECT model, price 
                    FROM pc
                    UNION
                    SELECT model, price 
                    FROM printer) AS price 
                    ON product.model = price.model
WHERE price.price >=ALL (SELECT price 
                        FROM laptop
                        UNION
                        SELECT price 
                        FROM pc
                        UNION
                        SELECT price 
                        FROM printer);

-- 5

SELECT maker
FROM printer JOIN product ON printer.model = product.model
WHERE color = 'y' AND price <=ALL (SELECT price 
                                    FROM printer
                                    WHERE color = 'y');

-- 6

SELECT maker
FROM pc JOIN product ON pc.model = product.model
WHERE ram <=ALL (SELECT ram 
                FROM pc)    AND speed >=ALL (SELECT speed 
                                            FROM pc
                                            WHERE RAM <=ALL (SELECT RAM 
                                                            FROM pc));