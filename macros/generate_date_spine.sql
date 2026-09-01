{% macro generate_date_spine(start_date, months_ahead) %}
    {% set end_date = modules.datetime.datetime.strptime(start_date, '%Y-%m-%d') + modules.datetime.timedelta(days=30*months_ahead) %}
    
    SELECT 
        '{{ start_date }}'::DATE AS start_period,
        '{{ end_date.strftime("%Y-%m-%d") }}'::DATE AS end_period
{% endmacro %}