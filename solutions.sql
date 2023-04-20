USE sakila;
-- 1. Write a query to display for each store its store ID, city, and country.
SELECT store.store_id, city.city, country.country FROM store, city, country
WHERE store.store_id = city.city_id
AND city.country_id = country.country_id
GROUP BY store.store_id;
-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT store.store_id, SUM(payment.amount) AS `payment amount` FROM store, payment
WHERE store.manager_staff_id = payment.staff_id
GROUP BY store.store_id;
-- 3. What is the average running time of films by category?
SELECT category.name, AVG(film.length) AS `average running time` FROM category, film, film_category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
GROUP BY category.name;
-- 4. Which film categories are longest?
SELECT category.name, AVG(film.length) AS `TOP 10 average running time` FROM category, film, film_category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY `TOP 10 average running time` DESC;
-- 5. Display the most frequently rented movies in descending order.
SELECT film.title, COUNT(rental.rental_id) AS `rental count` FROM film, rental, inventory
WHERE rental.inventory_id = inventory.inventory_id
AND inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY `rental count` DESC;
-- 6. List the top five genres in gross revenue in descending order.
SELECT category.name, SUM(payment.amount) AS `payment amount` FROM category, film, film_category, payment, rental, inventory
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
AND payment.rental_id = rental.rental_id
AND rental.inventory_id = inventory.inventory_id
AND inventory.film_id = film.film_id
GROUP BY category.name
ORDER BY `payment amount` DESC;
-- 7. Is "Academy Dinosaur" available for rent from Store 1?
SELECT film.title, SUM(inventory.film_id) AS `inventory`, inventory.store_id FROM film, inventory
WHERE film.film_id = inventory.film_id
AND film.title = "Academy Dinosaur"
GROUP BY inventory.store_id
ORDER BY `inventory` DESC