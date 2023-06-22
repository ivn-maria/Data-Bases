-- 10

INSERT INTO classes(class, type, country, bore, displacement)
VALUES ('Nelson', 'bb', 'Gt.Britain', 16, 3400);
INSERT INTO ships(name, class, launched)
VALUES ('Nelson', 'Nelson', 1927);
INSERT INTO ships(name, class, launched)
VALUES ('Rodney', 'Nelson', 1927);

-- 11

DELETE FROM ships
WHERE name IN (SELECT ship
                FROM outcomes
                WHERE result = 'sunk');
-- DELETE FROM outcomes
-- WHERE result = 'sunk';

-- 12

UPDATE classes
SET bore = bore*(2.5), displacement = displacement/(1.1);