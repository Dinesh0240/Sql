use sakila;

-- functions ==> multi-row function
	-- applied on multiple row --> gives 1 output
    
    -- distinct function or keyword
		-- gives unique value and remove duplicate
        -- for one column
        -- we can not perfrom calculations on distinct
			select distinct(department) from employees;
		
        -- for multiple column
			select distinct department,salary from employees;
    
    -- calculation on your data ==> aggregate function
		select department from employees;
        -- count function 
			-- to count number of rows
            -- it does not count null rows because null does not take space
            -- and empty string takes space 
				select count(department) from employees;
				select count(first_name) from employees;
				select count(salary) from employees;
                
				select count(district), count(address_id), count(address2) from address;
                
                select count(distinct department) from employees;
                -- if aggregate fun applied then you can not use anotehr column directlya after using the aggregate function
		-- sum
			select sum(salary) from employees;
            select sum( distinct salary) from employees;
            
        -- average(avg) 
			select avg(salary) from employees;
            
        -- max
			select max(salary) from employees;
            
        -- min 
			select min(salary) from employees;
            
            
            
-- 30 april 2026

use sakila;
select  * from employees;

select sum(salary) from employees where department='IT';

select sum(salary) from employees where department='Finance';

select 

