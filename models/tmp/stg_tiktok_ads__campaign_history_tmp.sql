{{ config(enabled=var('ad_reporting__tiktok_ads_enabled', true)) }}

select *
from {{ var('campaign_history') }}