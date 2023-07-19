{{ config(enabled=var('ad_reporting__tiktok_ads_enabled', true)) }}

with base as (

    select *
    from {{ ref('stg_tiktok_ads__advertiser_tmp') }}
), 

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads__advertiser_tmp')),
                staging_columns=get_advertiser_columns()
            )
        }}

    from base
),

final as (

    select   
        id as advertiser_id, 
        address, 
        balance, 
        company, 
        contacter, 
        country, 
        currency, 
        description, 
        email, 
        industry, 
        language,
        name as advertiser_name, 
        coalesce(phone_number, cellphone_number) as cellphone_number, 
        coalesce(telephone, telephone_number) as telephone_number,
        timezone
    from fields
)

select *
from final