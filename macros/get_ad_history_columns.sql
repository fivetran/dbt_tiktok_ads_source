{% macro get_ad_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "ad_id", "datatype": dbt_utils.type_numeric()},
    {"name": "ad_name", "datatype": dbt_utils.type_string()},
    {"name": "ad_text", "datatype": dbt_utils.type_string()},
    {"name": "adgroup_id", "datatype": dbt_utils.type_numeric()},
    {"name": "advertiser_id", "datatype": dbt_utils.type_numeric()},
    {"name": "app_name", "datatype": dbt_utils.type_string()},
    {"name": "call_to_action", "datatype": dbt_utils.type_string()},
    {"name": "campaign_id", "datatype": dbt_utils.type_numeric()},
    {"name": "click_tracking_url", "datatype": dbt_utils.type_string()},
    {"name": "create_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "display_name", "datatype": dbt_utils.type_string()},
    {"name": "impression_tracking_url", "datatype": dbt_utils.type_string()},
    {"name": "is_aco", "datatype": "boolean"},
    {"name": "is_creative_authorized", "datatype": "boolean"},
    {"name": "is_new_structure", "datatype": "boolean"},
    {"name": "landing_page_url", "datatype": dbt_utils.type_string()},
    {"name": "open_url", "datatype": dbt_utils.type_string()},
    {"name": "opt_status", "datatype": dbt_utils.type_string()},
    {"name": "playable_url", "datatype": dbt_utils.type_string()},
    {"name": "profile_image", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "video_id", "datatype": dbt_utils.type_string()},
    {"name": "image_ids", "datatype": dbt_utils.type_string()}

] %}

{{ return(columns) }}

{% endmacro %}