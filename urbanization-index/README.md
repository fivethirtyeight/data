# urbanization-index

This folder contains the data behind the story [
How Urban Or Rural Is Your State? And What Does That Mean For The 2020 Election?
](https://fivethirtyeight.com/features/how-urban-or-rural-is-your-state-and-what-does-that-mean-for-the-2020-election/)


`urbanization-state.csv` contains FiveThirtyEight's urbanization index for every state. This number is calculated via a weighted average based on each the population of each census tract in that state.

`urbanization-census-tract.csv` contains FiveThirtyEight's urbanization index for every census tract.


Column | Description
-------|------------
`statefips` | FIPS code for each state
`state` | Name of state
`gisjoin` | [Geographic Identifier](https://www.nhgis.org/user-resources/geographic-crosswalks) for the census tract from the 2010 census
`lat_tract` | Latitude of the center of the census tract
`long_tract` | Longitude of the center of the census tract
`population` | Number of people living in the census tract according to 5-year American Community Survey data from 2017
`adj_radiuspop_5` | Estimate of the number of people within a 5-mile radius of a census tract. For a census tract that is more than 5 miles away any other census tract (centroid to centroid), this number is decreased based on the minimum distance to the nearest census tract
`urbanindex` | A calculation of how urban or rural a given area is; calculated as the natural logarithm of `adj_radiuspop_5`
