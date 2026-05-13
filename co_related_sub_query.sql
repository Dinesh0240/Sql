use shadidb;

create table department ( dept_id int, dept_name varchar(20), location varchar(20));

insert into department values (10, 'HR', 'Mumbai'), (20, 'IT', 'Banglore'), (30, 'Finance' ,'Delhi');

select * from department;
select * from employees join department;
-- find those person who works in mumbai and delhi 
	select dept_name from department where location in ('banglore', 'delhi');
    select * from employees where department =any (select dept_name from department where location in ('banglore', 'delhi'));
    
    -- no of column should be same and values should be something same
    
-- correlated subquery ( asked in interviews) important
	-- a type of subquery where inner query is executed for each value of the outer query
    -- inner  query is also refer to the column of outer query
    -- also called dependent query
    -- 
    
    
    select * from employees where department='IT';
    select avg(salary) from employees where department='IT';
    
    select * from employees 
    where department='IT' and salary=79000; -- this is fixed
    
    select * from employees as e -- here we refeered the outter querry in the inside query
    where salary>(select avg(salary) from employees where department=e.department);
    
    
    -- those data who have the highest salary as of there department is same as highest salary of there department
		select max(salary) from employees where department = 'IT';
        
        select * from employees 
        where department ='IT' 
        and salary=(select max(salary) from employees where department = 'IT'); -- can not fix the department
        
        select * from employees as eout
        where salary=(select max(salary) from employees where department = eout.department);
        
	-- Find departments where all employees earn above 70000
		select distinct department from employees where salary>70000;
        select * from employees where department='IT';
        select * from employees as e where salary<=all(select salary from employees where department=e.department); 
        