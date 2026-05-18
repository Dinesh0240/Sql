use shadidb;

select * from employees;

-- running  salary
	select * ,sum(salary) over(), sum(salary) over(order by salary) from employees;
    
-- partition by
	-- similar values are collected
    
		-- total salary
			select * , sum(salary) over() from employees;
		
        -- sum of similar values by using  partition by 
			-- sum(salary) over(partition by department) --> gives total salary of the particular department
            -- sum(salary) over() --> gives total salary of the all department
            
			select *, sum(salary) over(partition by department), sum(salary) over() from employees;
            
		-- sum of salary by column name --> Name
			select *, sum(salary) over(partition by Name) from employees;
            
		-- partition by --> only applied on those where we see the similar values
        
        -- appling partition by on manager id(column)
			select *, sum(salary) over(partition by manager_id) from employees;
            
            
		select *, sum(salary) over(partition by  department order by salary) from employees;
        
        -- diana salary more than or less than its department and the total salary of the department
			select  name,department, salary, sum(salary) over(partition by department), 
            round((salary / sum(salary) over(partition by department) )*100 ,2)from employees;
            
            
            
	