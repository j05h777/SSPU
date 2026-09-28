USE shopdb; 
-- 1. List each order with the customer's name and the order date.
select
	o.order_id,
    c.name,
    o.order_date
from customers c
inner join orders o
on c.customer_id=o.customer_id;
	
-- 2. List every customer with their number of orders, including customers who have none.
select
	c.customer_id,
    c.name,
    count(o.order_id) as number_of_orders
from customers c
left join orders o
	on c.customer_id=o.customer_id
group by
		c.customer_id,
        c.name;

-- 3. List all products priced above the average product price.
select *
from products 
where price>(
	select avg(price)
    from products
);

-- 4. Show the total revenue per category, excluding cancelled orders. (Revenue of a line = quantity × unit_price.)
select
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
from categories c
join products p
    on c.category_id = p.category_id
join order_items oi
    on p.product_id = oi.product_id
join orders o
    on oi.order_id = o.order_id
where o.status <> 'Cancelled'
group by 
	c.category_id, 
    c.category_name;

-- 5. Show only the categories whose total revenue exceeds ₹5,000.
select
	c.category_name,
    sum(oi.quantity * oi.unit_price) as total_revenue
from categories c
join products p
    on c.category_id = p.category_id
join order_items oi
	on oi.product_id = p.product_id
join orders o
	on o.order_id=oi.order_id
where o.status <> "Cancelled"
group by
	c.category_id,
    c.category_name
having sum(oi.quantity * oi.unit_price)>5000;

-- 6. List products priced above the average price within their own category.
select
	p.product_id,
    p.product_name,
    p.price,
	(
		select round(avg(p2.price),2)
		from products p2
		where p2.category_id = p.category_id 
	) as average_category_price
from products p
where p.price > (
    select avg(p2.price)
    from products p2
    where p2.category_id = p.category_id
);