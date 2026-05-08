show databases;
use sakila; -- to access database

show tables;
select * from customer;
select  first_name, customer_id from customer;

-- to filter the data  we use where
select first_name, customer_id from customer where customer_id >5;
select * from customer where first_name='LINDA'; -- doubt

select * from customer where customer_id between 2 and 5;

-- can not write ulta
select * from customer where customer_id between 5 and 2;

-- in use
select  * from customer where first_name in ('LISA',10);

select * from customer where address_id between 6 and 1; -- no filter

select * from customer where address_id between 1 and 5;

-- when range is not specific we use and, or operator
select * from customer where  customer_id=2 or customer_id>7;

select * from customer where  customer_id=2;
select * from customer where first_name = 'MARION';

select * from customer where first_name = 'MARION' or store_id=2; -- gives full data of store_id and 1 data of Marion
select * from customer where first_name='MARION' and store_id=2; -- gives only one o/p

select * from customer where store_id = 2 and  store_id = 5; -- no output

select * from customer where first_name='MARION' or  store_id = 2 and  store_id = 5; -- order is first and then or

select * from customer where customer_id >= 3 and customer_id<=6;

select * from customer where customer_id>=6 or customer_id<2 and first_name='PATRICIA';