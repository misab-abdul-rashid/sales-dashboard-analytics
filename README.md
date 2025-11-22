# Sales Dashboard — Sales Analytics & Dashboard


**Project type:** Data Analyst portfolio piece — Power BI dashboard + SQL transformations + Python EDA


## Objective
Build an interactive sales dashboard that answers core business questions: revenue trends, top products, regional performance, repeat-customer behavior, and churn signals. Provide clear recommendations supported by data.

## Key Insights

- **Total revenue:** ₹349.94  
- **Top product:** Delta Watch (₹199.99 revenue)  
- **Strongest region:** East (highest single-order value)  
- **Repeat customers:** Customer A made multiple purchases  
- **Category performance:** Footwear and Accessories drove most revenue  
- **Daily trend:** Revenue spiked on 2024-08-04 due to a high-value watch purchase  

## Recommendations

- Promote high-ticket items like **Delta Watch** to boost revenue  
- Increase marketing in **South region** to improve performance  
- Cross-sell accessories to repeat buyers (Customer A behavior)  
- Add discount offers for low-performing categories (Apparel)  


## Tech stack
- Power BI (dashboard .pbix or screenshots)
- SQL (data transformation queries)
- Python (Pandas) for EDA and small data prep


## Repo structure
- `data/sample_sales.csv` — small sample dataset for quick demos
- `sql/queries.sql` — SQL used to transform / aggregate data
- `analysis/EDA.md` — EDA notebook-style steps 
- `powerbi/SalesDashboard.pbix` — Power BI file or `powerbi/screenshots/` for images

## Dashboard Preview

![Dashboard Screenshot](powerbi/screenshots/dashboard_screenshot.png)

## How to run (no terminal needed)

### 1. Run SQL transformations
You can run all SQL queries directly in the browser:

- Open https://sqliteonline.com
- Paste the contents of `sql/schema_and_seed.sql` → Run (creates tables)
- Paste `sql/queries.sql` in a new tab → Run (aggregates the data)

### 2. View or edit the dashboard
- Download `data/sample_sales.csv`
- Open Power BI Desktop
- Import the CSV and recreate visuals
- Or open the screenshot in `powerbi/screenshots/`

### 3. Review the analysis steps
Open `analysis/EDA.md` for EDA logic, preprocessing, and insight generation.

