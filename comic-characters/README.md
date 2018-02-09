# Comic Characters

This folder contains data behind the story [Comic Books Are Still Made By Men, For Men And About Men](http://fivethirtyeight.com/features/women-in-comic-books/).

The data comes from [Marvel Wikia](http://marvel.wikia.com/Main_Page) and [DC Wikia](http://dc.wikia.com/wiki/Main_Page). Characters were scraped on August 24. Appearance counts were scraped on September 2. The month and year of the first issue each character appeared in was pulled on October 6.

The data is split into two files, for DC and Marvel, respectively: `dc-wikia-data.csv` and `marvel-wikia-data.csv`. Each file has the following variables:

Variable | Definition
---|---------
`page_id` | The unique identifier for that characters page within the wikia
`name` | The name of the character
`urlslug` | The unique url within the wikia that takes you to the character
`ID` | The identity status of the character (Secret Identity, Public identity, [on marvel only: No Dual Identity])
`ALIGN` | If the character is Good, Bad or Neutral
`EYE` | Eye color of the character
`HAIR` | Hair color of the character
`SEX` | Sex of the character (e.g. Male, Female, etc.)
`GSM` | If the character is a gender or sexual minority (e.g. Homosexual characters, bisexual characters)
`ALIVE` | If the character is alive or deceased
`APPEARANCES` | The number of appareances of the character in comic books (as of Sep. 2, 2014. Number will become increasingly out of date as time goes on.)
`FIRST APPEARANCE` | The month and year of the character's first appearance in a comic book, if available
`YEAR` | The year of the character's first appearance in a comic book, if available
