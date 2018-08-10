# Primary Candidates 2018

This folder contains the data behind the story [We Researched Hundreds Of Races. Here’s Who Democrats Are Nominating.](https://fivethirtyeight.com/features/democrats-primaries-candidates-demographics/)

This project looks at patterns in open Democratic primary elections for the U.S. Senate, U.S. House and governor through August 7, 2018. 

`dem_candidates_0809.csv` contains information about the 811 candidates who have appeared on the ballot this year in Democratic primaries for Senate, House and governor, not counting races featuring a Democratic incumbent, as of August 7, 2018. Here is a description and source for each column in the accompanying dataset.

Column | Description 
-------|--------------
`Candidate` | All candidates who received votes in 2018’s Democratic primary elections for U.S. Senate, U.S. House and governor in which no incumbent ran. Supplied by Ballotpedia.
`State` | The state in which the candidate ran. Supplied by Ballotpedia.
`District` | The office and, if applicable, congressional district number for which the candidate ran. Supplied by Ballotpedia.
`Office Type` | The office for which the candidate ran. Supplied by Ballotpedia.
`Race Type` | Whether it was a “regular” or “special” election. Supplied by Ballotpedia.
`Race Primary Election Date` | The date on which the primary was held. Supplied by Ballotpedia.
`Primary Status` | Whether the candidate lost (“Lost”) the primary or won/advanced to a runoff (“Advanced”). Supplied by Ballotpedia.
`Primary Runoff Status` | “None” if there was no runoff; “On the Ballot” if the candidate advanced to a runoff but it hasn’t been held yet; “Advanced” if the candidate won the runoff; “Lost” if the candidate lost the runoff. Supplied by Ballotpedia.
`General Status` | “On the Ballot” if the candidate won the primary or runoff and has advanced to November; otherwise, “None.” Supplied by Ballotpedia.
`Gender` | “Male” or “Female.” Supplied by Ballotpedia.
`Partisan Lean` | The FiveThirtyEight partisan lean of the district or state in which the election was held. Partisan leans are calculated by finding the average difference between how a state or district voted in the past two presidential elections and how the country voted overall, with 2016 results weighted 75 percent and 2012 results weighted 25 percent.
`Primary %` | The percentage of the vote received by the candidate in his or her primary. In states that hold runoff elections, we looked only at the first round (the regular primary). In states that hold all-party primaries (e.g., California), a candidate’s primary percentage is the percentage of the total Democratic vote they received. Unopposed candidates and candidates nominated by convention (not primary) are given a primary percentage of 100 but were excluded from our analysis involving vote share. Numbers come from official results posted by the secretary of state or local elections authority; if those were unavailable, we used unofficial election results from the New York Times.
`Won Primary` | “Yes” if the candidate won his or her primary and has advanced to November; “No” if he or she lost.
`Race` | “White” if we identified the candidate as non-Hispanic white; “Nonwhite” if we identified the candidate as Hispanic and/or any nonwhite race; blank if we could not identify the candidate’s race or ethnicity. To determine race and ethnicity, we checked each candidate’s website to see if he or she identified as a certain race. If not, we spent no more than two minutes searching online news reports for references to the candidate’s race.
`Veteran?` | If the candidate’s website says that he or she served in the armed forces, we put “Yes.” If the website is silent on the subject (or explicitly says he or she didn’t serve), we put “No.” If the field was left blank, no website was available.
`LGBTQ?` | If the candidate’s website says that he or she is LGBTQ (including indirect references like to a same-sex partner), we put “Yes.” If the website is silent on the subject (or explicitly says he or she is straight), we put “No.” If the field was left blank, no website was available.
`Elected Official?` | We used Ballotpedia, VoteSmart and news reports to research whether the candidate had ever held elected office before, at any level. We put “Yes” if the candidate has held elected office before and “No” if not. 
`Self-Funder?` | We used Federal Election Committee fundraising data (for federal candidates) and state campaign-finance data (for gubernatorial candidates) to look up how much each candidate had invested in his or her own campaign, through either donations or loans. We put “Yes” if the candidate donated or loaned a cumulative $400,000 or more to his or her own campaign before the primary and “No” for all other candidates.
`STEM?` | If the candidate identifies on his or her website that he or she has a background in the fields of science, technology, engineering or mathematics, we put “Yes.” If not, we put “No.” If the field was left blank, no website was available.
`Obama Alum?` | We put “Yes” if the candidate mentions working for the Obama administration or campaign on his or her website, or if the candidate shows up on this list of Obama administration members and campaign hands running for office. If not, we put “No.”


