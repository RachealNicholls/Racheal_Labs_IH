-- TEMPS_TABLES_VIEWS_CTE

-- task: creating a view showing for rental information of customers
CREATE VIEW customer_rental_summary AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

SELECT * FROM customer_rental_summary;



-- task : creating a temp table showing total amount paid by each customer
CREATE TEMPORARY TABLE customer_payment_summary AS
SELECT 
    crs.customer_id,
    crs.customer_name,
    crs.email,
    crs.rental_count,
    SUM(p.amount) AS total_paid
FROM customer_rental_summary crs
JOIN payment p ON crs.customer_id = p.customer_id
GROUP BY crs.customer_id;

SELECT * FROM customer_payment_summary;

-- task: creationg a CTE which joins above table 1 and 2 together
WITH Customer_Summary AS (
  SELECT 
    crs.customer_name,
    crs.email,
    crs.rental_count,
    cps.total_paid
  FROM customer_rental_summary crs
  JOIN customer_payment_summary cps ON crs.customer_id = cps.customer_id
)
SELECT * FROM Customer_Summary;
 
 -- task: create the query to generate the final customer summary report,
 -- which should include: customer name, email, 
 -- rental_count, total_paid and average_payment_per_rental
 
 WITH Customer_Summary AS (
  SELECT 
    crs.customer_name,
    crs.email,
    crs.rental_count,
    cps.total_paid
  FROM customer_rental_summary crs
  JOIN customer_payment_summary cps ON crs.customer_id = cps.customer_id
)
SELECT 
  customer_name,
  email,
  rental_count,
  total_paid,
  CASE 
    WHEN rental_count > 0 THEN ROUND(total_paid / rental_count, 2)
    ELSE 0
  END AS average_payment_per_rental
FROM Customer_Summary;

-- DIFFICULT !!! 