/*
	JOIN Operations: 
	Used to combine two tables. There are 3 types of Join operations. These;
		1.INNER JOIN: Lists the common data in the tables.
		2.LEFT JOIN: Lists all data in the first table.
		3.RIGHT JOIN: Lists all data in the second table.
		FULL JOIN: Lists all the data in both tables. (LEFT JOIN + RIGHT JOIN - INNER JOIN)
		
	Syntax :
	SELECT [column1], [column2],... FROM [table_name1]
	... JOIN [table_name2]
	ON table_name1.common_column=table_name2.common_column;	
*/

--Create the first table
CREATE TABLE qa_lessons(
	lesson_id SMALLINT,
	lesson_name VARCHAR(30),
	lesson_time SMALLINT
);

--Insert data into the first table
INSERT INTO qa_lessons VALUES (101,'Core Java',40);
INSERT INTO qa_lessons VALUES (102,'Selenium',30);
INSERT INTO qa_lessons VALUES (103,'API',15);
INSERT INTO qa_lessons VALUES (104,'SQL',10);
INSERT INTO qa_lessons VALUES (105,'SDLS',10);
INSERT INTO qa_lessons VALUES (106,'LAMBDA',12);

--Create the second table
CREATE TABLE developer_lessons(
	lesson_id SMALLINT,
	lesson_name VARCHAR(30),
	lesson_time SMALLINT
);

--Insert data into the second table
INSERT INTO developer_lessons VALUES (101,'Core Java',40);
INSERT INTO developer_lessons VALUES (103,'API',15);
INSERT INTO developer_lessons VALUES (104,'SQL',10);
INSERT INTO developer_lessons VALUES (105,'SDLS',10);
INSERT INTO developer_lessons VALUES (106,'LAMBDA',12);
INSERT INTO developer_lessons VALUES (107,'Spring Framework',20);
INSERT INTO developer_lessons VALUES (108,'Micro Services',12);

SELECT * FROM qa_lessons;
SELECT * FROM developer_lessons;

--1. List qa_lessons using Join.
--1.Way: Left Join
SELECT A.lesson_id, A.lesson_name, A.lesson_time FROM qa_lessons AS A
LEFT JOIN developer_lessons AS B
ON A.lesson_id=b.lesson_id;
--2.Way: Right Join
SELECT A.lesson_id, A.lesson_name, A.lesson_time FROM developer_lessons AS B
RIGHT JOIN qa_lessons AS A 
ON A.lesson_id=b.lesson_id;

--2. List developer_lessons using Join.
--1.Way: Left Join
SELECT A.lesson_id, A.lesson_name, A.lesson_time FROM developer_lessons AS A
LEFT JOIN qa_lessons AS B
ON A.lesson_id=b.lesson_id;
--2.Way: Right Join
SELECT B.lesson_id, B.lesson_name, B.lesson_time FROM qa_lessons AS A 
RIGHT JOIN developer_lessons AS B 
ON A.lesson_id=b.lesson_id;

--3. List common lessons
--1.Way:
SELECT A.lesson_id, A.lesson_name, A.lesson_time FROM qa_lessons AS A 
INNER JOIN developer_lessons AS B 
ON A.lesson_id=b.lesson_id;
--2.Way:
SELECT B.lesson_id, B.lesson_name, B.lesson_time FROM qa_lessons AS A 
INNER JOIN developer_lessons AS B 
ON A.lesson_id=b.lesson_id;

--4. List all data in both tables using Join
SELECT A.lesson_id, A.lesson_name, A.lesson_time FROM qa_lessons AS A 
LEFT JOIN developer_lessons AS B 
ON A.lesson_id=b.lesson_id

UNION

SELECT B.lesson_id, B.lesson_name, B.lesson_time FROM qa_lessons AS A 
RIGHT JOIN developer_lessons AS B 
ON A.lesson_id=b.lesson_id;

--Delete the table
DROP TABLE qa_lessons, developer_lessons;