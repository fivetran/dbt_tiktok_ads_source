{% macro get_ad_report_hourly_columns() %}

{% set columns = [
    {"name": "ad_id", "datatype": dbt_utils.type_numeric()},
    {"name": "average_video_play", "datatype": dbt_utils.type_float()},
    {"name": "average_video_play_per_user", "datatype": dbt_utils.type_float()},
    {"name": "clicks", "datatype": dbt_utils.type_numeric()},
    {"name": "comments", "datatype": dbt_utils.type_numeric()},
    {"name": "conversion", "datatype": dbt_utils.type_numeric()},
    {"name": "conversion_rate", "datatype": dbt_utils.type_float()},
    {"name": "cost_per_conversion", "datatype": dbt_utils.type_float()},
    {"name": "cpc", "datatype": dbt_utils.type_float()},
    {"name": "cpm", "datatype": dbt_utils.type_float()},
    {"name": "ctr", "datatype": dbt_utils.type_float()},
    {"name": "follows", "datatype": dbt_utils.type_numeric()},
    {"name": "impressions", "datatype": dbt_utils.type_numeric()},
    {"name": "likes", "datatype": dbt_utils.type_numeric()},
    {"name": "profile_visits", "datatype": dbt_utils.type_numeric()},
    {"name": "reach", "datatype": dbt_utils.type_numeric()},
    {"name": "shares", "datatype": dbt_utils.type_numeric()},
    {"name": "spend", "datatype": dbt_utils.type_numeric()},
    {"name": "stat_time_hour", "datatype": dbt_utils.type_timestamp()},
    {"name": "video_play_actions", "datatype": dbt_utils.type_numeric()},
    {"name": "video_views_p_25", "datatype": dbt_utils.type_numeric()},
    {"name": "video_views_p_50", "datatype": dbt_utils.type_numeric()},
    {"name": "video_views_p_75", "datatype": dbt_utils.type_numeric()},
    {"name": "video_watched_2_s", "datatype": dbt_utils.type_numeric()},
    {"name": "video_watched_6_s", "datatype": dbt_utils.type_numeric()}
] %}

{{ return(columns) }}

{% endmacro %}