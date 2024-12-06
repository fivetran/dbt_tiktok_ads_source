# dbt_tiktok_ads_source v0.7.0
[PR #28](https://github.com/fivetran/dbt_tiktok_ads_source/pull/28) includes the following updates:

## Breaking Changes
- In the [July 2023 update](https://fivetran.com/docs/connectors/applications/tiktok-ads/changelog#july2023) for the `ADGROUP_HISTORY` table, the `age` column was renamed to `age_groups`.
  - Previously, our data models coalesced these two columns to account for connectors using the old naming convention. However, due to inconsistent data types, this approach is no longer viable.
  - As a result, the coalesced field has been removed, and the models now exclusively rely on the `age_groups` column.
  - Customers can populate historical data in the `age_groups` column by performing a resync of the `ADGROUP_HISTORY` table, since TikTok provides all data regardless of the previous sync state.
  - For more details, see the [DECISIONLOG entry](https://github.com/fivetran/dbt_tiktok_ads_source/blob/main/DECISIONLOG.md).


# dbt_tiktok_ads_source v0.6.0
[PR #23](https://github.com/fivetran/dbt_tiktok_ads_source/pull/23) includes the following **BREAKING CHANGE** updates:

## Feature Updates: Conversion Support
- We have added the following source fields to each `stg_tiktok_ads__<entity>_report_hourly` model (`ad`, `ad_group`, `campaign`):
  - `real_time_conversion`: Number of times your ad resulted in the optimization event you selected.
  - `total_purchase_value`: The total value of purchase events that occurred in your app that were recorded by your measurement partner.
  - `total_sales_lead_value`: The monetary worth or potential value assigned to a lead generated through ads.
- In the event that you were already passing the above fields in via our [passthrough columns](https://github.com/fivetran/dbt_tiktok_ads_source?tab=readme-ov-file#passing-through-additional-metrics), the package will dynamically avoid "duplicate column" errors.
> The above new field additions are **breaking changes** for users who were not already bringing in conversion fields via passthrough columns.

## Under the Hood 
- Created `tiktok_ads_fill_pass_through_columns` and `tiktok_ads_add_pass_through_columns` macros to ensure that the new conversion fields are backwards compatible with users who have already included them via passthrough fields.
- Updated `conversion` to be an integer rather than a numeric data type, as is the expected behavior of the field. **This is a breaking change.**
- In each `stg_tiktok_ads__<entity>_report_hourly` model, coalesced every metric field with `0` (except fields representing averages).
- Updated seed data to adequately test new field additions in integration tests.
- Removed yml descriptions for nonexistent columns.

## Contributors
- [Seer Interactive](https://www.seerinteractive.com/?utm_campaign=Fivetran%20%7C%20Models&utm_source=Fivetran&utm_medium=Fivetran%20Documentation)

# dbt_tiktok_ads_source v0.5.2
[PR #19](https://github.com/fivetran/dbt_tiktok_ads_source/pull/19) includes the following updates:
## Bug Fixes
- This package now leverages the new `tiktok_ads_extract_url_parameter()` macro for use in parsing out url parameters. This was added to create special logic for Databricks instances not supported by `dbt_utils.get_url_parameter()`.
  - This macro will be replaced with the `fivetran_utils.extract_url_parameter()` macro in the next breaking change of this package.
## Under the Hood
- Included auto-releaser GitHub Actions workflow to automate future releases.

# dbt_tiktok_ads_source v0.5.1
[PR #14](https://github.com/fivetran/dbt_tiktok_ads_source/pull/14) includes the following updates:
## Under the Hood:
- Updates the [DECISIONLOG](DECISIONLOG.md) to clarify why there exist differences among aggregations across different grains.

# dbt_tiktok_ads_source v0.5.0
[PR #12](https://github.com/fivetran/dbt_tiktok_ads_source/pull/12) includes the following updates:
## Breaking changes
- Updated the source identifier format for consistency with other packages and for compatibility with the `fivetran_utils.union_data` macro. Identifiers now are:

| current  | previous |
|----------|----------|
|tiktok_ads_adgroup_history_identifier | tiktok_ads__ad_group_history_identifier |
|tiktok_ads_ad_history_identifier | tiktok_ads__ad_history_identifier
|tiktok_ads_advertiser_identifier | tiktok_ads__advertiser_identifier|
|tiktok_ads_campaign_history_identifier | tiktok_ads__campaign_history_identifier|
|tiktok_ads_ad_report_hourly_identifier | tiktok_ads__ad_report_hourly_identifier|
|tiktok_ads_adgroup_report_hourly_identifier | tiktok_ads__ad_group_report_hourly_identifier|
|tiktok_ads_campaign_report_hourly_identifier | tiktok_ads__campaign_report_hourly_identifier|

- If you are using the previous identifier, be sure to update to the current version!

## Feature update 🎉
- Unioning capability! This adds the ability to union source data from multiple tiktok_ads connectors. Refer to the [Union Multiple Connectors README section](https://github.com/fivetran/dbt_tiktok_ads_source/blob/main/README.md#union-multiple-connectors) for more details.

## Under the hood 🚘
- Updated tmp models to union source data using the `fivetran_utils.union_data` macro. 
- To distinguish which source each field comes from, added `source_relation` column in each staging model and applied the `fivetran_utils.source_relation` macro.
- Updated tests to account for the new `source_relation` column.

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
