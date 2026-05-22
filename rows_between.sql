create database rjdb;

use rjdb;
drop table sales;
CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 200),
(5, '2026-01-05', 500);

select * from sales;
-- lag(column name, offset)
-- when showing previous row infront of other we use lag
	select *, lag(sale_date, 1) over() from sales;
    
-- lead(column name, offset)
	-- lets you access data from a subsequent (following) row in the same result set without needing to join the table to itself
	select *, lead(sale_date, 1) over() from sales;
    select *, lead(sale_date, 1) over(order by amount desc) from sales;
    -- when null is not needed then we can pritn the value you want 
		select *, lead(sale_date, 1, 0) over(order by amount desc) from sales;
    
    
-- rows between
	-- running sum
		-- when asked culumative sum then use rows between not order by
		select *, sum(amount) over( rows between unbounded preceding and current row ) from sales;
        select *,sum(amount) over(order by amount) from sales;
        
	-- current row sum and its previous row sum(n-preceding)
		select *, sum(amount) over( rows between 2 preceding and current row ) from sales;
        
	-- (following)
		select *, sum(amount) over( rows between unbounded preceding and 1 following ) from sales;
        
	-- calaculate sum of current row and next row
		select id,sale_date,amount,
        sum(amount) over(order by sale_date rows between current row and 1 following) as current_next_sum
        from sales;
		
-- learning assignment
	-- constraints
    -- learn full sql till now