#### Story: "Dear Mona, What’s The Most Common Name In America?"
#### Url: http://fivethirtyeight.com/features/whats-the-most-common-name-in-america/ 
#### Authors: Mona Chalabi (Mona.Chalabi@fivethirtyeight.com) and Andrew Flowers (andrew.flowers@fivethirtyeight.com)

require(babynames)
require(dplyr)
require(reshape2)
require(zoo)
require(datasets)

# Census population parameters
pop2000 <- 276059000 # year 2000 population
pop2013 <- 316128839 # year 2013 population

hispPopShare <- .171 # Hispanic share of overall population
foreignPopShare <- .127 # Foreign-born share of overall population

# Census growth rates by racial categories, 2000-2013
whiteGrowth  <- 1.01155164
blackGrowth  <- 1.138799977
aianGrowth  <- 1.110695106
asianGrowth  <- 1.553975166
twoRaceGrowth  <-  1.817182595
hispGrowth <- 1.531490233

### Step 1: Actuarial Adjustments
# Create actuarial ajustments by birth year according to SSA probabilities

aging  <- read.csv("aging-curve.csv") # taken from SSA: http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7.html; 2013 is used as base year

agingSmooth  <- data.frame(year=c(1900:2013))

agingSmooth$perctAliveMale  <- aging[match(agingSmooth$year, aging$Decade),]$Male.1
agingSmooth$perctAliveFemale  <- aging[match(agingSmooth$year, aging$Decade),]$Female.1

agingSmooth$perctAliveMale[1:111] <- na.approx(agingSmooth$perctAliveMale)
agingSmooth$perctAliveFemale[1:111] <- na.approx(agingSmooth$perctAliveFemale)

agingSmooth$perctAliveMale[112:114] <- 0.993480 # Assume probabilities are flat since 2010
agingSmooth$perctAliveFemale[112:114] <- 0.994490 # Assume probabilities are flat since 2010

# Estimate stock of first names of those currently living, using actuarial probablities

babyNames  <- babynames  %>% filter(year>=1900)

babyNames$perctAlive  <- ifelse(babyNames$sex=="F", agingSmooth[match(babyNames$year, agingSmooth$year),]$perctAliveFemale, agingSmooth[match(babyNames$year, agingSmooth$year),]$perctAliveMale)
babyNames$nAlive <- babyNames$n * babyNames$perctAlive

stockNames  <- babyNames  %>% group_by(name) %>% 
    dplyr::summarize(totalAlive=sum(nAlive)) %>% ungroup() %>%
    arrange(desc(totalAlive))

grep("Maria", stockNames$name)[1] # "Maria" is the 97th most common first name (unadjusted)

stockNames$perct2013  <- stockNames$totalAlive/pop2013

#### Step 2: Adjust first names to correct for undercounting of Hispanic names

# Why? Need to scale up Hispanic/Latino names because immigration not factored into SSA data set
# We can make inferences about Hispanic name undercounting by looking at names by state, which the SSA does provide.

######### ONLY RUN THIS ONCE, DATA SAVED IN all-states-babynames.csv #########
    # Download state files from here: http://www.ssa.gov/oact/babynames/state/namesbystate.zip
    # stateFiles  <- grep("\\.TXT", list.files())
    # allStates  <- data.frame()
    # for (i in stateFiles){
    #     stateData  <- read.table(list.files()[i], sep=",")
    #     allStates <- rbind(allStates, stateData)
    # }
    # names(allStates)  <- c("state", "sex", "year", "name", "n")
    # write.csv(allStates, "all-states-babynames.csv")
######### ONLY RUN THIS ONCE, DATA SAVED IN all-states-babynames.csv #########

allStates  <- read.csv("all-states-babynames.csv", stringsAsFactors=F) # Huge file, created from code above
allStates$perctAlive  <- ifelse(allStates$sex=="F", agingSmooth[match(allStates$year, agingSmooth$year),]$perctAliveFemale, agingSmooth[match(babyNames$year, agingSmooth$year),]$perctAliveMale)
allStates$nAlive <- allStates$n * allStates$perctAlive

