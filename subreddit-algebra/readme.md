# Subreddit Algebra

This directory contains the code and data behind the story [Dissecting Trump's Most Rabid Online Following](https://fivethirtyeight.com/features/dissecting-trumps-most-rabid-online-following/).

The raw data (an online cache of Reddit comments going back to 2005) is from [Google's BigQuery](https://bigquery.cloud.google.com/table/fh-bigquery:reddit_comments.2015_05) and more information about the data can [be found here](https://www.reddit.com/r/bigquery/comments/3cej2b/17_billion_reddit_comments_loaded_on_bigquery/).

Details about the three files of code in this folder:

File | Description
---|---------
`processData.sql` | SQL code for filtering, processing and formatting Reddit comment data from Google's BigQuery. (Note that if you click on the raw data link above, this SQL query will automatically be loaded).
`subredditVectorAnalysis.R` | Conducts a latent semantic analysis of over 50,000 subreddits that creates a vector representation of each one based on commenter co-occurence. It also implements "subreddit algebra:" the ability to add and subtract different subreddits to reveal how they relate to one another.
`computeUserOverlap.sql` | A separate SQL query used for computing the user overlap between r/The_Donald and other subreddits
