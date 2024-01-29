# Marriage

This folder contains data behind the story [Marriage Isn’t Dead — Yet](http://fivethirtyeight.com/features/marriage-isnt-dead-yet/).

Source for all data is Decennial Census (years 1960 to 2000) and American Community Survey (years 2001-2012), via [IPUMS USA](https://usa.ipums.org/usa/cite.shtml).

Except in the divorce file, figures represent share of the relevant population that has never been married (MARST == 6 in the IPUMS data). Note that in the story, charts generally show the share that have *ever* been married, which is simply 1 - n. In the divorce file, figures are share of the relevant population that is *currently* divorced, conditional on having ever been married.

Variable names are as follows. Number in variable names are age ranges, so `all_2534` is the marriage rate for everyone ages 25 to 34.

Header | Description
---|---------
`all` | Total (or all men/women in sex-specific files)
`HS` | High school graduate or less (EDUCD < 65)
`SC` | Some college (EDUCD >= 65 & <= 100)
`BAp` | Bachelor's degree or more (EDUCD > 100)
`BAo` | Bachelor's degree, no graduate degre (EDUCD > 100 & <= 113)
`GD` | Graduate degree (EDUCD > 113)
`White` | Non-Hispanic white
`Black` | Black or African-American
`Hisp` | Hispanic of any race
`NE` | New England (REGION == 11)
`MA` | Mid-Atlantic (REGION == 12)
`Midwest` | Midwest (REGION == 21-23)
`South` | South (REGION == 31-34)
`Mountain` | Mountain West (REGION == 41)
`Pacific` | Pacific (REGION == 42)
`poor` | Family income in lowest 25%
`mid` | Family income in middle 50%
`rich` | Family income in top 25%
`work` | Employed 50+ weeks prior year
`nowork` | Not employed at least 50 weeks prior year
`nokids_all` | No own children living at home
`kids_all` | At least one own child living at home
