create database startersql;  -- to create a database n  sql
use startersql;			-- to use a particular database
use employees;
select * from employees;

-- string function 
use sakila;
select * from actor;
	-- to convert to lower case we use lower function
    select first_name, lower(first_name) from actor;
    -- to conert to upper case we have upper
    
    
    -- to convert to title case we have title
    
    
    -- to count number of character we use length
    select first_name, length(first_name) from actor;
    -- the length method gives the length of a string in bytes
    
    -- dummy table(1 row 1 colmn)
    select 1+2 from dual;
    select char_length("hello") from dual;
    
-- to concate the data or string data

select "dinesh","choudhary", concat("dinesh","choudhary") from dual;

select first_name,last_name,actor_id, concat(first_name," ",last_name,actor_id) from actor;


select first_name,last_name,actor_id, concat_ws("_",first_name,last_name,actor_id) from actor;


-- string functions for changing or manuplating the string 

	-- substring function
		-- to extract some portiuon or some data
        select first_name,substr(first_name,3) from actor;
        
        -- to extract data from particular index to another particular index
                select first_name,substr(first_name,1,3) from actor;
                
	-- trim method
		--