{% macro get_ad_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "ad_id", "datatype": dbt_utils.type_numeric()},
    {"name": "ad_name", "datatype": dbt_utils.type_string()},
    {"name": "adgroup_id", "datatype": dbt_utils.type_numeric()},
    {"name": "advertiser_id", "datatype": dbt_utils.type_numeric()},
    {"name": "call_to_action", "datatype": dbt_utils.type_string()},
    {"name": "campaign_id", "datatype": dbt_utils.type_numeric()},
    {"name": "click_tracking_url", "datatype": dbt_utils.type_string()},
    {"name": "impression_tracking_url", "datatype": dbt_utils.type_string()},
    {"name": "landing_page_url", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}

] %}

{{ return(columns) }}

{% endmacro %}