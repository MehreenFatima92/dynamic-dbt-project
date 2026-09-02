
  
  create view "dev"."main"."daily_sales_summary__dbt_tmp" as (
    SELECT
    order_date,
    region,
    COUNT(*) as order_count,
    SUM(total_amount) as total_sales,
    AVG(total_amount) as avg_order_value
FROM "dev"."main"."raw_orders"
WHERE order_date = '2024-01-15'
  AND status = 'completed'
  
  AND region = 'North'
  
GROUP BY order_date, region
  );
