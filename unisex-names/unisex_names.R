# Top unisex names
# June 10, 2015
# Andrew <andrew.flowers@fivethirtyeight.com>



require(dplyr)
require(babynames)
require(ggplot2)
require(zoo)

pop2013 <- 316128839 # U.S. population in 2013, from Census Bureau

# Data preparation

aging <- read.csv("aging_curve.csv") # taken from SSA: http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7.html; 2013 is used as base year

agingSmooth <- data.frame(year=c(1900:2013))

agingSmooth$perctAliveMale <- aging[match(agingSmooth$year, aging$decade),]$male_perct
agingSmooth$perctAliveFemale <- aging[match(agingSmooth$year, aging$decade),]$female_perct

agingSmooth$perctAliveMale[1:111] <- na.approx(agingSmooth$perctAliveMale)
agingSmooth$perctAliveFemale[1:111] <- na.approx(agingSmooth$perctAliveFemale)

agingSmooth$perctAliveMale[112:114] <- 0.993480 # Assume probabilities are flat since 2010
agingSmooth$perctAliveFemale[112:114] <- 0.994490 # Assume probabilities are flat since 2010

# Estimate stock of first names of those currently living, using actuarial probablities

babyNames <- babynames %>% filter(year>=1900)

babyNames$perctAlive <- ifelse(babyNames$sex=="F", agingSmooth[match(babyNames$year, agingSmooth$year),]$perctAliveFemale, agingSmooth[match(babyNames$year, agingSmooth$year),]$perctAliveMale)
babyNames$nAlive <- babyNames$n * babyNames$perctAlive

# Analysis
maleNames <- babyNames %>% filter(sex=="M") %>% distinct(name)
femaleNames <- babyNames %>% filter(sex=="F") %>% distinct(name)

unisexNames <- data.frame(name=intersect(maleNames$name, femaleNames$name))

# Choose 1/3 cutoff
cutoff <- (1/3)

unisexSummary <- babyNames %>% 
  filter(name %in% unisexNames$name) %>% 
  mutate(malesAlive=ifelse(sex=="M", nAlive, 0),
         femaleAlive=ifelse(sex=="F", nAlive, 0)) %>% 
  group_by(name) %>% 
  summarize(total=sum(nAlive),
            maleTotal=sum(malesAlive),
            femaleTotal=sum(femaleAlive),
            male_share=maleTotal/total,
            female_share=femaleTotal/total,
            gap=abs(male_share-female_share)) %>% 
  filter((male_share>=cutoff)&(female_share>=cutoff),
         total>=100) %>% 
  arrange(desc(total))

# Plotting
ggplot(data=unisexSummary, aes(x=gap, y=total))+geom_point()+ggtitle("Sex Imbalance of Name vs. Popularity of Name")

# Top 20 names
unisexSummary_top20 <- unisexSummary %>% filter(total>=25000)

# For sortable table
unisexSummary_table <- unisexSummary %>% 
  select(name, total, male_share, female_share, gap) %>% 
  # Remove placeholder names
  filter(name != 'Unnamed' &
         name != 'Unknown' &
         name != 'Notnamed' &
         name != 'Infant' &
         name != 'Infantof')

write.csv(unisexSummary_table, "unisex_names_table.csv")

# For specific queries
unisexSummary[grep("Riley", unisexSummary$name),]

# Odds of American w/ unisex names
1/(sum(unisexSummary_table$total)/pop2013)
