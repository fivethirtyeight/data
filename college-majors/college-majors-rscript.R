##############################################################
#
# COLLEGE MAJORS AND EARNINGS
# This is the code used to generate data for FiveThirtyEight's
# story on earnings by college major.
# Analysis is based off the 2010-2012 American Community Survey
# microdata. 
# Download data here: http://www.census.gov/acs/www/data_documentation/pums_data/
# Documentation here: http://www.census.gov/acs/www/data_documentation/pums_documentation/

# First download data and select records for which college major 
# (variable FOD1P) is present. Save into data frame as MAJORS1012.
# Also download github_majorslist.csv

require(dplyr)

load("MAJORS1012")
MajorsList <- read.csv("github_majorslist.csv",header=TRUE,stringsAsFactors=FALSE)

working <- merge(MAJORS1012,MajorsList,by="FOD1P") # Check merge properly
MAJORS1012  <- working
rm(working)

# Create dummy for full-time, year-round workers
MAJORS1012$FTYR <- 0
MAJORS1012$FTYR[MAJORS1012$WKW == 1 & MAJORS1012$WKHP >= 35] <- 1
nrow(MAJORS1012[MAJORS1012$FTYR==1,])

# If you want inflation-adjusted earnings, this is how to do it
# MAJOR1012 <- mutate(MAJORS1012,RealEarn = PERNP * (ADJINC/1000000))

# We want data on three groups
# For ALL ages (no grad degree):
#   - Number: Total, Employed, Unemployed, Employed FTYR
#   - Median earnings (for FYFT)
#   - 25th and 75th percentile earnings
#   - Unemployment rate
# For ages 25+
#   - Median earnings for grad degree (FTYR)
#   - Median earnings for non grad degree (FTYR)
#   - Number with grad degree: Total, Employed, Unemployed, FTYR
#   - Number without grad degree: Total, Employed, Unemployed, FTYR
#   - Sample size
# For YOUNG (up to 27):
#   - Number: Total, Employed, Unemployed, Employed FTYR
#   - Sample size
#   - Median earnings (for FYFT)
#   - 25% and 75% percentile earnings
#   - Unemployment rate
#   - Median hours worked
#   - Share working full-time
#   - Share employed in college/noncollege and low-end jobs

# Several smaller data frames
allage <- filter(MAJORS1012,SCHL == 21) # No grad degree earners
allage.ftyr <- filter(MAJORS1012,SCHL == 21 & FTYR == 1 & PERNP >0)
over25.nograd <- filter(MAJORS1012,AGEP > 24 & SCHL == 21)
over25.grad <- filter(MAJORS1012,AGEP > 24 & SCHL > 21)
young <- filter(MAJORS1012,AGEP < 28) # This DOES include students with grad degrees
young.ftyr <- filter(young,FTYR == 1 & SCHL == 21 & SCH == 1) # But this doesn't. Also excludes those in school.

# Create dummy for low-end job
# Here's our list of low-end jobs
# 4020 .EAT-COOKS
# 4030 .EAT-FOOD PREPARATION WORKERS
# 4040 .EAT-BARTENDERS
# 4050 .EAT-COMBINED FOOD PREPARATION AND SERVING WORKERS,
# .INCLUDING FAST FOOD
# 4060 .EAT-COUNTER ATTENDANTS, CAFETERIA, FOOD CONCESSION, AND
# .COFFEE SHOP
# 4110 .EAT-WAITERS AND WAITRESSES
# 4120 .EAT-FOOD SERVERS, NONRESTAURANT
# 4130 .EAT-MISCELLANEOUS FOOD PREPARATION AND SERVING RELATED
# .WORKERS, INCLUDING DINING ROOM AND CAFETERIA ATTENDANTS AND
# .BARTENDER HELPERS
# 4140 .EAT-DISHWASHERS
# 4150 .EAT-HOSTS AND HOSTESSES, RESTAURANT, LOUNGE, AND COFFEE SHOP
# 4220 .CLN-JANITORS AND BUILDING CLEANERS
# 4230 .CLN-MAIDS AND HOUSEKEEPING CLEANERS
# 4240 .CLN-PEST CONTROL WORKERS
# 4250 .CLN-GROUNDS MAINTENANCE WORKERS
# 4720 .SAL-CASHIERS
# 4740 .SAL-COUNTER AND RENTAL CLERKS
# 4750 .SAL-PARTS SALESPERSONS
# 4760 .SAL-RETAIL SALESPERSONS
# 4940 .SAL-TELEMARKETERS

