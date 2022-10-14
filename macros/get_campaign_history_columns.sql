{% macro get_campaign_history_columns() %}

{% set columns = [
    {"name": "advertiser_id", "datatype": dbt.type_numeric()},
    {"name": "campaign_id", "datatype": dbt.type_numeric()},
    {"name": "campaign_name", "datatype": dbt.type_string()},
    {"name": "campaign_type", "datatype": dbt.type_string()},
    {"name": "split_test_variable", "datatype": dbt.type_string()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}