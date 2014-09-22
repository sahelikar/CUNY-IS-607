# Week 4 Assignment - Saheli Kar
========================================================

## Algorithm

Identifying a movie as popular which got most of the votes. 
* Considering a movie that is voted over 1000 to be popular. So get the subset of the movies with vote greater than 1000<br/>
**Note:**
Here we are considering a movie to be poular if its vote count is more than the the first quantile value of the votes.

* Select Movies title and year from the movie data frame.

* Form a data frame with the columns year and the number of the distinct values of the year in the selected data frame from previuos step

* Arrange  the list from previous step with respect to the count of distinct values in descening order. The year on top is the one which produced most number of popular movies.

## R code

```r
require(dplyr)
```

```
## Warning: package 'dplyr' was built under R version 3.1.1
```

```r
require(plyr)

movie <- read.table("C:\\Users\\sonatushi\\Google Drive\\CUNY Data Analytics\\IS-607\\movies.tab", sep="\t", header=TRUE, quote="", comment="")

s<-subset(movie, votes>1000)

s1<-select(s, c( year))

s1<-data.frame(s1, count=c(rep(1, times=length(s1$year))))

a<-aggregate(count~year, s1, sum)

output<-arrange(a, desc(count))

head(output)
```

```
##   year count
## 1 2002   243
## 2 2001   226
## 3 1999   219
## 4 2000   214
## 5 1997   197
## 6 2003   194
```

# Plotting the count of poular movies with respect to year

```r
plot(output)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


```r
require(ggplot2)
```

```
## Loading required package: ggplot2
```

```
## Warning: package 'ggplot2' was built under R version 3.1.1
```

```r
ggplot(data = output) + geom_area (aes(x = year, y=count ))+ ggtitle("Popular movies count")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

