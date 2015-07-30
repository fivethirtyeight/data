##library I use for reading in images.
library(bmp)

##attempting to capture the moment immediately after catching
##made a list of each moment for susac and for posey
posey <- c(30, 167, 332, 457, 822, 1016, 1199,
1437, 1621, 1770, 1924, 2101, 2251, 2442, 2594,
2757, 2918, 3072, 3205, 3356, 3526, 3685,
4068, 4217)
susac <- c(751, 1286, 1485, 1666, 2030,
2187)

##for Posey
##read in files
v <- list.files("buster_posey_catching/")
v <- v[order(as.numeric(unlist(lapply(strsplit(v, split="i"), "[[", 1))))]
setwd("buster_posey_catching/")
full <- list()
for(i in 1:length(v))
{
full[[i]] <- read.bmp(v[i])
}
setwd("../")

##compare motion patterns across frames
posz <- vector()
for(i in 2:length(full))
{
posz[i] <- sum(abs(full[[i]][1:250,1:250,2:4]-full[[i-1]][1:250,1:250,2:4])>1)
print(i)
}

posm <- list()
for(i in 1:length(posey))
{
posm[[i]] <- posz[posey[i]:(posey[i]+100)]
}

##same for Susac!
v <- list.files("andrew_susac_catching/")
v <- v[order(as.numeric(unlist(lapply(strsplit(v, split="i"), "[[", 1))))]
setwd("andrew_susac_catching/")
full <- list()
for(i in 1:length(v))
{
full[[i]] <- read.bmp(v[i])
}
setwd("../")

susz <- vector()
for(i in 2:length(full))
{
susz[i] <- sum(abs(full[[i]][1:250,1:250,2:4]-full[[i-1]][1:250,1:250,2:4])>1)
print(i)
}

susm <- list()
for(i in 1:length(susac))
{
susm[[i]] <- susz[susac[i]:(susac[i]+100)]
}

##now averaging motion patterns
##across the receptions
posv <- vector()
susv <- vector()

for(i in 1:100)
{
posv[i] <- mean(unlist(lapply(posm, "[[", i)))
}

for(i in 1:100)
{
susv[i] <- mean(unlist(lapply(susm, "[[", i)))
}

plot(posv[1:20], type="l", col="red", lwd=3, 
ylim=c(80000, 120000), xlab="Time", xaxt="no",
ylab="Total Pixel Movement")
lines(susv[1:20], type="l", col="blue", lwd=3)
axis(side=1, at=c(0,5,10,15,20),
labels=as.character(c(0,5,10,15,20)*.05))

