SELECT
    s.store_id AS StoreID,
    c.city AS City,
    co.country AS Country
FROM
    sakila.store AS s
INNER JOIN
    sakila.address AS a ON s.address_id = a.address_id
INNER JOIN
    sakila.city AS c ON a.city_id = c.city_id
INNER JOIN
    sakila.country AS co ON c.country_id = co.country_id;



SELECT
    s.store_id AS StoreID,
    c.city AS City,
    co.country AS Country,
    SUM(p.amount) AS TotalSales
FROM
    sakila.store AS s
INNER JOIN
    sakila.address AS a ON s.address_id = a.address_id
INNER JOIN
    sakila.city AS c ON a.city_id = c.city_id
INNER JOIN
    sakila.country AS co ON c.country_id = co.country_id
INNER JOIN
    sakila.staff AS m ON s.manager_staff_id = m.staff_id
INNER JOIN
    sakila.payment AS p ON p.staff_id = m.staff_id
GROUP BY
    s.store_id, c.city, co.country;
    
    

SELECT
    c.name AS Category,
    AVG(f.length) AS AverageRunningTime
FROM
    sakila.film AS f
JOIN
    sakila.film_category AS fc ON f.film_id = fc.film_id
JOIN
    sakila.category AS c ON fc.category_id = c.category_id
GROUP BY
    c.name;



SELECT
    c.name AS Category,
    AVG(f.length) AS AverageRunningTime
FROM
    sakila.film AS f
JOIN
    sakila.film_category AS fc ON f.film_id = fc.film_id
JOIN
    sakila.category AS c ON fc.category_id = c.category_id
GROUP BY
    c.name
ORDER BY
    AverageRunningTime DESC;



SELECT
    f.film_id,
    f.title,
    COUNT(r.rental_id) AS RentalCount
FROM
    sakila.film AS f
JOIN
    sakila.inventory AS i ON f.film_id = i.film_id
JOIN
    sakila.rental AS r ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id, f.title
ORDER BY
    RentalCount DESC;



SELECT
    c.name AS Genre,
    SUM(p.amount) AS GrossRevenue
FROM
    sakila.category AS c
JOIN
    sakila.film_category AS fc ON c.category_id = fc.category_id
JOIN
    sakila.film AS f ON fc.film_id = f.film_id
JOIN
    sakila.inventory AS i ON f.film_id = i.film_id
JOIN
    sakila.rental AS r ON i.inventory_id = r.inventory_id
JOIN
    sakila.payment AS p ON r.rental_id = p.rental_id
GROUP BY
    c.name
ORDER BY
    GrossRevenue DESC
LIMIT 5;



SELECT
    f.title AS FilmTitle,
    CASE
        WHEN COUNT(i.inventory_id) > 0 THEN 'Available for Rent'
        ELSE 'Not Available for Rent'
    END AS Availability
FROM
    sakila.film AS f
LEFT JOIN
    sakila.inventory AS i ON f.film_id = i.film_id
LEFT JOIN
    sakila.rental AS r ON i.inventory_id = r.inventory_id
LEFT JOIN
    sakila.store AS s ON i.store_id = s.store_id
WHERE
    f.title = 'Academy Dinosaur'
    AND s.store_id = 1
    AND r.return_date IS NULL
GROUP BY
    f.film_id, f.title;