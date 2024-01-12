# Candidate visits 2024 GOP primary

This directory contains the data behind [Can a busy campaign schedule save Trump's GOP primary opponents?](https://abcnews.go.com/538/busy-campaign-schedule-save-trumps-gop-primary-opponents/story?id=106292772).

`candidate_visits.csv` contains all public campaign events that 538 has tracked throughout the course of the 2024 primary campaign as of Jan. 11, 2024. For each candidate, tracking begins on the date that they announced their entry into the race, and ends on the date that they dropped out of the race. Tracking only includes those candidates that [538 considers "major"](https://fivethirtyeight.com/features/whos-a-serious-candidate-for-the-republican-nomination-and-whos-just-dreaming/). Public events are obtained from local media sources, candidate social media, ABC News reporters and campaign websites.

The following columns appear in the dataset.

Header | Definition
---|---------
`Candidate name` | Name of the candidate.
`Date` | Date of the event.
`City` | Name of the city in which the event was held. In cases where the city is not known, the county name may appear here or the column may be left blank.
`State` | The state in which the event was held.
`Primary purpose` | The purpose of the event. Note that the candidate may do multiple things in the same city; we count here only the primary reason for the visit. For example, a candidate might visit Des Moines, Iowa, to give a speech, and also stop at a local pizza shop to shake hands. We would count only the speech as a campaign event in that case.
`Host organization` | If the event is hosted by or conducted in conjunction with an organization other than the campaign itself, this column contains the name of the organization.
`Notes` | Notes about the event.

Sources: Campaign websites, social media, ABC News reporters, the Des Moines Register, WBTS (NBC10 Boston), The Nevada Independent, The Post and Courier, Ballotpedia
