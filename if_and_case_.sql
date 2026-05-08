-- Flow control statements
use sakila;

-- if 
	-- if(condition, True statement, False statement)
		select * from employees;
        select first_name, department, salary, if(department='IT', True, False) from employees;
        select first_name, department, salary, if(department='IT', round(salary*.1,2), round(salary*.05,2)) from employees;

-- multiple conditions
	-- if(condition, True, if(condition, True, False))
		select first_name, department, salary, if(department='IT', round(salary*.1,2), if(department='HR', salary*.05, salary)) from employees;
        
-- case condition
	/* select col1,col2,
       case
			when condition then statement
	   end
       from table_name
   */
   
	select first_name, department,salary,
    case
		when department='IT' then True
        else 'Non IT'
	end
    from employees;
    
    select first_name, department,salary,
    case
		when department='IT' or department='HR 'then 'A category'
        else 'B category'
	end
    from employees;
    
    -- when multiple conditions in case method
		select first_name, department,salary,
		case
			when department='IT'then salary*1.1
            when department='HR' then salary*1.05
			else salary
		end as 'new_salary'
		from employees;
        
-- if the hiring date of a employee is before year 2020 then print its job title with senior add and with its job title
-- and if the year 2021 then associate print
-- else the name was last will be applied
		select* from employees;
        select first_name,department,job_title,year(hire_date), 
        case 
			when year(hire_date)<=2020 then concat('senior',job_title)
            when year(hire_date) then concat('associate',job_title)
            else job_title
		end as 'new_job_titel'
        from employees;
        
        
/*
 if salary greater than 70000 then category = avg salary
  if salary greater than 85000 then category = high salary
   if salary greater than 100000 then category = extreme high salary
   otherwise print the category name as low salary
*/
select first_name ,department,salary,
case
	when salary>70000 and salary<85000 then 'avg_salary' 
    when salary>85000 and salary<100000 then 'high_salary'
    when salary>100000 then 'extreme_high_salary'
    else 'low salary'
end as category
from employees;

/*
select the job_title and print the column value based on the column condition
if more than 
*/
select job_title,count(job_title) from employees group by job_title;
select job_title,count(job_title),
case
	when count(job_title)=1 then concat(job_title,' Position have ',count(job_title),' Person')
    when count(job_title)>1 then concat(job_title,' Position have ',count(job_title),' Persons')
end as 'Person'
from employees group by job_title;


-- Learning assignment
	-- what is super key,primary key and foreign key?
    -- what is normalisation?
    -- what is first normal form(1nf)?