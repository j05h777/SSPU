CREATE DATABASE finance_db;
USE finance_db;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    date_of_birth DATE NOT NULL
);
CREATE TABLE account_types (
    account_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    interest_rate DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    
    CHECK (interest_rate >= 0)
);
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type_id INT NOT NULL,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    opened_date DATE NOT NULL,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_account_type
        FOREIGN KEY (account_type_id)
        REFERENCES account_types(account_type_id),

    CHECK (balance >= 0)
);
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    category_id INT NOT NULL,
    transaction_type VARCHAR(10) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATE NOT NULL,
    description VARCHAR(255),

    CONSTRAINT fk_transaction_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id),

    CONSTRAINT fk_transaction_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id),

    CHECK (transaction_type IN ('income', 'expense')),
    CHECK (amount > 0)
);


INSERT INTO customers
(name, email, phone, date_of_birth)
VALUES
('Aarav Sharma', 'aarav@gmail.com', '9876543210', '2001-05-12'),
('Priya Patel', 'priya@gmail.com', '9876543211', '2000-08-20'),
('Rahul Mehta', 'rahul@gmail.com', '9876543212', '1999-11-15'),
('Sneha Joshi', 'sneha@gmail.com', '9876543213', '2002-03-25'),
('Vikram Singh', 'vikram@gmail.com', '9876543214', '1998-07-10');

INSERT INTO account_types
(type_name, interest_rate)
VALUES
('Savings', 4.00),
('Current', 0.00),
('Fixed Deposit', 6.50);

INSERT INTO accounts
(customer_id, account_type_id, account_number, balance, opened_date)
VALUES
(1, 1, 'ACC10001', 50000.00, '2024-01-10'),
(2, 1, 'ACC10002', 75000.00, '2024-02-15'),
(3, 2, 'ACC10003', 120000.00, '2024-03-20'),
(4, 1, 'ACC10004', 45000.00, '2024-04-05'),
(5, 3, 'ACC10005', 200000.00, '2024-05-12');

INSERT INTO categories
(category_name)
VALUES
('Salary'),
('Food'),
('Rent'),
('Shopping'),
('Utilities'),
('Investment');

INSERT INTO transactions
(account_id, category_id, transaction_type, amount, transaction_date, description)
VALUES
(1, 1, 'income', 60000.00, '2024-06-01', 'Monthly salary'),
(1, 2, 'expense', 2500.00, '2024-06-03', 'Groceries and food'),
(1, 3, 'expense', 15000.00, '2024-06-05', 'Monthly rent'),
(2, 1, 'income', 55000.00, '2024-06-01', 'Monthly salary'),
(2, 4, 'expense', 5000.00, '2024-06-10', 'Clothing and shopping'),
(2, 5, 'expense', 3000.00, '2024-06-12', 'Electricity bill'),
(3, 1, 'income', 80000.00, '2024-06-01', 'Monthly salary'),
(3, 6, 'expense', 10000.00, '2024-06-15', 'Investment contribution'),
(4, 1, 'income', 50000.00, '2024-06-01', 'Monthly salary'),
(4, 2, 'expense', 3000.00, '2024-06-18', 'Food expenses'),
(5, 6, 'income', 15000.00, '2024-06-20', 'Investment return');

SELECT * FROM customers;

# View all accounts
SELECT
    a.account_id,
    c.name AS customer_name,
    at.type_name AS account_type,
    a.account_number,
    a.balance,
    a.opened_date
FROM accounts a
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN account_types at
    ON a.account_type_id = at.account_type_id;

# View transactions with account and category
SELECT
    t.transaction_id,
    c.name AS customer_name,
    a.account_number,
    cat.category_name,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    t.description
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN categories cat
    ON t.category_id = cat.category_id;
    
# constraint violation
INSERT INTO transactions
(account_id, category_id, transaction_type, amount, transaction_date, description)
VALUES
(1, 1, 'income', -5000.00, '2024-07-01', 'Invalid transaction');

INSERT INTO customers
(name, email, phone, date_of_birth)
VALUES
('Test User', 'aarav@gmail.com', '9999999999', '2000-01-01');