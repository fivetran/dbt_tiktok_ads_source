{{ config(enabled=var('ad_reporting__tiktok_ads_enabled', true)) }}

select *
from {{ var('ad_history') }}