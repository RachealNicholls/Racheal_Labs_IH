-- LAB_SQL_BASIC
-- task : displaying all tables available
SHOW TABLES FROM sakila;
-- solution: see query above

-- task : rewtrieve dasta from table: actor , film, customers
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;
SELECT * FROM sakila.customer;

-- solution : see query above

-- task: all film titles from table 'film'
SELECT title FROM sakila.film;

 -- solution: see query above
 
 -- task: List of languages used in films, with the column aliased as language from the language table
 SELECT DISTINCT name AS language FROM sakila.language;
 
 -- solution: English, Italian, Japanese, Mandarin, French, German
 
 -- task: First name of all staff
 SELECT first_name FROM sakila.staff;

-- solution: Mike and Jon

-- task: film unique release years
SELECT DISTINCT release_year FROM sakila.film;

-- solution 2006

-- task: number of stores that the company has
SELECT COUNT(*) AS number_of_stores FROM store;

 -- solution 2 
 
 -- task: number of employees
 SELECT COUNT(*) AS number_of_employees FROM staff;

-- solution: 2

-- task: films available for rental and number rented out so far
SELECT COUNT(*) AS total_films FROM film;
SELECT COUNT(DISTINCT inventory_id) AS films_rented FROM rental;

-- task : number of distinct last names of actors in DB
SELECT COUNT(DISTINCT last_name) AS distinct_last_names FROM actor;

-- solution: 121

-- task :retrieve the 10 longest films
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

-- solution: see query above

 -- task: all actors with first name 'Scarlett'
 SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'SCARLETT';

-- solution : 2 actors scarlett Damon and Scarlett Bening

-- BONUS ASSIGNEMT
-- task: retrieveing all movies with 'ARMAGEDDON ' in their titel
SELECT title, length
FROM film
WHERE title LIKE '%ARMAGEDDON%'
  AND length > 100;

-- solution : 4 films: Ladybugs Armageddon, Metal Armageddon, Stagecoach Armageddon, Steers Armageddon

-- task : number of films that include  Behind the Scenes content

SELECT COUNT(*) AS films_with_behind_the_scenes
FROM film
WHERE special_features LIKE '%Behind the Scenes%';

-- solution: 538 Films are with Behind the Scenes Contents




