/*
					CONSTRAINT
					
		1. Unique: All data in a column is unique.
			Unique constraint can contain 2 or more "null" values.
			
		2. Not Null: All data in a column does not contain Null.
			Constraint name cannot be defined for Not Null constraint.
			"Not Null" constraint is written only after the data type.
			
		3. Check: Used to limit the range of values to be placed in a column.
		
		4. Primary Key:
			All data in a column must be Unique and must not contain Null. That is, Unique + Not Null.
			Primary Key is used when we want to reach only one person using a data.
			It is not mandatory to have a Primary Key in every table.
			We can use maximum 1 Primary Key in a table.
			
		5. Foreign Key:
			It is used to reference the Primary Key in another table. 
			Thus, a parent-child relationship is established between the tables. 
			In other words, Relational Tables are provided.
			It may contain repeated and Null values.
			More than one Foreign Key restriction can be used.
			The table containing the Foreign Key is called Child Table, and 
			The table containing the Primary Key is called Parent Table.
			
		Note: pgAdmin creates constraint names according to its own rules. But we can determine this name ourselves. We can
		specify this under column names and data types.
		
		The convenience provided by specifying Constraints under the column names;
			1. We can determine the Constraint name ourselves.
			2. It allows us to make a Composite Primary Key. 
		  	   That is, we can create a Primary Key from the combination of two columns.
*/ 

--Create a table
CREATE TABLE us_states(
state_name varchar(20) PRIMARY KEY,
abbreviation char(2) UNIQUE,
capital varchar(30) NOT NULL,
population int CHECK(population>10000000)
);

--This Constraints can be created by the following:
CREATE TABLE us_states (
state_name varchar(20),
abbreviation char(2),
capital varchar(30) NOT NULL,
population int,

	CONSTRAINT sn_pk PRIMARY KEY (state_name),
	CONSTRAINT abb_unq UNIQUE (abbreviation),
	CONSTRAINT pop_check CHECK (population>10000000)
);

--Insert data into the table
INSERT INTO us_states VALUES ('California', 'CA', 'Sacramento', 38965193);
INSERT INTO us_states VALUES ('Texas', 'TX', 'Austin', 30503301);
INSERT INTO us_states VALUES ('Ohio', 'OH', 'Columbus', 11785935);
INSERT INTO us_states VALUES ('Michigan', 'MI', 'Lansing', 10037261);

INSERT INTO us_states VALUES ('New Jersey', 'NJ', 'Trenton', 9290841);	--Gives an error because of Check Constraint
INSERT INTO us_states VALUES ('Georgia', 'GA', null, 11029227);			--Gives an error because of Not Null Constraint
INSERT INTO us_states VALUES ('Illinois', 'OH', 'Columbus', 11785935);	--Gives an error because of Unique Constraint

INSERT INTO us_states VALUES ('Texas', 'TS', 'Austin', 30503301);		--Gives an error because of Primary Key Constraint
INSERT INTO us_states VALUES (null, 'NC', 'Raleigh', 10835491);			--Gives an error because of Primary Key Constraint


INSERT INTO us_states VALUES ('Alaska', 'AK', null, 733406);			--Gives an error because of both Check and Not Null Constraints
INSERT INTO us_states VALUES ('Alaska', 'AK', 'Juneau', 733406);		--Gives an error because of both Check and Unique Constraints
INSERT INTO us_states VALUES ('Texas', 'TA', 'Sacramento', 733406);		--Gives an error because of both Check and Primary Key Constraints

INSERT INTO us_states VALUES ('Texas', 'TX', 'Sacramento', 733406);		--Gives an error because of Check, Unique and Primary Key Constraints

INSERT INTO us_states VALUES ('Texas', 'TX', null, 733406);				--Gives an error because of all Constraints

--Delete the table
DROP TABLE us_states;

-------------------------------------------------------------------------------------------------------------------------------------------------
/*
Thanks to the FOREIGN KEY constraint;
	1. Data cannot be entered into the Child table with data that is not in the Parent table. (Child table accepts null
values)
	2.The data in the parent table cannot be deleted without deleting the data in the child table.
	3.Parent table cannot be deleted without deleting the Child table.
*/
--Create a first table
CREATE TABLE hospitals(
hospital_name varchar(50),
hospital_address varchar(30),
hospital_code int,
	
	CONSTRAINT hn_pk PRIMARY KEY (hospital_name)
);

