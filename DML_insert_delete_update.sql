/*
	Data Manipulation Language(DML): It deals with the data itself.
	
		Insert: Adds data to the table.
			Syntax: INSERT INTO [table_name] VALUES ([data1], [data2], [date3], [...]);
			
		Delete: Deletes the data in the table.
			Syntax: DELETE FROM [table_name] WHERE [condition];
			
		Update: Updates the data in the table.
			Syntax: UPDATE [table_name] SET [column_name=new_value] WHERE [condition];
*/

--Insert Command
--Create a table
CREATE TABLE animals (
type varchar(30),
name varchar(30),
year int,
height int,
weight int
);

--Insert data to the table
INSERT INTO animals VALUES ('Cat', 'Sweet', 6, 24, 3);
INSERT INTO animals VALUES ('Dog', 'Oscar', 8, 85, 35);
INSERT INTO animals VALUES ('Horse', 'Cisco', 26, 150, 750);
INSERT INTO animals VALUES ('Turtle', 'Sheldon', 132, 10, 145);
INSERT INTO animals VALUES ('Elephant', 'Kandula', 42, 300, 5000);

SELECT * FROM animals;

----------------------------------------------------------------------------------------------------------
--Delete Command
--1. Delete the row with weight 145 in the animals table.
DELETE FROM animals WHERE weight=145;

--2. Delete the row with height 85 in the animals table.
DELETE FROM animals WHERE height=85;

--3. Delete the row with year 6 in the animals table.
DELETE FROM animals WHERE year=6;

--4. Delete the row with name 'Cisco' in the animals table.
DELETE FROM animals WHERE name='Cisco';

--5. Delete the row with type 'Elephant' in the animals table.
DELETE FROM animals WHERE type='Elephant';

--Insert data to the table again
INSERT INTO animals VALUES ('Cat', 'Sweet', 6, 24, 3);
INSERT INTO animals VALUES ('Dog', 'Oscar', 8, 85, 35);
INSERT INTO animals VALUES ('Horse', 'Cisco', 26, 150, 750);
INSERT INTO animals VALUES ('Turtle', 'Sheldon', 132, 10, 145);
INSERT INTO animals VALUES ('Elephant', 'Kandula', 42, 300, 5000);

SELECT * FROM animals;

--6. Delete the rows in the animals table whose year is smaller than 10.
DELETE FROM animals WHERE year<10;

--7. Delete the rows in the animals table whose weight is greater than 1000.
DELETE FROM animals WHERE weight>1000;

--8. Delete all date from the table
DELETE FROM animals;

--9. Delete the table
DROP TABLE animals;

--------------------------------------------------------------------------------------------------
--Update Command
--Create a table
CREATE TABLE fruits (
type varchar(20),
color varchar(20),
country varchar(20),
production_quantities int
);

--Insert date into table
INSERT INTO fruits VALUES ('Apple', 'Red', 'Argentina', 2000);
INSERT INTO fruits VALUES ('Grapes', 'Black', 'Spain', 2000);
INSERT INTO fruits VALUES ('Banana', 'Yellow', 'Argentina', 2000);
INSERT INTO fruits VALUES ('Pomegranate', 'Red', 'Turkey', 3000);
INSERT INTO fruits VALUES ('Strawberry', 'Red', 'Italy', 1500);
INSERT INTO fruits VALUES ('Peach', 'Yellow', 'Uzbekistan', 1000);
INSERT INTO fruits VALUES ('Watermelon', 'Green', 'Turkey', 5000);

SELECT * FROM fruits;

--1. Update the color to 'Green' whose type is 'Apple'
UPDATE fruits SET color='Green' WHERE type='Apple';

--2. Update the country to 'Turkey' whose production_quantities is samller than 1600
UPDATE fruits SET country='Turkey' WHERE production_quantities<1600;

--3. Update the type to 'Apple' and the color to 'Yellow' whose country is Spain or Argentina
UPDATE fruits SET type='Apple', color='Yellow' WHERE country in('Spain', 'Argentina');

--4. Update all date to 'Germany' in country column
UPDATE fruits SET country='Germany';

--5. Update country to 'England' whose production_quantities is greater than 2000
UPDATE fruits SET country='England' WHERE production_quantities>2000;

--6. Update production_quantities by adding 500 whose production_quantities is 2000
UPDATE fruits SET production_quantities=production_quantities+500 WHERE production_quantities=2000;

--7. Update type to 'Strawberry' whose type is 'Pomegranate'
UPDATE fruits SET type='Strawberry' WHERE type='Pomegranate';

--8. Delete all date from the table
DELETE FROM fruits;

--9. Delete the table
DROP TABLE fruits;