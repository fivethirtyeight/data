# FiveThirtyEight.com
# Article: "Using ‘Infrastructure Jobs’ as a Measuring Stick For State-Level Spending"
# Published on: June 3, 2014
# Article Author: Andrew Flowers (andrew.flowers@fivethirtyeight.com)
# Article URL: http://fivethirtyeight.com/datalab/using-infrastructure-jobs-as-a-measuring-stick-for-state-level-spending/

# Code Author: Andrew Flowers (andrew.flowers@fivethirtyeight.com)
# Dependent files: payroll-states.csv

# Purpose: Get state-level data on "Heavy Construction and Civil Engineering"  
# Will produce statepayrolls.csv file after running

# Get data
temp<-tempfile()
download.file("http://download.bls.gov/pub/time.series/sm/sm.data.62.Construction.Current",temp)
statepay.raw<-read.table(temp,header=TRUE,sep="\t",stringsAsFactors=FALSE,strip.white=TRUE)
unlink(temp)

# Add series info
series<-read.table("http://download.bls.gov/pub/time.series/sm/sm.series",sep="\t",header=TRUE,strip.white=TRUE)
state<-read.csv("payroll-states.csv",header=TRUE,strip.white=TRUE)
series<-merge(series,state,by="state_code")

# Add industry info
industry<-read.table("http://download.bls.gov/pub/time.series/sm/sm.industry", sep="\t", header=TRUE, strip.white=TRUE)
industry$industry_name<-NULL
industry$industry_name<-row.names(industry)
row.names(industry)<-NULL
names(industry)<-c("industry_name","industry_code")

series<-merge(series,industry,by="industry_code")

statepay<-merge(statepay.raw,series,by="series_id")

# Take out heavy construction industry data (which is coded 20237000)
heavyIndCodes<-c(20237000, 20237100, 20237200, 20237300, 20237900)
statepay.heavy<-statepay[grep(heavyIndCodes[1], statepay$industry_code),]

# Clean state data
statepay.NSA<-subset(statepay.heavy,!period=="M13")
statepay.NSA<-subset(statepay.NSA, area_code==0)
statepay.NSA$date<-as.Date(paste(statepay.NSA$year,statepay.NSA$period,"01",sep="-"),"%Y-M%m-%d")
statepay.NSA<-subset(statepay.NSA,select=c("series_id","date","state_name","value"))

# Convert to time series
require(reshape2)
statepay.NSA.t<-dcast(statepay.NSA, date ~ state_name,value.var="value") #  ,fun.aggregate=mean)
write.csv(statepay.NSA.t,file="statepayrolls.csv")


