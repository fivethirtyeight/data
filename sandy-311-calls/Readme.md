# Sandy 311 Calls

This folder contains data behind the story [The (Very) Long Tail Of Hurricane Recovery](https://projects.fivethirtyeight.com/sandy-311/).

Data was collected from the [NYC OpenData](https://data.cityofnewyork.us/City-Government/311-Call-Center-Inquiry/tdd6-3ysr) website. The [data dictionary](https://data.cityofnewyork.us/api/views/wewp-mm3p/files/3a563b1d-9e0b-4824-98c7-a308bbc5ce6e?download=true&filename=Call%20Center%20Inquiry%20Data%20Dictionary.xlsx), hosted on the city's  website, contains an "Agency List" tab with the full form of each agency's acronym.

You can recreate this spreadsheet by downloading all the data from Oct. 2012 to today from that site (warning: it's very large), and running the following R code:

```
allCalls <- read.csv('DOWNLOADED_DATA_HERE')

justSandy <- allCalls[grepl("Sandy", allCalls$BRIEF_DESCRIPTION),]

library(reshape2)
justSandy$date <- mdy(justSandy$DATE)
bydate <- dcast(justSandy, date ~ AGENCY)
```