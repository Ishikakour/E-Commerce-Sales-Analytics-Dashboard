#  E-Commerce Profitability & Risk Analysis

**Business Problem:** 
An e-commerce platform generated ₹72K in total sales across 1,017 orders in Q3 (July–September). However, despite strong top-line revenue, the company suffered a net loss of ₹1,469. Leadership needed to identify which regions, payment methods, and product categories were driving the losses and formulate a mitigation strategy.

**Data Architecture:**
Raw CSV → Power Query (Data Cleaning) → Power BI (DAX Measures, Visualization)

**Key Findings:**
- **Regional Losses:** Madhya Pradesh accounted for the highest sales volume but was a primary driver of negative profit margins.
- **Payment Risk:** Cash on Delivery (COD) accounted for 42.87% of transactions, correlating with the highest return/loss rates. UPI (24.68%) and Credit Card (13.47%) showed better profitability.
- **Category Imbalance:** Clothing represented 60% of total quantity sold but had a disproportionate negative impact on profit. Bookcases and Tables were the only profitable sub-categories.
- **Monthly Trend:** July and September were loss-making months, while August was the only profitable month. 

**Business Impact & Recommendations:**
1. **Shift COD to Prepaid:** Introduce a 5% discount for UPI/Credit Card transactions to reduce COD dependency and lower return rates.
2. **Product Mix Adjustment:** Bundle low-margin Clothing items with high-margin Accessories to improve overall basket profitability.
3. **Regional Focus:** Restrict high-risk COD orders in Madhya Pradesh or require a deposit for high-value orders in that region.

**Dashboard Preview:**
![Dashboard Screenshot](dashboard.png)

**Tech Stack:** Power BI, DAX, Power Query
**Files:** `project.pbix`, `dashboard1.png`
