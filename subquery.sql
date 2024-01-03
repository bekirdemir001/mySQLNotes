/*
	SUBQUERY: 
	It is the query that runs within the query.
*/

--Create the first table
CREATE TABLE materials(
	supplier_tax_no int,
	id int,
	name varchar(30),
	costumer_name varchar(30)
);

--Insert data into the first table
INSERT INTO materials VALUES (201, 1001, 'Laptop', 'Morgan Freeman');
INSERT INTO materials VALUES (203, 1001, 'Mobile Phone', 'Angelina Jolie');
INSERT INTO materials VALUES (204, 1001, 'TV', 'Julia Roberts');
INSERT INTO materials VALUES (201, 1001, 'Laptop', 'Tom Hanks');
INSERT INTO materials VALUES (202, 1001, 'Mobile Phone', 'Will Smith');
INSERT INTO materials VALUES (204, 1001, 'TV', 'Antony Hopkins');
INSERT INTO materials VALUES (202, 1001, 'Mobile Phone', 'Bruce Wills');

--Create the second table
CREATE TABLE wholesaler(
	tax_no int,
	company_name varchar(30),
	contact_name varchar(30)
);

--Insert data into second table
INSERT INTO wholesaler VALUES (201,'IBM','Emma Watson');
INSERT INTO wholesaler VALUES (202,'Huawei','Leonardo DiCaprio');
INSERT INTO wholesaler VALUES (203,'Erikson','Scarlett Johansson');
INSERT INTO wholesaler VALUES (204,'Apple','Tom Cruise');

SELECT * FROM materials;
SELECT * FROM wholesaler;

--1. Update the material name of the customer_name 'Tom Hanks' in the materials table with the company_name whose contact_name is 
--'Tom Cruise' in the wholesalers table.
UPDATE materials SET name=(SELECT company_name FROM wholesaler WHERE contact_name='Tom Cruise') WHERE costumer_name='Tom Hanks';

--2. Update the customer_names whose name is 'Mobile Phone' in the materials table with the contact_name whose company_name is
--'Erikson' in the wholesaler table.
UPDATE materials SET costumer_name=(SELECT contact_name FROM wholesaler WHERE company_name='Erikson') WHERE name='Mobile Phone';

--3. Update the contact_name whose company_name is 'IBM' in the wholesaler table with the costumer_name whose material name is
--'Laptop' in the materials table.
UPDATE wholesaler SET contact_name=(SELECT costumer_name FROM materials WHERE name='Laptop') WHERE company_name='IBM';

--4. Delete all tables
DROP TABLE materials, wholesaler;