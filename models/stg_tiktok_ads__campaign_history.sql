with base as (

    select *
    from {{ ref('stg_tiktok_ads__campaign_history_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_tiktok_ads__campaign_history_tmp')),
                staging_columns=get_campaign_columns()
            )
        }}
    from base

), final as (

    select 
          campaign_id
        , updated_at
        , advertiser_id
        , budget
        , budget_mode
        , campaign_name
        , campaign_type
        , create_time
        , is_new_structure
        , objective_type
        , opt_status
        , status
        , split_test_variable

        , {{ dbt_utils.surrogate_key(['campaign_id','_fivetran_synced'] )}} as version_id
    from fields

)

select *
from final