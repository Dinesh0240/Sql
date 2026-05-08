-- srting functions
-- number, dates
use sakila;
select * from customer;

-- date format
-- yyyy-mm-dd
	select current_date();

-- current time function
	-- gives time current
	select current_time();
    
-- current timestamp function
	-- gives date and time both
	select current_timestamp();

-- now method
	-- current date and time both
	select current_timestamp(), now();
    
    select payment_id, payment_date, now() from payment;
    
-- adddate
    -- we can add how much days you want to add
        select payment_id, payment_date, adddate(payment_date,2) from payment;
	-- can also add in negative it will subtract that days
    
    -- we can add/subtract hours,months,year aslo through adddate method
		select payment_id, payment_date, adddate(payment_date,interval -5 year) from payment;

-- datediff function
	-- we can find the difference of the days or date through this method
    -- can do comparision between diffenet dates 
    select payment_id, datediff(now(),payment_date) from payment;
    
	select payment_id, payment_date from payment;
	-- to extract month we use month function
		select payment_id, month(payment_date) from payment;
        
	-- find specific month using month function
		select payment_id, payment_date, month(payment_date) from payment where month(payment_date) = 2;
        
	-- for specific year using year function
		select payment_id, payment_date, year(payment_date) from payment where year(payment_date)=2006;
	
    -- to month,year,minutes,hours,days,quarter
		-- we use extract method
        select payment_id,payment_date,extract(day from payment_date) from payment;
        
	-- date format 
		-- 
        select payment_date, month(payment_date) from payment;
        -- small y gives only year i.e. 05
        -- capital y gives full i.e. 2005
			select payment_date, date_format(payment_date, '%Y') from payment;
        -- for current_date is  d
			select payment_date, date_format(payment_date, 'current date is %d') from payment;
		-- for current hours h 
			select payment_date, date_format(payment_date, 'current hour is %h') from payment;
		-- for current month m
			select payment_date, date_format(payment_date, 'current minute is %m') from payment;
		-- for current second s
			select payment_date, date_format(payment_date, 'current minute is %s') from payment;
		
        