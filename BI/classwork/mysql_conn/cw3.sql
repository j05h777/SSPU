CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    customer_id INT,
    store_id INT,
    product_id INT,
    Quantity INT,
    sales_amount DECIMAL(12,2),
    profit DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);