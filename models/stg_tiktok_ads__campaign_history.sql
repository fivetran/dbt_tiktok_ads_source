{{ config(enabled=var('ad_reporting__tiktok_ads_enabled', true)) }}

with base as (

    select *
    from {{ ref('stg_tiktok_ads__campaign_history_tmp') }}
), 

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads__campaign_history_tmp')),
                staging_columns=get_campaign_history_columns()
            )
        }}
        
    from base
), 

final as (

    select   
        campaign_id,
        cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at,
        advertiser_id,
        campaign_name,
        campaign_type,
        split_test_variable,
        row_number() over (partition by campaign_id order by updated_at desc) = 1 as is_most_recent_record
    from fields
)

select *
from final