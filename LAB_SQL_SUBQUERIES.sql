-- SQL JOINS LAB
-- task: number of copies of film 'Hunchback Impossible'
SELECT COUNT(*) AS number_of_copies
FROM inventory i
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'Hunchback Impossible';

-- solution: 6

-- task: all films whose length is longer than avereage of all films
SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- solution: see query above

-- task: all actor who appear in film 'Alone Trip' 
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Alone Trip';

-- solution: see query above

-- #BONUS TASKS
-- task: all movies / films categorized as family films
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Family';

-- task: name and emails from canadian customers using subqueries and joins
-- using joins
SELECT cu.first_name, cu.last_name, cu.email
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Canada';

-- using subquery
SELECT cu.first_name, cu.last_name, cu.email
FROM customer cu
WHERE cu.address_id IN (
  SELECT a.address_id
  FROM address a
  WHERE a.city_id IN (
    SELECT ci.city_id
    FROM city ci
    WHERE ci.country_id IN (
      SELECT co.country_id
      FROM country co
      WHERE co.country = 'Canada'
    )
  )
);


-- solution: 5 customers: see query above

-- task: film with the most prolific actor:
SELECT actor_id
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;

 -- DIFFICULT ONE !!!!!
 
 -- task: film rented by tzhe most profitable customer:
 SELECT customer_id
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;

-- then films rented by this customer: 
SELECT DISTINCT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.customer_id = 526;

-- solution: see queries above

