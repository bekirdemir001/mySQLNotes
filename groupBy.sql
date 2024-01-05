/*
	GROUP BY: 
	1. It is used to briefly group rows according to the values of the columns.
	2. It returns one row per group.
	3. It is used with the Select command.
	4. Generally; It is used with aggregate functions such as avg(), count(), max(), min(), and sum().
	
	HAVING:
	1. It is used to express conditions.
	2. It is located after the Group By command.
	3. After grouping, the Having command is used if conditions are required.
*/

--Create a table
CREATE TABLE vehicle(
	make varchar(30),
	model varchar(30),
	price int,
	mileage int,
	gear varchar(30)
);

--Insert data into the table
INSERT INTO vehicle VALUES('Citroen','C3',500000,5000,'Automatic');
INSERT INTO vehicle VALUES('Mercedes','C180',900000,10000,'Automatic');
INSERT INTO vehicle VALUES('Honda','Civic',400000,15000,'Manuel');
INSERT INTO vehicle VALUES('Volkswagen','Golf',350000,20000,'Manuel');
INSERT INTO vehicle VALUES('Ford','Mustang',750000,5000,'Automatic');
INSERT INTO vehicle VALUES('Porsche','Panamera',850000,5000,'Automatic');
INSERT INTO vehicle VALUES('Bugatti','Veyron',950000,5000,'Automatic');
INSERT INTO vehicle VALUES('Mercedes','C180',800000,10000,'Manuel');
INSERT INTO vehicle VALUES('Citroen','C3',450000,5000,'Manuel');
INSERT INTO vehicle VALUES('Ford','Mustang',850000,1000,'Automatic');
INSERT INTO vehicle VALUES('Bugatti','Veyron',1100000,0,'Automatic');
INSERT INTO vehicle VALUES('Mercedes','C180',750000,35000,'Manuel');

SELECT * FROM vehicle;

--1. List the average price grouped by make.
SELECT make, ROUND(AVG(price),2) FROM vehicle GROUP BY make;

--2. List the average mileage grouped by gear.
SELECT gear, ROUND(AVG(mileage),2) FROM vehicle GROUP BY gear;

--3. List how many automatic vehicle grouped by make.
SELECT make, COUNT(*) AS automatic FROM vehicle WHERE gear='Automatic' GROUP BY make;

--4. List the maximum price grouped by gear.
SELECT gear, MAX(price) AS max_price FROM vehicle GROUP BY gear;

--5. List the maximum price grouped by gear.
SELECT gear, MIN(price) AS min_price FROM vehicle GROUP BY gear;

--6. List the sum of prices grouped by make.
SELECT make, SUM(price) AS sum_price FROM vehicle GROUP BY make;

--7. List the sum of prices grouped by gear.
SELECT gear, SUM(price) AS sum_price FROM vehicle GROUP BY gear;

--------------------------------------------------------------------------------------------
--HAVING:
--1. List the average price greater than 750000 grouped by make.
SELECT make, ROUND(AVG(price),2) AS avg_price FROM vehicle GROUP BY make HAVING AVG(price)>750000; 

--2. List the average mileage greater than 10000 grouped by make.
SELECT make, ROUND(AVG(mileage), 2) AS avg_mileage FROM vehicle GROUP BY make HAVING AVG(mileage)>10000;

--3. List the sum of prices greater than 1500000 grouped by make.
SELECT make, SUM(price) AS sum_price FROM vehicle GROUP BY make HAVING SUM(price)>1500000;

--4. Delete the table
DROP TABLE vehicle;