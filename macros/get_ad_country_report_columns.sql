{% macro get_ad_country_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "ad_id", "datatype": dbt.type_int()},
    {"name": "aeo_type", "datatype": dbt.type_string()},
    {"name": "clicks", "datatype": dbt.type_int()},
    {"name": "conversion", "datatype": dbt.type_int()},
    {"name": "conversion_rate", "datatype": dbt.type_float()},
    {"name": "cost_per_conversion", "datatype": dbt.type_float()},
    {"name": "country_code", "datatype": dbt.type_string()},
    {"name": "cpc", "datatype": dbt.type_float()},
    {"name": "cpm", "datatype": dbt.type_float()},
    {"name": "ctr", "datatype": dbt.type_float()},
    {"name": "impressions", "datatype": dbt.type_int()},
    {"name": "real_time_conversion", "datatype": dbt.type_int()},
    {"name": "spend", "datatype": dbt.type_float()},
    {"name": "stat_time_day", "datatype": "datetime"}
] %}

{{ return(columns) }}

{% endmacro %}