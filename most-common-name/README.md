# Most Common Name

This directory contains the code and data behind the story [Dear Mona, What’s The Most Common Name In America?](http://fivethirtyeight.com/features/whats-the-most-common-name-in-america/)

The main script file is `most-common-name.R`

There are four input files:

 * `state-pop.csv` - Total population and Hispanic population by state. 
 * `surnames.csv` - Data on surnames from the U.S. Census Bureau, including a breakdown by race/ethnicity. 
 * `aging-curve.csv` - Data from the Social Security Administration on the chances that someone born in the decade shown was still alive in 2013: http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7.html
 * `adjustments.csv` - Taken directly from Lee Hartman's article: http://mypage.siu.edu/lhartman/johnsmith.html.

And five output files:

* `adjusted-name-combinations-list.csv` - Adjusted estimates for the most common full names. 
* `adjusted-name-combinations-matrix.csv` - The same data from the file `adjusted-name-combinations-list.csv` but in matrix form. These are the estimates presented in the second (and final) table of the article.
* `independent-name-combinations-by-pop.csv` - Matrix of estimates for the top 100 most common first names by top 100 most common surnames. These were calculated using independent odds, and displayed in the first table presented in the article.
* `new-top-firstNames.csv` - Final estimated ranking of top first names.
* `new-top-surnames.csv` - Final estimated ranking of top surnames.

