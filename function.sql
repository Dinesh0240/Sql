-- function --> code logic/task +
-- concat()   a function which can be used to combine 
use sakila;
select first_name, last_name,concat(first_name,last_name) from customer;

-- to addd something in between
select first_name, last_name,concat('Mrs.',first_name,last_name) from customer;


-- for a particular concate
select * from customer where concat(first_name,' ',last_name)= 'MARY SMITH';
use employees;
select * from employees;
