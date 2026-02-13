# Zepto Inventory Analysis

 End-to-end data analysis of a Zepto inventory dataset stored in MySQL. Used SQL for data cleaning, aggregation, CTEs, and window functions to analyze pricing, discounts, and revenue trends. Integrated Python (Pandas, Matplotlib) for feature engineering and visualization to generate actionable business insights.

🛠 Tech Stack
1. SQL (MySQL)
2. Python
3. Pandas
4. Matplotlib
5. SQLAlchemy
6. PyMySQL

📂 Workflow

1️⃣ Data Extraction

Connected Python to MySQL using SQLAlchemy.

Pulled product inventory data from the zepto table into a Pandas DataFrame.

2️⃣ Feature Engineering

Created new business metrics:

Revenue

revenue = discountedSellingPrice × availableQuantity


Price per Gram

price_per_gram = discountedSellingPrice / weightInGms


These metrics help evaluate profitability and pricing efficiency.

3️⃣ Category-Level Analysis

Used groupby() operations to calculate total revenue per category.

Identified top-performing product categories.

4️⃣ Data Cleaning

Removed duplicate rows.

Handled potential division-by-zero issues.

Validated column consistency.

5️⃣ Data Visualization

Built bar charts to compare revenue across categories.

Highlighted high-performing inventory segments.

📊 Key Insights

Identified highest revenue-generating categories.

Compared pricing efficiency using price-per-unit metrics.

Evaluated inventory distribution from a business perspective.

Derived insights that can support pricing and stocking decisions.


💼 Business Impact

This project simulates a real-world quick-commerce analysis scenario where:

Revenue contribution by category is evaluated.

Pricing efficiency is analyzed.

Data-driven decisions can improve profitability and inventory optimization.

👤 Author

Raghav Sharma,

Aspiring Data Analyst | SQL | Python | Business Analytics
   
