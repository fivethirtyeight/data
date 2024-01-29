# State of the State

This folder contains the data behind the story [What America’s Governors Are Talking About](https://fivethirtyeight.com/features/what-americas-governors-are-talking-about/).

`index.csv` contains a listing of each of the 50 speeches, one for each state as well as the name and party of the state's governor and a link to an official source for the speech. If an official government source could not be found, we have linked to a news media source that had a transcript of the speech.

The `speeches/` folder contains 50 `.txt` files containing the text of each of the speeches.

`words.csv` contains every one-word phrase that was mentioned in at least 10 speeches and every two- or three-word phrase that was mentioned in at least five speeches after a list of stop-words was removed and the word "healthcare" was replaced with "health care" so that they were not counted as distinct phrases. It also contains the results of a [chi^2 test](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.chi2.html#sklearn.feature_selection.chi2) that shows the statistical significance of and associated p-value of phrases.

Column | Definition
-------|-----------
`n-gram` | one-, two- or three-word phrase
`category` | thematic categories for n-grams hand-coded by FiveThirtyEight staff: `economy/fiscal issues`, `education`, `health care`, `energy/environment`, `crime/justice`, `mental health/substance abuse`
`d_speeches` | number of Democratic speeches containing the n-gram
`r_speeches` | number of Republican speeches containing the n-gram
`total` | total number of speeches containing the n-gram
`percent_of_d_speeches` | percent of the 23 Democratic speeches containing the phrase
`percent_of_r_speeches` | percent of the 27 Republican speeches containing the phrase
`chi2` | [chi^2 statistic](https://scikit-learn.org/stable/modules/generated/sklearn.feature_selection.chi2.html#sklearn.feature_selection.chi2)
`pval` | p-value for chi^2 test
