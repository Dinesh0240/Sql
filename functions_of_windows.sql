-- Windows 

create database windowsdb;
use windowsdb;

drop database windowsdb;
-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2021),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   55000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);


select * from employees;

-- sum of salaries over the partition of the hire year
	select *, sum(salary) over (partition by hire_year order by salary) from employees;
    
-- max salary o nthe basis of dept and order by hire year    
    select *, max(salary) over (partition by dept) from employees;
    select *, max(salary) over (partition by dept order by hire_year) from employees;
    
-- multiple partition can be done
	select *, sum(salary) over (partition by dept,hire_year) from employees;
    
-- 
	select *, avg(salary) over (partition by dept),
    case
		when salary> avg(salary) over (partition by dept) then 'Above avg salary'
        else 'Less than avg salary'
        end
	from employees;
    
    
-- functions related to windows
	
    -- 1. Row Number
		-- it is not affected by same values
		-- to generate unique number only 
			select *,row_number() over() from employees;
        
        -- generating unique values over salary from smallest to largest
			select *,row_number() over(order by salary) from employees;
            
		-- generating unique values by every dept
			select *,row_number() over(partition by dept) from employees;
            
	-- 2. Rank
		-- here it is affected by same values
        -- based on comparision it gives values otherwise it gives same rank and next will start from the skipped value
		-- giving ranking to the values
        -- does not know on what basis it has to give values so it gives 1
			select *, rank() over(partition by dept) from employees;
        
        -- based on order by we can only give ranking
			select *, rank() over(order by salary) from employees;
        
        -- dept wise ranking
			select *, rank() over(partition by dept order by salary desc) from employees;
            
		-- row number and rank differnce
			select *, row_number() over (partition by dept order by salary),
            rank() over(partition by dept order by salary) from employees;
            
		
        -- learning assignment 
			-- diff btw windows function and group by
            -- diff btw row number , rank , dense rank
            -- diff btw where and having clause 
            -- types of joins in sql
            -- natural join and cartesian join or cross join 
            -- what is super key ,primary key, unique key and foriegn key