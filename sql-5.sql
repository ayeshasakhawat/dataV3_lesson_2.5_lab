USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE (first_name = 'Scarlett');


-- How many films (movies) are available for rent and how many films have been rented?
-- I would assume this refers to how many movies are available to be rented. 

SELECT COUNT(DISTINCT film_id) FROM sakila.film;
SELECT COUNT(DISTINCT film_id) FROM sakila.inventory;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?

SELECT CONCAT(FLOOR(AVG(length)/60),'hours ', MOD(round(AVG(length)),60),'minutes ') AS avg_duration FROM sakila.film;


-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT * FROM sakila.rental;
SELECT MAX(rental_date) AS last_od, MIN(rental_date) AS first_od FROM sakila.rental;
SELECT DATEDIFF('2006/02/14', '2005/05/24') AS operating_days;

-- How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM sakila.rental;

SELECT *, 
date_format(rental_date, '%M') AS 'rental_month', 
date_format(rental_date,'%W') AS 'rental_weekday' FROM sakila.rental 
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
	date_format(rental_date, '%M') AS 'rental_month', 
	date_format(rental_date,'%W') AS 'rental_weekday',
    CASE 
    WHEN (date_format(rental_date,'%W')= 'Saturday') OR  (date_format(rental_date,'%W')= 'Sunday')
    THEN 'weekend'
    ELSE 'weekday'
    END AS rental_day_type
FROM sakila.rental;
    
    
-- Get release years.
SELECT 
DISTINCT release_year
FROM film;

-- Get all films with ARMAGEDDON in the title.

SELECT * FROM sakila.film;

SELECT title 
FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.

SELECT title 
FROM film
WHERE title LIKE '%APOLLO';

-- Get 10 the longest films.

SELECT title, length FROM sakila.film
ORDER BY length DESC
LIMIT 10;
  -- How many films include Behind the Scenes content?

SELECT count(title) AS films_behindthescenes
FROM sakila.film
WHERE special_features LIKE ('%behind the scenes%');

