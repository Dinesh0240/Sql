create database dml_statement;

		create table dinesh as 
		select actor_id, first_name from sakila.actor;
select * from dinesh;

-- insert
	insert into dinesh values(19999, 'japan');
	select * from dinesh;
    
-- update
	set sql_safe_updates = 0; -- to remove the safe mode
	update dinesh set first_name = 'Urvashi'; -- all the values of first_name ar e updated
    select * from dinesh;
    
    -- to update a particular row value (by giving condtion)
		update dinesh set first_name = 'raj' where actor_id = 2;
		select * from dinesh;
        
-- delete
	delete from dinesh where  first_name = 'raj';
    select * from dinesh;
    delete from dinesh;
    select * from dinesh;
    
    
-- interview questions
	-- what is DDL and DML statememnt?
    -- diff between truncate , delete and drop
    -- what is normalization?
    -- diff char and varchar data type