stateNames  <- allStates %>% group_by(name, state) %>% 
    dplyr::summarize(totalAlive=sum(nAlive)) %>% ungroup() %>%
    arrange(desc(totalAlive))

# Import state's hispanic population
statePop  <- read.csv("state-pop.csv", stringsAsFactors=F)
statePop$totalPop  <-  gsub( ",", "", statePop$totalPop)
statePop$hispPop  <-  gsub( ",", "", statePop$hispPop)
statePop$hispPerct  <- as.numeric(statePop$hispPop)/as.numeric(statePop$totalPop)
statePop$state  <- state.abb[match(statePop$state, state.name)]
statePop$state[9]  <- "DC" # Correct D.C. being coded as "NA"

# Add Hispanic population percentage and state population to each name/state combo
stateNames$hispPerct  <- statePop[match(stateNames$state, statePop$state),]$hispPerct
stateNames$statePop  <- statePop[match(stateNames$state, statePop$state),]$totalPop

# Calculate frequency of that name in that state, nation-wide, and difference between the two
stateNames$stateFreq <- as.numeric(stateNames$totalAlive) /  as.numeric(stateNames$statePop)
stateNames$natFreq <- stockNames[match(stateNames$name, stockNames$name),]$perct2013
stateNames$diffFreq <- stateNames$stateFreq - stateNames$natFreq 

# Group name/state combos into one national total, and take top 1000 names
natNamesByState  <- stateNames %>% group_by(name) %>% summarize(n=sum(totalAlive)) %>% arrange(desc(n))
topNames  <- natNamesByState[1:1000,]$name

# Regress each state's Hispanic population on the frequency each first name appears in the state.
coefs  <- data.frame()

# Formula: stateFrequency ~ intercept + hispPerct, weighted by the square-root of the state's population
for(i in 1:length(topNames)){
    name <- paste0("^", topNames[i], "$")
    m <- lm(data=stateNames[grep(name, stateNames$name),], formula=stateFreq~hispPerct, weights=sqrt(as.numeric(statePop)))
    coefs  <- rbind(coefs, coef(m))
}

names(coefs) <- c("intercept", "hispPerct")
coefs$name <- topNames
coefs$correction  <- (coefs$intercept + coefs$hispPerct*hispPopShare)/(coefs$intercept + coefs$hispPerct*foreignPopShare)
hispNameCorrex  <- coefs %>% arrange(desc(correction))

# Cap Hispanic name correction on top and bottom 
hispNameCorrex$correction  <- ifelse(hispNameCorrex$correction > (hispPopShare/foreignPopShare), (hispPopShare/foreignPopShare), hispNameCorrex$correction)
hispNameCorrex$correction  <- ifelse(hispNameCorrex$correction < (1-hispPopShare)/(1-foreignPopShare), (1-hispPopShare)/(1-foreignPopShare), hispNameCorrex$correction)

stockNames$correction  <- hispNameCorrex[match(stockNames$name, hispNameCorrex$name),]$correction
stockNames$correction  <- ifelse(is.na(stockNames$correction), 1.0, stockNames$correction)
stockNames$newTotal  <- stockNames$total * stockNames$correction

stockNames$newPerct2013  <- stockNames$newTotal / pop2013

stockNames2  <- stockNames %>% arrange(desc(newPerct2013))

#### Step 3: Surnames analysis

# Adjust up surnames by their racial shares percent
surnames  <- read.csv("surnames.csv", stringsAsFactors=F)

# Growth rates taken from 2000 to 2013; parameters are at top of script
surnames$hispCount2013 <- (as.numeric(surnames$count) * (as.numeric(surnames$pcthispanic)/100)) * hispGrowth
surnames$whiteCount2013 <- (as.numeric(surnames$count) * (as.numeric(surnames$pctwhite)/100)) * whiteGrowth
surnames$blackCount2013 <- (as.numeric(surnames$count) * (as.numeric(surnames$pctblack)/100)) * blackGrowth
surnames$asianCount2013 <- (as.numeric(surnames$count) * (as.numeric(surnames$pctapi)/100)) * asianGrowth
surnames$aianCount2013 <- (as.numeric(surnames$count) * (as.numeric(surnames$pctaian)/100)) * aianGrowth
surnames$twoRaceCount2013 <- (as.numeric(surnames$count) * (as.numeric(surnames$pct2prace)/100)) * twoRaceGrowth
surnames$Count2013  <- surnames$hispCount2013 + surnames$whiteCount2013 + surnames$blackCount2013 + surnames$asianCount2013  + surnames$aianCount2013 + surnames$twoRaceCount2013
surnames$perct2013  <- surnames$Count2013/pop2013
surnames  <- surnames %>% arrange(desc(perct2013)) 

