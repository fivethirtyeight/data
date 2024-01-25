# FiveThirtyEight's Pollster Ratings

This directory contains the data behind FiveThirtyEight's pollster ratings. 

See also:

* [FiveThirtyEight's Pollster Ratings](https://projects.fivethirtyeight.com/pollster-ratings/)
* [What are the best pollsters in America?](https://abcnews.go.com/538/best-pollsters-america/story?id=105563951) (2024)
* [The Polls Were Historically Accurate In 2022](https://fivethirtyeight.com/features/2022-election-polling-accuracy/) (2023)
* [The Death Of Polling Is Greatly Exaggerated](https://fivethirtyeight.com/features/the-death-of-polling-is-greatly-exaggerated/) (2021)
* [The State Of The Polls, 2019](https://fivethirtyeight.com/features/the-state-of-the-polls-2019/)
* [The Polls Are All Right](https://fivethirtyeight.com/features/the-polls-are-all-right/) (2018)
* [The State Of The Polls, 2016](https://fivethirtyeight.com/features/the-state-of-the-polls-2016/)
* [How FiveThirtyEight Calculates Pollster Ratings](https://fivethirtyeight.com/features/how-fivethirtyeight-calculates-pollster-ratings/). Note: This methodology was in effect from 2014 through 2023.
* [How 538's pollster ratings work](https://abcnews.go.com/538/538s-pollster-ratings-work/story?id=105398138). Note: This methodology is in effect from 2024 onward.

Past data can be found in the directories in this repository. The codebook for data calculated between 2014 and 2023 can be found [here](README_PRE2024.md). 

---

`raw-polls.csv` contains all of the polls analyzed to give each pollster a rating. Descriptions for each column are in the table below.

Header | Definition
---|---------
`poll_id` | FiveThirtyEight poll ID number.
`question_id` | FiveThirtyEight question ID number. Note that there may be more than one question from the same poll included in the data.
`race_id` | FiveThirtyEight race ID number.
`cycle` | Election cycle.
`location` | Geography of the question. This may be a state, House district, or the US.
`type_simple` | Category of the race. This value is structured with the type of election (`Sen`, `Gov`, `Pres`, or `House`) followed by a dash, and then either `P` or `G` to indicate if the survey is of a primary or general election, respectively. House generic ballot polls are noted as `House-G-US`.
`race` | Race for this question. This is structured as the year, followed by an underscore and the simple type, followed by an underscore and the location. For presidential primaries, the party is indicated with a `-R` or `-D` after `Pres`.
`pollster` | Pollster name.
`pollster_rating_id` | FiveThirtyEight pollster rating ID number.
`aapor_roper` | Boolean flag for whether the pollster is a member of the [AAPOR Transparency Initiative](https://aapor.org/standards-and-ethics/transparency-initiative/) or contributes polls to the [Roper Center](https://ropercenter.cornell.edu/).
`inactive` | Boolean flag for whether the pollster appears to still be conducting publicly available opinion polls.
`methodology` | Mode used to conduct this poll. This should be a combination of one or more of the following values, separated by a forward slash:<ul><li>`Live Phone` — Live telephone interviews, may or may not include calls to cell phones</li><li>`IVR`  — Interactive voice response, otherwise known as automated polls or "robopolls"</li><li>`Online Panel` — Opt-in online panel, either proprietary or contracted to a panel provider</li><li>`Text-to-Web` — Recruitment via text messages that direct participants to a website to complete the survey</li><li>`Probability Panel` — [Probability based online panel](https://ropercenter.cornell.edu/how-do-probability-based-online-panels-work)</li><li>`Email` — Recruitment via emails that direct participants to a website to complete the survey</li><li>`Mail-to-Web` — Recruitment via snail mail that directs participants to a website to complete the survey</li><li>`Mail-to-Phone` — Recruitment via snail mail that directs participants to call a phone number to complete the survey</li><li>`Text` — Recruitment via text message in which questions are asked directly over SMS</li><li>`Mail`— By U.S. mail or other “snail mail” service</li><li>`Online Ad` — Recruitment via advertisement on websites, mobile games, or other online medium</li><li>`App Panel` — Opt-in panel using a proprietary app</li><li>`Face-to-face` — Poll conducted in person</li></ul>
`partisan` | Flag for internal/partisan poll. "D" indicates Democratic poll, "R" indicates Republican poll, "I" indicates poll put out by independent candidate's campaign. Note that different sources define these categories differently and our categorization will often reflect the original source's definition. In other words, these definitions may be inconsistent and should be used carefully.
`polldate` | Median field date of the poll.
`electiondate` | Date of the election.
`time_to_election` | Number of days between the median field date of the poll and the election date.
`samplesize` | Sample size of the question. For questions with no sample size available, this is approximated as the median sample size for races of the same type.
`cand1_name` | Name of Candidate #1. Candidates #1 and #2 are defined as the top two finishers in the election (regardless of whether or not they were the top two candidates in the poll). In races where a Democrat and a Republican were the top two finishers, Candidate #1 is the Democrat.
`cand1_id` | FiveThirtyEight ID number for Candidate #1.
`cand1_party` | Party code for Candidate #1.
`cand1_pct` | Candidate #1's share of the vote in the poll.
`cand1_actual` | Actual share of vote for Candidate #1
`cand2_name` | Name of Candidate #2. 
`cand2_id` | FiveThirtyEight ID number for Candidate #2.
`cand2_party` | Party of Candidate #2.
`cand2_pct` | Candidate #2's share of the vote in the poll.
`cand2_actual` | Actual share of vote for Candidate #2
`margin_poll` | Projected margin of victory (defeat) for Candidate #1. This is calculated as `cand1_pct - cand2_pct`. In races between a Democrat and a Republican, positive values indicate a Democratic lead; negative values a Repubican lead.
`margin_actual` | Actual margin in the election. This is calculated as `cand1_actual - cand2_actual`. In races between a Democrat and a Republican, positive values indicate a Democratic win; negative values a Republican win.


`pollster-ratings-combined.csv` contains the output of the pollster ratings algorithm for each pollster. A description of the columns is in the table below.

Header | Definition
---|---------
`pollster` | Pollster name.
`pollster_rating_id` | FiveThirtyEight pollster rating ID number.
`aapor_roper` | Boolean flag for whether the pollster is a member of the [AAPOR Transparency Initiative](https://aapor.org/standards-and-ethics/transparency-initiative/) or contributes polls to the [Roper Center](https://ropercenter.cornell.edu/).
`inactive` | Boolean flag for whether the pollster appears to still be conducting publicly available opinion polls.
`numeric_grade` | FiveThirtyEight numeric overall rating for the pollster.
`rank` | FiveThirtyEight pollster rank based on numeric grade. Note that pollsters that are flagged as inactive do not have a numeric grade and appear at the end of the rankings; this is not intended to indicate anything about their skill level.
`POLLSCORE` | Score including both error and bias (but not transparency). Lower numbers are better. Stands for Predictive Optimization of Latent skill Level in Surveys, Considering Overall Record, Empirically.
`wtd_avg_transparency` | Average transparency score for polls conducted by this pollster, weighted by the age of the survey.
`number_polls_pollster_total` | Number of questions used to evaluate the pollster.
`percent_partisan_work` | Percent of the pollster's polls that are considered partisan by FiveThirtyEight's standards.
`error_ppm` | Predictive Plus-Minus for pollster's absolute error, as described in the pollster ratings methodology.
`bias_ppm` | Predictive Plus-Minus for pollster bias, as described in the pollster ratings methodology.
`number_polls_pollster_time_weighted` | Number of questions used to evaluate the pollster, weighted by the age of the survey.
`ranking_value` | Value used to determine pollster rank, as described in the pollster ratings methodology.
