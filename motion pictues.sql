use sakila;

-- task 1

select actor.first_name,actor.last_name,actor.actor_id,actor.last_update from actor inner join film_actor inner join 
inventory inner join rental  on actor.actor_id=film_actor.actor_id and film_actor.film_id=inventory.film_id
and inventory.inventory_id=rental.inventory_id group by actor_id;

(select actor.first_name,actor.last_name,actor.actor_id,actor.last_update from actor inner join film_actor inner join 
inventory inner join rental  on actor.actor_id=film_actor.actor_id and film_actor.film_id=inventory.film_id
and inventory.inventory_id=rental.inventory_id group by actor_id) into outfile 
  'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\task1.csv'
  fields terminated by ','
  lines terminated by  'n/';


-- task 2.1
select concat(first_name,' ',Last_name) as Name from actor;

-- task 2.2

select first_name,count(first_name) from actor group by first_name having count(first_name)>1;

-- task 2.3

select last_name,count(last_name) from actor group by last_name having count(last_name)>1;


-- task 3

select  rating,count(film_id) as Total_Movies  from film group by rating order by count(film_id);

-- task 4

select rating, avg(rental_rate) from film group by rating;

-- task 5.1

select title,replacement_cost from film  where   replacement_cost<=8;

-- task 5.2

select title,replacement_cost from film where replacement_cost between 15 and 20;

-- task 5.3

select title,min(rental_rate),max(replacement_cost) from film group by title;

-- task 6

select film_id,count(actor_id) from film_actor group by film_id ORDER BY COUNT(ACTOR_ID) DESC;

-- task 7

select title from film where title like ('K%') or title like  ('Q%');

-- task 8

select actor.first_name,actor.last_name from actor join film join film_actor on actor.actor_id=film_actor.actor_id
and film_actor.film_id=film.film_id  where  title like '%Agent Truman%';

-- task 9

select film.title from category join film join film_category on category.category_id=film_category.category_id and 
film_category.film_id= film.film_id where category.name like 'children';

-- task 10

select film.title,count(rental.inventory_id) from film  inner join inventory inner join rental on film.film_id=inventory.film_id and
 inventory.film_id=rental.inventory_id group by title order by count(rental.inventory_id) desc ;



-- task 11

select category.name from film join category join  film_category on film.film_id=film_category .film_id and  
category.category_id=film_category.category_id group by category.name
 having avg(replacement_cost-rental_rate)>15;

-- task 12

select count(film_id),category.name from film_category join category on category.category_id=film_category.category_id group by 
category.name having count(film_id) between 60 and 70 order by count(film_id);


