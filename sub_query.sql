-- subquery
	-- query inside query
    -- here ouput of outer query is dependent on inside query
    -- alsao calleld nested query
    -- a type of query where query is present inside another query
		-- two parts 
			-- outer query 
				-- result depends on inner query
            -- inner query
				

create database shadidb;

use shadidb;

create table biodata(id int ,name varchar(20), age int);

insert into biodata values(1, 'Rahul', 28), (2, 'anjali', 28), (3, 'Aishwarya', 40), (4, 'naina', 23);

select * from biodata;

select age from biodata where name= 'Rahul'; -- age of rahul

select * from biodata where age=28;

-- making it dynamic
select * from biodata 
where age=(select age from biodata where name= 'Rahul');



-- 
select max(age) from biodata;
select * from biodata where age=40;
-- for dynamic
select * from biodata 
where age=(select max(age) from biodata);

-- find the character of the name of the rahul naem
	select char_length(name) from biodata where name='Rahul';
    
    select name from biodata
    where char_length(name)=(select char_length(name) from biodata where name='Rahul');
    
-- single row subquery
		-- in which  the inner query return only 1 row 
        

use sakila;
    
select * from film;
-- find the name of movies where rental rate is same for the movie of african egg
	
    select rental_rate  from film where title = 'AFRICAN EGG';
    select title , rental_rate from film where rental_rate=2.99;
    -- making it dynamic
	select title , rental_rate from film
    where rental_rate=(select rental_rate  from film where title = 'AFRICAN EGG');
    
    
-- get the movie id and movie name where the rental rate is equal to min rental rate 
	select min(rental_rate) from film ;
    select film_id, title from film where rental_rate=(select min(rental_rate) from film );
    
-- get the movie id,movie name ,duration  where the duration is greater than the average duration of the movie
-- get the movie id for the movies where the release year of the movei is should be equal to the movie "ALONE TRIP" and the rating should be same as of the movie "APOLLO TEEN"
