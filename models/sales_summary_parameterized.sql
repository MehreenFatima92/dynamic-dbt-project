{% set start_date = var("start_date", "2024-01-01") %}

WITH date_range AS (
    {{ generate_date_spine(start_date, 2) }}
)
SELECT
    date_trunc('month', o.order_date) AS order_month,
    o.region,
    sum(o.total_amount) AS total_sales
FROM {{ ref('raw_orders') }} o
CROSS JOIN date_range d
WHERE o.order_date >= d.start_period
  AND o.order_date < d.end_period
  AND o.status = '{{ var("valid_status", "completed") }}'
GROUP BY 1, 2