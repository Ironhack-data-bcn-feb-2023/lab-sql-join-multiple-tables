USE sakila;
-- Query 1:
SELECT store_id, city, country from store
	LEFT JOIN address ON store.address_id = address.address_id
    LEFT JOIN city ON address.city_id = city.city_id
    LEFT JOIN country ON city.country_id = country.country_id;

-- Query 2: 
SELECT store_id, SUM(amount) FROM payment
	LEFT JOIN staff ON payment.staff_id = staff.staff_id
    GROUP BY store_id;

-- Query 3: 
SELECT avg(length), name FROM film
	LEFT JOIN film_category ON film.film_id = film_category.film_id
    LEFT JOIN category ON film_category.category_id = category.category_id
    GROUP BY name;

-- Query 4: 
SELECT avg(length) AS AVG_length, name FROM film
	LEFT JOIN film_category ON film.film_id = film_category.film_id
    LEFT JOIN category ON film_category.category_id = category.category_id
    GROUP BY name
    ORDER BY AVG_length DESC;
    
-- Query 5: 
SELECT film.film_id, title, COUNT(rental_id) AS FREQUENCY FROM film
	LEFT JOIN inventory ON film.film_id = inventory.film_id
    LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film_id
ORDER BY FREQUENCY DESC;

-- Query 6: 
SELECT category.name, SUM(payment.amount) AS gross_revenue
FROM category
	LEFT JOIN film_category ON category.category_id = film_category.category_id
	LEFT JOIN inventory ON film_category.film_id = inventory.film_id
	LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
	LEFT JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY category.name
ORDER BY gross_revenue DESC
LIMIT 5;


-- Query 7: 
SELECT title, inventory_id, store_id FROM film
	LEFT JOIN inventory ON film.film_id = inventory.film_id 
    WHERE title = 'Academy Dinosaur' AND store_id = 1;
    


