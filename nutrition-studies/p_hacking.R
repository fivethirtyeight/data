# Nutrition Sutides P-hacking
# Andrew Flowers <andrew.flowers@fivethirtyeight.com>



require(readr)
require(plyr)
require(dplyr)
require(tidyr)

rawData <- read.csv("raw_anonymized_data.csv")

# Fix innie/out characteristics

rawData$belly <- revalue(rawData$belly, c("Innie"="Yes", "Outie"="No"))

# FFQ variable names (should total 1066)

ffq <- names(rawData)[28:1093]

# Characteristic variable names (should total 26)

characteristics <- names(rawData)[2:27]

# Linear regressions with respondent characteristic predicting food frequency

regValues <- data.frame(food=ffq)

for (c in characteristics) regValues[,c] <- NA # Add characteristics as blank columns to regValues data frame

for (f in ffq){
  for (c in characteristics){
    
    frm <- formula(paste0(f, "~", c))
    reg <-  summary(lm(data=rawData, formula=frm))
    regValues[which(regValues$food==f), c]  <- reg$coefficients[8]
  }
}

# Extract p-values

regAnalysis <- regValues %>%
  gather("characteristic", "p_values", 2:27) %>% 
  arrange(p_values)

# Write out p-values

write_csv(regAnalysis, "p_values_analysis.csv")

# Note: This is an intentionally shady regression analysis. Both because of the "p-hacking" or 
# "data mining" behind running over 27,000 regresison, but also in that only the statistics reported 
# were the p-values of the characteristics (the independent variables).

# IN OTHER WORDS: DO NOT TRY THIS AT HOME (AKA, THIS IS NOT AN EXAMPLE OF SOUND DATA ANALYSIS)
