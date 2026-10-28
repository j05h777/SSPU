use shopdb;

# 1. Create a view named vw_order_value(order_id, customer, order_value) that gives each order's total value; query the view.
create or replace view vw_order_value as 
select
    o.order_id,
    name as customer,
    sum(oi.quantity * p.price) as order_value
from orders o
join customers c
	on o.customer_id=c.customer_id
join order_items oi
	on o.order_id=oi.order_id
join products p
	on oi.product_id=p.product_id
group by
	o.order_id,
    c.name;
    
select * from vw_order_value;

# 2. Create an index on orders(customer_id)
create index idx_create_customer_id
on orders(customer_id);

show index from orders;

# 3. Using a Common Table Expression, compute the revenue for each month, then add a column showing the month-over-month change (use an appropriate window function).
with monthly_revenue as (
	select
		date_format(o.order_date, '%Y-%m') as month,
		sum(oi.quantity * p.price) as revenue
    from orders o
    join order_items oi
        on o.order_id = oi.order_id
    join products p
        on oi.product_id = p.product_id
    group by o.order_date 
)
select
	month,
    revenue,
    lag(revenue) over (order by month) as previous_month_revenue,
    revenue - lag(revenue) over (order by month) as month_over_month_change
from monthly_revenue
order by month;

# 4. Using a window function, rank the products by revenue within each category (ranking should restart for each category).
with product_revenue as(
	select
		c.category_id,
        c.category_name,
        p.product_id,
        p.product_name,
        sum(oi.quantity*p.price) as revenue        
	from products p
    join order_items oi
		on p.product_id=oi.product_id
	join categories c
		on c.category_id=p.category_id
	group by
    	p.category_id,
        p.product_id,
        p.product_name
)
select
	category_id,
    category_name,
    product_id,
    product_name,
    revenue,
    rank() over (
		partition by category_id
        order by category_name desc
	) as revenue_rank
from product_revenue
order by 
	category_id,
    revenue_rank;