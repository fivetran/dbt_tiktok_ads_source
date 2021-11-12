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

), final as (

    select 
          id as advertiser_id
        , address
        , balance
        , company
        , contacter
        , country
        , create_time
        , currency
        , description
        , email
        , industry
        , language
        , license_no
        , license_url
        , name
        , phone_number
        , promotion_area
        , reason
        , role
        , status
        , telephone
        , timezone

        , {{ dbt_utils.surrogate_key(['advertiser_id','_fivetran_synced'] )}} as version_id
    from fields

)

select *
from final