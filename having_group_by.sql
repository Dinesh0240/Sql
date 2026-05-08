use sakila;

select * from sales;

select product,sum(amount) from sales group by product;
select product,sum(amount) from sales where not product='tablet' group by product;

-- where clause is not used with the aggregate functions and it only work on data inside the table
	
-- Having clause
	-- only with group by working
	-- apply after group by
    -- for particular column we use it when we need to apply calculation
    -- for filtering with group by
    -- both can also be used 
    
    select  product, sum(amount) from sales group by product having sum(amount)>200000; 
    
    
    -- need to find how many sales are done by each person
    select * from sales;
    select sales_person,count(sales_person) from sales group by sales_person having count(sales_person)>8;
    
    select region,sum(amount) from sales group by region having count(*)>9;
    
    -- find the total transation done by each person in the decreasing order
		select sales_person,count(sales_person),sum(amount) from sales group by sales_person,product order by count(amount) desc ;
		
        select sales_person,product,count(sales_person),sum(amount) from sales group by sales_person,product order by count(amount) desc,sales_person;
        
		select * from payment;
        select year(payment_date),month(payment_date),sum(amount) from payment group by year(payment_date),month(payment_date);