--Insert data into the table 
INSERT INTO hospitals VALUES('St. Elizabeths Hospital','Washington, D.C.','0246');
INSERT INTO hospitals VALUES('Memphis Mental Health Institute','Tennessee','0236');
INSERT INTO hospitals VALUES('Coastal Carolina Hospital','South Carolina','0216');
INSERT INTO hospitals VALUES('Mary Lanning Memorial Hospital','Nebraska','0242');
INSERT INTO hospitals VALUES('Central State Hospital','Kentucky','0271');
INSERT INTO hospitals VALUES('Fremont Hospital','California','0262');
INSERT INTO hospitals VALUES('Broward Health Medical Center','Florida','0294');

--Create a second table
CREATE TABLE doctors(
duty_station varchar(50),
doctor_name varchar(30),
diploma_no int,
doctor_branch varchar(30),
	
	CONSTRAINT hn_ds_fk FOREIGN KEY (duty_station) REFERENCES hospitals(hospital_name)
);
INSERT INTO doctors VALUES('St. Elizabeths Hospital','Tom Cruise','125456','psychiatry');
INSERT INTO doctors VALUES('Coastal Carolina Hospital','Morgan Freeman','123765','pediatrics');
INSERT INTO doctors VALUES('Central State Hospital','Angelina Jolie','121852','internal medicine');
INSERT INTO doctors VALUES('Memphis Mental Health Institute','Julia Roberts','183369','dermatology');
INSERT INTO doctors VALUES('St. Elizabeths Hospital','Antony Banderas','121147','anesthesia');
INSERT INTO doctors VALUES('Mary Lanning Memorial Hospital','Tim Roberts','173568','orthopedics');
INSERT INTO doctors VALUES('St. Elizabeths Hospital','Al Pacino','123547','anesthesia');
INSERT INTO doctors VALUES('Coastal Carolina Hospital','Denzel Washington','113568','internal medicine');
INSERT INTO doctors VALUES('Central State Hospital','Jeneffer Lopez','120147','pediatrics');
INSERT INTO doctors VALUES('Fremont Hospital','Antony Hopkins','193568','orthopedics');

SELECT * FROM doctors;

--1. Enter data with duty_station 'Coastal Carolina Hospital' into the doctors table.
INSERT INTO doctors VALUES ('Coastal Carolina Hospital', 'Addy Morphy', 143211, 'cardiovascular');
--The data above can be inserted because Parent Table(hospitals) has this hospital_name.

--2. Enter data with duty_station 'Covington County Hospital' into the doctors table.
INSERT INTO doctors VALUES ('Covington County Hospital', 'Harrison Ford',183327,'internal medicine');
--The data above cannot be inserted because Parent Table(hospitals) hasn't got this hospital_name.

--3.  Enter data with duty_station 'null' into the doctors table.
INSERT INTO doctors VALUES (null, 'Tom Hanks',126633,'neurology');
--Child table accepts null values.

--4. Delete the data with hospital_name 'St. Elizabeths Hospital' in the hospitals table.
DELETE FROM hospitals WHERE hospital_name='St. Elizabeths Hospital';
--The data in the Parent table cannot be deleted without deleting the data in the Child table.

--5. Delete the data with duty_station 'St. Elizabeths Hospital' in the doctors table.
DELETE FROM doctors WHERE duty_station='St. Elizabeths Hospital';
--The data in the Child table can be deleted

--6. Delete the data with hospital_name 'St. Elizabeths Hospital' in the hospitals table.
DELETE FROM hospitals WHERE hospital_name='St. Elizabeths Hospital';
--Since there is no 'St. Elizabeths Hospital' left in the Child table, we can delete the 'St. Elizabeths Hospital' data in the hospitals table.

--7. Delete hospitals table
DROP TABLE hospitals;
--Parent table cannot be deleted without deleting the Child table.

--8. Delete doctors table
DROP TABLE doctors;
--Child table can be deleted

--9. Delete hospitals table
DROP TABLE hospitals;
--Parent table can be deleted since the Child table is deleted.