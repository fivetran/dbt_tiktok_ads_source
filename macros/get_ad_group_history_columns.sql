{% macro get_ad_group_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "action_days", "datatype": dbt_utils.type_numeric()},
    {"name": "adgroup_id", "datatype": dbt_utils.type_numeric()},
    {"name": "adgroup_name", "datatype": dbt_utils.type_string()},
    {"name": "advertiser_id", "datatype": dbt_utils.type_numeric()},
    {"name": "audience_type", "datatype": dbt_utils.type_string()},
    {"name": "budget", "datatype": dbt_utils.type_float()},
    {"name": "campaign_id", "datatype": dbt_utils.type_numeric()},
    {"name": "category", "datatype": dbt_utils.type_numeric()},
    {"name": "display_name", "datatype": dbt_utils.type_string()},
    {"name": "frequency", "datatype": dbt_utils.type_numeric()},
    {"name": "frequency_schedule", "datatype": dbt_utils.type_numeric()},
    {"name": "gender", "datatype": dbt_utils.type_string()},
    {"name": "landing_page_url", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "interest_category_v_2", "datatype": dbt_utils.type_string()},)},
    {"name": "action_categories", "datatype": dbt_utils.type_string()},
    {"name": "age", "datatype": dbt_utils.type_string()},
    {"name": "languages", "datatype": dbt_utils.type_string()}

] %}

{{ return(columns) }}

{% endmacro %}