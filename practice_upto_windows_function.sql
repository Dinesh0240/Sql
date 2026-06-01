create database practice;
use practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO employees VALUES
(101,'Alice Johnson','IT',72000,NULL),
(102,'Bob Smith','IT',65000,101),
(103,'Carol White','HR',58000,NULL),
(104,'David Brown','HR',54000,103),
(105,'Eva Green','Finance',80000,NULL),
(106,'Frank Black','Finance',75000,105),
(107,'Grace Lee','IT',68000,101),
(108,'Henry Wilson','Marketing',60000,NULL),
(109,'Ivy Turner','Marketing',56000,108),
(110,'Jack Davis','Finance',70000,105),
(111,'Karen Moore','IT',63000,101),
(112,'Leo Harris','HR',50000,103),
(113,'Mia Clark','Marketing',62000,108),
(114,'Nate Lewis','Finance',78000,105),
(115,'Olivia Walker','IT',71000,101),
(116,'Paul Hall','HR',53000,103),
(117,'Quinn Young','Marketing',59000,108),
(118,'Rachel King','Finance',82000,105),
(119,'Sam Scott','IT',66000,101),
(120,'Tina Adams','HR',55000,103);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50),
    join_year INT
);

INSERT INTO customers VALUES
(201,'Aarav Mehta','Mumbai','India',2021),
(202,'Priya Sharma','Delhi','India',2020),
(203,'Rohan Gupta','Pune','India',2022),
(204,'Sunita Patel','Ahmedabad','India',2021),
(205,'Vikram Rao','Bangalore','India',2019),
(206,'Neha Singh','Chennai','India',2023),
(207,'Arjun Kumar','Hyderabad','India',2020),
(208,'Deepa Nair','Kochi','India',2022),
(209,'Sanjay Joshi','Jaipur','India',2021),
(210,'Meera Iyer','Coimbatore','India',2023),
(211,'Ravi Verma','Lucknow','India',2020),
(212,'Anita Das','Kolkata','India',2019),
(213,'Kiran Reddy','Vizag','India',2022),
(214,'Pooja Shah','Surat','India',2021),
(215,'Amit Bose','Nagpur','India',2023),
(216,'Tara Menon','Trivandrum','India',2020),
(217,'Nikhil Kulkarni','Nashik','India',2022),
(218,'Swati Chatterjee','Bhopal','India',2019),
(219,'Rahul Pandey','Patna','India',2021),
(220,'Divya Tiwari','Indore','India',2023);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_qty INT
);

INSERT INTO products VALUES
(301,'Laptop','Electronics',55000,30),
(302,'Smartphone','Electronics',22000,80),
(303,'Headphones','Electronics',3500,120),
(304,'Monitor','Electronics',18000,45),
(305,'Keyboard','Accessories',1500,200),
(306,'Mouse','Accessories',900,250),
(307,'Desk Chair','Furniture',8500,40),
(308,'Standing Desk','Furniture',22000,15),
(309,'Webcam','Electronics',4200,70),
(310,'USB Hub','Accessories',1200,180),
(311,'Notebook','Stationery',150,500),
(312,'Pen Set','Stationery',250,600),
(313,'Printer','Electronics',12000,25),
(314,'Scanner','Electronics',9000,20),
(315,'External SSD','Electronics',7500,60),
(316,'Lamp','Furniture',2200,90),
(317,'Whiteboard','Office Supplies',3800,35),
(318,'Cable Organiser','Accessories',600,300),
(319,'Power Bank','Electronics',2800,100),
(320,'Smart Watch','Electronics',15000,55);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1001,201,301,1500,'2024-01-05'),
(1002,202,302,2300,'2024-01-12'),
(1003,203,303,800,'2024-02-03'),
(1004,201,304,3200,'2024-02-14'),
(1005,204,301,1100,'2024-03-01'),
(1006,205,302,4500,'2024-03-15'),
(1007,202,303,950,'2024-03-22'),
(1008,206,304,2100,'2024-04-05'),
(1009,203,301,1750,'2024-04-18'),
(1010,207,302,3300,'2024-04-30'),
(1011,204,303,680,'2024-05-10'),
(1012,208,304,2900,'2024-05-22'),
(1013,205,301,1200,'2024-06-08'),
(1014,201,302,2700,'2024-06-15'),
(1015,209,303,500,'2024-06-28'),
(1016,206,304,3800,'2024-07-07'),
(1017,207,301,1600,'2024-07-19'),
(1018,210,302,4100,'2024-07-25'),
(1019,208,303,720,'2024-08-02'),
(1020,209,304,2200,'2024-08-14');

