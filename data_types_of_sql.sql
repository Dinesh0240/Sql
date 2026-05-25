create database if not exists datatypedb;
use datatypedb;

-- >numeric data type
	-- tinyint
		create table test1( id tinyint);
		insert into test1 values(-1) ,(10);
		insert into test1 values(-128);
		insert into test1 values(128); -- this gives error out of range( 1 byte => 8 bit ==> 2**8( -128 to 127))
		select * from test1;
        -- for positive only
			create table test2( age tinyint unsigned);
			insert into test2 values(250);
			select * from test2;
        
	-- small int -> 2 byte 
    -- medium int -> 3 byte
    -- big int -> 8 byte
		
	-- float gives upto 2 decimal values 
    -- while double gives more than 2
		create table test3( salary float, salary2 double);
		insert into test3 values(1989.9889867, 1989.9889867603);
		select * from test3;
        
	-- fixing the values before and after the decimal
		-- double(before decimal values you can place or you will get , after decimal values you can place or you will get)
		create table test4( price double(6,2));
        insert into test4 values (0.93848983873); -- only 2 decimal places
        insert into test4 values (44.93848983873);
        insert into test4 values (4456.93848983873);
        insert into test4 values (4563);
        insert into test4 values (45612.93848983873); -- gives error due to the values we fixes above (5 values we give here)
        select * from test4;
        
	-- char and varchar
		-- char
			-- memory consumption is more
            -- it is fast but cache memory is more
				create table test5( countrycode char(3) );
				insert into test5 values('ind');
				insert into test5 values('india'); -- this gives error due to the fixed number no of char 
				insert into test5 values('he      ');
				select * from test5;
                -- char_length removes white sapces from last but not from the start it counts them
				select char_length(countrycode) from test5;
                
		-- varchar
			-- not fixed size
            -- it takes white spaces till its memory is filled
				create table test6( countrycode varchar(3) );
				insert into test6 values('ind');
				insert into test6 values('india'); -- this gives error due to the fixed number no of varchar 
				insert into test6 values('he      '); -- data is truncate after 3
				select * from test6;
		
        