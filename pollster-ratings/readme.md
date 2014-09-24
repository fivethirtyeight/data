## Political pollster ratings

The raw data behind FiveThirtyEight's pollster ratings, which . An interactive table of these ratings [can be found here]().

###`pollster-ratings.tsv`

Header | Definition
---|---------
`Pollster` | Organization that contributed the most intellectual property to the methodology and execution of the poll (rather than the organization that paid for or sponsored it)
`Polls` | Polls conducted in the final three weeks of House, Senate, gubernatorial and presidential general election campaigns since 1998, and the last three weeks of presidential primaries and caucuses since 2000
`NCPP/AAPOR/Roeper` | Yes indicates the polling firm was a member of the National Council of Public Polls (NCPP), a signatory to the American Association Public Opinion Research (AAPOR) Transparency Initiative, or a contributor to the Roper Center data archive as of Aug. 29, 2014.
`Calls Cellphones` | "Yes" indicates the polling firm is routinely placing calls to cellphones — in addition to landlines — as of Aug. 29, 2014. Text messages do not count. "Sometimes" indicates that the pollster TKTKTK. We assume a polling firm has not begun to include cellphones in its samples until we have evidence to the contrary. Pollsters that have routinely begun to include cellphones in their samples but which are listed without a "yes" should [contact FiveThirtyEight](mailto:contact@fivethirtyeight.com).
`Banned by 538` | "Yes" indicates the polling firm is not used in FiveThirtyEight’s election forecasting models because we are concerned they have faked some polling results or engaged in other gross ethical misconduct.
`Historical Advanced Plus-Minus` | How a pollster’s average error has compared to other polling firms surveying the same races, also accounting for the type of election polled, the number of days until the election, the poll’s sample size, and the number of other pollsters surveying the same race. Negative scores are favorable and indicate above-average quality.
`Predictive Plus-Minus` | A projection of how accurate the poll will be in future elections, based on a combination of a pollster’s Historical Advanced Plus-Minus score, the number of polls it has in the database, and our proxies for methodological quality.
`538 grade` |  A letter grade from "A+" to "F" which reflects a pollster’s Predictive Plus-Minus score. Firms banned by FiveThirtyEight are automatically given a grade of F.
`Mean-Reverted Bias` | A pollster’s historical average statistical bias toward Democratic or Republican candidates, reverted to a mean of zero based on the number of polls in the database.

###`raw-polls.tsv`

Contains all of the polls analyzed to give each pollster a grade.

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
`bias` | Statistical bias of the poll. This is calculated only for races in which the top two finishers were a Democrat and a Republican. It is calculated as `margin_poll - argin_actual`. Positive values indicate a Democratic bias (the Democrat did better in the poll than the election). Negative values indicate a Republican bias.
`rightcall` | Flag to indicate whether the pollster called the outcome correctly, i.e. whether the candidate they had listed in 1st place won the election. A 1 indicates a correct call and a 0 an incorrect call; 0.5 indicates that the pollster had two or more candidates tied for the lead and one of the tied candidates won.
`comment` | Additional information, such as alternate names for the poll.