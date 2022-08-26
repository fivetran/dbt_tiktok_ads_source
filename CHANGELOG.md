# dbt_tiktok_ads_source v0.2.0
PR [#3](https://github.com/fivetran/dbt_tiktok_ads_source/pull/3) applies the following updates:
## 🎉 Feature Enhancements 🎉
- Inclusion of passthrough metrics:
  - `tiktok_ads__ad_group_hourly_passthrough_metrics`
  - `tiktok_ads__ad_hourly_passthrough_metrics`
  - `tiktok_ads__campaign_hourly_passthrough_metrics`
> This applies to all passthrough columns within the `dbt_snapchat_ads_source` package and not just the `tiktok_ads__ad_group_hourly_passthrough_metrics` example.
```yml
vars:
  tiktok_ads__ad_group_hourly_passthrough_metrics:
    - name: "my_field_to_include" # Required: Name of the field within the source.
      alias: "field_alias" # Optional: If you wish to alias the field within the staging model.
```
- Casts all timestamp fields using dbt_utils.type_timestamp() and rounds all monetary fields
- Adds not-null tests to key fields
- Introduces the identifier variable for all source models
- Add enable configs for this specific ad platform, for use in the Ad Reporting rollup package 

# dbt_tiktok_ads_source v0.1.0

## Initial Release
- This is the initial release of this package. For more information refer to the [README](/README.md).
