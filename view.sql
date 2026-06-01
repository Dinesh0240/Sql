-- view 
create database view;
use view;

CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50),
    dept_id  INT,
    salary   DECIMAL(10,2),
    city     VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance');

INSERT INTO employees VALUES
(101,'Aman',    2, 70000, 'Jaipur'),
(102,'Priya',   1, 45000, 'Delhi'),
(103,'Rahul',   2, 90000, 'Mumbai'),
(104,'Sneha',   3, 55000, 'Jaipur'),
(105,'Vikram',  2, 30000, 'Pune');

select * from departments;
select * from departments where dept_id<3;
-- creating a view
	create view dept_view as select * from departments where dept_id<3;
    
    select * from dept_view;
	
	select * from employees;
	create view city_sum as select city, round(sum(salary),0) from employees group by city;
    select * from city_sum;
    
    -- restricted the columns
		create view emp_2_col as select emp_id, name from employees;
		select * from emp_2_col;
        
-- inserting the values in the view
-- ==>where we can insert update delete in the view it is called simple view
        insert into emp_2_col values(107, 'yash'); -- inserting 
        select * from emp_2_col; -- changes are done in the view 
        select * from employees; -- changes made at the view are aslo done in the orginal table but sometimes only
        
		-- delete a row in view
			delete from emp_2_col where emp_id =101;
			select * from emp_2_col;
			select * from employees;
            
        -- delete a row in view
			update emp_2_col set emp_id = 1 where emp_id = 102;
			select * from emp_2_col;
			select * from employees;
            
-- 
            select count(name) from emp_2_col;
            select * from emp_2_col;
            select * from departments;
            
            create view emp_join as select emp_id, name, dept_id from employees;
            select * from emp_join;
            
            create view dept_join as select * from departments;
			select * from dept_join;
            
            select * from emp_join as e join dept_join as d
            on e.dept_id = d.dept_id;
            
			select * from employees;
            
            
            create or replace view new_view as select e.emp_id, e.name, e.dept_id from employees as e
            join departments d on e.dept_id = d.dept_id;
            desc new_view;
            select * from new_view;
            update new_view set emp_id =102 ;
            
            
            