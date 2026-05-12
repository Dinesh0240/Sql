use sakila;
create database joindb;
-- self join
/*

Amit
 ├── Neha
 │    ├── Rohit
 │    │     └── Meera
 │    └── Anjali
 │
 ├── Raj
 │    ├── Karan
 │    │     ├── Arjun
 │    │     └── Pooja
 │    └── Priya
 │           └── Nitin
 │
 └── Simran
      ├── Vikas
      │     └── Dev
      └── Sneha

*/

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);

use joindb;
select * from employees;

select empl.emp_id, empl.emp_name, empl.manager_id, mngr.emp_id, mngr.emp_name from employees as empl join employees as mngr where empl.manager_id=mngr.emp_id;

-- find that employe whose department is same as the department of its manager
	select empl.emp_id, empl.emp_name, empl.manager_id, empl.department from employees as empl;
    select  mngr.emp_id, mngr.emp_name, mngr.department from employees as mngr;
    
    select empl.emp_id, empl.emp_name, empl.manager_id, empl.department, mngr.emp_id, mngr.emp_name, mngr.department from employees as empl join employees as mngr where empl.department=mngr.department and empl.manager_id=mngr.emp_id;
	select e.emp_id, e.emp_name, e.department, e.manager_id, m.emp_id, m.emp_name from employees as e join employees as m where e.manager_id=m.emp_id and e.department=m.department;

-- find the empl name and its salary if it is greater than the salary of its manager
	select empl.emp_id, empl.emp_name, empl.manager_id, empl.salary, empl.department, mngr.emp_id, mngr.emp_name, mngr.salary, mngr.department from employees as empl join employees as mngr where empl.emp_id=mngr.emp_id and empl.salary>mngr.salary;
	
    select e.emp_id, e.emp_name, e.department, e.manager_id, e.salary, m.emp_id, m.emp_name, m.salary from employees as e join employees as m where e.manager_id=m.emp_id and e.salary>m.salary;
-- Questions
	-- show all the manager name with all the employee name
		select m.manager_id, m.emp_name, e.emp_id, e.emp_name from employees as e join employees as m where e.manager_id=m.emp_id;
	-- show employe with its grand manager
		select e.emp_id, e.emp_name, e.manager_id as e_manager_id , m.emp_id,  m.emp_name, m.manager_id as m_manager_id  from employees as e join employees as m where e.manager_id=m.emp_id;
		
		select e.emp_id, e.emp_name, e.manager_id as e_manager_id , m.emp_id,  m.emp_name, m.manager_id as m_manager_id  from employees as e left join employees as m on e.manager_id=m.emp_id;

		select e.emp_id, e.emp_name, e.manager_id as e_manager_id , m.emp_id,  m.emp_name, m.manager_id as m_manager_id, supermanager.emp_id, supermanager.emp_name 
        from employees as e 
        left join employees as m on e.manager_id = m.emp_id 
        left join employees as supermanager on m.manager_id =  supermanager.emp_id ;

	-- find the employees who are also the manager
    
	select * from employees;