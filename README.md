# ae\_learning dbt Project

This project demonstrates how to build a modern analytics pipeline on **BigQuery** using **dbt** with the `bigquery-public-data.thelook_ecommerce` dataset.

---

## 📂 Project Structure

```
models/
  staging/      # Source-aligned staging models (clean + rename columns)
  marts/        # Business-ready fact and dimension tables
```

---

## 🔄 Transformation Methodology

We follow a **layered architecture**:

### 1. **Sources**

* Defined in `models/sources/thelook_sources.yml`
* Point to the **public BigQuery dataset**:

  * `bigquery-public-data.thelook_ecommerce.distribution_centers`
  * `bigquery-public-data.thelook_ecommerce.events`
  * `bigquery-public-data.thelook_ecommerce.inventory_items`
  * `bigquery-public-data.thelook_ecommerce.order_items`
  * `bigquery-public-data.thelook_ecommerce.orders`
  * `bigquery-public-data.thelook_ecommerce.products`
  * `bigquery-public-data.thelook_ecommerce.thelook_ecommerce-table`
  * `bigquery-public-data.thelook_ecommerce.users`

### 2. **Staging Layer**

* Models in `models/staging/`
* Purpose:

  * Rename raw columns to consistent snake\_case
  * Cast datatypes (e.g., timestamps to dates)
  * Add helper fields (flags, derived dates)
* Example:

  * `stg_orders.sql` → adds `order_date`, `order_month`, shipment/delivery flags
  * `stg_order_items.sql` → standardizes `unit_price`, `gross_revenue`
  * `stg_products.sql` → cleans product attributes
  * `stg_users.sql` → user demographics and signup info
  * `stg_events.sql` → event timestamp and traffic source

### 3. **Mart Layer**

* Models in `models/marts/`
* Purpose: provide **flexible fact and dimension tables** for analytics
* Facts:

  * `fct_sales`: order-item level sales transactions
  * `fct_inventory`: inventory lifecycle (created, sold, unsold)
  * `fct_events`: user event tracking for attribution
* Dimensions:

  * `dim_products`: product attributes (brand, category, department, etc.)
  * `dim_users`: customer demographic info
  * `dim_orders`: order-level metadata
* This design follows a **star schema** → business users can join facts to dims directly.

---

## 🌟 Example Business Questions Answered

### Sales

* Which 10 product categories obtained the highest sales in the last 6 months?
* What are the top 10 brands contributing to sales for every quarter since 2022?
* What is the year-on-year % increase in sales for each brand?

### Digital

* Which traffic source generates the highest conversion rate from clicks to purchases?
* From which product categories do users purchase under each traffic source?

### Inventory

* For each category, which product is sold the fastest?
* For each category, which product remains unsold the longest?
* For each category, how many products remain unsold at month-end?

---
