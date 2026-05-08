-- joins
use sakila;
use regexjoin;

select * from customers;
select * from orders;

select customers.customer_id,customers.customer_name from customers;

-- to join
	select customers.customer_id,customers.customer_name,product_name,orders.customer_id from customers join orders where customers.customer_id = orders.customer_id;

-- inner join
	-- filtet the data and gets common values
    -- on is use instead of where in new syntax
    	select customers.customer_id,customers.customer_name,product_name,orders.customer_id from customers join orders on customers.customer_id = orders.customer_id;

-- left outer join 
	-- means common values but also left wala data
    -- where data is not matched there null is places
    -- whe seeing or finding null values we use is instead of = operator
			select customers.customer_id,customers.customer_name,product_name,orders.customer_id from customers left join orders on customers.customer_id = orders.customer_id;

			select customers.customer_id,customers.customer_name,product_name,orders.customer_id from customers left join orders on customers.customer_id = orders.customer_id where product_name is null;
			
			select customers.customer_id,customers.customer_name,product_name,orders.customer_id from customers left join orders on customers.customer_id = orders.customer_id where product_name is not null;

INSERT INTO orders VALUES (106, 11, 'Ice cream');

-- right outer join or right join
			select customers.customer_id,customers.customer_name,product_name,orders.customer_id from customers right join orders on customers.customer_id = orders.customer_id;

-- natural join
	-- join two tables but names should be same (joins automatically on the basis of same names)
    -- joins column if column name are same and it will work as inner join
    -- but if more than 2 columns it makes complecate
		select customers.customer_id,customers.customer_name,product_name,orders.customer_id from customers natural join orders;
        
	-- 