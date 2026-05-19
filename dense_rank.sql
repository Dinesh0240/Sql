use windowsdb;
-- can not use the created column in the where clause because it is executed first at the time of execution
select * from employees;

-- helps us to apply aggregate functions over a set of rows

select *, row_number() over(order by salary),
rank() over(order by salary),
dense_rank() over(order by salary) from employees;

select *,row_number() over(partition by dept) from employees;

select *,rank() over(partition by dept order by salary) from employees; 

select *,rank() over(partition by dept order by salary desc) from employees; 

select *,rank() over(partition by dept order by hire_year) from employees; 


-- find th max salary of the employyee in the particular departmetn
	-- by subquery
		select * from employees as e
		where salary=(select max(salary) from employees where dept=e.dept);
        
	-- by max
		-- can not use the created column in the where clause because it is executed first at the time of execution
			select * ,max(salary) over(partition by dept) as deptSalary from employees;
        

		-- storing a sub-query in a table form
			-- saving the a particular query result in a variable
			select * from(select * ,max(salary) over(partition by dept) as deptSalary from employees) as trh
			where salary=deptSalary;
	
    -- by rank
		select *, rank() over(partition by dept order by salary desc)  from employees;
        
        -- we use the back tik below the esc key as rank is already a keyword
        select *, rank() over(partition by dept order by salary desc) as `rank` from employees;
        
        -- storing it in a table form
			select * from (select *, rank() over(partition by dept order by salary desc) as rnk from employees) as temp 
            where rnk=1;
            
            
-- person with the second highest salary
	-- with windows function
		select * from(select *, dense_rank() over(order by salary desc) as rnk from employees) 
		as temp where rnk=2;
		
		select max(salary) from employees where salary<(select max(salary) from employees);
		
		select * from employees
		where salary=(select max(salary) from employees where salary<(select max(salary) from employees));
    
    -- do not use order by and limit for finding the 2nd highest and 2nd lowest salary
    
    -- for second highest
		select max(salary) from employees where salary<(select max(salary) from employees);
    
    -- fourth lowest
		select * from(select *, dense_rank() over(order by salary ) as rnk from employees) 
		as temp where rnk=4;
		select * from employees order by salary;
        
        
-- learning assignment 
	-- yesterdays theory questions
    -- rows between
	-- sql zoo windows function chapter complete