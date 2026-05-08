-- numberic  functions
-- round function
	select 43.76;
	select 43.76,round(43.26);
	-- 0.5 ke aage agr value hogi toh round off krega nhi toh nhi krega

	select 43.26, round(43.26),round(43.24,1);
	-- this gives 43.2 and here 1 is the decimal value after the decimal which we have to round off
	-- so it checks the next value of the decimal value which we have to round off
	select 43.26, round(43.26),round(43.26,1);
	-- this gives 43.3	

	-- when we have to round off the value before the decimal
		select 43.647,round(3.647,-1);
		 -- they are converted to the decimal value which it is nearest to 
		select 16.647,round(16.647,-1);
		
		select 36.647,round(36.647,-2);
		
		select 475, round(475,-1);
		select 475, round(475,-2);
	  
		select 463,round(463,-2); -- converted to 0 since -3 place must be either greater then or equal to 5
		select 565,round(565,-3); -- converted to 1000 since -3 place must be either greater then or equal to 5


-- truncate function
	-- to extract values upto two decimal values
    -- while round off roundoff the values
    -- we don't use truncate for negative
    select round(345.6859,2), truncate(345.6859,2);
    
    
-- mod function

-- floor function
	-- mod values
	select 4.99999, floor(4.349999); -- output ->4
    
-- ceil function-
	-- converted to upper value always
	select 5.99999, ceil(5.9999999);
	select 4.99999, ceil(4.000123);



--