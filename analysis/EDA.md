# Exploratory Data Analysis (EDA)

This notebook-style markdown outlines the steps taken to explore and prepare the sales dataset prior to building the Power BI dashboard.

---

## 1. Objective
Understand sales patterns, identify top products/regions, and prepare aggregated tables for the dashboard.

---

## 2. Load Data

```python
import pandas as pd

sales = pd.read_csv('../data/sample_sales.csv', parse_dates=['order_date'])
sales.head()

