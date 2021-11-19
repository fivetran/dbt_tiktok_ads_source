{% macro get_campaign_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "advertiser_id", "datatype": dbt_utils.type_numeric()},
    {"name": "budget", "datatype": dbt_utils.type_float()},
    {"name": "budget_mode", "datatype": dbt_utils.type_string()},
    {"name": "campaign_id", "datatype": dbt_utils.type_numeric()},
    {"name": "campaign_name", "datatype": dbt_utils.type_string()},
    {"name": "campaign_type", "datatype": dbt_utils.type_string()},
    {"name": "create_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "is_new_structure", "datatype": dbt_utils.type_string()},
    {"name": "objective_type", "datatype": dbt_utils.type_string()},
    {"name": "opt_status", "datatype": dbt_utils.type_string()},
    {"name": "split_test_variable", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}