select * from employees;
-- Q1. List each department along with the number of employees in it.
	select department, count(emp_name) from employees group by department order by department;
-- Q2. Find departments where the average salary is greater than 60,000.
	select department, round(avg(salary),2) as avg_salary 
    from employees 
    group by department having round(avg(salary)>60000,2) order by department;	
-- Q3. Show the total salary paid per department, ordered by total salary descending.
	select department, sum(salary) from employees group by department order by sum(salary) desc;
-- Q4. Find departments that have more than 4 employees AND an average salary above 55,000.
	select department, count(emp_name) as emp_count, round(avg(salary),2) as avg_salary 
    from employees 
    group by department having count(emp_name)>4 and avg(salary)>55000 order by department;	
select * from customers;
select * from orders;
-- Q5. Using the orders table, find customer_ids who have placed more than 2 orders and
-- whose total order amount exceeds 5,000.
	select c.customer_id, count(o.customer_id) , sum(o.amount)
    from customers as c join orders as o 
    on c.customer_id = o.customer_id 
    group by c.customer_id having count(o.customer_id)>=2 and sum(o.amount)>5000;


select * from employees;    
select * from customers;
select * from orders;
select * from products;

-- Topic 2
-- Q6. Show each customer's name along with the total number of orders they have placed.
	select c.customer_name, count(o.customer_id) 
    from customers as c join orders as o
    on c.customer_id = o.customer_id
    group by c.customer_name;
    
-- Q7. List each product name with the total revenue generated from orders.
	select p.product_name , sum(o.amount)
    from products as p join orders as o
    on p.product_id = o.product_id
    group by p.product_name;
    
-- Q3. Show each product category with the total quantity in stock.
	select p.category, sum(p.stock_qty)
    from products as p
    group by category order by category;
   
-- Q9 Find customers who have spent more than 3,000 in total, showing their name, city and total spend.
	select c.customer_name, c.city, sum(o.amount)
    from customers as c join orders as o
    on c.customer_id = o.customer_id
    group by c.customer_name, c.city
    having sum(o.amount)>3000
    order by sum(o.amount) desc;
  
-- Q10 For each product category, find the average order amount 
-- and the number of distinct customers who ordered products in that category.
    select p.product_name ,  round(sum(o.amount),0), count(distinct o.customer_id)
    from products as p
    join orders as o 
    on p.product_id = o.product_id
    join customers as c
    on o.customer_id = c.customer_id
    group by p.product_name;
    
-- Topic 3
-- Q11. List every employee along with their manager's name. 
-- Employees with no manager should still appear (show NULL or 'No Manager').
	select e.emp_name, m.emp_name
    from employees as e left  join employees as m 
    on e.manager_id = m.emp_id;
    
-- Q12 Show only those employees whose salary is higher than their manager's salary.
	select e.emp_name, e.salary , m.emp_name, m.salary 
    from employees as e
    join employees as m
    on e.manager_id = m.emp_id
    where e.salary > m.salary;
-- Q13 List all employees who are managed by 'Alice Johnson', showing the employee name and their department.
	select e.emp_id, e.emp_name, e.department
    from employees as e join employees as m
    on e.manager_id = m.emp_id
    where m.emp_name = 'Alice Johnson';
    
-- Q14 For each manager, show their name, department, and 
-- the average salary of their direct reports. Only
-- include managers who have at least 3 direct reports.
	select m.emp_name, m.department, count(e.emp_name), round(avg(e.salary),0)
    from employees as e join employees as m
    on e.manager_id = m.emp_id
    group by m.emp_name, mk.department
    having count(e.emp_name)>=3;
    
-- Topic 4
-- Q1. Find all employees who earn more than the average salary of all employees.
	select round(avg(salary),0) from employees;
    select emp_name, department, salary 
    from employees
    where salary>(select round(avg(salary),0) from employees);
-- Q2. Show the details of the employee who earns the highest salary in the company.
	select max(salary) from employees;
    select emp_id, emp_name, department, salary
    from employees 
    where salary = (select max(salary) from employees);
-- Q3. List all products whose price is greater than
	-- the average price of all products in the 'Electronics' category.
		select avg(price) from products where
select * from employees;    
select * from customers;
select * from orders;
select * from products;