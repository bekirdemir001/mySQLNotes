/*
	ORDER BY 
	It is used to sort by a certain column in a query.
	Syntax: ORDER BY [column_name] 			int --> Smallest to Largest 		String --> A->Z
			ORDER BY [column_name] ASC		int --> Smallest to Largest 		String --> A->Z
			We can type 'ASC' at the end of the query, but it is not recommended.
			
			ORDER BY [column_name] DESC 	int --> Largest to Smallest 		String --> Z->A
*/

--Create a table
CREATE TABLE artists(
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	revenue int,
	birth_date date
);

--Insert data into table
INSERT INTO artists VALUES ('Leonardo', 'DiCaprio', 55000, '1974-10-11');
INSERT INTO artists VALUES ('Tom', 'Cruise', 65000, '1962-07-03');
INSERT INTO artists VALUES ('Will', 'Smith', 50000, '1968-09-28');
INSERT INTO artists VALUES ('Denzel', 'Washington', 48000, '1954-12-28');
INSERT INTO artists VALUES ('Natalie', 'Portman', 62000, '1981-06-09');
INSERT INTO artists VALUES ('Emma', 'Watson', 52000, '1990-04-15');
INSERT INTO artists VALUES ('Jennifer', 'Lawrence', 45000, '1990-09-15');
INSERT INTO artists VALUES ('Anne', 'Hathaway', 59000, '1982-10-12');
INSERT INTO artists VALUES ('Scarlett', 'Johansson', 52000, '1984-10-22');
INSERT INTO artists VALUES ('Johnny', 'Depp', 34000, '1963-06-09');

SELECT * FROM artists;

--1. List the artists table by first_name, from smallest to largest.
SELECT * FROM artists ORDER BY first_name;
SELECT * FROM artists ORDER BY first_name ASC;--It is not recommended.

--2. List the artists table by first_name, from larhest to smallest.
SELECT * FROM artists ORDER BY first_name DESC;

--3. List the artists table by last_name, from smallest to largest.
SELECT * FROM artists ORDER BY last_name;
SELECT * FROM artists ORDER BY last_name ASC;--It is not recommended.

--4. List the artists table by last_name, from larhest to smallest.
SELECT * FROM artists ORDER BY last_name DESC;

--5. List the artists table by revenue, from smallest to largest.
SELECT * FROM artists ORDER BY revenue;
SELECT * FROM artists ORDER BY revenue ASC;--It is not recommended.

--6. List the artists table by revenue, from larhest to smallest.
SELECT * FROM artists ORDER BY revenue DESC;

--7. List the artists table by birth_date, from smallest to largest.
SELECT * FROM artists ORDER BY birth_date;
SELECT * FROM artists ORDER BY birth_date ASC;--It is not recommended.

--8. List the artists table by birth_date, from larhest to smallest.
SELECT * FROM artists ORDER BY birth_date DESC;

--9. List artists born before 1980, from smallest to largest..
SELECT * FROM artists WHERE birth_date<'1980-01-01' ORDER BY birth_date;
SELECT * FROM artists WHERE birth_date<'1980-01-01' ORDER BY birth_date ASC;--It is not recommended.

--10. List artists born before 1980, from largest to smallest.
SELECT * FROM artists WHERE birth_date<'1980-01-01' ORDER BY birth_date DESC;

--11. Delete the table
DROP TABLE artists;