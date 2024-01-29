# Nutrition Studies

This directory contains data and code behind the story [You Can’t Trust What You Read About Nutrition](http://fivethirtyeight.com/features/you-cant-trust-what-you-read-about-nutrition).

Many studies of diet and nutrition include multiple variables with vast amounts of data, making it easy to p-hack your way to sexy (and false) results. We learned this firsthand when we invited readers to take a survey about their eating habits known as the food frequency questionnaire and answer a few other questions about themselves. We ended up with 54 complete responses and looked for associations much as researchers look for links between foods and dreaded diseases. It was easy to find them. 

*Warning*: This is evil (statistical) work. Do not go to the dark side. Do not try this at home.

This directory contains three files:

File | Description
--- | -----
`raw_anonymized_data.csv` | The FFQ and survey data from 54 respondents
`p_hacking.R` | An R script that performs 27,716 regressions
`p_values_analysis.csv` | The output data file listing the p-values

**Note:** This is an intentionally shady regression analysis, both because of the "p-hacking" or "data mining" behind running more than 27,000 regressions and because the statistics reported were the p-values of the characteristics (the independent variables).

**IN OTHER WORDS: THIS IS NOT AN EXAMPLE OF SOUND DATA ANALYSIS.**