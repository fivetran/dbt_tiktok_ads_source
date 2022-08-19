# dbt_tiktok_ads_source v0.2.0
PR [#3](https://github.com/fivetran/dbt_tiktok_ads_source/pull/3) applies the following updates:
## 🎉 Feature Enhancements 🎉
- Introduces metrics passthrough capability 
- Casts all timestamp fields using dbt_utils.type_timestamp() and rounds all monetary fields
- Adds not-null tests to key fields
- Introduces the identifier variable for all source models
- Add enable configs for this specific ad platform, for use in the Ad Reporting rollup package 

# dbt_tiktok_ads_source v0.1.0

## Initial Release
- This is the initial release of this package. For more information refer to the [README](/README.md).
