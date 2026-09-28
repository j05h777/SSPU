use shopdb;
-- 2. Frame 4-5 business questions (revenue by category, top products, above-average customers,monthly trend).
-- 3. Write SQL using joins, subqueries and grouped aggregation to answer each.

-- a. Which products generate the highest revenue?  
select
	p.product_id,
    p.product_name,
    -- p.price,
    -- sum(oi.quantity) as total_units_ordered,
	sum(oi.quantity * oi.unit_price) as total_revenue
from products p
join order_items oi
	on p.product_id=oi.product_id
join orders o
	on o.order_id=oi.order_id
where
	o.status <> "Cancelled"
group by
	p.product_id
order by total_revenue desc;

-- b. How many orders are placed each month, and what is the monthly order trend?  
select
	year(order_date) as order_year,
    month(order_date) as order_month,
    count(order_date) as total_orders
from orders
group by
	order_year,
    order_month;
    
-- c. Which category has the highest number of products?
select
	c.category_id,
    c.category_name,
    count(p.product_id) as number_of_products
from categories c
join products p 
	on c.category_id=p.category_id
group by
	c.category_id,
    c.category_name
order by number_of_products desc
limit 1;

-- d. Which product categories have the highest average product price?  
select
	c.category_id,
    c.category_name,
    round(avg(p.price),2) as average_product_price
from categories c
join products p
	on c.category_id=p.category_id
group by
	c.category_id,
    c.category_name
order by average_product_price desc;

-- e. What is the total number of orders and total revenue generated in each order status?
select
	o.status,
    count(distinct o.order_id) as total_orders,
    sum(oi.quantity * oi.unit_price) as total_revenue
from orders o
join order_items oi
	on o.order_id=oi.order_id
group by o.status
order by total_revenue desc;

-- Which customers have placed two or more orders?
select
	c.customer_id,
    c.name,
    count(o.order_id) as orders_placed
from customers c
join orders o
	on c.customer_id=o.customer_id
group by
	c.customer_id,
    c.name
having orders_placed>=2
order by orders_placed desc;
