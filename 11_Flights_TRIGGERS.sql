-- can't be executed at once

-- 1

ALTER TABLE Flights ADD NUM_PASS INT DEFAULT 0 NOT NULL;

-- 2

ALTER TABLE Agencies ADD NUM_BOOK INT DEFAULT 0 NOT NULL;

-- 3

CREATE TRIGGER trig_bookings_insert
ON Bookings
AFTER INSERT
AS
BEGIN
UPDATE Flights 
SET NUM_PASS = NUM_PASS + 1
WHERE FNUMBER IN (SELECT FNUMBER
                FROM inserted
                WHERE STATUS = '0')
UPDATE Agencies
SET NUM_BOOK = NUM_BOOK + 1
WHERE NAME IN (SELECT NAME
                FROM inserted
                WHERE STATUS = '0')
END;

-- 4

CREATE TRIGGER trig_bookings_delete
ON Bookings
AFTER DELETE
AS
BEGIN
UPDATE Flights
SET NUM_PASS = NUM_PASS - 1
WHERE FNUMBER IN (SELECT FNUMBER
                FROM deleted)
UPDATE Agencies
SET NUM_BOOK = NUM_BOOK - 1
WHERE NAME IN (SELECT NAME
                FROM deleted)
END;

-- 5

CREATE TRIGGER trig_bookings_update
ON Bookings
AFTER UPDATE
AS
BEGIN
UPDATE Flights
SET NUM_PASS = NUM_PASS + 1
WHERE FNUMBER IN (SELECT FNUMBER
                FROM inserted
                WHERE STATUS = '0') AND FNUMBER IN (SELECT FNUMBER
                                                    FROM deleted
                                                    WHERE STATUS = '1') 
UPDATE Flights
SET NUM_PASS = NUM_PASS - 1
WHERE FNUMBER IN (SELECT FNUMBER
                FROM inserted
                WHERE STATUS = '1') AND FNUMBER IN (SELECT FNUMBER
                                                    FROM deleted
                                                    WHERE STATUS = '0') 
END;