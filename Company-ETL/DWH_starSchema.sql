CREATE TABLE Dim_Customer (
    customer_id SERIAL PRIMARY KEY,
    full_name TEXT,
    email TEXT,
    phone TEXT,
    address TEXT
);

CREATE TABLE Dim_Date (
    date_id SERIAL PRIMARY KEY,
    full_date DATE UNIQUE,
    year INT,
    month INT,
    day INT,
    weekday TEXT
);

CREATE TABLE Dim_Payment_Method (
    method_id SERIAL PRIMARY KEY,
    method TEXT UNIQUE
);

CREATE TABLE Fact_Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Dim_Customer(customer_id),
    order_date INT REFERENCES Dim_Date(date_id),
    amount NUMERIC,
    payment_method INT REFERENCES Dim_Payment_Method(method_id)
);
