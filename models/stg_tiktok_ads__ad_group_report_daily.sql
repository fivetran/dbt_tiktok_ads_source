with base as (

    select *
    from {{ ref('stg_tiktok_ads__ad_group_report_daily_tmp') }}

), 

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads__ad_group_report_daily_tmp')),
                staging_columns=get_ad_group_report_daily_columns()
            )
        }}

    from base

), 

final as (

    select  
        adgroup_id as ad_group_id, 
        _fivetran_synced,
        stat_time_day, 
        cpc, 
        cpm, 
        ctr, 
        impressions, 
        clicks, 
        spend, 
        reach, 
        conversion, 
        cost_per_conversion, 
        conversion_rate, 
        likes, 
        comments, 
        shares, 
        profile_visits,
        follows, 
        video_play_actions, 
        video_watched_2_s, 
        video_watched_6_s, 
        video_views_p_25, 
        video_views_p_50,
        video_views_p_75,  
        average_video_play, 
        average_video_play_per_user
    from fields

), 

most_recent as (

    select 
        *,
        row_number() over (partition by ad_group_id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from final

)

select * from most_recent

