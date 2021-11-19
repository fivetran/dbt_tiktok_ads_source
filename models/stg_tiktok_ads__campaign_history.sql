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
        updated_at, 
        advertiser_id, 
        budget, 
        budget_mode, 
        campaign_name, 
        campaign_type, 
        create_time, 
        is_new_structure, 
        objective_type, 
        opt_status, 
        status,  -- there isn't a status column in the source 
        split_test_variable,
        _fivetran_synced

    from fields

), 

most_recent as (

    select 
        *,
        row_number() over (partition by campaign_id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from final

)

select * from most_recent