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
        create_time, 
        currency, 
        description, 
        email, 
        industry, 
        language, 
        license_no, 
        license_url, 
        name, 
        phone_number, 
        promotion_area, 
        reason, 
        role, 
        status, 
        telephone, 
        timezone,
        _fivetran_synced
    from fields

), 

most_recent as (

    select 
        *,
        row_number() over (partition by advertiser_id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from final

)

select * from most_recent