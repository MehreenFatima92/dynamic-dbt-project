# Dynamic & Parameterized dbt Project

This project demonstrates automated data transformation pipelines using dbt (data build tool) and DuckDB.

## Features
- **Dynamic Parameterization**: Uses dbt variables (`var`) to filter data dynamically via CLI.
- **Automated Date Logic**: Implements Jinja macros with Python's `datetime` module for auto-calculating date ranges.
- **Local Analytics DB**: Integrates DuckDB for high-performance in-memory querying.

## How to Run
1. Install dependencies: `pip install dbt-duckdb`
2. Seed raw data: `dbt seed --profiles-dir .`
3. Run parameterized model:
   ```bash
   dbt run --vars "{'start_date': '2024-02-01', 'valid_status': 'completed'}" --profiles-dir .
   