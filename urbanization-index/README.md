# urbanization-index

This folder contains the data behind the story [
How Urban Or Rural Is Your State? And What Does That Mean For The 2020 Election?
](https://fivethirtyeight.com/features/how-urban-or-rural-is-your-state-and-what-does-that-mean-for-the-2020-election/)


`urbanization-state.csv` contains FiveThirtyEight's urbanization index for every state. This number is calculated via a weighted average based on each the population of each census tract in that state.


`urbanization-census-tract.csv` contains FiveThirtyEight's urbanization index for every census tract.


Column | Description
-------|------------
`year` |
`source` |
`gis_year` |
`gisjoin` |
`geoid` | [Geographic Identifier](https://www.census.gov/programs-surveys/geography/guidance/geo-identifiers.html) of the census tract
`lat_tract` | latitude of the center of the census tract
`long_tract` | lognitude of the center of the census tract
`population` | number of people living in the census tract according to data from the 2017 American Community Survey
`neworder` |
`distance` |
`radiuspop_5` | number of people living within a five-mile radius of the census tract
`dmin` |
`adj_radiuspop_5` |
`urbanindex` | a calculation of how urban or rural a given area is; calculated as the natural logarithm of `radiuspop_5`
`statefips` | FIPS code for each state
`state` | Name of state