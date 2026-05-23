-- ==> constraints
	-- are those rules which are applied to the table column to prevent invalid data entry in the table 
	-- to create the database
    create database const_db;
    
    use const_db;
    select database();
    -- DDL(data defination language)
		-- it shows the structure of the table
        -- to create table
			create table test1( id int, age int ); -- it gives error if already exists
            
			create table if not exists test1( id int, age int ); -- it does not give error it gives warning
            
	-- DML(data  manipulation language)
		insert into test1 values(101, 32), (102, null); -- here null is for to insert null value
        select * from test1;
        
        insert into test1 values(103, 56),(101, 55);
        select * from test1;
	
    -- --> not null constraint
		create table if not exists test2( id int , age int not null );
        insert into test2 values(101, 32);
        select * from test2;
        insert into test2 values(102, null); -- it gives error due to the constraint given i.e not null values not allowed
        
	-- --> unique constraint
		-- multiple null values cacn be there in one unique constraint
			create table if not exists test3( id int unique, age int not null );
			insert into test3 values(101, 32);
			select * from test3;
            
			-- it gives error due to the constraint given i.e this value already exists and duplicate is not allowed
				insert into test3 values(101, 32);
			insert into test3 values(102, 32);
            insert into test3 values(null, 32);
			
            select * from test3;
            
	-- --> Default constraint
		create table if not exists test4( id int default 100 , age int);
        insert into test4(age) values(101);
        select * from test4;
        insert into test4(id) values(null);
        select * from test4;
        
	-- --> Primary key constraint
		-- it should be always unique
        -- null values not allowed
        
         -- here we make combination of two columns 
         -- a primary key (called composite key(where there are minimal combinations of attriutes))
         
			create table if not exists test6( id int , age int, salary int , primary key (id,age));
			insert into test6 values(1, 50, 50000), (2, 40, 20000), (1,51, 100000), (3, 55, 100);
			select * from test6;
            
            -- used to describe the table attributes(desc)
				desc test6;
			
	-- --> Check constraint
		-- to check condition applied or not
        
			create table if not exists test7( id int , age int check (age>18));
			insert into test7 values(1,50);
            select * from test7;
            insert into test7 values(1,17); -- it gives condition is voilated due to the check constraint condition
            select * from test7;
            desc test7;
		
        -- operator and functions can be used here
			create table if not exists test8( id int , age int check ( age between 18 and 22 ));
			insert into test8 values(1,20);
            insert into test8 values(2,10); -- it gives warning that it is not between the range specified in the check
            select * from test7;
	
    -- --> Foriegn key
		-- both tables are independent and values ccan be inserted in both the tables
        -- (problem)whether the values relation exist or not there valeus are inserted
			
			create table if not exists s_class(cname varchar(20) primary key);
			insert into s_class values(10), (8), (9);
            select * from s_class;
			
			create table if not exists student( id int , name varchar(20), cname varchar(20) ,
            foreign key (cname) references s_class(cname) );
			insert into student values(1, 'niana', '10');
            insert into student values(2, 'abhi', 12); -- it will give error
            select * from student;
            
-- learning asignmnet
	-- data types in sql