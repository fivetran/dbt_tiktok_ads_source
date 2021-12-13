with base as (

    select *
    from {{ ref('stg_tiktok_ads__ad_group_history_tmp') }}

), 

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads__ad_group_history_tmp')),
                staging_columns=get_ad_group_history_columns()
            )
        }}

    from base

), 

final as (

    select  
        adgroup_id as ad_group_id,
        updated_at,
        advertiser_id,
        campaign_id,
        action_days,
        adgroup_name as ad_group_name,
        -- age,
        audience_type,
        category,
        display_name,
        frequency,
        frequency_schedule,
        gender,
        -- languages, 
        landing_page_url,
        _fivetran_synced
    from fields

), 

most_recent as (

    select 
        *,
        row_number() over (partition by ad_group_id order by updated_at desc) = 1 as is_most_recent_record
    from final

)

select * from most_recent