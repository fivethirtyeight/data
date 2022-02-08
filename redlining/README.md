# The Lasting Legacy Of Redlining

This repo contains the data behind the story [The Lasting Legacy Of Redlining](https://projects.fivethirtyeight.com/redlining/). There are two csv files in this repo: `metro-grades.csv` and `zone-block-matches.csv`.

---

`metro-grades.csv` contains 2020 population total estimates by race/ethnicity for combined zones of each redlining grade (from Home Owners' Loan Corporation [HOLC] maps originally drawn in 1935-40, downloaded from the [Mapping Inequality project](https://dsl.richmond.edu/panorama/redlining/#loc=5/37.8/-97.9&maps=0)) within micro- and metropolitan areas. Also included are population estimates in the surrounding area of each metropolitan area's HOLC map (computed by adding a 10 percent buffer radius to the minimum bounding circle of all zones in that metro area) and location quotients (LQs) for each racial/ethnic group and HOLC grade. [LQs](https://belonging.berkeley.edu/technical-appendix#footnote34_cnxakh3) are small-area measures of segregation that specifically compare one racial/ethnic group’s proportion in a granular geography to their proportion in a larger surrounding geography. An LQ above 1 for a given racial group indicates overrepresentation in that HOLC zone relative to the broader surrounding area, and values below 1 indicate underrepresentation.

Population and race/ethnicity data comes from the 2020 U.S. decennial census. White, Black and Asian data excludes those who indicated Hispanic or Latino ethnicity. Hispanic/Latino data includes all who indicated Hispanic or Latino ethnicity, regardless of race. Other race data includes all population counts that did not fall under white, Black, Asian or Latino groups.

Only micro- and metropolitan areas with both A- (“best”) and D-rated (“hazardous”) zones in their redlining map are included — 138 of a total 143 metropolitan areas in the data from Mapping Inequality.

Header | Definition
--- | ---
`metro_area` | Official U.S. Census name of micro- or metropolitan area — defined as ["Core-Based Statistical Areas"](https://www.census.gov/topics/housing/housing-patterns/about/core-based-statistical-areas.html). The first city and state listed are used as the display name for each micro/metropolitan area in the story (for example, "Chicago-Naperville-Elgin, IL-IN-WI" is referred to as "Chicago, IL").
`holc_grade` | Grade assigned by the Home Owners' Loan Corporation (HOLC). `A`: "best" (green). `B`: "Still Desirable" (blue). `C`: "Definitely Declining" (yellow). `D`: "Hazardous" (red).
`white_pop` | Estimate of non-Hispanic white population within HOLC zones with a given `holc_grade` in a given `metro_area`. Rounded to the nearest integer.
`black_pop` | Estimate of non-Hispanic Black population within HOLC zones with a given `holc_grade` in a given `metro_area`. Rounded to the nearest integer.
`hisp_pop` | Estimate of Hispanic/Latino population within HOLC zones with a given `holc_grade` in a given `metro_area`. Rounded to the nearest integer.
`asian_pop` | Estimate of non-Hispanic Asian population within HOLC zones with a given `holc_grade` in a given `metro_area`. Rounded to the nearest integer.
`other_pop` | Estimate of population in any other racial/ethnic groups within HOLC zones with a given `holc_grade` in a given `metro_area`. Rounded to the nearest integer.
`total_pop` | Estimate of total population (across all racial/ethnic groups) within HOLC zones with a given `holc_grade` in a given `metro_area`. Rounded to the nearest integer.
`pct_white` | Estimate of the percentage of total population within HOLC zones with a given `holc_grade` in a given `metro_area` that are non-Hispanic white. Represented between 0-100. Rounded to the nearest two decimal places.
`pct_black` | Estimate of the percentage of total population within HOLC zones with a given `holc_grade` in a given `metro_area` that are non-Hispanic Black. Represented between 0-100. Rounded to the nearest two decimal places.
`pct_hisp` | Estimate of the percentage of total population within HOLC zones with a given `holc_grade` in a given `metro_area` that are Hispanic/Latino. Represented between 0-100. Rounded to the nearest two decimal places.
`pct_asian` | Estimate of the percentage of total population within HOLC zones with a given `holc_grade` in a given `metro_area` that are non-Hispanic Asian. Represented between 0-100. Rounded to the nearest two decimal places.
`pct_other` | Estimate of the percentage of total population within HOLC zones with a given `holc_grade` in a given `metro_area` in any other racial/ethnic group. Represented between 0-100. Rounded to the nearest two decimal places.
`lq_white` | Non-Hispanic white location quotient for a given `holc_grade` and `metro_area`.
`lq_black` | Non-Hispanic Black location quotient for a given `holc_grade` and `metro_area`.
`lq_hisp` | Hispanic/Latino location quotient for a given `holc_grade` and `metro_area`.
`lq_asian` | Non-Hispanic Asian location quotient for a given `holc_grade` and `metro_area`.
`lq_other` | All other racial/ethnic groups' location quotient for a given `holc_grade` and `metro_area`.
`surr_area_white_pop` | Estimate of non-Hispanic white population within surrounding area of a given `metro_area`'s HOLC zones. Rounded to nearest integer. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_black_pop` | Estimate of non-Hispanic Black population within surrounding area of a given `metro_area`'s HOLC zones. Rounded to nearest integer. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_hisp_pop` | Estimate of Hispanic/Latino population within surrounding area of a given `metro_area`'s HOLC zones. Rounded to nearest integer. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_asian_pop` | Estimate of non-Hispanic Asian population within surrounding area of a given `metro_area`'s HOLC zones. Rounded to nearest integer. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_other_pop` | Estimate of population in any other racial/ethnic groups within surrounding area of a given `metro_area`'s HOLC zones. Rounded to nearest integer. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_total_pop` | Estimate of total population (across all racial/ethnic groups) within surrounding area of a given `metro_area`'s HOLC zones. Rounded to nearest integer. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_pct_white` | Estimate of the percentage of total population within surrounding area of a given `metro_area`'s HOLC zones that are non-Hispanic white. Represented between 0-100. Rounded to the nearest two decimal places. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_pct_black` | Estimate of the percentage of total population within surrounding area of a given `metro_area`'s HOLC zones that are non-Hispanic Black. Represented between 0-100. Rounded to the nearest two decimal places. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_pct_hisp` | Estimate of the percentage of total population within surrounding area of a given `metro_area`'s HOLC zones that are Hispanic/Latino. Represented between 0-100. Rounded to the nearest two decimal places. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_pct_asian` | Estimate of the percentage of total population within surrounding area of a given `metro_area`'s HOLC zones that are non-Hispanic Asian. Represented between 0-100. Rounded to the nearest two decimal places. Repeated for each `holc_grade` for a given `metro_area`.
`surr_area_pct_other` | Estimate of the percentage of total population within surrounding area of a given `metro_area`'s HOLC zones in any other racial/ethnic group. Represented between 0-100. Rounded to the nearest two decimal places. Repeated for each `holc_grade` for a given `metro_area`.

---

`zone-block-matches.csv` is a crosswalk between 2020 U.S. decennial census blocks and Home Owners' Loan Corporation (HOLC) zones (from the collective spatial data shapefile, made available for download by the [Mapping Inequality project](https://dsl.richmond.edu/panorama/redlining/#loc=5/37.8/-97.9&maps=0&text=downloads)). HOLC zones were matched to census blocks by first determining census blocks geographically intersected with each zone, then calculating the proportion of the block’s total area that intersects with that HOLC zone. This intersecting area was used to weight each block's census data, which was then summed to estimate 2020 census totals in each HOLC zone.

HOLC zones do not have a unique ID column in the Mapping Inequality shapefile (across all cities and states), but each HOLC zone should have a unique combination of the five columns that begin with `holc_` below.

The spatial calculations that generated this data were conducted using the Albers Equal-Area Conic projection.

Header | Definition
--- | ---
`holc_city` | City name from this zone's HOLC map. Matches to `city` column in the Mapping Inequality shapefile.
`holc_state` | State abbreviation from this zone's HOLC map. Matches to `state` column in the Mapping Inequality shapefile.
`holc_grade` | HOLC grade assigned to this zone (`A`, `B`, `C` or `D`). Matches to `holc_grade` column in the Mapping Inequality shapefile.
`holc_id` | HOLC ID assigned to this zone (may be empty). Matches to `holc_id` column in the Mapping Inequality shapefile.
`holc_neighborhood_id` | Neighborhood ID. Unique for all HOLC zones except `holc_id`s B6 and B7 in Savannah, GA, which share a `holc_neighborhood_id` of `8678`. Matches to `neighborho` column in the Mapping Inequality shapefile.
`block_geoid20` | [`GEOID20`](https://www.census.gov/programs-surveys/geography/guidance/geo-identifiers.html) of 2020 U.S. census block that intersects with a given HOLC zone.
`pct_match` | Estimated percent of the 2020 U.S. census block's total area that intersects with a given HOLC zone. Use this column to weight census data to compute aggregate 2020 U.S. census estimates within an HOLC zone.
