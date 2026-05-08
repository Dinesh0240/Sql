use sakila;
select * from actor;

-- for comaprision 
select * from actor where actor_id=2;
select * from actor where actor_id!=2;
select * from actor where actor_id<>2;

-- between operator
-- between within a range
select * from actor where actor_id between 1 and 10;


