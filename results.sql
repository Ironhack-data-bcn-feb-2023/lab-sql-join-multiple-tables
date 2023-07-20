USE SAKILA;

-- 1. Write a query to display for each store its store ID, city, and country.
SELECT store.store_id, city.city, country.country
FROM store
JOIN address on store.address_id = address.address_id
JOIN city on address.city_id = city.city_id
JOIN country on city.country_id = country.country_id;


-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT store.store_id, SUM(payment.amount) as total_amount
FROM store
JOIN staff on store.store_id = staff.store_id
JOIN payment on staff.staff_id = payment.staff_id
GROUP BY store.store_id;


-- 3. What is the average running time of films by category?
SELECT category.name as Category, AVG(film.length) as Average_minutes
FROM category
JOIN film_category on category.category_id = film_category.category_id
JOIN film on film_category.film_id = film.film_id
GROUP BY category.name;


-- 4. Which film categories are longest?
SELECT category.name as Category, AVG(film.length) as Average_minutes
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name
ORDER BY Average_minutes DESC;


-- 5. Display the most frequently rented movies in descending order.
SELECT film.title, COUNT(rental.rental_id) as Num_rentals
FROM film
JOIN inventory on film.film_id = inventory.film_id
JOIN rental on inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY Num_rentals DESC;


-- 6. List the top five genres in gross revenue in descending order.
SELECT category.name as Category, SUM(payment.amount) as total_amount
FROM category
JOIN film_category on category.category_id = film_category.category_id
JOIN film on film_category.film_id = film.film_id
JOIN inventory on film.film_id = inventory.film_id
JOIN store on inventory.store_id = store.store_id
JOIN staff on store.store_id = staff.store_id
JOIN payment on staff.staff_id = payment.staff_id
GROUP BY Category 
ORDER BY total_amount DESC
LIMIT 5;
-- no es correcta --

-- 7. Is "Academy Dinosaur" available for rent from Store 1?
SELECT store.store_id
FROM store
JOIN inventory on store.store_id = inventory.store_id
JOIN film on inventory.film_id = film.film_id
WHERE store.store_id = 1
AND film.title LIKE "Academy Dinosaur"
LIMIT 1;
