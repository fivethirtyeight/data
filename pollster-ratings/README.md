# FiveThirtyEight's Pollster Ratings

This directory contains the data behind FiveThirtyEight's pollster ratings. 

See also:

* [FiveThirtyEight's Pollster Ratings](https://projects.fivethirtyeight.com/pollster-ratings/)
* [The Polls Are All Right](https://fivethirtyeight.com/features/the-polls-are-all-right/)
* [The State Of The Polls, 2016](https://fivethirtyeight.com/features/the-state-of-the-polls-2016/)
* [How FiveThirtyEight Calculates Pollster Ratings](https://fivethirtyeight.com/features/how-fivethirtyeight-calculates-pollster-ratings/)

Past data:

* [2014](2014/)
* [2016](2016/)

`pollster-stats-full.xlsx` contains a spreadsheet with all of the summary data and calculations involved in determining the pollster ratings as well as descriptions for each column.

`pollster-ratings.csv` has ratings and calculations for each pollster. A copy of this data and descriptions for each column can also be found in `pollster-stats-full.xlsx`.

`raw-polls.csv` contains all of the polls analyzed to give each pollster a grade. Descriptions for each column are in the table below.

Header | Definition
---|---------
`pollno` | FiveThirtyEight poll ID number
`race` | Election polled
`year` | Year of election (not year of poll)
`location` | Location (state or Congressional district, or "US" for national polls)
`type_simple` | Type of election (5 categories)
`type_detail` | Detailed type of election (this distinguishes between Republican and Democratic primaries, for example, whereas `type_simple` does not)
`pollster` | Pollster name
`partisan` | Flag for internal/partisan poll. "D" indicates Democratic poll, "R" indicates Republican poll, "I" indicates poll put out by independent candidate's campaign. Note that different sources define these categories differently and our categorization will often reflect the original source's definition. In other words, these definitions may be inconsistent and should be used carefully.
`polldate` | Median field date of the poll
`samplesize` | Sample size of the poll. Where missing, this is estimated from the poll's margin of error, or similar polls conducted by the same polling firm. A sample size of 600 is used if no better estimate is available.
`cand1_name` | Name of Candidate #1. Candidates #1 and #2 are defined as the top two finishers in the election (regardless of whether or not they were the top two candidates in the poll). In races where a Democrat and a Republican were the top two finishers, Candidate #1 is the Democrat and simply listed as "Democrat".
`cand1_pct` | Candidate #1's share of the vote in the poll.
`cand2_name` | Name of Candidate #2. Candidates #1 and #2 are defined as the top two finishers in the election (regardless of whether or not they were the top two candidates in the poll). In races where a Democrat and a Republican were the top two finishers, Candidate #2 is the Republican and simply listed as "Republican"
`cand2_pct` | Candidate #2's share of the vote in the poll.
`cand3_pct` | Share of the vote for the top candidate listed in the poll, other than Candidate #1 and Candidate #2.
`margin_poll` | Projected margin of victory (defeat) for Candidate #1. This is calculated as `cand1_pct - cand2_pct`. In races between a Democrat and a Republican, positive values indicate a Democratic lead; negative values a Repubican lead.
`electiondate` | Date of election
`cand1_actual` | Actual share of vote for Candidate #1
`cand2_actual` | Actual share of vote for Candidate #2
`margin_actual` | Actual margin in the election. This is calculated as `cand1_actual - cand2_actual`. In races between a Democrat and a Republican, positive values indicate a Democratic win; negative values a Republican win.
`error` | Absolute value of the difference between the actual and polled result. This is calculated as `abs(margin_poll - margin_actual)`
`bias` | Statistical bias of the poll. This is calculated only for races in which the top two finishers were a Democrat and a Republican. It is calculated as `margin_poll - margin_actual`. Positive values indicate a Democratic bias (the Democrat did better in the poll than the election). Negative values indicate a Republican bias.
`rightcall` | Flag to indicate whether the pollster called the outcome correctly, i.e. whether the candidate they had listed in 1st place won the election. A 1 indicates a correct call and a 0 an incorrect call; 0.5 indicates that the pollster had two or more candidates tied for the lead and one of the tied candidates won.
`comment` | Additional information, such as alternate names for the poll.
