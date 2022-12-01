use sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT 
    category.*, COUNT(*) AS nb_movies
FROM
    category
        JOIN
    film_category ON category.category_id = film_category.category_id
GROUP BY category.category_id
ORDER BY nb_movies;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT 
    staff.*, SUM(payment.amount) AS total_rung_up_amount
FROM
    staff
        JOIN
    payment ON staff.staff_id = payment.staff_id
WHERE
    YEAR(payment.payment_date) = 2005
        AND MONTH(payment.payment_date) = 8
GROUP BY staff.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT 
    actor.*, COUNT(*) nb_film_appearance
FROM
    actor
        JOIN
    film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY nb_film_appearance DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT 
    customer.*, COUNT(*) AS nb_rentals
FROM
    customer
        JOIN
    rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY nb_rentals DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT 
    first_name, last_name, address.*
FROM
    staff
        JOIN
    address USING (address_id);

-- 6. List each film and the number of actors who are listed for that film.
SELECT 
    film.title, COUNT(*) nb_listed_actors
FROM
    film
        JOIN
    film_actor USING (film_id)
GROUP BY film.film_id
ORDER BY nb_listed_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
-- select customer.first_name, customer.last_name, sum(payment.amount) as total_paid_amount
SELECT 
    customer.last_name,
    customer.first_name,
    SUM(payment.amount) AS total_paid_amount
FROM
    customer
        JOIN
    payment USING (customer_id)
GROUP BY customer.customer_id
ORDER BY customer.last_name;

-- 8. List number of films per category.
SELECT 
    category.name AS category, COUNT(*) AS nb_films
FROM
    category
        JOIN
    film_category USING (category_id)
GROUP BY category.category_id;