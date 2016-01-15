# Nutrition Sutides P-hacking
# Andrew Flowers <andrew.flowers@fivethirtyeight.com>
# Updates by Stephen Fiete <sfiete@hotmail.com>

require(plyr)
require(dplyr)
require(doParallel)
require(foreach)
rawData <- read.csv("raw_anonymized_data.csv")

# Fix innie/out characteristics
rawData$belly <- revalue(rawData$belly, c("Innie"="Yes", "Outie"="No"))

# FFQ variable names (should total 1066)

ffq <- names(rawData)[28:1093]

# Characteristic variable names (should total 26)

characteristics <- names(rawData)[2:27]

# Logistic regressions to predict each characteristic based on each food frequency
# make a report for each regression
#  put report in directory based on the pvalue
# make a data frame wiht one-line summarization for each regression
# to save time, only render reports which pvalue <= 10%
#use multi-core processing using all but one available cores
ncores = pmax(1, detectCores() - 1)
cl <- makeCluster(ncores)
registerDoParallel(cl)

#ffq <- sample(ffq, 50)


regAnalysis <- foreach(char = characteristics, 
                       .combine = bind_rows,
                       .multicombine = TRUE,
                       .inorder = FALSE
) %:%
  foreach(food = ffq, 
          .combine = bind_rows,
          .multicombine = TRUE,
          .inorder = FALSE,
          .errorhandling = 'pass', 
          .packages=c('ggplot2', 'ggthemes', 'dplyr',
                                               'rmarkdown','scales')) %dopar% {
    subdat <- rawData[,c(food, char)]
    frmla <- formula(paste0("I(", char,"=='Yes') ~ ", food))
    mdl <- glm(data=subdat, formula = frmla, family='binomial')
    if (mdl$converged & nrow(summary(mdl)$coefficients) > 1) {
      pvalue <-  summary(mdl)$coefficients[2, 4]
      slope <- summary(mdl)$coefficients[2,1]
      fit.df <- (subdat
                 %>% group_by_(.dots = c(food, char))
                 %>% summarise(frequency=n())
      )
      pred <- predict(mdl, fit.df, type = 'response', se.fit = TRUE)
      fit.df$fit <- pred$fit + 1 
      fit.df$se <- pred$se.fit
      fit.df$x <- fit.df[[food]]
      fit.df$y <- fit.df[[char]]
      plt <- (ggplot(data = fit.df, aes(x=x))
              + geom_point(aes(y=y, size=frequency), color='red')
              + geom_ribbon(aes(ymin=fit-1.96*se, ymax=fit+1.96*se), 
                            fill='lightblue', alpha = .5)
              + geom_line(aes(y=fit), linetype='dashed', size=1)
              + labs(x=food, y=char,
                     title = paste0('Logistic Regression Analysis\n',char,
                                    ' vs. ',food, '\np-value = ',round(pvalue, 4)))
              + theme_fivethirtyeight()
              + theme(plot.title = element_text(size=18, face='bold')))
      anls <- list(data = fit.df,
                   regsmry = summary(mdl),
                   pvalue = pvalue,
                   plot = plt)
      if (pvalue > .1) rpt.dir <- './reports/gt_10pct'
      if (pvalue <= .1 & pvalue >.05) rpt.dir <- './reports/5pct_to_10pct'
      if (pvalue <= .05 & pvalue >.01) rpt.dir <- './reports/1pct_to_5pct'
      if (pvalue <= .01) rpt.dir <- './reports/lt_1pct'
      if (pvalue <= .1) {
        tryCatch(
          render("report_template.Rmd", output_format = 'html_document',
                 output_dir = rpt.dir,
                 output_file = paste0('phack_',char,'_vs_',food,'.html'))
          ,error=function(cond) {
            print(paste('cannot render',char,food))
            return(NA)
          }
        )
      }
      rm(anls, plt, fit.df, subdat, pred, frmla, mdl)
      gc()
      result <- data.frame(Characteristic = as.character(char),
                        Food = as.character(food),
                        slope = slope,
                        pvalue = pvalue)
  
    } else {
      result <- data.frame(Characteristic = as.character(char),
                        Food = as.character(food),
                        slope = -99,
                        pvalue = -99)
    }
    return(result)
  }
stopCluster(cl)
rm(cl)
regAnalysis <- (regAnalysis
                %>% filter(pvalue != -99)
                %>% arrange(pvalue)
)
write.csv(regAnalysis, file='phack_results.csv', row.names = F, quote=F)
save.image()

# Note: This is an intentionally shady regression analysis. Both because of the "p-hacking" or 
# "data mining" behind running over 27,000 regresison, but also in that only the statistics reported 
# were the p-values of the characteristics (the independent variables).

# IN OTHER WORDS: DO NOT TRY THIS AT HOME (AKA, THIS IS NOT AN EXAMPLE OF SOUND DATA ANALYSIS)
