####################### Week 4 Quiz by Saheli Kar #########################


movie <- read.table("C:\\Users\\sonatushi\\Google Drive\\CUNY Data Analytics\\IS-607\\movies.tab", sep="\t", header=TRUE, quote="", comment="")


## Question 1
require(ggplot2)

##Option -1
ggplot(data = movie, aes(x = year) ) + geom_histogram(binwidth = 10 )+ ggtitle("Movies in decade")

##Option2
movie1<-data.frame(movie, decade=movie$year-(movie$year%%10))
ggplot(data = movie1, aes(x = decade) ) + geom_histogram()+ ggtitle("Movies in decade")


##Question 2

require('dplyr')
require('reshape2')


a2 <- select(movie, year, rating, Action, Animation, Comedy, Drama, Documentary, Romance, Short)
m <- melt(a2, id.vars = c( "rating"))
m1 <- filter(m, value == 1)
m2 <- group_by(m1,  avg.rating=mean(rating))
m3 <- group_by(m2, year)
## Ploting of the movies against the rating for different types of movies
ggplot(data = m2) + geom_histogram(aes(x = avg.rating))+ facet_wrap(~variable) 
## From the plots we can see that the average rating of Comedy and Drama movie is fairly good.
## The average rating of short movie is not too bad
## The average rating of Action, Animation, Documentary and Romance movie score realtively low.


## Plotting of the ratings of the movies with respect to year for different types of movies.
ggplot(data = m3, aes(x = year, y = rating)) + geom_smooth(method = gam) + facet_wrap(~variable) 
## The average rating of Action movie falled drastically over years
## Also the rating for Comedy movie failed steeply
## The rating for Animation movie reamined almost same over years
## While the ratings for Drama and Romantic movies dropped a little
## Documentary movies performed very high over the years while the short movies performnace is also good.



##Question 3
rating_vs_length <- ggplot(data = m, aes(y = rating, x =length  )) + 
   geom_violin() + 
   ggtitle("Relationship between rating and length")

rating_vs_length
## From the plotted graph we can conclude that the movies with the shorter and longer length has average rating.
## And movies with average length may get lower or higher rating. 



## Question 4
require(gridExtra)
require(ggPlot2)
ggplot(data = m2, aes(x = variable, y = rating))+geom_smooth(method=
action.length<-ggplot(movies, aes(x=length, y=Action))+geom_violin()
animation.length<-ggplot(movies, aes(x=length, y=Animation))+geom_violin()
comedy.length<-ggplot(movies, aes(x=length, y=Comedy))+geom_violin()
drama.length<-ggplot(movies, aes(x=length, y=Drama))+geom_violin()
documentary.length<-ggplot(movies, aes(x=length, y=Documentary))+geom_violin()
romance.length<-ggplot(movies, aes(x=length, y=Romance))+geom_violin()
short.length<-ggplot(movies, aes(x=length, y=Short))+geom_violin()

grid.arrange(action.length, animation.length, comedy.length, drama.length, documentary.length, romance.length, short.length, ncol=2)

## from the graphs we can conclude that Action, Animation, Documentary movies 
## are of relatively shorter lengths that of Comedy, drama and romance.


# Question 5
require(dplyr)
require(reshape)
require(gridExtra)

a1<-select(movies, votes, rating)
b1<-group_by(a1, votes, rating)
plot1<-ggplot(data=b1, aes(x=rating, y=votes) , name="Rating", color='red')+geom_line()

a2<-select(movies, votes, length)
b2<-group_by(a2, votes, length)
plot2<-ggplot(data=b2, aes(x=length, y=votes) , name="Length", color='blue')+geom_line()

a3<-select(movies, votes, year)
b3<-group_by(a3, votes, year)
plot3<-ggplot(data=a3, aes(x=year, y=votes), , name="Year", color='red')+geom_line()

grid.arrange(plot1, plot2, plot3, ncol=1)

## Conclusion: Votes of the movies generally increase with Rating
## Votes doesnt depend upon the lnegth of the movies
## Votes for the movies increased with years
## No relationship between votes and budget; or votes and mpaa 
## is concluded as most of the fields of budget and mpaa is blank or na


