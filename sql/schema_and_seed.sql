-- schema_and_seed.sql
-- Use this on sqliteonline.com or DB Fiddle (SQLite mode)
-- This file creates tables + inserts sample data for your dashboard project.

-----------------------------------------------------------
-- 1) DROP TABLES IF THEY ALREADY EXIST
-----------------------------------------------------------
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_items;

-----------------------------------------------------------
-- 2) CREATE TABLES
-----------------------------------------------------------

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT,
  region TEXT
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT,
  category TEXT
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  order_date TEXT,
  customer_id INTEGER,
  total_amount REAL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  product_id INTEGER,
  qty INTEGER,
  price REAL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-----------------------------------------------------------
-- 3) INSERT SAMPLE DATA (matches sample_sales.csv)
-----------------------------------------------------------

INSERT INTO customers (customer_id, name, region) VALUES
(501, 'Customer A', 'South'),
(502, 'Customer B', 'North'),
(503, 'Customer C', 'West'),
(504, 'Customer D', 'East');

INSERT INTO products (product_id, product_name, category) VALUES
(2001, 'Alpha Shoe', 'Footwear'),
(2002, 'Beta Shirt', 'Apparel'),
(2003, 'Gamma Cap', 'Accessories'),
(2004, 'Delta Watch', 'Accessories');

INSERT INTO orders (order_id, order_date, customer_id, total_amount) VALUES
(1001, '2024-08-01', 501, 49.99),
(1002, '2024-08-01', 502, 39.98),
(1003, '2024-08-02', 501, 9.99),
(1004, '2024-08-03', 503, 49.99),
(1005, '2024-08-04', 504, 199.99);

INSERT INTO order_items (order_item_id, order_id, product_id, qty, price) VALUES
(1, 1001, 2001, 1, 49.99),
(2, 1002, 2002, 2, 19.99),
(3, 1003, 2003, 1, 9.99),
(4, 1004, 2001, 1, 49.99),
(5, 1005, 2004, 1, 199.99);

-----------------------------------------------------------
-- 4) OPTIONAL CHECKS
-----------------------------------------------------------

-- View tables
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

-- Quick revenue check
SELECT SUM(total_amount) AS total_revenue FROM orders;
