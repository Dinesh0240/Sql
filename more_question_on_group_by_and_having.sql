use sakila;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
category VARCHAR(30) NOT NULL,
product VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL
);

INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1,
55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3,
1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2,
18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4,
3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1,
22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2,
4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1,
8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5,
2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2,
3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1,
15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1,
25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3,
1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2,
6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3,
2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2,
9500, '2024-02-25');

select * from orders;
-- Q1 
	select city,count(city) from orders group by city order by city;

-- Q2
	select category,sum(price*quantity) as total_revenue from orders group by category order by total_revenue desc;
    
-- Q3
	select category,count(product) from orders group by category order by category;
    
-- Q4
	select city,round(avg(price),2) from orders group by city order by city;
    
-- Q5
	select category,max(price) from orders group by category order by category;
    
-- Q6
	select city,min(price) from orders group by city order by city;
    
-- Q7
	select category,sum(quantity) from orders group by category;
    
-- Q8
	select * from orders;
	select city,sum(quantity) from orders group by city order by sum(quantity) desc;
    
-- Q9
	select city,count(city) from orders  group by city having count(city)>3 order by city;
    
-- Q10
	select  category,sum(price*quantity) as total_revenue from orders group by category having total_revenue>50000;

-- Q11
	select city,round(avg(price),2) as avg_price from orders group by city having avg_price>10000 order by avg_price desc;
    
-- Q12
	select city,sum(price*quantity) as total_revenue from orders where category='electronics' group by city order by total_revenue desc;
    
-- Q13 
	select category,sum(quantity) as total_quantity from orders group by category having total_quantity>8 order by total_quantity desc; use sakila;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
category VARCHAR(30) NOT NULL,
product VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL
);

INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1,
55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3,
1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2,
18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4,
3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1,
22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2,
4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1,
8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5,
2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2,
3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1,
15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1,
25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3,
1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2,
6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3,
2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2,
9500, '2024-02-25');

select * from orders;
-- Q1 
	select city,count(city) from orders group by city order by city;

-- Q2
	select category,sum(price*quantity) as total_revenue from orders group by category order by total_revenue desc;
    
-- Q3
	select category,count(product) from orders group by category order by category;
    
-- Q4
	select city,round(avg(price),2) from orders group by city order by city;
    
-- Q5
	select category,max(price) from orders group by category order by category;
    
-- Q6
	select city,min(price) from orders group by city order by city;
    
-- Q7
	select category,sum(quantity) from orders group by category;
    
-- Q8
	select * from orders;
	select city,sum(quantity) from orders group by city order by sum(quantity) desc;
    
-- Q9
	select city,count(city) from orders  group by city having count(city)>3 order by city;
    
-- Q10
	select  category,sum(price*quantity) as total_revenue from orders group by category having total_revenue>50000;

-- Q11
	select city,round(avg(price),2) as avg_price from orders group by city having avg_price>10000 order by avg_price desc;
    
-- Q12
	select city,sum(price*quantity) as total_revenue from orders where category='electronics' group by city order by total_revenue desc;
    
-- Q13 
	select category,sum(quantity) as total_quantity from orders group by category having total_quantity>8 order by total_quantity desc; 
    
-- Q15
	select city,min(price) from orders group by city having min(price)<2000 ;