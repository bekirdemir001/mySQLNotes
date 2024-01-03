/*
	ON DELETE CASCADE: Thanks to this command;
	1. We can directly delete the data in the Parent table. 
	2. We can also delete the Parent table directly. (We must type "CASCADE" at the end of query line)
	3. To do this, it is sufficient to write the ON DELETE CASCADE command at the end of the FOREIGN KEY line.
	4. The data in the Parent table is deleted. However, in this case, the data in the Child table is also deleted.
*/
/*
	If ON DELETE CASCADE command is not written in FOREIGN KEYs;
	1) When trying to delete the Parent table without deleting the Child table, pgAdmin gives an error. In other words, the Parent table 
	cannot be deleted without deleting the Child table.
	2) When trying to delete the data in the parent table without deleting the data in the child table, pgAdmin gives an error. In other 
	words, the data in the parent table cannot be deleted without deleting the data in the child table.

	If ON DELETE CASCADE command is written in FOREIGN KEYs;
	1) Parent table can be deleted without deleting the Child table. pgAdmin does not give an error.
	2) When trying to delete the data in the parent table without deleting the data in the child table, pgAdmin does not give an error. 
	The data in the Parent table is deleted. But in this case, the data in the Child table is also deleted.
*/

--Create a parent table
CREATE TABLE us_states (
name varchar(30),
abbreviation char(2),
	CONSTRAINT sn_pk PRIMARY KEY (name),
	CONSTRAINT abb_unq UNIQUE (abbreviation)
);

--Insert data into the table
INSERT INTO us_states VALUES ('Alabama', 'AL');
INSERT INTO us_states VALUES ('Alaska', 'AK');
INSERT INTO us_states VALUES ('Arizona', 'AZ');
INSERT INTO us_states VALUES ('Arkansas', 'AR');
INSERT INTO us_states VALUES ('California', 'CA');
INSERT INTO us_states VALUES ('Colorado', 'CO');
INSERT INTO us_states VALUES ('Connecticut', 'CT');
INSERT INTO us_states VALUES ('Delaware', 'DE');
INSERT INTO us_states VALUES ('Florida', 'FL');

--Create a child table
CREATE TABLE us_population(
state_name varchar(30),
capital varchar(30),
population int,
	CONSTRAINT sn_fk FOREIGN KEY (state_name) REFERENCES us_states (name) ON DELETE CASCADE
);

--Insert data into the table
INSERT INTO us_population VALUES ('Alabama', 'Montgomery', 5108468);
INSERT INTO us_population VALUES ('Alaska', 'Juneau', 733406);
INSERT INTO us_population VALUES ('Arizona', 'Phoenix', 7431344);
INSERT INTO us_population VALUES ('Arkansas', 'Little Rock', 3067732);
INSERT INTO us_population VALUES ('California', 'Sacramento', 38965193);
INSERT INTO us_population VALUES ('Colorado', 'Denver', 5877610);
INSERT INTO us_population VALUES ('Connecticut', 'Hartford', 3617176);
INSERT INTO us_population VALUES ('Delaware', 'Dover', 1031890);
INSERT INTO us_population VALUES ('Florida', 'Tallahassee', 22610726);

SELECT * FROM us_states;
--1. Delete first row in the parent table
DELETE FROM us_states WHERE abbreviation='AL';

--2. Delete all row in the parent table
DELETE FROM us_states;

--3. Delete the parent table
DROP TABLE us_states CASCADE;

--4. Delete the child table
DROP TABLE us_population;