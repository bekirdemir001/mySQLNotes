/*
	TRANSACTION 
	Protects data from deletion. If we want to protect the data we added to the table from deletion, TRANSACTION operation is used.
		Begin: Used to start the TRANSACTION process.
		Savepoint: Saves data against deletion.
		Rollback: Brings back deleted data.
		Commit: Used to end the TRANSACTION process.
*/

--Create a table
CREATE TABLE documents(
	id INT,
	importance_level VARCHAR(40),
	subject VARCHAR(100)
);

--Start Transaction
BEGIN;

--Insert data into the table with Transaction
INSERT INTO documents VALUES (101, 'Top Secret', 'Health');
INSERT INTO documents VALUES (102, 'Top Secret', 'Finance');
INSERT INTO documents VALUES (103, 'Top Secret', 'Population');
INSERT INTO documents VALUES (104, 'Top Secret', 'Graduation');

--Save data
SAVEPOINT x;

--Insert extra data into the table without Transaction
INSERT INTO documents VALUES (104, 'Low', 'Electricity Bill');
INSERT INTO documents VALUES (105, 'Low', 'Water bill');

SELECT * FROM documents;

--Delete all data
DELETE FROM documents;

--Retrieve data
ROLLBACK TO x;

SELECT * FROM documents;

--Finish Transaction
COMMIT;

SELECT * FROM documents;

--Delete all data
DELETE FROM documents;

--Delete the table
DROP TABLE documents;