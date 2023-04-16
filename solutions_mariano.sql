-- Answer 1:
USE sakila;
SELECT 
	s.store_id as store_id,
    c.city as city,
    co.country as country
FROM store s
	LEFT JOIN address a
	ON s.address_id = a.address_id
	LEFT JOIN city c
	ON a.city_id = c.city_id
    LEFT JOIN country co
	ON co.country_id = c.country_id
WHERE s.store_id IS NOT NULL;

-- Answer 2:
USE sakila;
SELECT 
	s.store_id as store_id,
    sum(p.amount) as total_paid
FROM store s
	LEFT JOIN customer c
	ON s.store_id = c.store_id
	LEFT JOIN payment p
	ON p.customer_id = c.customer_id
WHERE s.store_id IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- Answer 3:
USE sakila;
SELECT 
	c.name as category,
    avg(f.length) as average_duration
FROM film f
	LEFT JOIN film_category fc
	ON f.film_id = fc.film_id
	LEFT JOIN category c
	ON fc.category_id = c.category_id
WHERE c.name IS NOT NULL
GROUP BY 1
ORDER BY 2;

-- Answer 4:
USE sakila;
SELECT 
	c.name as category,
    max(f.length) as max_duration
FROM film f
	LEFT JOIN film_category fc
	ON f.film_id = fc.film_id
	LEFT JOIN category c
	ON fc.category_id = c.category_id
WHERE c.name IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;

-- Answer 5:
USE sakila;
SELECT 
	f.title as film,
    COUNT(r.rental_id) as num_rent
FROM film f
	LEFT JOIN inventory i
	ON f.film_id = i.film_id
	LEFT JOIN rental r
	ON r.inventory_id = i.inventory_id
WHERE r.rental_id IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;

-- Answer 6:
SELECT *
FROM sakila.sales_by_film_category
ORDER BY 2 DESC
LIMIT 5;

-- Answer 7: Yes, it is available.-
USE sakila;
SELECT 
	f.title as film,
    s.store_id as store
FROM film f
	LEFT JOIN inventory i
	ON f.film_id = i.film_id
	LEFT JOIN store s
	ON s.store_id = i.store_id
WHERE title = 'Academy Dinosaur'
GROUP BY 1
ORDER BY 2 DESC;