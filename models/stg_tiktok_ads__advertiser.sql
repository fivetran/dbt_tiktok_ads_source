with base as (

    select *
    from {{ ref('stg_tiktok_ads__advertiser_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads__advertiser_tmp')),
                staging_columns=get_advertiser_columns()
            )
        }}
    from base

), surrogate_key as (

    select 
        id as advertiser_id, 


        
        *,
        {{ dbt_utils.surrogate_key(['advertiser_id','_fivetran_synced'] )}} as version_id
    from fields

)

select *
from surrogate_key