# Filter out top 100 surnames and first names
topFirstName  <- stockNames2[1:100,] %>% select(name, newPerct2013)
topSurnames  <- surnames[1:100,] %>% select(name, perct2013)

# Create empty matrix of top 100 surnames and first names 

nameMatches  <- data.frame(matrix(NA, nrow = 100, ncol = 100))
row.names(nameMatches)  <- topFirstName$name
names(nameMatches)  <- topSurnames$name

# Calculate "independent" probabilities

for (i in 1:100){
    nameMatches[,i] <- topFirstName$newPerct2013 * topSurnames[i,]$perct2013
}

nameMatches2  <- nameMatches * pop2013 # Scale matrix by 2013 population

# Melt independent name name matches

longNames  <- melt(nameMatches2, measure.vars=1:100)
longNames$firstName <- rep(topFirstName$name, 100)
longNames <- longNames  %>% select(firstName, variable, value)  %>% arrange(desc(value))
names(longNames)  <- c("FirstName", "Surname", "EstimatedNumber")

# Read in Hartman's adjustments table, and melt it
# Source for the data in the 'adjustments.csv' is here: http://mypage.siu.edu/lhartman/johnsmith.html

adjustments  <- read.csv("adjustments.csv")
adjustments2 <- melt(adjustments, measure.vars=2:21)
names(adjustments2)  <- c("FirstName", "Surname", "Adjustment")

# Clean full names, attach estimated number (by pure independent odds) 

longNames$cleanName  <- paste(tolower(longNames$FirstName), tolower(longNames$Surname), sep=" ")
adjustments2$cleanName  <- paste(tolower(adjustments2$FirstName), tolower(adjustments2$Surname), sep=" ")
adjustments2$Estimate  <- longNames[match(adjustments2$cleanName, longNames$cleanName),]$EstimatedNumber

adjustedTotals  <- adjustments2 %>% arrange(desc(Estimate))
adjustedTotals$finalEstimate  <- adjustedTotals$Estimate * (1+ (adjustedTotals$Adjustment/100))
adjustedTotals  <- adjustedTotals %>% arrange(desc(finalEstimate))

adjustedMatrix  <- dcast(adjustedTotals, formula=FirstName~Surname)

longNames$finalEstimate <- adjustedTotals[match(longNames$cleanName, adjustedTotals$cleanName),]$finalEstimate
finalMatrix  <- dcast(longNames, formula=FirstName~Surname)

tableNames  <- row.names(nameMatches)[1:20]

finalMatrix2  <- finalMatrix[match(tableNames, finalMatrix$FirstName),]
advMatrixFinal  <- finalMatrix2[,1:21]

#### Numbers to check in piece
sum(stockNames2$newPerct2013) # first names cover 80% of population
sum(stockNames2$newTotal) # first names cover 255 million people

grep("maria garcia", adjustments2$cleanName) # Maria Garcia (unadjusted) is the 354th most common name
grep("maria smith", adjustments2$cleanName) # Maria Smith (unadjusted) is the 74th most common name

surnames[grep("GEORGE", surnames$name)[1],]$perct2013 * stockNames2[grep("Kieron", stockNames2$name)[1],]$newPerct2013 * pop2013 # "Kieron George" odds

surnames[grep("LOTT", surnames$name)[1],]$count # Number of Americans with last name "Lott", should be 25118

#### Files to export

write.csv(topFirstName, "new-top-firstNames.csv")
write.csv(topSurnames, "new-top-surnames.csv")
write.csv(nameMatches2, "independent-name-combinations-by-pop.csv")
write.csv(advMatrixFinal, "adjusted-name-combinations-matrix.csv")
write.csv(adjustedTotals, "adjusted-name-combinations-list.csv")