lowend <- c(4020,4030,4040,4050,4060,4110,4120,4130,4140,4150,4220,4230,4240,4250,4720,4740,4750,4760,4940)
young$LowEnd  <-  0
young$LowEnd[young$OCCP10 %in% as.list(lowend) | young$OCCP12 %in% as.list(lowend)] <- 1

# This creates a dummy for college-level jobs. Based off non-public data from Jaison R. Abel and
# Richard Deitz of the New York Fed. As a result, csv is not included here.
# collegejobs <- read.csv("collegejobs.csv",header=TRUE,stringsAsFactors=FALSE)
# young$collegejob[young$OCCP10 %in% as.list(collegejobs$OCC[collegejobs$College==1]) | 
#                    young$OCCP12 %in% as.list(collegejobs$OCC[collegejobs$College==1])]  <- 1
# young$noncollege[young$OCCP10 %in% as.list(collegejobs$OCC[collegejobs$College==0]) | 
#                    young$OCCP12 %in% as.list(collegejobs$OCC[collegejobs$College==0])]  <- 1

# Now we create three big dataframes for the analysis
AllAges <- data.frame(FOD1P = as.numeric(MajorsList$FOD1P[2:nrow(MajorsList)]),Major = MajorsList$Major[2:nrow(MajorsList)],Major_Cat = MajorsList$Major_Category[2:nrow(MajorsList)],
                      Total = NA, Employed = NA, FTYR = NA, Unemployed = NA, Urate = NA, Median = NA, P25th = NA, P75th = NA)
Ages25up <- data.frame(FOD1P = as.numeric(MajorsList$FOD1P[2:nrow(MajorsList)]),Major = MajorsList$Major[2:nrow(MajorsList)],Major_Cat = MajorsList$Major_Category[2:nrow(MajorsList)],
                       GradTotal = NA, GradEmployed = NA, GradFTYR = NA, GradUnemployed = NA, GradUrate = NA, GradMedian = NA, GradP25th = NA, GradP75th = NA,GradSample = NA,
                       NoGradTotal = NA, NoGradEmployed = NA, NoGradFTYR = NA, NoGradUnemployed = NA, NoGradUrate = NA, NoGradMedian = NA, NoGradP25th = NA, NoGradP75th = NA)
Young <- data.frame(FOD1P = as.numeric(MajorsList$FOD1P[2:nrow(MajorsList)]),Major = MajorsList$Major[2:nrow(MajorsList)],Major_Cat = MajorsList$Major_Category[2:nrow(MajorsList)],
                    Total = NA, Employed = NA, FTYR = NA, Unemployed = NA, Urate = NA, Median = NA, P25th = NA, P75th = NA, Sample = NA,
                    Median_hours = NA, FT = NA, PT = NA, LowEnd = NA, CollegeJob = NA, NonCollege = NA, Men = NA, Women = NA, ShareWomen = NA)

