-- like operator
	-- use to search for the pattern/character
    
    -- % --> zero or more than 1 character
    -- B% --> B,BAD uske baad kuch bhi
    -- %y --> last leetter y us se phele kuch bhi 
    -- B%y --> first B and last y dono ke bich m kuch bhi 
use sakila;
select * from customer where first_name='M';

select * from customer where first_name like 'J%O';

-- starting two leter JO but only character
-- % denotes multiple character means koi bhi character
-- underscore(-) denotes that at underscore anything aage ya piche  jo letter h sirf woh

select * from customer  where first_name like '%OY_';
select * from customer  where first_name like 'Y_%';
select * from customer where first_name like 'JO%';
select * from  customer where first_name like 'JO_%';
select * from customer where first_name like 'A___%';
select * from customer where first_name like 'A_A%';
select * from customer where first_name like '%AA%'; 	-- a khi bhi aah sktah because % is there

-- not like
select * from customer where first_name not like '%A%';
