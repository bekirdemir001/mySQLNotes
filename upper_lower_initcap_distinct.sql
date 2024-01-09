/*
		UPPER - LOWER - INITCAP - DISTINCT

	UPPER: Lists the data in the column in uppercase letters.
		   Syntax: SELECT UPPER ([column_name]) FROM [table_name];

	LOWER: Lists the data in the column in lowercase letters.
		   Syntax: SELECT LOWER ([column_name]) FROM [table_name];

	INITCAP: Lists the data in the column with the first letter in uppercase and the other letters in lowercase.
		     Syntax: SELECT INITCAP (column_name) from table_name;

	DISTINCT: Lists the data in the column without repetition.
			  Syntax: SELECT DISTINCT ([column_name]) FROM [table_name];
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
INSERT INTO artists VALUES (1007, 'Julie', 'Roberts');
INSERT INTO artists VALUES (1008, 'Scarlett', 'Jhonson');
INSERT INTO artists VALUES (1009, 'Will', 'Smith');
INSERT INTO artists VALUES (1010, 'Scarlett', 'Jhonson');

--1. List the first_name column in capital letters.
SELECT UPPER(first_name) FROM artists;

--2. List the first_name column in lower letters.
SELECT LOWER(first_name) FROM artists;

--3. List the LAST_NAME column with the first letter capitalized and the other letters lowercase.
SELECT INITCAP(last_name) FROM artists;

--4. List the first_name column in capital letters and the last_name column in lowercase letters.
SELECT UPPER(first_name), LOWER(last_name) FROM artists;

--5. List the first_name column without repetition.
SELECT DISTINCT(first_name) FROM artists;

--6. Delete the table
DROP TABLE artists;