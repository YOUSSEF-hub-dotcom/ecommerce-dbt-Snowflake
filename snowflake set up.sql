-- 1. Create database
CREATE DATABASE IF NOT EXISTS ECOMMERCE_DB;

-- 2. Switch to the database
USE DATABASE ECOMMERCE_DB;

-- 3. Create schemas
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS STAGING;
CREATE SCHEMA IF NOT EXISTS MARTS;

-- 4. Set current schema context to RAW
USE SCHEMA ECOMMERCE_DB.RAW;

-- 5. Create raw customers table matching CSV columns
CREATE OR REPLACE TABLE RAW_CUSTOMERS (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    signup_date DATE
);

-- 6. Create raw products table matching CSV columns
CREATE OR REPLACE TABLE RAW_PRODUCTS (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMBER(10,2)
);

-- 7. Create raw orders table matching CSV columns
CREATE OR REPLACE TABLE RAW_ORDERS (
    order_id INT,
    customer_id INT,
    product_id INT,
    quantity NUMBER(10,2),
    order_date DATE,
    status VARCHAR(50)
);