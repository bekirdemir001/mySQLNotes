/*
	INTERSECT: Returns the intersection value of two query expressions.
	EXCEPT: Returns values that are in the first query but not in the second query.
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
INSERT INTO movies VALUES ('1004', 'The Godfather Part II', 9.0, '1974', 13.00, 93.00);
INSERT INTO movies VALUES ('1005', '12 Angry Men', 9.0, '1957', 0.34, 2.00);
INSERT INTO movies VALUES ('1006', 'Schindler s List', 8.9, '1993', 22.00, 322.20);
INSERT INTO movies VALUES ('1007', 'The Lord of the Rings: The Return of the King', 8.9, '2003', 94.00, 1146.00);
INSERT INTO movies VALUES ('1008', 'Pulp Fiction', 8.8, '1994', 8.50, 213.90);
INSERT INTO movies VALUES ('1009', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, '2001', 93.00, 898.20);
INSERT INTO movies VALUES ('1010', 'The Good, the Bad and the Ugly', 8.8, '1966', 1.20, 38.90);

SELECT * FROM movies;

--1. List the intersection of 
--the title of movies with imdb_rating less than 9 and 
--the title of movies with year_released after 1990.
SELECT title FROM movies WHERE imdb_rating<9
INTERSECT
SELECT title FROM movies WHERE year_released>'1990';

--2. List the intersection of 
--the title of movies with imdb_rating equal to greater than 9 and 
--the title of movies with budget greater than 10.
SELECT title FROM movies WHERE imdb_rating>=9
INTERSECT
SELECT title FROM movies WHERE budget>10.

--3. List the intersection of 
--the title of movies with imdb_rating equal to greater than 9 and 
--the title of movies with box_office greater than 100.
SELECT title FROM movies WHERE imdb_rating>=9
INTERSECT
SELECT title FROM movies WHERE box_office>100;

--4. List the intersection of 
--the title of movies with year_released before 1990 and 
--the title of movies with budget smaller than 10.
SELECT title FROM movies WHERE year_released<'1990-01-01'
INTERSECT
SELECT title FROM movies WHERE budget<10;

--5. List the intersection of 
--the title of movies with year_released after 1990 and 
--the title of movies with box_office greater than 100.
SELECT title FROM movies WHERE year_released>'1990-01-01'
INTERSECT
SELECT title FROM movies WHERE box_office>100;

--6. List the intersection of 
--the title of movies with budget greater than 75 and 
--the title of movies with box_office smaller than 100.
SELECT title FROM movies WHERE budget>75
INTERSECT
SELECT title FROM movies WHERE box_office<100;

--7. List data which are existed in first query but not in second query;
--the title of movies with imdb_rating less than 9 and 
--the title of movies with year_released after 1990.
SELECT title FROM movies WHERE imdb_rating<9
EXCEPT
SELECT title FROM movies WHERE year_released>'1990';

--8. List data which are existed in first query but not in second query;
--the title of movies with imdb_rating equal to greater than 9 and 
--the title of movies with budget greater than 10.
SELECT title FROM movies WHERE imdb_rating>=9
EXCEPT
SELECT title FROM movies WHERE budget>10.

--9. List data which are existed in first query but not in second query;
--the title of movies with imdb_rating equal to greater than 9 and 
--the title of movies with box_office greater than 100.
SELECT title FROM movies WHERE imdb_rating>=9
EXCEPT
SELECT title FROM movies WHERE box_office>100;

--10. List data which are existed in first query but not in second query;
--the title of movies with year_released before 1990 and 
--the title of movies with budget smaller than 10.
SELECT title FROM movies WHERE year_released<'1990-01-01'
EXCEPT
SELECT title FROM movies WHERE budget<10;

--11. List data which are existed in first query but not in second query;
--the title of movies with year_released after 1990 and 
--the title of movies with box_office greater than 100.
SELECT title FROM movies WHERE year_released>'1990-01-01'
EXCEPT
SELECT title FROM movies WHERE box_office>100;

--12. List data which are existed in first query but not in second query;
--the title of movies with budget greater than 75 and 
--the title of movies with box_office smaller than 100.
SELECT title FROM movies WHERE budget>75
EXCEPT
SELECT title FROM movies WHERE box_office<100;

--13. Delete the table
DROP TABLE movies;