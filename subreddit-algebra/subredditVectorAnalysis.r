#######################################
#
# Program to analyze distance between
# Reddit subreddits using the cooccurrence
# of commentors across subreddits. 
# Also implements "subreddit algebra"
# by adding and subtracting subreddit
# vectors. 
# By @martintrevor_ for FiveThirtyEight
#
#######################################

library(reshape2)
library(lsa)
library(ggtern)

##### Part 1: Load in the data

# This CSV file was created by running the SQL code in processData.sql in Google's BigQuery
rawsubredditvecs = read.table("all_starting_2015_01_overlaps_top2200_no200_10com_allrank_mod_122716.csv",header=TRUE,sep=",")

##### Part 2: Format and clean data for analysis

castsubredditvecs = dcast(rawsubredditvecs,t1_subreddit~t2_subreddit,FUN="identity",fill=0)
subredditvecst = as.matrix(castsubredditvecs[,-1])
rownames(subredditvecst) = castsubredditvecs[,1]
subredditvecs = t(subredditvecst)
subredditvecssums = apply(subredditvecs,1,sum)
subredditvecsnorm = sweep(subredditvecs,1,subredditvecssums,"/")
subredditvecssumscontext = apply(subredditvecs,2,sum)
contextprobs = subredditvecssumscontext/sum(subredditvecssumscontext)
subredditvecspmi = log(sweep(subredditvecsnorm,2,contextprobs,"/")) # PMI version
subredditvecsppmi = subredditvecspmi
subredditvecsppmi[subredditvecspmi<0] = 0 # PPMI version
scalar1 <- function(x) {x / sqrt(sum(x^2))} # Function to normalize vectors to unit length
subredditvecsppminorm = t(apply(subredditvecsppmi,1,scalar1))

##### Part 3: Analysis of subreddit similarities

## Looking at which subreddits are closest to each other (and combinations of subreddits)
cursubmat = subredditvecsppminorm
cursubmatt = t(cursubmat)
currownameslc = tolower(rownames(cursubmat))
# Function to calculate subreddit similarities and perform algebra
# Note that curops always has a leading "+"
findrelsubreddit <- function(cursubs,curops,numret=20) {
    cursubs = tolower(cursubs)
    curvec = 0
    for(i in 1:length(cursubs)) {
	    curvec = ifelse(curops[i]=="+",list(curvec + cursubmat[which(currownameslc==cursubs[i]),]),list(curvec - cursubmat[which(currownameslc==cursubs[i]),]))[[1]]
    }
    curclosesubs = cosine(x=curvec,y=cursubmatt)
    curclosesubso = order(curclosesubs,decreasing=TRUE)
    curclosesubsorder = curclosesubs[curclosesubso]
    curclosesubsorderc = curclosesubsorder[-which(tolower(names(curclosesubsorder))%in%cursubs)]
return(head(curclosesubsorderc,numret))
}

## Political examples

# /r/The_Donald
cursubs = c("the_donald")
curops = c("+")
findrelsubreddit(cursubs,curops,5)

# /r/The_Donald - /r/politics
cursubs = c("the_donald","politics")
curops = c("+","-")
findrelsubreddit(cursubs,curops,5)

# /r/hillaryclinton - /r/politics
cursubs = c("hillaryclinton","politics")
curops = c("+","-")
findrelsubreddit(cursubs,curops,5)

# /r/The_Donald - /r/SandersforPresident
cursubs = c("the_donald","sandersforpresident")
curops = c("+","-")
findrelsubreddit(cursubs,curops,5)

# /r/SandersforPresident - /r/The_Donald
cursubs = c("sandersforpresident","the_donald")
curops = c("+","-")
findrelsubreddit(cursubs,curops,5)

# /r/fatpeoplehate + /r/CoonTown + /r/politics
cursubs = c("fatpeoplehate","coontown","politics")
curops = c("+","+","+")
findrelsubreddit(cursubs,curops,5)

