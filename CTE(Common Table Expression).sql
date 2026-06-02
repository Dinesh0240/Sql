-- CTE ( commom table expression )
-- storing a result on a temprorary
-- after semicolon we can not access the CTE query or data
	select * from sakila.film_actor;
    
    with test as
    (select actor_id, count(film_id) as movieCount from sakila.film_actor group by actor_id) -- no semicolon here(;)
    select sum(movieCount) from test where actor_id>10;
    
    use windowsdb;
    -- using windows function
		select * from 
        (select *, max(salary) over( partition by dept) as deptmax 
        from employees) as temp
        where salary=deptmax;
        
	-- using CTE
		with cte as
        (select *, max(salary) over( partition by dept) as deptmax from employees)
        select * from cte where salary=deptmax;
        
	-- using join on CTE and original data
		with xyz as
        (select dept, max(salary) as deptMax from employees group by dept)
        select * from employees as e join xyz as x
        where e.dept = x.dept and e.salary = x.deptMax;
		