# Sandy 311 Calls Dataset

Data for our story on 311 calls related to Sandy: https://projects.fivethirtyeight.com/sandy-311/

All data compiled from: https://data.cityofnewyork.us/City-Government/311-Call-Center-Inquiry/tdd6-3ysr which includes a code dictionary

You can recreate this spreadsheet by downloading all the data from Oct. 2012 to today from that site (warning: it's very large), and running the following R code:

```
allCalls <- read.csv('DOWNLOADED_DATA_HERE')

justSandy <- allCalls[grepl("Sandy", allCalls$BRIEF_DESCRIPTION),]

library(reshape2)
justSandy$date <- mdy(justSandy$DATE)
bydate <- dcast(justSandy, date ~ AGENCY)
```