/*
	Composite Primary Key: 
	If a column alone does not have the feature of being a Primary Key, a Primary Key can be created by
combining two columns to obtain this feature. This situation is called Composite Key.
*/

--Create a table
CREATE TABLE vegetables (
vegetable_type varchar(30),
production_center varchar(30),
production_quantity int, 
	
	CONSTRAINT vt_pc_cpk PRIMARY KEY (vegetable_type, production_center) 
);

--Insert data into the table
INSERT INTO vegetables VALUES ('Cucumber', 'Italy', 245000);
INSERT INTO vegetables VALUES ('Cucumber', 'USA', 985000);
INSERT INTO vegetables VALUES ('Tomato', 'Italy', 135000);

INSERT INTO vegetables VALUES ('Cucumber', 'Italy', 985000);	--Gives an error because of Composite Primary Key.

/*
	The convenience provided by specifying Constraints under the column names;
		1. We can determine the Constraint name ourselves.
		2. It allows us to make a Composite Primary Key. 
		   That is, we can create a Primary Key from the combination of two columns.
*/