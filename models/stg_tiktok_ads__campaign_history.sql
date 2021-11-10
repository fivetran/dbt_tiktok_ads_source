with base as (

    select *
    from {{ ref('stg_tiktok_ads__campaign_history_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads__campaign_history_tmp')),
                staging_columns=get_campaign_columns()
            )
        }}
    from base

), surrogate_key as (

    select 
        *,
        {{ dbt_utils.surrogate_key(['campaign_id','_fivetran_synced'] )}} as version_id
    from fields

)

select *
from surrogate_key