# We'll do this in one big for loop
loop <- seq(1:nrow(AllAges))
for (i in loop) {
  x <- AllAges$FOD1P[i]
  AllAges[i,4] <- with(allage,sum(PWGTP[FOD1P==x]))
  AllAges[i,5] <- with(allage,sum(PWGTP[FOD1P==x & (ESR == 1 | ESR == 2)]))
  AllAges[i,6] <- with(allage,sum(PWGTP[FOD1P==x & FTYR == 1]))
  AllAges[i,7] <- with(allage,sum(PWGTP[FOD1P==x & ESR == 3]))
  AllAges[i,8] <- AllAges[i,7]/(AllAges[i,5] + AllAges[i,7])
  AllAges[i,9] <- with(allage.ftyr[allage.ftyr$FOD1P == x,],median(rep(PERNP,times=PWGTP)))
  AllAges[i,10] <- with(allage.ftyr[allage.ftyr$FOD1P == x,],quantile(rep(PERNP,times=PWGTP))[2])
  AllAges[i,11] <- with(allage.ftyr[allage.ftyr$FOD1P == x,],quantile(rep(PERNP,times=PWGTP))[4])
  
  Ages25up[i,4] <- with(over25.grad,sum(PWGTP[FOD1P==x]))
  Ages25up[i,5] <- with(over25.grad,sum(PWGTP[FOD1P==x & (ESR == 1 | ESR == 2)]))
  Ages25up[i,6] <- with(over25.grad,sum(PWGTP[FOD1P==x & FTYR == 1]))
  Ages25up[i,7] <- with(over25.grad,sum(PWGTP[FOD1P==x & ESR == 3]))
  Ages25up[i,8] <- Ages25up[i,7]/(Ages25up[i,5] + Ages25up[i,7])
  Ages25up[i,9] <- with(over25.grad[over25.grad$FOD1P == x & over25.grad$FTYR ==1,],median(rep(PERNP,times=PWGTP)))
  Ages25up[i,10] <- with(over25.grad[over25.grad$FOD1P == x & over25.grad$FTYR ==1,],quantile(rep(PERNP,times=PWGTP))[2])
  Ages25up[i,11] <- with(over25.grad[over25.grad$FOD1P == x & over25.grad$FTYR ==1,],quantile(rep(PERNP,times=PWGTP))[4])
  Ages25up[i,12] <- nrow(over25.grad[over25.grad$FOD1P == x & over25.grad$FTYR ==1,])
  Ages25up[i,13] <- with(over25.nograd,sum(PWGTP[FOD1P==x]))
  Ages25up[i,14] <- with(over25.nograd,sum(PWGTP[FOD1P==x & (ESR == 1 | ESR == 2)]))
  Ages25up[i,15] <- with(over25.nograd,sum(PWGTP[FOD1P==x & FTYR == 1]))
  Ages25up[i,16] <- with(over25.nograd,sum(PWGTP[FOD1P==x & ESR == 3]))
  Ages25up[i,17] <- Ages25up[i,16]/(Ages25up[i,14] + Ages25up[i,16])
  Ages25up[i,18] <- with(over25.nograd[over25.nograd$FOD1P == x & over25.nograd$FTYR ==1,],median(rep(PERNP,times=PWGTP)))
  Ages25up[i,19] <- with(over25.nograd[over25.nograd$FOD1P == x & over25.nograd$FTYR ==1,],quantile(rep(PERNP,times=PWGTP))[2])
  Ages25up[i,20] <- with(over25.nograd[over25.nograd$FOD1P == x & over25.nograd$FTYR ==1,],quantile(rep(PERNP,times=PWGTP))[4])  
  
  Young[i,4] <- with(young,sum(PWGTP[FOD1P==x]))
  Young[i,5] <- with(young,sum(PWGTP[FOD1P==x & (ESR == 1 | ESR == 2)]))
  Young[i,6] <- with(young,sum(PWGTP[FOD1P==x & FTYR == 1]))
  Young[i,7] <- with(young,sum(PWGTP[FOD1P==x & ESR == 3]))
  Young[i,8] <- Young[i,7]/(Young[i,5] + Young[i,7])
  Young[i,9] <- with(young.ftyr[young.ftyr$FOD1P == x & young.ftyr$PERNP>0,],median(rep(PERNP,times=PWGTP)))
  Young[i,10] <- with(young.ftyr[young.ftyr$FOD1P == x & young.ftyr$PERNP>0,],quantile(rep(PERNP,times=PWGTP))[2])
  Young[i,11] <- with(young.ftyr[young.ftyr$FOD1P == x & young.ftyr$PERNP>0,],quantile(rep(PERNP,times=PWGTP))[4])
  Young[i,12] <- nrow(young.ftyr[young.ftyr$FOD1P == x & young.ftyr$PERNP>0,])
  Young[i,13] <- with(young[young$FOD1P == x,],median(na.omit(rep(WKHP,times=PWGTP))))
  Young[i,14] <- with(young,sum(na.omit(PWGTP[FOD1P==x & WKHP >= 35])))
  Young[i,15] <- with(young,sum(na.omit(PWGTP[FOD1P==x & WKHP < 35])))
  Young[i,16] <- with(young,sum(PWGTP[FOD1P==x & LowEnd == 1]))
  Young[i,17] <- with(young,sum(na.omit(PWGTP[FOD1P==x & collegejob == 1 & (ESR == 1 | ESR == 2)]))) # only want employed
  Young[i,18] <- with(young,sum(na.omit(PWGTP[FOD1P==x & noncollege == 1 & (ESR == 1 | ESR == 2)]))) # only want employed
  Young[i,19] <- with(young,sum(PWGTP[FOD1P==x & SEX == 1]))
  Young[i,20] <- with(young,sum(PWGTP[FOD1P==x & SEX == 2]))
  Young[i,21] <- Young[i,20]/(Young[i,19] + Young[i,20])
  
  print(paste(i,"of",nrow(AllAges)))
}

write.csv(Young,file="Young.csv")
write.csv(AllAges,file="AllAges.csv")
write.csv(Ages25up,file="Ages25up.csv")
