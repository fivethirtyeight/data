# France Terror Attacks

This directory contains data, code and charts behind the story [The Rise Of Religiously Inspired Terrorism In France](http://fivethirtyeight.com/features/the-rise-of-religiously-inspired-terrorism-in-france/).

The data source is the [Global Terrorism Database](http://www.start.umd.edu/gtd/) (GTD). Raw data files from the GTD were retrieved on November 13, 2015; however, the raw data can not be made public. The data is freely available at the GTD [website](http://www.start.umd.edu/gtd/). Please see the GTD codebook -- the file `GTD_Codebook_2015Final.pdf` -- for more information.

Note: incident-level data for the year 1993 does not exist in the GTD database. However, in appendenix II of the codebook, GTD provides country-level summary statistics for that year; that data is included in the file `country_stats_1993_appendix2.csv`.

The FiveThirtyEight analysis is contained in the following files:

Header | Notes
---|---------
`paris_terror_analysis.R` | An R script that loads the GTD raw data and performs analysis
`france_fatalities.png` | Total fatalities from terrorism incidents in France, by year (from 1972 through 2014)
`france_terrorism_fatalities_by_year.csv` | The raw data behind the chart above
`eu_fatalities.png` | Total fatalities from terrorism incidents in the EU countries that joined in 1986 or earlier, from 1986 through 2014
`eu_terrorism_fatalities_by_year.csv` | The raw data behind the chart above
`eu_fatalities_by_country.png` | Total fatalities from terrorism incidents in the EU countries that joined in 1986 or earlier, for each country from 1972 through 2014
`eu_terrorism_fatalities_by_country.csv` | The raw data behind the chart above
`country_stats_1993_appendix2.csv` | This data is from Appendix II of the GTD codebook (found on pages 60-62); it includes country-level statistics on terrorism incidents in the year 1993.