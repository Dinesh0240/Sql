use sakila;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
department VARCHAR(50),
job_title VARCHAR(60),
salary DECIMAL(10,2),
hire_date DATE,
birth_date DATE,
phone VARCHAR(20),
city VARCHAR(50),
country VARCHAR(50),
is_active CHAR(1)
);

INSERT INTO employees VALUES
(1, 'Alice', 'Smith', 'alice.smith@gmail.com', 'IT', 'Software Engineer', 85000.00, '2019-03-15', '1990-06-20', '555-1001', 'New York', 'USA', 'Y'),
(2, 'Bob', 'Johnson', 'bob.j@yahoo.com', 'HR', 'HR Manager', 72000.00, '2020-07-01', '1985-11-05', '555-1002', 'Chicago', 'USA', 'Y'),
(3, 'Carol', 'Williams', 'carol.w@gmail.com', 'Finance', 'Accountant', 65000.00, '2018-01-10', '1992-03-14', '555-1003', 'Houston', 'USA', 'Y'),
(4, 'David', 'Brown', 'david.b@outlook.com', 'IT', 'DevOps Engineer', 90000.00, '2021-05-20', '1988-09-25', '555-1004', 'Los Angeles', 'USA', 'Y'),
(5, 'Emma', 'Jones', 'emma.j@gmail.com', 'Marketing', 'Marketing Lead', 78000.00, '2017-11-30', '1991-07-08', '555-1005', 'Phoenix', 'USA', 'Y'),
(6, 'Frank', 'Garcia', 'frank.g@yahoo.com', 'Sales', 'Sales Representative', 55000.00, '2022-02-14', '1994-02-28', '555-1006', 'Philadelphia', 'USA', 'N'),
(7, 'Grace', 'Martinez', 'grace.m@gmail.com', 'IT', 'QA Engineer', 68000.00, '2020-09-01', '1993-12-01', '555-1007', 'San Antonio', 'USA', 'Y'),
(8, 'Henry', 'Davis', 'henry.d@outlook.com', 'Finance', 'Financial Analyst', 76000.00, '2019-06-15', '1989-04-17', '555-1008', 'San Diego', 'USA', 'Y'),
(9, 'Isla', 'Wilson', 'isla.w@gmail.com', 'HR', 'Recruiter', 60000.00, '2021-10-05', '1995-08-22', '555-1009', 'Dallas', 'USA', 'Y'),
(10, 'Jack', 'Moore', 'jack.m@yahoo.com', 'Marketing', 'SEO Specialist', 58000.00, '2023-01-09', '1997-01-15', '555-1010', 'San Jose', 'USA', 'Y'),
(11, 'Karen', 'Taylor', 'karen.t@gmail.com', 'Sales', 'Sales Manager', 82000.00, '2016-04-20', '1984-05-30', '555-1011', 'Austin', 'USA', 'Y'),
(12, 'Liam', 'Anderson', 'liam.a@outlook.com', 'IT', 'Data Scientist', 95000.00, '2020-11-15', '1987-10-10', '555-1012', 'Jacksonville', 'USA', 'Y'),
(13, 'Mia', 'Thomas', 'mia.t@gmail.com', 'Finance', 'Tax Consultant', 71000.00, '2022-06-01', '1993-06-15', '555-1013', 'Columbus', 'USA', 'Y'),
(14, 'Noah', 'Jackson', 'noah.j@yahoo.com', 'IT', 'System Admin', 80000.00, '2018-08-25', '1990-02-14', '555-1014', 'Charlotte', 'USA', 'N'),
(15, 'Olivia', 'White', 'olivia.w@gmail.com', 'HR', 'HR Assistant', 50000.00, '2023-03-20', '1998-09-05', '555-1015', 'Indianapolis', 'USA', 'Y'),
(16, 'Paul', 'Harris', 'paul.h@outlook.com', 'Marketing', 'Content Writer', 52000.00, '2021-07-10', '1996-11-20', '555-1016', 'San Francisco', 'USA', 'Y'),
(17, 'Quinn', 'Clark', 'quinn.c@gmail.com', 'Sales', 'Sales Representative', 56000.00, '2022-09-15', '1995-04-11', '555-1017', 'Seattle', 'USA', 'Y'),
(18, 'Rachel', 'Lewis', 'rachel.l@yahoo.com', 'Finance', 'Budget Analyst', 73000.00, '2019-12-01', '1991-01-30', '555-1018', 'Denver', 'USA', 'Y'),
(19, 'Sam', 'Robinson', 'sam.r@gmail.com', 'IT', 'Cloud Architect', 105000.00, '2017-05-22', '1986-07-19', '555-1019', 'Nashville', 'USA', 'Y'),
(20, 'Tina', 'Walker', 'tina.w@outlook.com', 'HR', 'Training Manager', 69000.00, '2020-03-08', '1988-12-03', '555-1020', 'Baltimore', 'USA', 'Y'),
(21, 'Uma', 'Hall', 'uma.h@gmail.com', 'Marketing', 'Brand Manager', 77000.00, '2018-10-17', '1990-08-25', '555-1021', 'Louisville', 'USA', 'N'),
(22, 'Victor', 'Young', 'victor.y@yahoo.com', 'Sales', 'Sales Director', 98000.00, '2015-02-10', '1980-03-07', '555-1022', 'Portland', 'USA', 'Y');

