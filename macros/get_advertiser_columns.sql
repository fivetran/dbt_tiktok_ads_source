{% macro get_advertiser_columns() %}

{% set columns = [
    {"name": "address", "datatype": dbt_utils.type_string()},
    {"name": "balance", "datatype": dbt_utils.type_float()},
    {"name": "company", "datatype": dbt_utils.type_string()},
    {"name": "contacter", "datatype": dbt_utils.type_string()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_numeric()},
    {"name": "industry", "datatype": dbt_utils.type_string()},
    {"name": "language", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "phone_number", "datatype": dbt_utils.type_string()},
    {"name": "telephone", "datatype": dbt_utils.type_string()},
    {"name": "timezone", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}