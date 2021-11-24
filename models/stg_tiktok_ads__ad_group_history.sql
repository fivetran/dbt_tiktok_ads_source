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
        adgroup_name,
        app_id,
        app_name,
        app_type,
        audience_type,
        bid,
        bid_type,
        billing_event,
        budget,
        budget_mode,
        category,
        conversion_bid,
        cpv_video_duration,
        creative_material_mode,
        deep_external_action,
        display_name,
        external_action,
        fallback_type,
        frequency,
        frequency_schedule,
        gender,
        click_tracking_url,
        app_download_url,
        impression_tracking_url,
        landing_page_url,
        open_url,
        open_url_type,
        is_comment_disable,
        is_new_structure,
        optimize_goal,
        pacing,
        package,
        placement_type,
        schedule_start_time,
        schedule_end_time,
        schedule_type,
        statistic_type,
        status,
        video_download,
        _fivetran_synced
    from fields

), 

most_recent as (

    select 
        *,
        row_number() over (partition by ad_group_id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from final

)

select * from most_recent