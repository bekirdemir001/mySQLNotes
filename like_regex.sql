/*
	LIKE: It means like. For example; LIKE command is used for operations such as list data starting with 'A', list data ending with 'n', 
	list data with second letter 'e'.

	LIKE allows us to use certain patterns when querying.
	
	Pattern: % --> Specifies zero or more characters.
			 _ --> Specifies a single character.

	Syntax: SELECT * FROM [table_name] WHERE [column_name] LIKE pattern
	
	Note1: If we want to list regardless of uppercase or lowercase letters, we use "ILIKE".
	Note2: If we want to list data that don't contain any characters, we use "NOT LIKE".
*/
/*
	Regular Expressions:
	REGEXP_LIKE: It means like. However, it can be used for more complex querying. It is indicated by the '~' sign.

	Syntax: SELECT * FROM [table_name] WHERE [column_name] ~ pattern;
	
	Note1: If we want to list regardless of uppercase or lowercase, we use "~*".
	Note2: The ^ sign is used to mean beginning.
	Note3: The $ sign is used to mean ending.
	Note4: The ! sign is used to mean not to exist.
*/

--Create a table
CREATE TABLE movies(
	id CHAR(4),
	title VARCHAR(50),
	imdb_rating REAL,
	year_released CHAR(4),
	budget REAL,
	box_office REAL
);

--Insert data into the first table
INSERT INTO movies VALUES ('1001', 'The Shawshank Redemption', 9.2, '1994', 25.00, 73.30);
INSERT INTO movies VALUES ('1002', 'The Godfather', 9.2, '1972', 7.20, 291.00);
INSERT INTO movies VALUES ('1003', 'The Dark Knight', 9.0, '2008', 185.00, 1006.00);
INSERT INTO movies VALUES ('1004', 'the Godfather Part II', 9.0, '1974', 13.00, 93.00);
INSERT INTO movies VALUES ('1005', '12 Angry Men', 9.0, '1957', 0.34, 2.00);
INSERT INTO movies VALUES ('1006', 'schindler s List', 8.9, '1993', 22.00, 322.20);
INSERT INTO movies VALUES ('1007', 'The Lord of the Rings: The Return of the King', 8.9, '2003', 94.00, 1146.00);
INSERT INTO movies VALUES ('1008', 'Pulp Fiction', 8.8, '1994', 8.50, 213.90);
INSERT INTO movies VALUES ('1009', 'the Lord of the Rings: The Fellowship of the Ring', 8.8, '2001', 93.00, 898.20);
INSERT INTO movies VALUES ('1010', 'The Good, the Bad and the Ugly', 8.8, '1966', 1.20, 38.90);

SELECT * FROM movies;

--1. List all information of movies whose titles start with the letter 'T'.
SELECT * FROM movies WHERE title LIKE 'T%';

--2. List all information of movies whose titles start with the letter 't'.
SELECT * FROM movies WHERE title LIKE 't%';

--3. List all information of movies whose titles start with the letter 't', regardless of uppercase or lowercase letters.
SELECT * FROM movies WHERE title ILIKE 'T%';

--4. List all information of movies whose titles start with the letter 'n'.
SELECT * FROM movies WHERE title LIKE '%n';

--5. List all information of movies whose titles contain 'er'.
SELECT * FROM movies WHERE title LIKE '%er%';

--6. List all information of movies whose titles have 'h' as the second letter.
SELECT * FROM movies WHERE title LIKE '_h%';

--6. List all information of movies whose titles have 'h' as the third letter.
SELECT * FROM movies WHERE title LIKE '__h%';

--7. List all information of movies whose titles have at least 4 letters as the first letter 'T'.
SELECT * FROM movies WHERE title LIKE 'T___%';

--8. List all information of movies with at least 4 letters in their title, with the 2nd letter being 'h' and the 5th letter being 'G'.
SELECT * FROM movies WHERE title LIKE '_h__G%';

--9. List all information of movies whose titles do not contain the letter 'i'.
SELECT * FROM movies WHERE title NOT LIKE '%i%';

--10. Delete the table
DROP TABLE movies;
----------------------------------------------------------------------------------------------------------------------------------------

--Regular Expressions

--Create a table
CREATE TABLE artists(
	id CHAR(4),
	first_name VARCHAR(30),
	last_name VARCHAR(30)	
);

--Insert data into the table
INSERT INTO artists VALUES (1001, 'Tom', 'Hanks');
INSERT INTO artists VALUES (1002, 'Tim', 'Roberts');
INSERT INTO artists VALUES (1003, 'Antony', 'Hopkins');
INSERT INTO artists VALUES (1004, 'Angelina', 'Jolie');
INSERT INTO artists VALUES (1005, 'Tom', 'Cruise');
INSERT INTO artists VALUES (1006, 'Morgan', 'Freeman');
INSERT INTO artists VALUES (1007, 'Julie', 'Roberts');
INSERT INTO artists VALUES (1008, 'Scarlett', 'Jhonson');
INSERT INTO artists VALUES (1009, 'Will', 'Smith');

--1. List all information of artists whose first_names start with 'T' and end with 'm' and the second letter of titles 'o' or 'i'.
SELECT * FROM artists WHERE first_name ~ 'T[oi]m';

--2. List all information about 3-letter first_names, the first letter of which is 't', the last letter of which is 'm', 
--and the second letter of which is 'a' or 'i', regardless of uppercase or lowercase letters.
SELECT * FROM artists WHERE first_name ~* 't[oi]M';

--3. List all information about 3-letter words whose first letter is 'T', last letter is 'm' and the 2nd letter is between 'a' and 'k'.
SELECT * FROM artists WHERE first_name ~ 'T[a-k]m';

--4. List all information of the words whose first letter starts with 'T' or 'A'.
SELECT * FROM artists WHERE first_name ~ '^[TA]';

--5. List all information about the words whose last letter ends with 'm' or 'a'.
SELECT * FROM artists WHERE first_name ~ '[ma]$';

--6. List all the information about the words whose last letter does not end with 'm' or 'a'.
SELECT * FROM artists WHERE first_name !~ '[ma]$';

--7. Delete the table
DROP TABLE artists;