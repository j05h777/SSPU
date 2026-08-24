	INSERT INTO dim_customer
(customer_id, customer_name, city, state, region)
VALUES
(1, 'Rahul Sharma', 'Mumbai', 'Maharashtra', 'West'),
(2, 'Priya Patel', 'Ahmedabad', 'Gujarat', 'West'),
(3, 'Arjun Kumar', 'Chennai', 'Tamil Nadu', 'South'),
(4, 'Sneha Reddy', 'Hyderabad', 'Telangana', 'South'),
(5, 'Vikram Singh', 'Delhi', 'Delhi', 'North'),
(6, 'Ananya Das', 'Kolkata', 'West Bengal', 'East'),
(7, 'Rohan Mehta', 'Pune', 'Maharashtra', 'West'),
(8, 'Neha Nair', 'Bangalore', 'Karnataka', 'South'),
(9, 'Amit Verma', 'Jaipur', 'Rajasthan', 'North'),
(10, 'Kavya Rao', 'Bangalore', 'Karnataka', 'South');

INSERT INTO dim_product
(product_id, product_name, category, brand)
VALUES
(1, 'Laptop', 'Electronics', 'Dell'),
(2, 'Smartphone', 'Electronics', 'Samsung'),
(3, 'Headphones', 'Electronics', 'Sony'),
(4, 'T-Shirt', 'Clothing', 'Nike'),
(5, 'Jeans', 'Clothing', 'Levis'),
(6, 'Coffee Maker', 'Appliances', 'Philips'),
(7, 'Office Chair', 'Furniture', 'IKEA'),
(8, 'Running Shoes', 'Footwear', 'Adidas'),
(9, 'Backpack', 'Accessories', 'Wildcraft'),
(10, 'Smart Watch', 'Electronics', 'Apple');

INSERT INTO dim_date
(date_id, full_date, day, month, year)
VALUES
(1, '2025-01-01', 1, 1, 2025),
(2, '2025-01-02', 2, 1, 2025),
(3, '2025-01-03', 3, 1, 2025),
(4, '2025-01-04', 4, 1, 2025),
(5, '2025-01-05', 5, 1, 2025),
(6, '2025-01-06', 6, 1, 2025),
(7, '2025-01-07', 7, 1, 2025),
(8, '2025-01-08', 8, 1, 2025),
(9, '2025-01-09', 9, 1, 2025),
(10, '2025-01-10', 10, 1, 2025);

INSERT INTO dim_store
(store_id, store_name, city, state, region)
VALUES
(1, 'Mumbai Central Store', 'Mumbai', 'Maharashtra', 'West'),
(2, 'Ahmedabad Mall Store', 'Ahmedabad', 'Gujarat', 'West'),
(3, 'Chennai Central Store', 'Chennai', 'Tamil Nadu', 'South'),
(4, 'Hyderabad City Store', 'Hyderabad', 'Telangana', 'South'),
(5, 'Delhi Main Store', 'Delhi', 'Delhi', 'North'),
(6, 'Kolkata Mall Store', 'Kolkata', 'West Bengal', 'East'),
(7, 'Pune City Store', 'Pune', 'Maharashtra', 'West'),
(8, 'Bangalore Central Store', 'Bangalore', 'Karnataka', 'South'),
(9, 'Jaipur Main Store', 'Jaipur', 'Rajasthan', 'North'),
(10, 'Bangalore Mall Store', 'Bangalore', 'Karnataka', 'South');

INSERT INTO fact_sales
(sale_id, date_id, customer_id, store_id, product_id, Quantity, sales_amount, profit)
VALUES
(1, 1, 1, 1, 1, 2, 120000.00, 18000.00),
(2, 2, 2, 2, 2, 3, 90000.00, 13500.00),
(3, 3, 3, 3, 3, 2, 12000.00, 2400.00),
(4, 4, 4, 4, 4, 5, 7500.00, 1500.00),
(5, 5, 5, 5, 5, 2, 5000.00, 1000.00),
(6, 6, 6, 6, 6, 1, 6000.00, 1200.00),
(7, 7, 7, 7, 7, 2, 16000.00, 3200.00),
(8, 8, 8, 8, 8, 3, 21000.00, 4200.00),
(9, 9, 9, 9, 9, 2, 5000.00, 1000.00),
(10, 10, 10, 10, 10, 1, 30000.00, 6000.00);