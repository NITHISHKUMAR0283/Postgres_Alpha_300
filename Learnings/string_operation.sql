CREATE TABLE Students(
    name Varchar(20),
    id Varchar(20)
);
-- Query returned successfully in 146 msec.
INSERT INTO Students (name, id) VALUES ('Nithish', 'RA2411026011347');
-- INSERT 0 1

-- Query returned successfully in 50 msec.

select name || id from Students;

SELECT CONCAT(name ,id ) from Students;
-- NithishRA2411026011347
SELECT CONCAT(name,' , ',id) from Students;
-- Nithish , RA2411026011347
SELECT CONCAT (UPPER(name), ' , ',id) from Students;
-- NITHISH , RA2411026011347
SELECT CONCAT (LOWER(name), ' , ',id) from Students;
-- nithish , RA2411026011347