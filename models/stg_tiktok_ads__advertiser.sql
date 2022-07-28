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
        phone_number, 
        telephone, 
        timezone
    from fields
)

select *
from final