## Validation examples

# /r/nba + /r/minnesota
cursubs = c("nba","minnesota")
curops = c("+","+")
findrelsubreddit(cursubs,curops,5)

# /r/personalfinance - /r/Frugal
cursubs = c("personalfinance","frugal")
curops = c("+","-")
findrelsubreddit(cursubs,curops,5)

# /r/Fitness + /r/TwoXChromosomes
cursubs = c("fitness","twoxchromosomes")
curops = c("+","+")
findrelsubreddit(cursubs,curops,5)

## Creating the ternary plot

# Similatrity to /r/The_Donald
cursubs = c("the_donald")
curops = c("+")
Dsubsims = findrelsubreddit(cursubs,curops,nrow(cursubmat))
# Similarity to /r/SandersforPresident
cursubs = c("sandersforpresident")
curops = c("+")
Ssubsims = findrelsubreddit(cursubs,curops,nrow(cursubmat))
# Similarity to /r/hillaryclinton
cursubs = c("hillaryclinton")
curops = c("+")
Hsubsims = findrelsubreddit(cursubs,curops,nrow(cursubmat))
# List of subreddits we're interested in
ternarysubs = c("theredpill","coontown","fatpeoplehate","politics","worldnews","news","sjwhate","thebluepill","feminism","books","political_revolution","basicincome")
Dternarysubsims = Dsubsims[tolower(names(Dsubsims))%in%ternarysubs]
Sternarysubsims = Ssubsims[tolower(names(Ssubsims))%in%ternarysubs]
Hternarysubsims = Hsubsims[tolower(names(Hsubsims))%in%ternarysubs]
# Normalizing the matrix
allternarysubsims = transform(merge(transform(merge(Sternarysubsims,Dternarysubsims,by="row.names"),row.names=Row.names,Row.names=NULL),Hternarysubsims,by="row.names"),row.names=Row.names,Row.names=NULL)
colnames(allternarysubsims) = c("S","D","H")
allternarysubsimssums = apply(allternarysubsims,1,sum)
allternarysubsimsnorm = sweep(allternarysubsims,1,allternarysubsimssums,"/")
# Creating the plot
pdf("./ternaryplotanno.pdf",height=10,width=10)
ggtern(data=allternarysubsimsnorm,aes(S,D,H)) + geom_point() + geom_text(label=rownames(allternarysubsimsnorm),hjust=0,vjust=0)
dev.off()
pdf("./ternaryplot.pdf",height=10,width=10)
ggtern(data=allternarysubsimsnorm,aes(S,D,H)) + geom_point() + theme_classic()
dev.off()

# Find subreddits that are particularly biased towards any of the three main candidate subreddits
allsubsims = transform(merge(transform(merge(Ssubsims,Dsubsims,by="row.names"),row.names=Row.names,Row.names=NULL),Hsubsims,by="row.names"),row.names=Row.names,Row.names=NULL)
colnames(allsubsims) = c("S","D","H")
chooseunique = c("H") # Set candidate subreddit of interest
curunique = 1/(allsubsims[,(!(colnames(allsubsims)==chooseunique))]/allsubsims[,chooseunique]) # Calculate fold enrichment of target candidate subreddit over other candidate subreddits for all other subreddits
allsubsimsmin = apply(allsubsims,1,min)
curuniquemin = apply(curunique,1,min)
curuniqueminc = curuniquemin[-which(allsubsimsmin==0)]
curuniquemat = data.frame(enrich=curuniqueminc,allsubsims[match(names(curuniqueminc),rownames(allsubsims)),])
curuniquemato = curuniquemat[order(curuniquemat$enrich,decreasing=TRUE),]
curuniquematoc = curuniquemato[which(curuniquemato[,chooseunique]>=0.25),] # Threshold for high enrichment and high raw similarity
head(curuniquematoc,20)
