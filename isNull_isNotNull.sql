/*
		IS NULL - IS NOT NULL

	IS NULL: Returns null data.
	IS NOT NULL: Returns non-null data.
*/

--Create a table
CREATE TABLE artists(
	id CHAR(4),
	first_name VARCHAR(30),
	last_name VARCHAR(30)	
);

--Insert data into the table
INSERT INTO artists VALUES (1001, 'Tom', 'Hanks');
INSERT INTO artists VALUES (1002, 'Tim', 'Roberts');
INSERT INTO artists VALUES (1003, 'Antony', 'Hopkins');
INSERT INTO artists VALUES (1004, 'Angelina', 'Jolie');
INSERT INTO artists VALUES (1005, 'Tom', 'Cruise');
INSERT INTO artists VALUES (1006, 'Morgan', 'Freeman');
INSERT INTO artists VALUES (1007, null, 'Roberts');
INSERT INTO artists VALUES (1008, null, 'Jhonson');
INSERT INTO artists VALUES (1009, 'Will', 'Smith');
INSERT INTO artists VALUES (1010, 'Scarlett', null);

--1. List the data that is null in the first_name column.
SELECT * FROM artists WHERE first_name IS NULL;

--2. List the data that is non-null in the first_name column.
SELECT * FROM artists WHERE first_name IS NOT NULL;

--3. List the data that is null in the last_name column.
SELECT * FROM artists WHERE last_name IS NULL;

--4. List the data that is non-null in the last_name column.
SELECT * FROM artists WHERE last_name IS NOT NULL;

--5. Delete the table
DROP TABLE artists;