/*
	Data Query Language(DQL):It deals with the data itself.
		Select: Lists the data in the table.
*/

--Create a table
CREATE TABLE student(
id char(10),
name varchar(20),
department varchar(20),	
average_score real,	
registered_date date
);

--Insert data into table
INSERT INTO student VALUES ('2015152060', 'Tom Hanks', 'Mathematic', 3.04, '2015-09-06');
INSERT INTO student VALUES ('2016144011', 'Angelina Jolie', 'Physic', 2.93, '2016-08-29');
INSERT INTO student VALUES ('2018152045', 'Morgan Freeman', 'Mathematic', 2.23, '2018-09-03');
INSERT INTO student VALUES ('2017132058', 'Tim Roberts', 'Chemistry', 3.25, '2017-08-26');
INSERT INTO student VALUES ('2016152034', 'Julia Roberts', 'Mathematic', 3.52, '2016-01-26');
INSERT INTO student VALUES ('2020112070', 'Will Smith', 'Biology', 2.25, '2020-02-01');
INSERT INTO student VALUES ('2019132026', 'Johnny Depp', 'Chemistry', 3.05, '2019-09-02');
INSERT INTO student VALUES ('2020144043', 'Selena Gomez', 'Physic', 2.23, '2020-09-07');
INSERT INTO student VALUES ('2015144055', 'Nicole Kidman', 'Physic', 3.67, '2015-02-11');
INSERT INTO student VALUES ('2017112001', 'Antonio Banderas', 'Biology', 2.75, '2017-01-29');

--SELECT COMMAND
--1. List all data 
SELECT * FROM student;

--2. List ids 
SELECT id FROM student;

--3. List names 
SELECT name FROM student;

--4. List departments
SELECT department FROM student;

--5. List average scores
SELECT average_score FROM student;

--6. List registered dates 
SELECT registered_date FROM student;

--7. List all data whose department is Mathematic
SELECT * FROM student WHERE department='Mathematic';

--8. List all data whose average score is greater than 3.00 
SELECT * FROM student WHERE average_score>=3.00;

--9. List all data whose average score is smaller than 2.50
SELECT * FROM student WHERE average_score<=2.50;

--10. List names and registered dates whose registered date is older than 2020-01-01
SELECT name, registered_date FROM student WHERE registered_date<='2020-01-01';

--11. List names and average scores whose department is Physic 
SELECT name, average_score FROM student WHERE department='Physic';

--12. List names and average scores whose department is Chemistry and average score is greater than 3.10
SELECT name, average_score FROM student WHERE department='Chemistry' AND average_score>=3.10;

--13. List all data whose department is Chemistry or Biology
SELECT * FROM student WHERE department='Chemistry' OR department='Biology';
SELECT * FROM student WHERE department IN('Chemistry','Biology');

--14. List all data whose department is not Mathematic and Biology
SELECT * FROM student WHERE department!='Mathematic' AND department!='Biology';
SELECT * FROM student WHERE department='Physic' OR department='Chemistry';
SELECT * FROM student WHERE department NOT IN('Mathematic','Biology');

--15. List all data whose average score is greater than 2.23 and smaller than 3.25
SELECT * FROM student WHERE average_score>=2.23 AND average_score<=3.25;
SELECT * FROM student WHERE average_score BETWEEN 2.23 AND 3.25;

--16. List all data whose average score is not greater than 2.25 and smaller than 3.25
SELECT * FROM student WHERE average_score<2.25 OR average_score>3.25;
SELECT * FROM student WHERE average_score NOT BETWEEN 2.25 AND 3.25;

/*
Note: When using "between" and "not between" keywords, Bounds are inculuded.
	  We can use "in()" and "not in()" keywords for multiple values in the same column.
	  We can use "where" keywoard when we need to specify a condition.
*/

--17. We can create a table from another table like the following:
CREATE TABLE new_students AS (SELECT name, department FROM student);

SELECT * FROM new_students;

--18. Delete the table
DROP TABLE student;