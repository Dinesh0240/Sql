-- TCL(Transaction control language)
	-- transaction are those set of sql statements which work as a unit
    -- ACID properties
		-- Atomicity 
        -- Consistency
        -- Isolation
        -- Durability
        
create database tcl;
use tcl;

create table raj45( id int);
insert into raj45 values(10);
select * from raj45;

-- TCL
	-- start transaction means theis data will be save when i want not sql workbech
	-- means it is only shown to me until i want
		start transaction;
		insert into raj45 values(45);
		select * from raj45;
        
	-- commit
		-- this saves the changes permanently and the data it saves is shown to everyone after commit
        insert into raj45 values(55);
		select * from raj45;
        commit;
        
-- when is the transaction started
	-- there are two cases
		-- to start transaction  we neend to write start transaction after this changes are in pending phase
        -- when DML statment is executed
        -- set autocommit = 0 (means off)
        
-- when is the transaction is ended
	-- commit
    -- rollback
    
    
start transaction;
update raj45 set id =500;
select * from raj45;
-- rollback
	-- all the pending transaction are revert(undone) to the previous state no changes are done
    -- transaction are  stoped after this also
rollback;

select * from raj45;

-- without start transaction
	-- data cannnot be rollback after delete without start transaction
	set sql_safe_updates = 0;
	select * from raj45;
	delete from raj45;
	select * from raj45;

-- when data is deleted and start transaction is used  and then committed then data is deleted
	start transaction;
    insert into raj45 values(10),(11),(56),(76);
    delete from raj45 where id = 10;
    select * from raj45;
    commit;

-- after commit rollback does not work
-- after rollback commit does not work


-- savepoint(can be called as the check point where our data will be saved before it)
	start transaction;
	insert into raj45 values(1),(2),(3);
	select * from raj45;
    
    savepoint raj45_savepoint_ins;
    
    update raj45 set id=1000;
    select * from raj45;
    rollback to raj45_savepoint_ins; -- rollback to savepoint to revert upto specific point
    select * from raj45;
    
-- after writng any DDL command then automaticaly data is commiited or etither we can say it is saved
-- so we cannot rollback it