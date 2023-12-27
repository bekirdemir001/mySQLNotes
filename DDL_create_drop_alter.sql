/*
	Data Definition Language(DDL): It deals with the table itself.
	
		Create: Creates a table.
			Syntax: CREATE TABLE [table_name] (column_name + data_type);
			
		Drop: Deletes the table.
			Syntax: Drop TABLE [table_name];
			
		Alter: Updates the table.
			Syntax: ALTER TABLE [table_name] [alteration];
					ALTER TABLE [table_name] ADD COLUMN [column_name] [data_type];
					ALTER TABLE [table_name] ADD COLUMN [column_name] [data_type] DEFAULT [data];
					ALTER TABLE [table_name] DROP COLUMN [column_name];
					ALTER TABLE [table_name] RENAME COLUMN [old_column_name] TO [new_column_name];
					ALTER TABLE [table_name] RENAME TO [new_table_name];			
*/
--------------------------------------------------------------------------------------------------
--Create Command
--Create a table
CREATE TABLE cars(
make varchar(20),
model varchar(20),
year int
);

--------------------------------------------------------------------------------------------------
--Drop Command
--Delete the table from database
DROP TABLE cars;

--------------------------------------------------------------------------------------------------
--Alter Command
--Create a table again
CREATE TABLE cars(
make varchar(20),
model varchar(20),
year int
);

--Insert data into table
INSERT INTO cars VALUES('Mercedes', 'C-200', 2018); 
INSERT INTO cars VALUES('BMV', 'X6', 2020);
INSERT INTO cars VALUES('Toyata', 'Corolla', 2015);
INSERT INTO cars VALUES('Seat', 'Leon', 2016);
INSERT INTO cars VALUES('Honda', 'Civic', 2022);
INSERT INTO cars VALUES('Tesla', 'Model-S', 2023);

SELECT * FROM cars;

--1. Add column "mileage int" to the table
ALTER TABLE cars ADD COLUMN mileage int;

--2. Add column "fuel_type varchar(20)" with default date "Diesel" to the table.
ALTER TABLE cars ADD COLUMN fuel_type varchar(20) DEFAULT 'Diesel';

--3. Delete "year" column from the table
ALTER TABLE cars DROP COLUMN year;

--4. Rename the "fuel_type" column to "is_diesel"
ALTER TABLE cars RENAME COLUMN fuel_type TO is_diesel;

--5. Alter the table name to "auto_showroom"
ALTER TABLE cars RENAME TO auto_showroom;

SELECT * FROM auto_showroom;

--6. Delete the table
DROP TABLE auto_showroom;