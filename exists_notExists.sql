/*
	EXISTS - NOT EXISTS
	They are used in the subquery.
	They are used if a certain value exists or does not exist in the subquery.
*/

--Create the first table
CREATE TABLE december_salary(
	worker_id SMALLINT,
	worker_name VARCHAR(30),
	worker_salary INT
);

--Insert data into the first table
INSERT INTO december_salary VALUES (1001, 'Morgan Freeman', 35000);
INSERT INTO december_salary VALUES (1002, 'Agelina Jolie', 45000);
INSERT INTO december_salary VALUES (1003, 'Scarlett Johnson', 50000);
INSERT INTO december_salary VALUES (1004, 'Eddy Murphy', 28000);
INSERT INTO december_salary VALUES (1005, 'Will Smith', 48000);
INSERT INTO december_salary VALUES (1006, 'Tom Hanks', 43000);
INSERT INTO december_salary VALUES (1007, 'Emma Watson', 34000);

--Create the second table
CREATE TABLE january_salary(
	worker_id SMALLINT,
	worker_name VARCHAR(30),
	worker_salary INT
);

--Insert data into the second table
INSERT INTO january_salary VALUES (1001, 'Morgan Freeman', 40000);
INSERT INTO january_salary VALUES (1002, 'Agelina Jolie', 50000);
INSERT INTO january_salary VALUES (1003, 'Scarlett Johnson', 53000);
INSERT INTO january_salary VALUES (1005, 'Will Smith', 50000);
INSERT INTO january_salary VALUES (1006, 'Tom Hanks', 48000);
INSERT INTO january_salary VALUES (1008, 'Julia Roberts', 42000);

SELECT * FROM december_salary;
SELECT * FROM january_salary;

--1. List the worker_ids of people with the same worker_id in the december_salary table and january_salary table, 
--as well as the December salaries of people with these worker_ids.
SELECT worker_id, worker_salary FROM december_salary AS A 
WHERE 
EXISTS (SELECT worker_id FROM january_salary AS B WHERE A.worker_id=B.worker_id);

--2. List the worker_ids of people with the same worker_id in the december_salary table and january_salary table, 
--as well as names and salaries of people with these worker_ids in the january_salary table.
SELECT * FROM january_salary AS B 
WHERE 
EXISTS (SELECT worker_id FROM december_salary AS A WHERE A.worker_id=B.worker_id);

--3. List the worker_ids of people who do not have the same worker_id in the december_salary table and january_salary table, 
--as well as the December salaries of people with these worker_ids.
SELECT worker_id, worker_salary FROM december_salary AS A 
WHERE 
NOT EXISTS (SELECT worker_id FROM january_salary AS B WHERE A.worker_id=B.worker_id);

--4. List the worker_ids of people who do not have the same worker_id in the december_salary table and january_salary table, 
--as well as names and salaries of people with these worker_ids in the january_salary table.
SELECT * FROM january_salary AS B 
WHERE 
NOT EXISTS (SELECT worker_id FROM december_salary AS A WHERE A.worker_id=B.worker_id);

--Delete the table
DROP TABLE december_salary, january_salary;