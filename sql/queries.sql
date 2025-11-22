-- queries.sql
-- Adapt to your SQL dialect (SQLite, Postgres, MySQL). Comments note when a function may differ.


-- 1) Basic sales aggregation: daily revenue
SELECT
DATE(order_date) AS day,
SUM(total_amount) AS revenue,
COUNT(DISTINCT order_id) AS orders
FROM orders
GROUP BY DATE(order_date)
ORDER BY day;


-- 2) Monthly revenue and YoY comparison (Postgres example)
SELECT
DATE_TRUNC('month', order_date) AS month,
SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY 1
ORDER BY 1;


-- 3) Top products by revenue
SELECT p.product_id,
p.name AS product_name,
p.category,
SUM(oi.qty * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name, p.category
ORDER BY revenue DESC
LIMIT 10;


-- 4) Repeat customer rate
WITH cust_orders AS (
SELECT customer_id, COUNT(order_id) AS orders_count
FROM orders
GROUP BY customer_id
)
SELECT
SUM(CASE WHEN orders_count > 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS repeat_rate
FROM cust_orders;


-- 5) Region performance (join with customers table)
SELECT c.region, COUNT(DISTINCT o.order_id) AS orders, SUM(o.total_amount) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY revenue DESC;


-- 6) Cohort example: first purchase month + retention
WITH first_order AS (
SELECT customer_id, MIN(DATE_TRUNC('month', order_date)) AS cohort_month
FROM orders
GROUP BY customer_id
),
monthly_orders AS (
SELECT customer_id, DATE_TRUNC('month', order_date) AS order_month
FROM orders
)
SELECT f.cohort_month, m.order_month, COUNT(DISTINCT m.customer_id) AS customers
FROM first_order f
JOIN monthly_orders m ON f.customer_id = m.customer_id
GROUP BY f.cohort_month, m.order_month
ORDER BY f.cohort_month, m.order_month;
