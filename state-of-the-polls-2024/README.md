# State of the Polls 2024

This directory contains the data behind the story "[2024 has fewer polls, but they are higher quality](https://abcnews.go.com/538/2024-fewer-polls-higher-quality/story?id=115157919)."

The four files `2024_polls.csv`, `2020_polls.csv`, `2016_polls.csv` and `2012_polls.csv` contain all polls whose end date falls between 180 and 15 days before the election in each cycle that ask at least one question about who voters will choose for president, Senate, House, governor or a generic ballot question. Polls in the file `2024_polls.csv` are those published as of Oct. 28 at 9 a.m. Eastern. Each file contains the following columns:

Header | Definition
---|---------
`pollster_name` | Name of the pollster that conducted the survey.
`pollster_rating_id` | 538 identifier for the [pollster rating](https://projects.fivethirtyeight.com/pollster-ratings/) that corresponds to this pollster.
`cycle_pollster_rating` | Pollster rating for the pollster as of the time of the survey (`cycle` in the header should match the numeric cycle of the file).
`sponsor_names` | Name(s) of any sponsor organization(s) involved with the survey. Multiple sponsors are separated by a comma, where relevant. Sponsor candidates are not included in this column.
`sponsor_classifications` | Type(s) of organization(s) that sponsored the survey. If multiple different types of organizations sponsored the survey, classifications are separated by a comma.
`partisanship` | Party code indicating the partisan affiliation of the pollster or sponsor(s). Blanks indicate a nonpartisan survey. If different sponsors of the survey are from different parties, all values will appear in this column, separated by a comma.
`internal` | Logical. Whether the poll was sponsored or conducted by a candidate, campaign committee or other official party organization (`TRUE`), or otherwise (left blank).
`state` | Postal abbreviation for the state in which the survey was conducted. For national surveys, this column will take the value `US`. For presidential surveys in the congressional districts of Nebraska and Maine, this column will take one of the following values: `N1`, `N2`, `N3`, `M1` or `M2`, where the letter indicates the state and the numeral indicates the congressional district.
`start_date` | First date of the field period of the survey.
`end_date` | Last date of the field period of the survey.
`tracking` | Logical. Whether the survey is a tracking survey (`TRUE`), defined as a rolling average over multiple days in which the same respondents will appear in multiple surveys, or otherwise (`FALSE`).
`has_prez?` | Logical. Whether the survey contains at least one question asking who respondents will vote for in the presidential election (`TRUE`), or otherwise (`FALSE`).
`has_generic?` | Logical. Whether the survey contains at least one generic ballot question (`TRUE`), or otherwise ( `FALSE`).
`has_senate?` | Logical. Whether the survey contains at least one question asking who respondents will vote for in a U.S. Senate election (`TRUE`), or otherwise ( `FALSE`).
`has_house?` | Logical. Whether the survey contains at least one question asking who respondents will vote for in a specific U.S. House of Representatives election (`TRUE`), or otherwise ( `FALSE`).
`media?` | Logical. Whether the survey was conducted or sponsored by a media organization (`TRUE`), or otherwise (left blank).
`university?` | Logical. Whether the survey was conducted or sponsored by a university, college, or department in a university or college (`TRUE`), or otherwise (left blank).
`media_or_university` | Logical. Whether at least one of `media?` or `university?` (`TRUE`), or otherwise (`FALSE`).



The four files `2024_races.csv`, `2020_races.csv`, `2016_races.csv` and `2012_races.csv` contain data about individual congressional races in each cycle. Each file contains the following columns:

Header | Definition
---|---------
`type` | Which chamber the seat belongs to, listed as either `HouseRace` or `SenateRace`. 
`state` | Postal abbreviation for the state in which the seat is located.
`seat` | The congressional district or class of the race. For House races, this will read `District N`, where N is the number of the district. At-large districts are given the number 1. For Senate races, this will read `Class N`, where N is the class of the seat, presented as a roman numeral.
`num_polls` | The total number of polls for this seat with an end field date between 180 and 15 days prior to the election. This includes a small number of tracking surveys that do not have overlapping dates.
`num_polls_partisan` | The total number of polls for this seat with a final field date between 180 and 15 days prior to the election that have a partisan sponsor or pollster. 
`Cook rating` | The [Cook Political Report rating](https://www.cookpolitical.com/ratings) for the race. For cycles prior to 2024, this is the final rating of the seat. For 2024, this is the rating of the seat as of Oct. 28 at 9 a.m. Eastern.

Sources: Polls, Cook Political Report 
