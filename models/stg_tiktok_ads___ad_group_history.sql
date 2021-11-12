with base as (

    select *
    from {{ ref('stg_tiktok_ads___ad_group_history_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads___ad_group_history_tmp')),
                staging_columns=get_ad_group_history_columns()
            )
        }}
    from base

), final as (

    select 
          adgroup_id
        , updated_at
        , advertiser_id
        , campaign_id
        , action_categories
        , action_days
        , adgroup_name
        , age
        , app_id
        , app_name
        , app_type
        , audience
        , audience_type
        , bid
        , bid_type
        , billing_event
        , budget
        , budget_mode
        , category
        , connection_type
        , conversion_bid
        , cpv_video_duration
        , creative_material_mode
        , deep_external_action
        , display_name
        , excluded_audience
        , external_action
        , fallback_type
        , frequency
        , frequency_schedule
        , gender
        , click_tracking_url
        , app_download_url
        , impression_tracking_url
        , landing_page_url
        , open_url
        , open_url_type
        , interest_category_v2
        , is_comment_disable
        , is_new_structure
        , keywords
        , languages
        , location
        , operation_system
        , optimize_goal
        , pacing
        , package
        , placement
        , placement_type
        , schedule_start_time
        , schedule_end_time
        , schedule_type
        , statistic_type
        , status
        , video_actions
        , video_download

        , {{ dbt_utils.surrogate_key(['adgroup_id','_fivetran_synced'] )}} as version_id
    from fields

)

select *
from final