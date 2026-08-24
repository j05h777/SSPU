CREATE TABLE dim_category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    category_type VARCHAR(50)
);

ALTER TABLE dim_product
ADD COLUMN category_id INT;

ALTER TABLE dim_product
ADD CONSTRAINT fk_product_category
FOREIGN KEY (category_id)
REFERENCES dim_category(category_id);

INSERT INTO dim_category
(category_id, category_name, category_type)
VALUES
(1, 'Electronics', 'Technology'),
(2, 'Clothing', 'Apparel'),
(3, 'Appliances', 'Home'),
(4, 'Furniture', 'Home'),
(5, 'Footwear', 'Apparel'),
(6, 'Accessories', 'Lifestyle');

UPDATE dim_product
SET category_id = 1
WHERE product_id IN (1, 2, 3, 10);

UPDATE dim_product
SET category_id = 2
WHERE product_id IN (4, 5);

UPDATE dim_product
SET category_id = 3
WHERE product_id = 6;

UPDATE dim_product
SET category_id = 4
WHERE product_id = 7;

UPDATE dim_product
SET category_id = 5
WHERE product_id = 8;

UPDATE dim_product
SET category_id = 6
WHERE product_id = 9;