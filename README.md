# E-Commerce Sales Analytics Dashboard

**Business Problem:** An e-commerce marketplace was experiencing stagnating quarterly sales despite growing customer acquisition. Leadership needed visibility into which regions, payment methods, and product categories were driving profitability — and which were eroding it.

**Data Architecture:**
Raw CSV → Python (Pandas) → Power BI (DAX Measures, Power Query)

**Key Findings:**
- COD was the dominant payment method (42.87%), correlating with higher return rates in non-metro regions
- Clothing accounted for 60% of quantity sold but contributed disproportionately low profit margins
- July–September quarter showed 23% higher profit than Q1, driven by regional sales in Maharashtra and Karnataka
- Average order value: ₹19K; total sales tracked: ₹72K across 1,017 units

**Tools:** Power BI, DAX, Power Query, Excel

**Repository Contents:**
- `dashboard1.png` — Power BI file with all DAX measures
- `data_clean.py` — Python data cleaning and transformation script
- `analysis.sql` — SQL queries for KPI calculation
