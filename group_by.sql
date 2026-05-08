-- grouping 
	-- for grouping we use group by
		-- a statment which is used to group similar values in a group so that we can perfrom calculation on that group

	use sakila;
	select  * from employees;

	select sum(salary) from employees where department='IT';

	select sum(salary) from employees where department='Finance';

		-- the column on which wee have to perform group by ,only that column is only select 
        -- only apply on the column which have similar values
        -- calculations can be performed
	select  department from employees  group by department;
    
    
-- count 
-- through this we can find the no of rows in that group
	select department, count(department) from employees group by department;
    
    select department, count(department), sum(salary) from employees group by department;
    
    -- these operations are performed on the particular group 
	select department, count(department), sum(salary), avg(salary) from employees group by department;
    
    
    select job_title from employees group by job_title;
    
     
    select job_title, count(job_title), sum(salary) from employees group by job_title;
    
    select job_title, count('Software Engineer'), sum(salary) from employees  where  job_title = 'Software Engineer';
    
    
    
    select * from payment;
    
   -- Questions 
    -- from the payment table find the total amount and avg amount
    -- from this payment table find no of transactions done by customer id 1
    -- find the total transaction done by customer id 2 and 5
    -- find the average amount spend in the year 2005
    
    select amount, count(amount), sum(amount), avg(amount) from payment group by amount;
    
    select customer_id,count('customer_id'),count(amount) from payment where customer_id=1;
    
    select customer_id,count('customer_id'),count(amount) from payment  where customer_id=2;
    
    select payment_date from employees where payment_date=2005;
    
    -- find the total transaction done by each customer id
		select * from payment;
        select customer_id, count(amount) from payment group by customer_id;
        
    -- find the total transactions and the total amount spend after the customer id 3
		select customer_id,count(amount),sum(amount) from payment where customer_id>3 group by customer_id;
        
    -- find the occurance of each amount value
		select amount, count(amount) from payment group by amount order by amount;
        
    -- find the total amount given in your table
		select amount, count(amount), sum(amount) from payment group by amount order by amount;
        select sum(amount) from payment;
        
    -- get the average amount spend by each staff
		select * from payment;
        select staff_id,count(amount), sum(amount), avg(amount) from payment group by staff_id;
        
    -- get the  total amount spend in each month
		select  month(payment_date),sum(amount) from payment group by month(payment_date) order by month(payment_date);
        select distinct month(payment_date) from payment;
        
        
    -- get the total amount spend for each month of each year 
		select distinct year(payment_date) from payment;
		select year(payment_date), month(payment_date), sum(amount) from payment group by year(payment_date), month(payment_date) order by year(payment_date);
		select month(payment_date), year(payment_date) from payment;
        
    -- learning assigment
		-- import employee database 
    use sakila;