# Russia Investigation

This folder contains data behind the story [Is The Russia Investigation Really Another Watergate?](https://projects.fivethirtyeight.com/russia-investigation/).

`russia-investigation.csv` contains every special investigation since the Watergate probe began in 1973 and who was charged in them.

Header | Definition
---|---------
`investigation` | Unique id for each investigation
`investigation-start` | Start date of the investigation
`investigation-end` | End date of the investigation
`investigation-days` | Length, in days, of the investigation. Days will be negative if the charge occured before the investigation began.
`name` | Name of the person charged (if applicable). Will be blank if there were no charges.
`indictment-days ` | Length, in days, from the start of the investigation to the date the person was charged (if applicable). Days will be negative if the charge occured before the investigation began.
`type` | Result of charge (if applicable)
`cp-date` | Date the person pled guilty or was convicted (if applicable)
`cp-days` | Length, in days, from the start of the investigation to the date the person pled guilty or was convicted (if applicable)
`overturned` | Whether or not the relevant person's conviction was overturned
`pardoned` | Whether or not the relevant person's charge was pardoned
`american` | Whether or not the relevant person's charge was a U.S. resident
`president` | President at the center of the investigation

