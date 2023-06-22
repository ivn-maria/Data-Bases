-- 1

INSERT INTO moviestar (name, gender, birthdate)
VALUES ('Nicole Kidman', 'F', '1967-06-20 00:00:00.000');

-- 2

DELETE FROM movieexec
WHERE networth > 30000000;

-- 3

DELETE FROM moviestar
WHERE address IS NULL;