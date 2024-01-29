# Andrew Flowers <andrew.flowers@fivethirtyeight.com>
# Nov 13, 2015



require(readr)
require(dplyr)
require(ggplot2)
require(reshape2)

# Load raw data -- instructions
# Download the raw data files from the GTD website (http://www.start.umd.edu/gtd/)
# Convert the three smaller .xlsx files into .csv files
# Then place those .csv files in a sub-directory with the name `raw-data`

rawData <- data.frame()

for (f in list.files("./raw-data/")){
  data <- read_csv(paste0(getwd(), "/raw-data/", f))
  rawData <- rbind(rawData, data)
}

dim(rawData)
names(rawData)
str(rawData)

# Add in 1993 country statistics from Appendix II of the GTD codebook
stats1993 <- read_csv("country_stats_1993_appendix2.csv")

##### France analysis #####

# Look at incidents in France
france <- rawData %>% filter(country_txt=="France")
dim(france)

# Incidents by year -- 1993 is missing from this data
table(france$iyear, useNA="ifany")
france %>% group_by(iyear) %>%
  summarize(incidents=n()) %>%
  arrange(desc(iyear))

# Fatalities by yeaer
fraFatByYear <- france %>% group_by(iyear) %>% 
  summarize(fatalities=sum(nkill, na.rm=T)) %>%
  arrange(desc(fatalities))

# Add in 1993 data -- 5 fatalities in France
fraFatByYear <- rbind(fraFatByYear, 
                      data.frame(iyear=1993, 
                                 fatalities=stats1993[match("France", stats1993$Country),]$`Number Killed`))

# Analysis: France had 274 fatalities from terrorism incidents between 1972 and 2014.
fraFatByYear
sum(fraFatByYear$fatalities, na.rm=T)

write_csv(fraFatByYear %>% arrange(desc(iyear)), "france_terrorism_fatalities_by_year.csv")

g <- ggplot(data=fraFatByYear, aes(x=iyear, y=fatalities))+
  geom_line() + xlab("Year") + ylab("Fatalities")+
  ggtitle("Fatalities from terrorism, in France")
g
ggsave(filename="france_fatalities.png", plot=g)

##### EU-wide analysis #####

# Founding since countries (pre-1973)
euFounders <- c("Belgium",
                 "France",
                 "Italy",
                 "Germany",
                 "Netherlands",
                 "Luxembourg"
                 )

# Countries that joined the EU through 1986
euCountries <- c(euFounders,
                 "Denmark",
                 "Ireland",
                 "United Kingdom",
                 "Greece",
                 "Portugal",
                 "Spain")
# EU data
euData <- rawData %>% filter(country_txt %in% euCountries)

# Filter out data since 1986
euData_since1986 <- euData %>% filter(iyear>=1986)

# Tally EU-wide fatalities by year
euFatalities <- euData_since1986 %>% group_by(iyear) %>% 
  summarize(fatalities=sum(nkill, na.rm=T)) %>%
  arrange(desc(fatalities))

# Calculate EU-wide fatalities in 1993 and add to data
euFat_in1993 <- stats1993 %>% filter(Country %in% euCountries) %>% summarize(sum(`Number Killed`))

euFatalities <- rbind(euFatalities, 
                      data.frame(iyear=1993, 
                                 fatalities=as.numeric(euFat_in1993)))

write_csv(euFatalities %>% arrange(desc(iyear)), "eu_terrorism_fatalities_by_year.csv")

g2 <- ggplot(data=euFatalities, aes(x=iyear, y=fatalities))+
  geom_line() + xlab("Year") + ylab("Fatalities")+
  ggtitle("Fatalities from terrorism, in EU countries since 1986 \n Of members who joined in 1986 or before")
g2
ggsave(filename="eu_fatalities.png", plot=g2)

##### Country-by-country breakdown #####
euData <- rawData %>% 
  filter(country_txt %in% euCountries) %>% 
  select(iyear, country_txt, nkill)

# Tally 1993 data by country and add 
eu1993data <- stats1993 %>% 
  filter(Country %in% euCountries) %>% 
  group_by(Country) %>% 
  summarize(nkill=sum(`Number Killed`)) %>% 
  mutate(iyear=1993) %>% 
  select(iyear, Country, nkill)

names(eu1993data)[2] <- 'country_txt'

euData <- rbind(euData, eu1993data)

euData_spread <- euData %>% 
  dcast(formula=iyear~country_txt, value.var="nkill", fun.aggregate=sum, na.rm=T)

write_csv(euData_spread, "eu_terrorism_fatalities_by_country.csv")

g3 <- ggplot(data=euData, aes(x=iyear, y=nkill))+
  geom_line() + xlab("Year") + ylab("Fatalities")+ facet_wrap(~country_txt)+
  ggtitle("Fatalities from terrorism, in EU countries since 1986 \n Of members who joined in 1986 or before")
g3

ggsave(filename="eu_fatalities_by_country.png", plot=g3)

# Calculations

# France fatalities since from 1986 until now
fraFatByYear %>% filter(iyear>1985) %>% summarize(sum(fatalities))

# All EU fatalities (of those pre-1986 countries) from 1986 until now
euFatalities %>% filter(iyear>1985) %>% summarize(sum(fatalities))

# In the last decade:
euFatalities %>% filter(iyear>2005) %>% summarize(sum(fatalities))