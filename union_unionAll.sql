/*
	UNION - UNION ALL
	1. Creates a single result set by combining the result sets of two or more query expressions.
	2. UNION: Retrieves only Unique data.
	   UNION ALL: Retrieves both Unique and Similar data.
	3. Here, the data type of the query expressions must be compatible with each other.
*/

--Create the first table
CREATE TABLE workers(
	id VARCHAR(4),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	age INT,
	start_date DATE
);

--Insert data into the first table
INSERT INTO workers VALUES ('1001', 'Tom', 'Cruise', 52, '2020-04-04');
INSERT INTO workers VALUES ('1002', 'Julia', 'Roberts', 43, '2010-05-12');
INSERT INTO workers VALUES ('1003', 'Morgan', 'Freeman', 28, '2021-01-23');
INSERT INTO workers VALUES ('1004', 'Will', 'Smith', 23, '2023-01-13');
INSERT INTO workers VALUES ('1005', 'Angelina', 'Jolie', 32, '2015-10-01');
INSERT INTO workers VALUES ('1006', 'Scarlett', 'Jhonson', 35, '2014-02-24');
INSERT INTO workers VALUES ('1007', 'Tom', 'Hanks', 41, '2017-03-14');
INSERT INTO workers VALUES ('1008', 'Tom', 'Cruise', 28, '2020-08-24');
INSERT INTO workers VALUES ('1009', 'Angelina', 'Jolie', 55, '2001-09-15');
INSERT INTO workers VALUES ('1010', 'Tom', 'Cruise', 29, '2018-11-11');

--Create the second table
CREATE TABLE workers_salaries(
	department VARCHAR(20),
	profession VARCHAR(30),
	salary INT
);

--Insert data into the second table
INSERT INTO workers_salaries VALUES ('Software', 'Developer', 123000);
INSERT INTO workers_salaries VALUES ('Accounting', 'Accountant', 90000);
INSERT INTO workers_salaries VALUES ('Logistics', 'Logistic Operator', 95000);
INSERT INTO workers_salaries VALUES ('Software', 'Tester', 115000);
INSERT INTO workers_salaries VALUES ('Software', 'DevOps', 132000);
INSERT INTO workers_salaries VALUES ('Purchasing', 'Purchasing Manager', 100000);
INSERT INTO workers_salaries VALUES ('Software', 'Mobile Developer', 105000);
INSERT INTO workers_salaries VALUES ('Planning', 'Industry Engineer', 102000);
INSERT INTO workers_salaries VALUES ('Export', 'Export Specialist', 123000);

--1. Write a non-repetitive query that shows people 
--who are older than 40 in the workers table and 
--whose income is greater than 100000 in the workers_salaries table.
SELECT first_name AS firstName_department, last_name AS lastName_profession, age AS age_salary FROM workers WHERE age>40
UNION
SELECT department, profession, salary FROM workers_salaries WHERE salary>100000;

--2. Write a non-repetitive query that shows people 
--whose name is 'Tom' in the workers table and 
--whose income is smaller than 100000 in the workers_salaries table.
SELECT first_name AS firstName_department, last_name AS lastName_profession FROM workers WHERE first_name='Tom'
UNION
SELECT department, profession FROM workers_salaries WHERE salary<100000;

--3. Write a repetitive query that shows people 
--whose name is 'Tom' in the workers table and 
--whose income is smaller than 100000 in the workers_salaries table.
SELECT first_name AS firstName_department, last_name AS lastName_profession FROM workers WHERE first_name='Tom'
UNION ALL
SELECT department, profession FROM workers_salaries WHERE salary<100000;

--4. Write a non-repetitive query that shows people 
--whose start_date is after '2020-01-01' in the workers table and 
--whose income is smaller than 120000 in the workers_salaries table.
SELECT first_name AS firstName_department, last_name AS lastName_profession FROM workers WHERE start_date>'2020-01-01'
UNION
SELECT department, profession FROM workers_salaries WHERE salary>120000;

--5. Write a repetitive query that shows people 
--whose start_date is after '2020-01-01' in the workers table and 
--whose income is smaller than 120000 in the workers_salaries table.
SELECT first_name AS firstName_department, last_name AS lastName_profession FROM workers WHERE start_date>'2020-01-01'
UNION ALL
SELECT department, profession FROM workers_salaries WHERE salary>120000;

--6. Delete the tables
DROP TABLE workers, workers_salaries;