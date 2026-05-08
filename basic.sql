select current_user();		-- to know the current user

show databases;		-- to show which databases are available

use sakila;			-- to use the particular database

show tables;		-- show the tables in the current database 
select * from customer;		-- * for all data and customer is our table
select customer_id from customer; 	-- to access the particular column
select customer_id, first_name from customer;  -- to access the multiple column and sequence according to you of the column
-- can also access same column multiple times and in any order
select first_name, customer_id from customer;
select * from payment;

select payment_id, amount from payment;


-- working on customer table

select customer_id, first_name from customer; 	

select customer_id, first_name, customer_id+10 from customer;  -- changes done through select are not affecting the original table
select customer_id, Customer_id, CUSTOMER_ID from customer;  -- not a case sensitive language

-- to select a particular row of a table
select * from customer where customer_id=4;

-- to select a particular row of a table with particular column
select customer_id, first_name from customer where customer_id=4;

-- to access the string we use single quotes only not double
select customer_id, first_name from customer where first_name='BARBARA'; 
select * from customer;