SELECT 'Customers' AS Table_Name, COUNT(*) AS Records FROM dim_customer
UNION ALL
SELECT 'Products', COUNT(*) FROM dim_product
UNION ALL
SELECT 'Dates', COUNT(*) FROM dim_date
UNION ALL
SELECT 'Stores', COUNT(*) FROM dim_store
UNION ALL
SELECT 'Sales', COUNT(*) FROM fact_sales;