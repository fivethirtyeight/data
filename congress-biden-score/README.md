# Congress Biden Score

This directory contains the data behind “[How often every member of Congress voted with Biden in 2023](https://abcnews.go.com/538/member-congress-voted-biden-2023/story?id=106718543)”.

`biden_score_2023.xlsx` contains data on all House and Senate floor votes taken in 2023 for which President Joe Biden had a clear position (support or opposition) before the vote. It also includes data on each bill (and nomination) that was voted on and aggregate data on how often each member of Congress voted with Biden in 2023. For a full methodology, please see [the article](https://abcnews.go.com/538/member-congress-voted-biden-2023/story?id=106718543). 

This file has five sheets.

The sheet `biden_agreement` has the following columns:

Header | Definition
---|---------
`bioguide` | Congressional biography number.
`name` | Member’s name.
`chamber` | Whether the member is part of the House or the Senate.
`state` | The state each senator represents.
`district` | The district each representative represents.
`party` | Member’s party affiliation, listed as Democrat, Republican or Independent.
`agree_pct` | The percentage of votes on which each member voted in line with Biden’s position in 2023.
`biden_margin` | The difference between Biden’s vote share and former President Donald Trump’s vote share in the relevant state or district in 2020.

The sheet `biden_agreement_senate_no_noms` has the following columns:

Header | Definition
---|---------
`bioguide` | Congressional biography number.
`name` | Member’s name.
`state` | The state each senator represents.
`party` | Member’s party affiliation, listed as Democrat, Republican or Independent.
`agree_pct` | The percentage of votes on which each member voted in line with Biden’s position in 2023.
`biden_margin` | The difference between Biden’s vote share and Trump’s vote share in the relevant state or district in 2020.

The sheet `bills` has the following columns:

Header | Definition
---|---------
`bill_number` | The bill number for each bill. 
`position_link` | A link to the source of Biden’s stated position on the bill.
`bill_link` | A link to view details for each bill on Congress.gov. 
`house_vote_date` | The date the House took the final vote on a bill, if applicable. 
`senate_vote_date` | The date the Senate took the final vote on a bill, if applicable. 
`override_vote_date` | The date the veto override vote took place, if applicable. 
`house_passed` | Logical. Whether the bill passed the House.
`senate_passed` | Logical. Whether the bill passed the Senate.
`law` | Logical. Whether the bill became law.
`veto` | Logical. Whether Biden vetoed the bill. 
`biden_position` | Whether Biden supported (support) or opposed (oppose) each bill.
`summary` | A brief summary of each bill.
`notes` | Any miscellaneous notes on each bill.
`house_roll` | The roll call number of the final vote taken on the bill in the House, if applicable. Does not include veto override votes. 
`house_dem_agree` | The percentage of House Democrats that voted in line with Biden’s position on the bill.
`house_rep_agree` | The percentage of House Republicans that voted in line with Biden’s position on the bill.
`senate_roll` | The roll call number of the final vote taken on the bill in the Senate, if applicable. Does not include veto override votes. 
`senate_dem_agree` | The percentage of Senate Democrats that voted in line with Biden’s position on the bill. Does not include independents who caucus with the Democrats.
`senate_rep_agree` | The percentage of Senate Republicans that voted in line with Biden’s position on the bill.
`veto_override_roll` | The House or Senate roll call number of the veto override vote, if applicable. Veto override votes occur in the chamber the bill originated in. 
`veto_dem_agree` | The percentage of Democrats in the applicable chamber that voted in line with Biden’s position on the bill.
`veto_rep_agree` | The percentage of Republicans in the applicable chamber that voted in line with Biden’s position on the bill.

The sheet `nominations` has the following columns:

Header | Definition
---|---------
`nomination_link` | A link to view details for each Senate nomination on Congress.gov. 
`nomination_roll` | The roll call number of the confirmation vote taken on a nominee.
`nomination_vote_date` | The date of the confirmation vote.
`nomination` | The nominee being voted on and the position they were nominated for.

The sheet `votes` has the following columns:

Header | Definition
---|---------
`roll_id` | The roll call number of each vote.
`chamber` | Whether the member is part of the House or the Senate.
`name` | Member’s name.
`bioguide` | Congressional biography number.
`party` | Member’s party affiliation, listed as Democrat, Republican or Independent.
`vote` | Whether the member supported (support) or opposed (oppose) the bill or nomination.
`biden_position` | Whether Biden supported or opposed the bill or nomination. Biden’s position is listed as support for all nomination votes.

Sources: [U.S. House of Representatives](https://clerk.house.gov/Votes), [U.S. Senate](https://www.senate.gov/legislative/LIS/roll_call_lists/vote_menu_118_1.htm), [White House Office of Management and Budget](https://www.whitehouse.gov/omb/statements-of-administration-policy/), [Voteview](https://voteview.com/), [Congress.gov](https://www.congress.gov/), [Daily Kos Elections](https://www.dailykos.com/stories/2022/11/14/1163009/-Daily-Kos-Elections-presidential-results-by-congressional-district-for-2020), [Dave Leip’s Atlas of U.S. Presidential Elections](https://uselectionatlas.org/RESULTS/), news reports.
