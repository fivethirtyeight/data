# Police Residence

This folder contains data behind the story [Most Police Don’t Live In The Cities They Serve](http://fivethirtyeight.com/datalab/most-police-dont-live-in-the-cities-they-serve/).

Includes the cities with the 75 largest police forces, with the exception of Honolulu for which data is not available. All calculations are based on data from the U.S. Census.

The Census Bureau numbers are potentially going to differ from other counts for three reasons:

1. The census category for police officers also includes sheriffs, transit police and others who might not be under the same jurisdiction as a city’s police department proper. The census category won’t include private security officers.
2. The census data is estimated from 2006 to 2010; police forces may have changed in size since then.
3. There is always a margin of error in census numbers; they are estimates, not complete counts.

__How to read `police-locals.csv`__

Header | Definition
---|---------
`city` | U.S. city
`police_force_size` | Number of police officers serving that city
`all` | Percentage of the total police force that lives in the city
`white` | Percentage of white (non-Hispanic) police officers who live in the city
`non-white` | Percentage of non-white police officers who live in the city
`black` | Percentage of black police officers who live in the city
`hispanic` | Percentage of Hispanic police officers who live in the city
`asian` | Percentage of Asian police officers who live in the city

__Note:__ When a cell contains `**` it means that there are fewer than 100 police officers of that race serving that city.