select * from employees;
-- Q1
select emp_id, first_name, last_name, department, salary from employees where salary between 65000 and 85000;

select * from employees;

-- Q2
select emp_id, first_name, last_name, department, job_title from employees where department in ('IT', 'Finance');
-- or this 
select emp_id, first_name, last_name, department, job_title from employees where department='IT' or deparment='Finance';

-- Q3
select emp_id, first_name, last_name, department from employees where last_name like '%son';
-- or this
select emp_id, first_name, last_name,substr(last_name,-3) from employees where substr(last_name,-3)='son';

-- Q4
select emp_id, first_name, last_name, job_title, salary from employees where is_active='Y' and department='IT';

-- Q5
select emp_id, upper(first_name) as first_name_upper , lower(last_name) as last_name_lower ,salary from employees;


-- Q6
select emp_id,first_name,char_length(first_name) as name_length ,department from employees where char_length(first_name)>4;

-- Q7
select emp_id,concat(first_name,' ',last_name) as full_name ,char_length(concat(first_name,' ',last_name)) as full_name_length,department from employees where department= 'Marketing';


-- Q8
select * from employees;

select emp_id, first_name, last_name, hire_date, year(hire_date) as hire_year, year(current_date()) - year(hire_date) as years_ago from employees; 


-- Q9
select emp_id, first_name,last_name,salary,round(salary,-4) as rounded_salary, round(salary,-4) - salary as salary_remainder from employees where department='IT';
-- or this
select emp_id, first_name,last_name,salary,round(salary,-4) as rounded_salary, mod(round(salary,-4),salary) as salary_remainder from employees where department='IT';

-- Q!0
select emp_id, first_name, last_name,email from employees where email like '%@outlook.com';

-- Q11
select emp_id, first_name, last_name, hire_date, datediff(now(),hire_date) as days_employed from employees where  datediff(now(),hire_date)>2000 ;


-- Q12
select emp_id, first_name, last_name, email, substr(email,1,instr(email,'@')-1) from employees where department = 'HR';

-- Q13 
select concat(first_name,' ', last_name) as full_name, department, salary from employees where department = 'Sales' or department = 'HR' or department = 'Marketing' and salary!= salary between 60000 and 80000;

-- Q14
select emp_id, first_name,last_name, email, upper(substr(email,1,instr(email,'@')-1)) as username_upper, char_length((substr(email,1,instr(email,'@')-1))) as username_length from employees where char_length((substr(email,1,instr(email,'@')-1)))>6 ;

-- Q15
select * from employees;
select emp_id, concat(first_name, ' ',last_name) as full_name, birth_date,year(now()) - year(birth_date) as age,salary  from employees where salary>65000 order by age;