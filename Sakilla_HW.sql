/* Elso feladat: */
SELECT first_name, last_name
FROM actor;

/*Masodik feladat:*/
/* a) */
SELECT CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS `Actor Name`
FROM actor;

/* b) */
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe';

/* c) */
SELECT *
FROM actor
WHERE last_name LIKE '%gen%';

/* d) */
SELECT *
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;

/* Harmadik Feladat */
SELECT COUNT(DISTINCT last_name) AS "Number of different last_names"
FROM actor;

/* Negyedik feladat  */
SELECT last_name, COUNT(*) AS name_occur
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1
ORDER BY name_occur DESC; /* Ha rendezni is akarjuk, pl előford. száma szerint */

/* Ötödik feladat */
SELECT country_id, country
FROM country
WHERE country IN ('China', 'Afghanistan', 'Israel');

/* Hatodik feladat */
SELECT AVG(length)
FROM film;

/* Hetedik feladat */ 
SELECT staff.first_name, staff.last_name, address.address
FROM staff 
JOIN address ON staff.address_id = address.address_id;

/* Nyolcadik feladat */
SELECT c.first_name, c.last_name, SUM(p.amount) AS sum_payments
FROM customer c /* a customer.first_name helyett igy elég c.first_name -et irni */
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
LIMIT 10;

/* Kilencedik feladat */
SELECT f.title, GROUP_CONCAT(CONCAT(a.first_name, ' ', a.last_name) SEPARATOR ', ') AS actors /* Összerakjuk a szinészek nevét, majd az egyes filmek szinészeit az actors oszlopban összeszedjük */
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.title /* a szinészeket a filmtitle szerint csoportosítjuk az "actors"ban, minden filmnél kiirva amiben játszanak */
LIMIT 20;