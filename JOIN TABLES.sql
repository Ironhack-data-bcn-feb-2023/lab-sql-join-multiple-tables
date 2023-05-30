use sakila;
-- 1 -- 
SELECT store_id, city, country
from store
JOIN address ON address.address_id = store.address_id
JOIN city ON city.city_id = address.city_id
JOIN country ON country.country_id = city.country_id;

-- 2 --
SELECT store.store_id, sum(payment.amount) as 'PROFIT'
FROM payment
JOIN customer ON customer.customer_id = payment.customer_id
JOIN store ON store.store_id = customer.store_id
GROUP BY store.store_id;

-- 3 --
SELECT AVG(film.length) AS 'average running', category.name AS 'category'
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

-- 4 --
SELECT category.name AS 'category', AVG(length) AS 'LONGEST CATEGORY'
FROM category
JOIN film_category ON film_category.category_id = category.category_id
JOIN film ON film.film_id = film_category.film_id
GROUP BY 1
ORDER BY 2 DESC;

-- 5 --
SELECT f.title AS 'Movie name', COUNT(rental_id) AS 'times rented'
FROM film as f
JOIN inventory ON inventory.film_id = f.film_id
JOIN rental ON rental.inventory_id = inventory.inventory_id
GROUP BY 1
ORDER BY 2 DESC;

-- 6 --
SELECT c.name, SUM(amount) AS 'Gross revenue'
FROM category as c
JOIN film_category ON film_category.category_id = c.category_id
JOIN inventory ON inventory.film_id = film_category.film_id
JOIN staff ON staff.store_id = inventory.store_id
JOIN payment ON payment.staff_id = staff.staff_id
GROUP BY 1
ORDER BY 2
LIMIT 5;

--  7 --
SELECT f.title, store.store_id
FROM film AS f
JOIN inventory ON inventory.film_id = f.film_id
JOIN store ON store.store_id = inventory.store_id
	HAVING f.title = 'Academy Dinosaur'
    AND store.store_id = '1';
-- 	GROUP BY 1;-- 



