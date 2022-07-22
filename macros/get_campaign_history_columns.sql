{% macro get_campaign_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "advertiser_id", "datatype": dbt_utils.type_numeric()},
    {"name": "campaign_id", "datatype": dbt_utils.type_numeric()},
    {"name": "campaign_name", "datatype": dbt_utils.type_string()},
    {"name": "campaign_type", "datatype": dbt_utils.type_string()},
    {"name": "split_test_variable", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}