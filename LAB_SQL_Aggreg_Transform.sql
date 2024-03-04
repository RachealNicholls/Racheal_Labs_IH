-- task: determine shortest and longest movie duration
SELECT MIN(length) AS min_duration, MAX(length) AS max_duration FROM film;
-- solution: min is 46; max is 185
-- task: average movie duration in expressed in hours and minutes
SELECT 
  FLOOR(AVG(length) / 60) AS average_hours, 
  ROUND(AVG(length) % 60) AS average_minutes 
FROM film;
-- solution: 1hr 55 minutes is the average duration

-- task : calculating the number of days the company has been in operation

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days FROM rental;
-- solution 266 days
-- task : retrieve rentalm informationa and add 2 extra columns to show month and weekday of rental

SELECT 
  rental_id, 
  rental_date, 
  customer_id, 
  inventory_id, 
  return_date, 
  staff_id, 
  MONTH(rental_date) AS rental_month, 
  DAYNAME(rental_date) AS rental_weekday 
FROM rental 
LIMIT 20;

-- solution: done . see query

-- task : retrieve rental information and add extra column called day_type using conditional expression
SELECT 
  rental_id, 
  rental_date, 
  customer_id, 
  inventory_id, 
  return_date, 
  staff_id, 
  CASE 
    WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' 
    ELSE 'workday' 
  END AS DAY_TYPE 
FROM rental;

-- solution: see query

-- task: customers being able to access information about movie collection. replacing all null values ( if any) with 'not available'

SELECT 
  title, 
  COALESCE(CAST(rental_duration AS CHAR), 'Not Available') AS rental_duration
FROM 
  film
ORDER BY 
  title ASC;

-- solution: see query above

-- task: retrieving first and last concatenated names of customers along with first 3 charactes of email address in ascending order

SELECT 
  CONCAT(first_name, ' ', last_name) AS full_name,
  LEFT(email, 3) AS email_prefix
FROM 
  customer
ORDER BY 
  last_name ASC;

-- solution: see query above

-- CHALLENGE 2
-- task : total number of films ever released
SELECT COUNT(*) AS total_films FROM film;

-- solution: 1000 films so far released

-- task: number of film for each rating
SELECT rating, COUNT(*) AS number_of_films 
FROM film 
GROUP BY rating;

-- solution: G: 178; PF: 194; R: 195; NC-17: 210 ; PG-13: 223

-- task : number of film ratins in descending order

SELECT rating, COUNT(*) AS number_of_films 
FROM film 
GROUP BY rating 
ORDER BY number_of_films DESC;

-- solution: see query above

-- task: using 'film' table, find MEAN film duration in descending order
SELECT rating, ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;
-- solution: pg-13 120.44, R 118.66, NC-17  113.23, PG   112.01, G  111,05

-- task:identifying which ratings have a MEAN duration of over 2 hours
SELECT rating, ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING AVG(length) > 120
ORDER BY mean_duration DESC;
 -- solution 120.44
 
 


