/*
	LIMIT: 
	Used to set limits.
*/

--Create a table
CREATE TABLE workers(
	id INT,
	name VARCHAR(30),
	profession VARCHAR(30),
	salary INT,
	
	CONSTRAINT id_uq UNIQUE (id)
);

--Insert data into the table
INSERT INTO workers VALUES (1001, 'Angelina Jolie', 'Software Developer', 123000);
INSERT INTO workers VALUES (1002, 'Megan Fox', 'Software Tester', 113000);
INSERT INTO workers VALUES (1003, 'Robert De Niro', 'Software Developer', 133000);
INSERT INTO workers VALUES (1004, 'Al Pacino', 'DevOps', 120000);
INSERT INTO workers VALUES (1005, 'Elizabeth Olsen', 'Mobile Developer', 105000);
INSERT INTO workers VALUES (1006, 'Christian Bale', 'Android Developer', 123000);
INSERT INTO workers VALUES (1007, 'Hugh Jackman', 'Product Owner', 150000);
INSERT INTO workers VALUES (1008, 'Jessica Alba', 'Test Lead', 140000);
INSERT INTO workers VALUES (1009, 'Matt Damon', 'Scrum Master', 100000);
INSERT INTO workers VALUES (1010, 'Brad Pitt', 'Software Developer', 126000);

SELECT * FROM workers;

--1. List the information of the first 5 people in the workers table.
SELECT * FROM workers LIMIT 5;

--2. List the first 3 data in the customers table whose id value is greater than 1002.
SELECT * FROM workers WHERE id>1002 LIMIT 3;

--3. List the first 3 data whose salary is greater than 110000 in the workers table.
SELECT * FROM workers WHERE salary>110000 LIMIT 3;

--4. List the first 3 data with the highest salary.
SELECT * FROM workers ORDER BY salary DESC LIMIT 3;

--5. Sort the table by salary from largest to smallest and list the 5 data after the first 2 data.
SELECT * FROM workers ORDER BY salary DESC OFFSET 2 LIMIT 5;

--6. Delete the table
DROP TABLE workers;