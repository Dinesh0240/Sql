use sakila;

-- order by
	-- to sort data  (in ascending order)
	select * from employees order by department;
    select * from employees order by salary;
    
    --  for descending order use desc in the last
    select * from employees order by salary desc;
    
    -- to sort inside a already sorted column
    select first_name, department, salary from employees order by department,salary;
    
    select salary, hire_date, year(hire_date) from employees order by year(hire_date),salary;
    
    -- when to sort only salary after year(hire_date) in descending order
	select salary, hire_date, year(hire_date) from employees order by year(hire_date),salary desc;


-- operators, between in and like
-- and or not
-- string functions ==> substr,instr, trim,lpad,replace,length,concat,char_length
-- numeric functions ==> round, mod, truncate, ceil, floor
-- date ==> addate, month, year, extract, datediff, date_format, now, 