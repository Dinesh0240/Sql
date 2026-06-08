-- Recursive CTE
create database recur_cte;
use recur_cte;

use sakila;
-- union --> gives all values except duplicates i.e combine all
	select * from actor where actor_id between 1 and 3
	union
	select * from actor where actor_id between 3 and 5;

-- union all --> gives all values witrth duplicates also
	select * from actor where actor_id between 1 and 3
	union all
	select * from actor where actor_id between 3 and 5;

-- intersect --> gives common values in both 
	select * from actor where actor_id between 1 and 3
	intersect
	select * from actor where actor_id between 3 and 5;

-- except -->return all distinct rows from the 1st query that are not present in the 2nd (right) query
	select * from actor where actor_id between 1 and 3
	except
	select * from actor where actor_id between 3 and 5;
-- normal cte    
	with cte as 
	(select 1 as n)
	select n+5 from cte;

-- recursive CTE
	with recursive cte_1 as 
	(select 1 as n
    union all
	select n+3 from cte_1 where n<10)
    select * from cte_1;
    
    with recursive cte_1 as 
	(select 1 as n
    union all
	select n+1 from cte_1 where n<=5)
    select * from cte_1
    ;
    
    
-- 
	create table employees3(
		emp_id int,
        emp_name varchar(50),
        manager_id int
    );
    insert into employees3 values
    (1, 'CEO', null),
    (2, 'John', 1),
    (3, 'Mary', 1),
    (4, 'David', 2),
    (5, 'Lisa', 2),
    (6, 'Tom', 4);
    
    select * from employees3;
    
-- without recursive cte
    with cte as
    (select emp_id as bid, emp_name as bname, emp_name as hirarchy from employees3 where manager_id is null)
    
    select * from cte
    union all
    select emp.emp_id, emp.emp_name, concat(emp.emp_name, '->', cte.bname) as hirarchy
    from employees3 as emp
    join cte where emp.manager_id = cte.bid;
   
-- with recursive cte
    with recursive cte as
    (select emp_id as bid, emp_name as bname, emp_name as hirarchy 
    from employees3 where manager_id is null
    union all
    select emp.emp_id, emp.emp_name, concat(emp.emp_name, ' -> ', cte.hirarchy) as hirarchy
    from employees3 as emp
    join cte where emp.manager_id = cte.bid)
    select * from cte;
    
-- learning assignment
	-- what are indexes 
	-- why we use it 
	-- what is the use of explain keyword
	-- what is clustered and non clustered indexed