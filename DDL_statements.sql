create database if not exists ddl_statements;
use ddl_statements;

-- ddl drop statement
	-- it delete all the data of the table and also the table if exists
		create table test1(id int, name varchar(20));
		insert into test1 values(1, 'abhi'), (2, 'shim'), (3, 'yash');
		select * from test1;
        drop table test1;
        
-- truncate
	-- it delete the table data and
    -- then recreate the same table again (with the same structure)
    truncate test1;
    select * from test1;
    
-- alter
	-- to add column
		alter table test1 add column (salary int);
		select * from test1;
        
        alter table test1 add column (age int default 18);
        select * from test1;
        
	--  to delete column
		alter table test1 drop column salary;
        select * from test1;
        
	-- to rename column name
		alter table test1 rename column age to new_age;
        select * from test1;
	
    -- adding constraints to the table columns
		alter table test1 add constraint primary key (id);
        desc test1;
        
-- Q1 add a column before the name column
-- Q2 change the data type of the name column to integer
-- Q3 add a not null constraint with the name and age column
-- Q4 add a foreign key of a column name as department_id referencing to the department column


select database();
-- can access the table from another database of a different database with the name of that database name
	select * from sakila.actor;
    
-- CTAS(Create table as select) 
	-- creating new table by accessing the data of another table and extracting tha data
		create table dinesh as 
		select actor_id, first_name from sakila.actor;
		select * from dinesh;
        
        