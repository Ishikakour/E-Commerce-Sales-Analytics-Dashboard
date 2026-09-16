-- Customer Lifetime Value and RFM Segmentation
WITH rfm_base AS (
    SELECT 
        customer_id,
        MAX(order_date) AS last_order_date,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(sales) AS monetary,
        DATEDIFF(day, MAX(order_date), GETDATE()) AS recency
    FROM orders
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT 
        customer_id,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
    FROM rfm_base
)
SELECT 
    customer_id,
    r_score, f_score, m_score,
    (r_score + f_score + m_score) AS rfm_total,
    CASE 
        WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champion'
        WHEN r_score >= 4 AND f_score >= 3 THEN 'Loyal'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
        ELSE 'Hibernating'
    END AS customer_segment
FROM rfm_scores
ORDER BY rfm_total DESC;

-- Cohort Retention Analysis
WITH first_purchase AS (
    SELECT 
        customer_id,
        MIN(order_date) AS cohort_date
    FROM orders
    GROUP BY customer_id
),
monthly_activity AS (
    SELECT 
        o.customer_id,
        f.cohort_date,
        DATE_TRUNC('month', o.order_date) AS activity_month,
        DATEDIFF(month, f.cohort_date, o.order_date) AS month_number
    FROM orders o
    JOIN first_purchase f ON o.customer_id = f.customer_id
)
SELECT 
    cohort_date,
    month_number,
    COUNT(DISTINCT customer_id) AS active_customers,
    LAG(COUNT(DISTINCT customer_id)) OVER (PARTITION BY cohort_date ORDER BY month_number) AS previous_month,
    ROUND(100.0 * COUNT(DISTINCT customer_id) / 
        FIRST_VALUE(COUNT(DISTINCT customer_id)) OVER (PARTITION BY cohort_date ORDER BY month_number), 2) AS retention_pct
FROM monthly_activity
GROUP BY cohort_date, month_number
ORDER BY cohort_date, month_number;
