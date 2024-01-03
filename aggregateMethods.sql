/*
	AGGREGATE METHODS: 
	Used when we want to obtain a single value.
		sum() --> Gets the sum of the data.
		count() --> Gets the count of the data.
		min() --> Gets the smallest value from the data.
		max() --> Gets the value of the largest data.
		avg() --> Averages the data.
		
		Note: round() --> Used to round the numbers in the decimal part.
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

SELECT * FROM vehicle;

--1. List the sum of prices in the vehicle table.
SELECT SUM(price) AS sum_prices FROM vehicle;

--2. List how many vehicle in the table.
SELECT COUNT(make) AS count_of_vehicle FROM vehicle;
SELECT COUNT(model) AS count_of_vehicle FROM vehicle;
SELECT COUNT(price) AS count_of_vehicle FROM vehicle;
SELECT COUNT(mileage) AS count_of_vehicle FROM vehicle;
SELECT COUNT(gear) AS count_of_vehicle FROM vehicle;

SELECT COUNT(*) AS count_of_vehicle FROM vehicle;

--3. List the lowest price in the vehicle table.
SELECT MIN(price) AS min_price FROM vehicle;

--4. List the highest price in the vehicle table.
SELECT MAX(price) AS max_price FROM vehicle;

--5. List the average of prices in the vehicle table.
SELECT AVG(price) AS average_price FROM vehicle;
SELECT ROUND (AVG(price)) AS average_price FROM vehicle;
SELECT ROUND (AVG(price), 2) AS average_price FROM vehicle;

--6. Delete the table
DROP TABLE vehicle;