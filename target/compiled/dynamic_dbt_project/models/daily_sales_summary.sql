/* 
===============================================================================
Model Name : daily_sales_summary
Description: Summarizes daily sales performance using parameterized filters.

Parameters:
  - analysis_date: Target transaction date (YYYY-MM-DD)
  - order_status : Filter by status ('completed', 'pending', etc.)
  - target_region: Specific region name or 'All' to aggregate all regions

Business Logic:
  - Dynamically includes/excludes region-based WHERE clauses using Jinja.
===============================================================================
*/

SELECT
    order_date,
    region,
    COUNT(*) as order_count,
    SUM(total_amount) as total_sales,
    AVG(total_amount) as avg_order_value,
    -- Conditional Aggregation Example (Step 5 Requirement)
    SUM(CASE WHEN total_amount > 200 THEN 1 ELSE 0 END) as high_value_order_count
FROM "dev"."main"."raw_orders"
WHERE order_date = '2024-01-15'
  AND status = 'completed'
  
GROUP BY order_date, region