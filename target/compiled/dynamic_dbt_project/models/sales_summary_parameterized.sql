

WITH date_range AS (
    
    
    
    SELECT 
        '2024-01-01'::DATE AS start_period,
        '2024-03-01'::DATE AS end_period

)
SELECT
    date_trunc('month', o.order_date) AS order_month,
    o.region,
    sum(o.total_amount) AS total_sales
FROM "dev"."main"."raw_orders" o
CROSS JOIN date_range d
WHERE o.order_date >= d.start_period
  AND o.order_date < d.end_period
  AND o.status = 'completed'
GROUP BY 1, 2