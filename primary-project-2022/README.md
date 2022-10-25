# Primary Project 2022

This directory contains demographic, electoral and endorsement data for Senate, House and governor candidates in the 2022 primary elections (except Louisiana’s). It was used in the following FiveThirtyEight articles:


* [Trump’s Endorsees Have Started Losing More. But Don’t Read Into That For 2024.](https://fivethirtyeight.com/features/trumps-endorsees-have-started-losing-more-but-dont-read-into-that-for-2024/)(Aug. 29, 2022)
* [People Of Color Make Up 41 Percent Of The U.S. But Only 28 Percent Of General-Election Candidates](https://fivethirtyeight.com/features/2022-candidates-race-data/) (Sept. 21, 2022)
* [Progressives Took A Step Back In The 2022 Primaries — But They’re Playing The Long Game](https://fivethirtyeight.com/features/progressives-democrats-2022/) (Sept. 27, 2022)
* [2022 Is Not Another ‘Year Of The Woman’ ](https://fivethirtyeight.com/features/2022-women-candidates-data/) (Oct. 10, 2022)


`dem_candidates.csv` contains information about candidates in Democratic primaries. 
`rep_candidates.csv` contains information about candidates in Republican primaries. 

Electoral, endorsement and gender data was collected by FiveThirtyEight from state election officials, organization websites, social media and the [Center for American Women and Politics](https://cawp.rutgers.edu). Race data was collected by political scientists [Bernard Fraga](http://polisci.emory.edu/home/people/biography/fraga-bernard.html) and [Hunter Rendleman](https://hunterrendleman.com) using statements made by candidates, membership in racial and ethnic caucuses or organizations, racial and ethnic advocacy organizations, news reports and candidate websites.

Both `dem_candidates.csv` and `rep_candidates.csv` include:

Column | Description | Source
-------|------------|-------
`Candidate` |The name of the candidate.|Official candidate lists and election results on state government websites. 
`Gender` |The candidate's gender.|The Center for American Women and Politics’s [website](https://cawp.rutgers.edu/election-watch/2022-summary-women-candidates), candidate websites and news reports.
`Race 1` |What race or ethnicity (including Hispanic origin) the candidate primarily identifies as.|Statements made by candidates, membership in racial and ethnic caucuses or organizations, racial and ethnic advocacy organizations, news reports and candidate websites. Data collected by political scientists Bernard Fraga and Hunter Rendleman.
`Race 2` |What race or ethnicity (including Hispanic origin) the candidate secondarily identifies as, if any.|Statements made by candidates, membership in racial and ethnic caucuses or organizations, racial and ethnic advocacy organizations, news reports and candidate websites. Data collected by political scientists Bernard Fraga and Hunter Rendleman.
`Race 3` | What race or ethnicity (including Hispanic origin) the candidate tertiarily identifies as, if any.|Statements made by candidates, membership in racial and ethnic caucuses or organizations, racial and ethnic advocacy organizations, news reports and candidate websites. Data collected by political scientists Bernard Fraga and Hunter Rendleman.
`Incumbent` | Whether the candidate was an incumbent.| Official U.S. Senate, U.S. House or state gubernatorial websites.
`Incumbent Challenger` | Whether one of the candidate’s opponents in the primary was an incumbent.|Official U.S. Senate, U.S. House or state gubernatorial websites.
`State` | The state in which the candidate ran.| State government websites.
`Primary Date` | The date of the primary in which the candidate ran.| State government websites.
`Office` | The office for which the candidate ran.| Official candidate lists and election results on state government websites.
`District` | For U.S. House races, the congressional district number for which the candidate ran.|Official candidate lists and election results on state government websites.
`Primary Votes`|The raw number of votes received by the candidate in his or her primary. In states with runoffs, the results of the first primary round are used. For races that were canceled because they were uncontested, this number is 1. |Official election results on state government websites.
`Primary %`|The percentage of the vote received by the candidate in his or her primary. In states with all-party primaries, this is the percentage of the Democratic or Republican vote received by the candidate. In states with runoffs, the results of the first primary round are used. For candidates who were unopposed, this number is 100.|Official election results on state government websites.
`Primary Outcome`|Whether the candidate “Won” or “Lost” his or her primary or, if applicable, “Made runoff.”|Official election results on state government websites.
`Runoff Votes`|The raw number of votes received by the candidate in his or her runoff, if applicable.|Official election results on state government websites.
`Runoff %`|The percentage of the vote received by the candidate in his or her runoff, if applicable.|Official election results on state government websites.
`Runoff Outcome`|Whether the candidate “Won” or “Lost” his or her runoff, if applicable.|Official election results on state government websites.


`dem_candidates.csv` also includes the following endorsement data. For these fields, “Yes” indicates that the candidate was endorsed by the organization or person in question before the primary. In states with runoff elections, if an organization or person issued an endorsement after the primary but before the runoff, that is indicated by “Yes (runoff only).” “N/A” is used if the organization or person did not weigh in on the race in question. “No” is reserved only for when the endorser is supporting a candidate’s opponent or if they specifically opposed the candidate. Note that endorsements only count if issued by the national arm of each organization; endorsements by local chapters do not count.


Column | Description | Source
-------|------------|-------
`EMILY's List` | Whether the candidate was endorsed by EMILY’s List.| [EMILY’s](https://emilyslist.org/candidates/gallery/senate) [List’s](https://emilyslist.org/candidates/gallery/house) [website.](https://emilyslist.org/candidates/gallery/governor)
`Justice Dems` | Whether the candidate was endorsed by Justice Democrats. | Justice Democrats’s [website](https://www.justicedemocrats.com/candidates).
`Indivisible` | Whether the candidate was endorsed by Indivisible.| Indivisible’s [website](https://indivisible.org/candidates).
`PCCC` | Whether the candidate was endorsed by the Progressive Change Campaign Committee.|The PCCC’s [website](https://www.boldprogressives.org/candidates/).
`Our Revolution` | Whether the candidate was endorsed by Our Revolution.| Our Revolution’s [website](https://ourrevolution.com/endorsements/).
`Sunrise` | Whether the candidate was endorsed by the Sunrise Movement. | The Sunrise Movement’s [website](https://www.sunrisemovement.org/political-endorsements/). 
`Sanders` |Whether the candidate was endorsed by Sen. Bernie Sanders. | Sanders’s [Twitter account](https://twitter.com/search?q=from%3A%40berniesanders%20endorse%20OR%20endorsement&src=typed_query&f=live) and news reports.
`AOC` | Whether the candidate was endorsed by Rep. Alexandria Ocasio-Cortez. | Ocasio-Cortez’s [Twitter account](https://twitter.com/search?q=from%3A%40aoc%20endorse%20OR%20endorses%20OR%20endorsing%20OR%20endorsement&src=typed_query&f=live), her email list and news reports.
`Party Committee` | Whether the candidate was placed on the Democratic Congressional Campaign Committee’s Red to Blue list, was endorsed by the Democratic Senatorial Campaign Committee or is an incumbent Democratic governor (the Democratic Governors Association has a policy of always supporting incumbents but not getting involved in primaries that do not feature incumbents).| The DCCC’s [website](https://redtoblue.dccc.org), DSCC [press releases](https://www.dscc.org/news/) and news reports.


`rep_candidates.csv` also includes the following endorsement data. For these fields, “Yes” indicates that the candidate was endorsed by the organization or person in question before the primary. In states with runoff elections, if an organization or person issued an endorsement after the primary but before the runoff, that is indicated by “Yes (runoff only).” “N/A” is used if the organization or person did not weigh in on the race in question. “No” is reserved only for when the endorser is supporting a candidate’s opponent or if they specifically opposed the candidate. Note that endorsements only count if issued by the national arm of each organization; endorsements by local chapters do not count.

Column | Description | Source
-------|------------|-------
`Trump` | Whether the candidate was endorsed by former President Donald Trump. | Trump’s [website](https://www.donaldjtrump.com/news), his [TruthSocial account](https://www.donaldjtrump.com/news) and news reports.
`Trump Date` | The date on which the candidate was endorsed by Trump. | Trump’s [website](https://www.donaldjtrump.com/news), his [TruthSocial account](https://www.donaldjtrump.com/news) and news reports.
`Club for Growth` | Whether the candidate was endorsed by the Club for Growth. | The Club for Growth’s [website](https://www.clubforgrowth.org/elections/pac-endorsed-candidates/).
`Party Committee` | Whether the candidate reached the highest tier of the National Republican Congressional Committee’s Young Guns program or is an incumbent Republican senator or governor (the National Republican Senatorial Committee and Republican Governors Association had policies in 2022 of always supporting incumbents but not getting involved in primaries that do not feature incumbents). | The NRCC’s [website](https://gopyoungguns.com) and news reports.
`Renew America` |Whether the candidate is listed as a “Renewer” (marked as “Yes”) or a “Divider” (marked as “No”) by the Renew America Movement. | The Renew America Movement’s [website](https://renewamericamovement.com/renewers/).
`E-PAC` | Whether the candidate was endorsed by E-PAC. | E-PAC’s [website](https://elevate-pac.com/our-candidates/).
`VIEW PAC` | Whether the candidate was endorsed by VIEW PAC. | VIEW PAC’s [website](https://viewpac.org/who-we-support/).
`Maggie’s List` | Whether the candidate was endorsed by Maggie’s List. | Maggie’s List’s [website](http://maggieslist.org/candidates/2022-candidates).
`Winning for Women` | Whether the candidate was endorsed by Winning for Women. | Winning for Women’s [website](https://winningforwomen.com/2022-candidates/).
