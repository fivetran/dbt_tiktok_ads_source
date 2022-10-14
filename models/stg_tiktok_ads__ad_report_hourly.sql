{{ config(enabled=var('ad_reporting__tiktok_ads_enabled', true)) }}

with base as (

    select *
    from {{ ref('stg_tiktok_ads__ad_report_hourly_tmp') }}
), 

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads__ad_report_hourly_tmp')),
                staging_columns=get_ad_report_hourly_columns()
            )
        }}
    from base
), 

final as (

    select  
        ad_id, 
        cast(stat_time_hour as {{ dbt.type_timestamp() }}) as stat_time_hour, 
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

        {{ fivetran_utils.fill_pass_through_columns('tiktok_ads__ad_hourly_passthrough_metrics') }}
    from fields
)

select * 
from final

