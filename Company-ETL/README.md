# Company-ETL

## Project Overview

This project sets up a PostgreSQL database containing customer-related tables with intentionally introduced data issues. The purpose of this database is to simulate real-world dirty data scenarios and apply data cleaning techniques using PySpark before loading the cleaned data into a Data Warehouse (DWH) using a Star Schema.

## Database Schema

The database consists of the following tables:

### 1. `customers`

Stores customer information with various data inconsistencies, such as:

- Duplicate records (e.g., `John Doe` vs. `john doe`)
- Missing email and phone values
- Inconsistent address formatting

### 2. `orders`

Stores order transactions with the following data issues:

- Invalid dates (e.g., `2024-02-30`)
- Missing amounts
- Inconsistent status values (e.g., `Completed` vs. `completed`)

### 3. `payments`

Stores payment details with:

- Invalid dates (e.g., `2024-02-31`)
- Missing amounts
- Inconsistent payment method names (e.g., `Credit Card` vs. `credit card`)

## Data Cleaning and ETL Process

1. **Extract** the dirty data from PostgreSQL.
2. **Transform** the data using PySpark:
   - Standardize text formatting.
   - Remove duplicates.
   - Fix incorrect or missing values.
   - Convert invalid dates.
3. **Load** the cleaned data into a Data Warehouse (DWH) using a **Star Schema**.

## Technologies Used

- **PostgreSQL** (Dirty data storage)
- **PySpark** (Data cleaning and transformation)
- **Apache Airflow** (ETL orchestration)
- **Docker** (Containerized environment for PostgreSQL and PySpark)

