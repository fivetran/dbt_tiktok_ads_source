{% macro get_campaign_report_hourly_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "average_video_play", "datatype": dbt_utils.type_float()},
    {"name": "average_video_play_per_user", "datatype": dbt_utils.type_float()},
    {"name": "campaign_id", "datatype": dbt_utils.type_numeric()},
    {"name": "clicks", "datatype": dbt_utils.type_numeric()},
    {"name": "comments", "datatype": dbt_utils.type_numeric()},
    {"name": "conversion", "datatype": dbt_utils.type_numeric()},
    {"name": "conversion_rate", "datatype": dbt_utils.type_float()},
    {"name": "cost_per_1000_reached", "datatype": dbt_utils.type_float()},
    {"name": "cost_per_conversion", "datatype": dbt_utils.type_float()},
    {"name": "cost_per_result", "datatype": dbt_utils.type_float()},
    {"name": "cost_per_secondary_goal_result", "datatype": dbt_utils.type_string()},
    {"name": "cpc", "datatype": dbt_utils.type_float()},
    {"name": "cpm", "datatype": dbt_utils.type_float()},
    {"name": "ctr", "datatype": dbt_utils.type_float()},
    {"name": "follows", "datatype": dbt_utils.type_numeric()},
    {"name": "impressions", "datatype": dbt_utils.type_numeric()},
    {"name": "likes", "datatype": dbt_utils.type_numeric()},
    {"name": "profile_visits", "datatype": dbt_utils.type_numeric()},
    {"name": "profile_visits_rate", "datatype": dbt_utils.type_float()},
    {"name": "reach", "datatype": dbt_utils.type_numeric()},
    {"name": "real_time_conversion", "datatype": dbt_utils.type_numeric()},
    {"name": "real_time_conversion_rate", "datatype": dbt_utils.type_float()},
    {"name": "real_time_cost_per_conversion", "datatype": dbt_utils.type_float()},
    {"name": "real_time_cost_per_result", "datatype": dbt_utils.type_float()},
    {"name": "real_time_result", "datatype": dbt_utils.type_numeric()},
    {"name": "real_time_result_rate", "datatype": dbt_utils.type_float()},
    {"name": "result", "datatype": dbt_utils.type_numeric()},
    {"name": "result_rate", "datatype": dbt_utils.type_float()},
    {"name": "secondary_goal_result", "datatype": dbt_utils.type_string()},
    {"name": "secondary_goal_result_rate", "datatype": dbt_utils.type_string()},
    {"name": "shares", "datatype": dbt_utils.type_numeric()},
    {"name": "spend", "datatype": dbt_utils.type_float()},
    {"name": "stat_time_hour", "datatype": dbt_utils.type_timestamp()},
    {"name": "video_play_actions", "datatype": dbt_utils.type_numeric()},
    {"name": "video_views_p_100", "datatype": dbt_utils.type_numeric()},
    {"name": "video_views_p_25", "datatype": dbt_utils.type_numeric()},
    {"name": "video_views_p_50", "datatype": dbt_utils.type_numeric()},
    {"name": "video_views_p_75", "datatype": dbt_utils.type_numeric()},
    {"name": "video_watched_2_s", "datatype": dbt_utils.type_numeric()},
    {"name": "video_watched_6_s", "datatype": dbt_utils.type_numeric()}
] %}

{{ return(columns) }}

{% endmacro %}