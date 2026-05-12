use shadidb;

CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);

INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from Employees;
select avg(salary) from employees;

select * from employees where salary>(select avg(salary) from employees);

select max(salary) from employees;
select * from employees where salary = (select max(salary) from employees);

select salary from employees where emp_id=101;
select * from employees where salary>(select salary from employees where emp_id=101);

select min(salary) from employees;
select name, department,salary from employees where salary=(select min(salary) from employees);


-- multi row subquery
	-- where there are multiple rows
    -- can not use comparision operator in this multi row query
    -- in for multiple values
	select salary from employees where name='Alice' or name ='Bob';
    select * from employees where salary = 50000 or salary = 80000;
    
    -- get the values where department is equal to the Alice or Bob's department
    select department from employees where name = 'Alice' or name ='Bob';
    select * from employees
    where department in (select department from employees where name = 'Alice' or name ='Bob');
    
    -- get the values whose salary is not equal to emp_id 103 or 105
    select salary from employees where emp_id = 103 or emp_id=105;
    select * from employees where salary not in (select salary from employees where emp_id = 103 or emp_id=105);
    
    -- any operator 
		-- inside query any
        -- any means kisi se bhi 
		select salary from employees where emp_id = 103 or emp_id=107;
		select * from employees where salary>any (select salary from employees where emp_id = 103 or emp_id=107);
        
        select salary from employees where emp_id = 103 or emp_id=107;
		select * from employees where salary<any (select salary from employees where emp_id = 103 or emp_id=107);
        
        select * from employees where department = 'HR';
        select * from employees where salary >any(select salary from employees where department = 'HR');
        
        select * from employees where department = 'HR';
        select * from employees where salary >all(select salary from employees where department = 'HR');
        
        -- greater then any salary of it department
        select salary from employees where department = 'IT';
        select * from employees where salary >all(select salary from employees where department = 'IT');
        
        -- jb sb m se nikalni ho values we use all
        
        select salary from employees where department = 'Finance';
        select * from employees where salary >any(select salary from employees where department = 'Finance');
        
        select * from employees;
        
        -- find the employee details who works in IT department have a salary greater than the salary of employe id 101
			select salary from employees where emp_id=101;
			select * from employees where salary>(select salary from employees where emp_id=101) and department = 'IT';
        
        -- find the name of a person whose salary is greater than all the salaries of HR or IT department
			select salary from employees where department='HR' or department='IT';
            select name from employees where salary>all(select salary from employees where department='HR' or department='IT');
            
        -- find the emp_id and the emp name of the users whose salary is greater than the salary of any employe working under the manager id 101
			select * from employees;
            
            select salary from employees where manager_id =101;
            select emp_id, name from employees where salary>any(select salary from employees where manager_id =101);
            
        -- find the second highest salary from this table
			select salary from employees;
        
			select max(salary) from employees;
            select max(salary) from employees where salary<(select max(salary) from employees) ;