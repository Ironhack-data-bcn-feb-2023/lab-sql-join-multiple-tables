
USE sakila;

-- Write a query to display for each store its store ID, city, and country.
SELECT * FROM store;

SELECT store_id, city, country
	FROM store
	LEFT JOIN address
		ON address.address_id = store.address_id
	LEFT JOIN city
		ON city.city_id = address.city_id
	LEFT JOIN country
		ON country.country_id = city.country_id;
        
-- Write a query to display how much business, in dollars, each store brought in.
SELECT store.store_id, SUM(amount) AS 'Total sales US$'
	FROM payment
	LEFT JOIN staff
		ON staff.staff_id = payment.staff_id
	LEFT JOIN store
		ON store.store_id = staff.store_id
	GROUP BY store.store_id;
    
-- What is the average running time of films by category?
SELECT * FROM film;
SELECT * FROM category;

SELECT category.name, AVG(length) AS 'Avg lenth (min)'
	FROM category
    LEFT JOIN film_category
		ON film_category.category_id = category.category_id
	LEFT JOIN film
		ON film.film_id = film_category.film_id
    GROUP BY category.name;
    
-- Which film categories are longest?
SELECT category.name, AVG(length) AS 'Avg lenth (min)'
	FROM category
    LEFT JOIN film_category
		ON film_category.category_id = category.category_id
	LEFT JOIN film
		ON film.film_id = film_category.film_id
    GROUP BY category.name
    ORDER BY AVG(length) DESC;
    
-- Display the most frequently rented movies in descending order.
SELECT film.title, COUNT(rental_id)
	FROM film
    LEFT JOIN inventory
		ON inventory.film_id = film.film_id
    LEFT JOIN rental
		ON rental.inventory_id = inventory.inventory_id
	GROUP BY film.title
	ORDER BY COUNT(rental_id) DESC;
    
-- List the top five genres in gross revenue in descending order.
SELECT * FROM category;

SELECT category.name, SUM(amount) AS 'Gross revenue'
	FROM category
    LEFT JOIN film_category
		ON film_category.category_id = category.category_id
	LEFT JOIN inventory
		ON inventory.film_id = film_category.film_id
	LEFT JOIN staff
		ON staff.store_id = inventory.store_id
	LEFT JOIN payment
		ON payment.staff_id = staff.staff_id
	GROUP BY category.name 
    ORDER BY SUM(amount) DESC
    LIMIT 5; -- Error code: 2013. Lost connection to MySQL server during query ??

-- Is "Academy Dinosaur" available for rent from Store 1?
-- store > inventory > film
SELECT film.title, store.store_id
	FROM film
    LEFT JOIN inventory
		ON inventory.film_id = film.film_id
	LEFT JOIN store
		ON store.store_id = inventory.store_id
	HAVING film.title = 'Academy Dinosaur'
    AND store.store_id = '1'; -- Yes, there's 4 units available for rent from Store 1.
    

        
