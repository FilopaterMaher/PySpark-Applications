-- Create a dirty PostgreSQL database with customer-related tables

-- Create customers table with data issues
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name TEXT,
    email TEXT,
    phone TEXT,
    address TEXT,
    created_at TIMESTAMP
);

-- Insert inconsistent and duplicate customer data
INSERT INTO customers (full_name, email, phone, address, created_at)
SELECT 
    CASE WHEN random() > 0.1 THEN 'John Doe' ELSE 'john doe' END,
    CASE WHEN random() > 0.2 THEN 'john.doe' || floor(random() * 100)::TEXT || '@example.com' ELSE NULL END,
    CASE WHEN random() > 0.3 THEN '123-456-' || floor(random() * 9000 + 1000)::TEXT ELSE NULL END,
    CASE WHEN random() > 0.4 THEN '123 Elm Street' ELSE '123 Elm St.' END,
    NOW() - (interval '1 day' * floor(random() * 365))
FROM generate_series(1, 5000);

-- Create orders table with foreign key and data issues
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    amount NUMERIC,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert inconsistent order data
INSERT INTO orders (customer_id, order_date, amount, status)
SELECT 
    floor(random() * 5000 + 1)::INTEGER,
    CASE WHEN random() > 0.1 THEN (NOW() - (interval '1 day' * floor(random() * 365)))::DATE ELSE '2024-02-30'::DATE END,
    CASE WHEN random() > 0.2 THEN round(CAST(random() * 1000 AS NUMERIC), 2) ELSE NULL END,
    CASE WHEN random() > 0.3 THEN 'Completed' ELSE 'completed' END
FROM generate_series(1, 5000);

-- Create payments table with data issues
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    payment_date DATE,
    amount NUMERIC,
    method TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert inconsistent payment data
INSERT INTO payments (order_id, payment_date, amount, method)
SELECT 
    floor(random() * 5000 + 1)::INTEGER,
    CASE WHEN random() > 0.1 THEN (NOW() - (interval '1 day' * floor(random() * 365)))::DATE ELSE '2024-02-31'::DATE END,
    CASE WHEN random() > 0.2 THEN round(CAST(random() * 1000 AS NUMERIC), 2) ELSE NULL END,
    CASE WHEN random() > 0.3 THEN 'Credit Card' ELSE 'credit card' END
FROM generate_series(1, 5000);
