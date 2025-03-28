# Data Engineering Project

## Overview
This project is a **Data Engineering Pipeline** that extracts raw customer data from an unclean PostgreSQL database, processes and cleans the data using **PySpark**, and loads it into a **Data Warehouse (DWH)**

## Technologies Used
- **PySpark**: Data processing and cleaning
- **Airflow**: Orchestrating ETL workflows
- **PostgreSQL**: Storing raw data and Data Warehouse
- **Docker**: Containerization for reproducibility

## Project Workflow
1. **Extract:** Load raw customer data from a PostgreSQL database.
2. **Transform:**
   - Handle missing values
   - Remove duplicates
   - Fix data inconsistencies
3. **Load:** Store cleaned data in a Data Warehouse

## Setup Instructions
### Prerequisites
- Docker installed
- Python 3.x
- PostgreSQL instance running
- Apache Airflow set up

## Data Cleaning Strategy
- **Missing Values:**
  - Fill missing numeric values with the mean/median.
  - Drop rows with critical missing fields.
- **Duplicate Removal:**
  - Deduplicate based on unique constraints.
- **Data Consistency:**
  - Standardize date formats.
  - Normalize categorical values.



