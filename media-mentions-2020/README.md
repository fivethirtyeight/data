# Media Mentions 2020

This folder contains the data behind a [series of stories](https://fivethirtyeight.com/features/beto-orourke-ignored-cable-news-and-it-ignored-him/) about how often 2020 Democratic candidates are mentioned in cable news.

`cable_weekly.csv` contains the mentions of currently declared [major candidates](https://fivethirtyeight.com/features/heres-how-were-defining-a-major-presidential-candidate/) for the 2020 Democratic primary since December 30, 2018 across CNN, Fox News, and MSNBC. The TV News Archive measures coverage by splitting daily news footage into 15-second clips and finding the clips that contain a mention of our search query. Our search queries are the full names of each candidate. 


Column | Description
-------|------------
`date` | Start date for the week of coverage. A week of coverage spans from Sunday through Saturday. The cutoff for measuring coverage for any given day is midnight Eastern Standard Time. (Clock changes for Daylight Saving Time are ignored.)
`name` | Candidate's name
`matched_clips` | Number of 15-second clips that match the query
`total_clips` | Total number of 15-second clips that week across the three networks
`pct` | (`matched_clips` / `total_clips`) * 100
`query` | Query for the GDELT Television API

Data is collected using the [GDELT Television API](https://blog.gdeltproject.org/gdelt-2-0-television-api-debuts/), which processes the data from the [TV News Archive](https://archive.org/details/tv).
