# dbt_tiktok_ads_source v0.4.0
[PR #10](https://github.com/fivetran/dbt_tiktok_ads_source/pull/10) applies the following updates:
## 🚨 Breaking Changes 🚨
- In the [July 2023 connector update for TikTok Ads](https://fivetran.com/docs/applications/tiktok-ads/changelog), we upgraded the connector to the v1.3 API. As a result the dependent fields and field names from the downstream staging models have changed.
  - In `stg_tiktok_ads__ad_group_history`, `age` has been renamed as `age_groups`.
  - In `stg_tiktok_ads__advertiser`, `phone_number` has been renamed as `cellphone_number`, and `telephone` has been renamed as `telephone_number`.
- **Note**: We coalesced the old API field names with these renamed fields to ensure backwards compatibility for these fields. 
 
## 🔧 Under the Hood 🔩
- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job.
- Updated the pull request [templates](/.github).
- Seed files were also renamed with the newest version of the fields, in case we decide to bring them in with future versions of the package.

# dbt_tiktok_ads_source v0.3.0

## 🚨 Breaking Changes 🚨:
[PR #4](https://github.com/fivetran/dbt_tiktok_ads_source/pull/4) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- `packages.yml` has been updated to reflect new default `fivetran/fivetran_utils` version, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.

## Bug Fixes
- Adjusted the `get_ad_group_report_hourly_columns`, `get_ad_report_hourly_columns`, and `get_campaign_report_hourly_columns` macros to ensure the passthrough variables are included in the returned columns and propogate within downstream models. ([#5](https://github.com/fivetran/dbt_tiktok_ads_source/pull/5))

## Contributors
- [@andysmv](https://github.com/andysmv) ([#5](https://github.com/fivetran/dbt_tiktok_ads_source/pull/5))

# dbt_tiktok_ads_source v0.2.0
PR [#3](https://github.com/fivetran/dbt_tiktok_ads_source/pull/3) applies the following updates:
## 🎉 Feature Enhancements 🎉
- Inclusion of passthrough metrics:
  - `tiktok_ads__ad_group_hourly_passthrough_metrics`
  - `tiktok_ads__ad_hourly_passthrough_metrics`
  - `tiktok_ads__campaign_hourly_passthrough_metrics`
> This applies to all passthrough columns within the `dbt_tiktok_ads_source` package and not just the `tiktok_ads__ad_group_hourly_passthrough_metrics` example.
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
