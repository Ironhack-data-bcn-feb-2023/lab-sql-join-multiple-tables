USE sakila;
-- QUERY 1
SELECT store.store_id
    ,city.city
    ,country.country
FROM store
	LEFT JOIN address ON address.address_id = store.address_id
	LEFT JOIN city ON city.city_id = address.city_id
	LEFT JOIN country ON country.country_id = city.country_id;

-- QUERY 2
SELECT cus.store_id
	,SUM(pay.amount) AS total_business
FROM customer cus
	LEFT JOIN payment pay ON pay.customer_id = cus.customer_id
GROUP BY 1;

-- QUERY 3
SELECT 
	cat.name
    ,AVG(length)
FROM category cat
	LEFT JOIN film_category fil_cat ON fil_cat.category_id = cat.category_id
	LEFT JOIN film ON film.film_id = fil_cat.film_id
GROUP BY 1
ORDER BY 2 DESC;

-- QUERY 4 -> Sports
SELECT 
	cat.name
    ,AVG(length)
FROM category cat
	LEFT JOIN film_category fil_cat ON fil_cat.category_id = cat.category_id
	LEFT JOIN film ON film.film_id = fil_cat.film_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- QUERY 5
SELECT film.title
	,COUNT(rental_id) AS total_rentals
FROM film
	LEFT JOIN inventory inv ON inv.film_id = film.film_id
    LEFT JOIN rental ON rental.inventory_id = inv.inventory_id
GROUP BY 1
ORDER BY 2 DESC;

-- QUERY 6
 SELECT cat.name
	,SUM(payment.amount) AS total_revenue
FROM category cat
	LEFT JOIN film_category ON film_category.category_id = cat.category_id
    LEFT JOIN inventory inv ON inv.film_id = film_category.film_id
    LEFT JOIN rental ON rental.inventory_id = inv.inventory_id
	LEFT JOIN payment ON payment.customer_id = rental.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- QUERY 7 -> YES, IT IS AVAILABLE. WE HAVE 4 SKU OF THIS PRODUCT AT STORE 1
SELECT film.title
	,COUNT(inv.store_id) AS total_sku_available
FROM film
	LEFT JOIN inventory inv ON inv.film_id = film.film_id
WHERE film.title = 'Academy Dinosaur'
	AND store_id = 1
GROUP BY 1