-- can't be executed at once

-- 1

CREATE VIEW v_airline_flightnumber_countbookings
(FLIGHT_AIRLINE, FLIGHT_NUMBER, COUNT_BOOKINGS)
AS
SELECT AIRLLINE_OPERATOR, FNUMBER, COUNT(CODE)
FROM Flights JOIN Bookings ON FNUMBER=FLIGHT_NUMBER
WHERE STATUS=1
GROUP BY AIRLLINE_OPERATOR, FNUMBER;

--2

CREATE VIEW v_agency_topcustomer
(AGENCY, TOP_CUSTOMER_FNAME, TOP_CUSTOMER_LNAME)
AS
SELECT Agency, FNAME, LNAME
FROM Bookings AS B1 JOIN Customers ON Customer_ID=ID
GROUP BY Agency, FNAME, LNAME
HAVING COUNT(Customer_ID) >= ALL (SELECT COUNT(Customer_ID)
                                FROM Bookings AS B2
                                WHERE B1.Agency=B2.Agency
                                GROUP BY Agency, Customer_ID);

--3

CREATE VIEW v_SF_agencies
AS
SELECT *
FROM Agencies
WHERE CITY='Sofia'
WITH CHECK OPTION;

--4

CREATE VIEW v_PH_agencies
AS
SELECT *
FROM Agencies
WHERE PHONE IS NULL
WITH CHECK OPTION;

-- 7

DROP VIEW v_airline_flightnumber_countbookings;

DROP VIEW v_agency_topcustomer;

DROP VIEW v_SF_agencies;

DROP VIEW v_PH_agencies;