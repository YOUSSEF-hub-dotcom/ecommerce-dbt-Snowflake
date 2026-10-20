# 🛒 E-Commerce Analytics Data Pipeline (dbt + Snowflake)

An end-to-end modern data stack pipeline built using **dbt (Data Build Tool)** and **Snowflake**. This project transforms raw e-commerce operational data into clean, structured data marts for dimensional modeling and business analytics following best practices in Data Engineering.

---

## 📌 Table of Contents
1. [Project Overview](#-project-overview)
2. [Data Pipeline Architecture](#-data-pipeline-architecture)
3. [Data Models & Transformations](#-data-models--transformations)
4. [Data Quality & Testing](#-data-quality--testing)
5. [Project Structure](#-project-structure)
6. [How to Run the Project](#-how-to-run-the-project)

---

## 🏗️ Project Overview

This project simulates a real-world Data Warehouse setup for an e-commerce platform. It addresses raw data inconsistencies, null handling, duplicate records, and business metric calculations by modeling raw transactions into optimized Star Schema models and business-ready data marts.

### 🔑 Key Features
- **Staging Layer:** Cleans, standardizes, and prepares raw data for ingestion.
- **Marts Layer:** Builds **Dimensional Models** (Fact and Dimension tables) and **Data Marts** tailored for business reporting.
- **Data Governance & Integrity:** Implements robust testing (`unique`, `not_null`) across core entities.
- **Aggregated Analytics:** Summarizes product performance and customer spending behavior.

---

## 🔄 Data Pipeline Architecture

[ Raw Snowflake Data ]
│
▼
[ Staging Layer ] ────> Cleaned & Standardized Views
│
▼
[ Marts Layer ]  ────> Dimensional Models (Star Schema)
│
▼
[ Business Marts ] ────> Aggregated Metrics for Analytics


1. **Sources (Raw Layer):** Ingests raw data tables from Snowflake (`raw_customers`, `raw_orders`, `raw_products`).
2. **Staging Layer (`stg_`):** Selects, casts, renames, and cleans fields from the source tables.
3. **Core Marts (`dim_`, `fct_`):** Constructs dimensional models using `dim_customers`, `dim_products`, and `fct_orders`.
4. **Analytics Marts (`mart_`):** Summarizes sales and revenue grouped by categories and customer profiles.

---

## 📊 Data Models & Transformations

### 1. Staging Models (`models/staging/`)
- **`stg_customers.sql`**: Standardizes customer demographical data.
- **`stg_products.sql`**: Prepares product catalog items and pricing information.
- **`stg_orders.sql`**: Ingests transactional records, order dates, and statuses.

### 2. Dimensional Core Models (`models/marts/`)
- **`dim_customers.sql`**: Contains customer profiles with historical order counts and order date ranges.
- **`dim_products.sql`**: Master list of all products with categorized pricing attributes.
- **`fct_orders.sql`**: Fact table representing order metrics (*One row per order*) aggregating quantities, item counts, and revenue.

### 3. Business Data Marts (`models/marts/`)
- **`mart_category_sales.sql`**: Aggregates total orders and revenue generated per product category.
- **`mart_customer_summary.sql`**: Provides complete customer spending metrics and cumulative completed orders.

---

## 🧪 Data Quality & Testing

Data testing is declared in `models/marts/schema.yml` to guarantee data freshness and prevent schema drift or invalid data ingestion:

- **Uniqueness Tests (`unique`)**: Validates primary keys (`customer_id`, `product_id`, `order_id`).
- **Null Value Constraints (`not_null`)**: Ensures primary and foreign keys are never null.

---

## 📁 Project Structure

```text
ecommerce-dbt/
├── models/
│   ├── staging/
│   │   ├── stg_customers.sql
│   │   ├── stg_orders.sql
│   │   └── stg_products.sql
│   └── marts/
│       ├── dim_customers.sql
│       ├── dim_products.sql
│       ├── fct_orders.sql
│       ├── mart_category_sales.sql
│       ├── mart_customer_summary.sql
│       └── schema.yml
├── dbt_project.yml
└── README.md
🚀 How to Run the Project
Prerequisites
Active Snowflake account configured with appropriate warehouse and database privileges.

dbt Cloud environment or local dbt-core setup.

Commands
Build all models:


dbt run
Execute data quality tests:


dbt test
Generate & View Data Lineage Documentation:


dbt docs generate
