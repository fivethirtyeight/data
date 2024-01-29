# District Urbanization Index 2022 

This directory contains FiveThirtyEight’s groupings of congressional districts used in the 2022 election using FiveThirtyEight’s [urbanization index](https://fivethirtyeight.com/features/how-urban-or-rural-is-your-state-and-what-does-that-mean-for-the-2020-election/). It was used in the following FiveThirtyEight article: 

- [The Republican Path To A House Majority Goes Through The Suburbs](https://fivethirtyeight.com/features/the-republican-path-to-a-house-majority-goes-through-the-suburbs/) (Nov. 2, 2022) 

`urbanization-index-2022.csv` contains information on each congressional district, including its urbanization index value, its categorization based on that value and the share of its population living in types of census tracts.

The urbanization index is calculated as the natural logarithm of the average number of people living within a five-mile radius of every census tract in a given district, based on a weighted average of the population of each census tract. The population of a census tract is according to 2020 census data. This provides a numerical value for how urban or rural a district is. Using this index, we created six groupings for all congressional districts based on their density, which are listed below: 

- `Dense Urban`: urbanization index of 13 or higher;
- `Urban-Suburban`: urbanization index from 12.5 up to 13;
- `Dense Suburban`: urbanization index from 11.5 up to 12.5;
- `Suburban-Exurban`: urbanization index from 10.5 up to 11.5;
- `Rural-Exurban`: urbanization index from 9.5 up to 10.5;
- `Mostly Rural`: urbanization index below 9.5.

Along with the density consideration, the districts in each grouping have a relatively similar share of their population living in census tracts that we define as rural, exurban or small town, suburban or small city, or urban core or large city. Those categories are defined as follows: 

- `rural`: fewer than 25,000 people live within a five-mile radius of a census tract;
- `exurban` or small town: between 25,000 and 99,999 people within a five-mile radius;
- `suburban` or small city: between 100,000 and 249,999 people within a five-mile radius;
- `urban` core or large city: 250,000 or more people within a five-mile radius.

`urbanization-index-2022.csv` includes the following variables:

Header | Description
------|-------------------------
`stcd` | A character variable containing the state abbreviation and congressional district number of the district observation. A concatenated variable of “state” and “cd” variables. The congressional districts for at-large seats in states with only one district are listed as `01` (for example, Alaska’s lone seat is `AK-01`). 
`state` | The state abbreviation. 
`cd` | The congressional district number. 
`pvi_22` | FiveThirtyEight’s partisan lean for each congressional district ahead of the 2022 midterm elections. Positive values indicate a Democratic lean, negative values indicate a Republican lean. Partisan lean is the average margin difference between how a state or district votes and how the country votes overall. This version of partisan lean, meant to be used for congressional and gubernatorial elections, is calculated as 50 percent the state or district’s lean relative to the nation in the most recent presidential election, 25 percent its relative lean in the second-most-recent presidential election and 25 percent a custom state-legislative lean based on the statewide popular vote in the last four state House elections. 
`urbanindex` | FiveThirtyEight’s urbanization index for each congressional district. The urbanization index is the natural logarithm of the average number of people living within a five-mile radius of every census tract in a given district, based on a weighted average of the population of each census tract in the 2020 census. 
`rural` | The percentage of the district population that live in census tracts where fewer than 25,000 people live within a five-mile radius. 
`exurban` | The percentage of the district population that live in census tracts where between 25,000 and 99,999 people live within a five-mile radius. 
`suburban` | The percentage of the district population that live in census tracts where between 100,000 and 249,999 people live within a five-mile radius. 
`urban` | The percentage of the district population that live in census tracts where 250,000 or more people within a five-mile radius. 
`grouping` | FiveThirtyEight’s categorization of congressional districts based on their urbanization index. `Dense Urban` districts have an urbanization index of 13 or higher; `Urban-Suburban` districts have an urbanization index from 12.5 up to 13; `Dense Suburban` districts have an urbanization index from 11.5 up to 12.5; `Suburban-Exurban` districts have an urbanization index from 10.5 up to 11.5; `Rural-Exurban` districts have an urbanization index from 9.5 up to 10.5; and `Mostly Rural` districts have an urbanization index below 9.5. 
