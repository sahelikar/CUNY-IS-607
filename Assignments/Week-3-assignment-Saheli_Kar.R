############################### Week 3 Assignment - Saheli Kar ###############################

#### Question 1 #####
#### Takes a vector as a input and returns the number of missing data in the input
countMissingValues<-function(inputVector){
  totallength<-length(inputVector)
  length_wo_na<-length(na.omit(inputVector))
  
  return(totallength-length_wo_na)
}


#### Question 2 #####
#### Takes a data frame as a input and returns a named vector with number of missing value 
#### in each column of the data frame
countMissingValuesInDataFrame<-function(iDataFrame){
  missingCounts<-c()
  for(i in 1:length(iDataFrame)){
    #print(iDataFrame[1,i])
    missingCounts<-c(missingCounts, countMissingValues(iDataFrame[,i]))
  }
  names(missingCounts)<-names(iDataFrame)
  return(missingCounts)
}

######### Question 3 #######
## inputs a numeric vector and returns the sorted vector
sortVector<-function(iVector){
  iVector<-na.omit(iVector)
  for(i in 1:length(iVector)){
    for(j in i:length(iVector)){
      if(iVector[i]>iVector[j]){
        temp<-iVector[i]
        iVector[i]<-iVector[j]
        iVector[j]<-temp
      }
    }
  }
  return(iVector)
}

##inputs a numeric vector and returns the maximum value in the vector
getMax<-function(iVector){
  iVector<-sortVector(iVector)
  return(iVector[length(iVector)])
}

##inputs a numeric vector and returns the minimum value in the vector
getMin<-function(iVector){
  iVector<-sortVector(iVector)
  return(iVector[1])
}

##inputs a numeric vector and returns the mean value in the vector
findMean<-function(iVector){
  iVector<-na.omit(iVector)
  return(sum(iVector)/length(iVector))
}

##inputs a numeric vector and returns the median of the vector
median<-function(iVector){
  
  iVector<-na.omit(iVector)
  
  iVector<-sortVector(iVector)
  
  if ((length(iVector)%% 2) ==0) {
    Median <- (iVector[length(iVector)/2 ] + iVector[(length(iVector)/2)+1])/2
  }
  else {
    Median <- iVector [(length(iVector)-1)/2+1]
  }
  return(Median)
}

##inputs a numeric vector and returns the first and third quartile of the vector
Quartile  <- function (iVector) {
  iVector<-na.omit(iVector)
  Med <- median (iVector)
  firstHalf  <- iVector [ iVector < Med]
  SecondHalf  <-  iVector [ iVector > Med]
  firstQuartile <- median (firstHalf)
  thirdQuartile <- median (SecondHalf)
  quartiles<-c(firstQuartile, thirdQuartile)
  names(quartiles)<-c("First Quartile", "Third Quartile")
  return (quartiles)
}


##inputs a numeric vector and returns the standard deviation value the vector
standardDeviation<-function(iVector){
  iVector<-na.omit(iVector)
  return(sqrt((sum((iVector-findMean(iVector))^2))/length(iVector)))
}

### the main function to be called for Question 3 to get all the eight calculated values in a named vector
findMathCalculations<-function(iVector){
  if(class(iVector)!="numeric"){
    print("The input vector is not numeric! Operations on it is not available!")
    return()
  }
  quartileVals<-Quartile(iVector)
  output<-c(getMax(iVector), getMin(iVector), findMean(iVector), median(iVector), quartileVals[1], quartileVals[2], standardDeviation(iVector), countMissingValues(iVector))
  names(output)<-c("Max", "Min", "Mean", "Median", "First Quartile", "Thirsd Quartile", "Standard Deviation", "Missing Values' Count")
  return(output)
}
  

########### Question 4 ##############
# inputs a character vector and returns a named vector with the count of distinct elements, 
# Count of max occured element, and Max ocuured element
distinctElements<-function(iVector){
  require(stringr)
  
   if((class(iVector)!="character") & (class(iVector)!="factor")){
     print("The input vector is not character vector!!!")
     return()
   }
  
  iVector<-na.omit(iVector)
  
  numDistictElements<-length(unique(iVector))
  
  df<-data.frame(count=rep(1, times=length(iVector)), iVector)
  
  aggregatedDf<-aggregate(count~iVector, df, sum)
  
  maxCount<-max(aggregatedDf[,2])
  
  output<-c(numDistictElements, maxCount, aggregatedDf[match(maxCount, aggregatedDf[,2]),1])
  
  names(output)<-c("No. of distinct Elements", "Count:Max occured element", "Max occured element")

  return(output)
}


########### Question 5 ##############
# inputs a logical vector and returns the count of TRUE, FALSE, proportion of TRUE and the count of missing values
logicalVectorSummary<-function(iVector){
  
  
  df<-data.frame(count=rep(1, times=length(iVector)), iVector)
  aggregatedDf<-aggregate(count~iVector, df, sum)
  
  positiveCount<-aggregatedDf[match(TRUE, aggregatedDf[,1]),2]
  print(positiveCount)
  
  negativeCount<-aggregatedDf[match(FALSE, aggregatedDf[,1]),2]
  print(positiveCount)
  
  positiveProportion<-positiveCount/(length(iVector))
  
  missingVallueCount<-countMissingValues(iVector)
  
  output<-c(positiveCount, negativeCount, positiveProportion, missingVallueCount)
  
  names(output)<-c("Positive Count", "Negative Count", "Positive Proportion", "NA Count")
  
  return(output)
   
}


##################Question 6 #############################
# inputs a dataframe of numerci vector, character vector 
# and logical vector and returns the summary from Q3-5
getSummary<-function(iDataFrame){
  
  NumericVectorDF<-findMathCalculations(iDataFrame[,1])
  CharVectorDF<-distinctElements(iDataFrame[,2])
  LogicalVectorDF<-logicalVectorSummary(iDataFrame[,3])
  
  outputList<-list(NumericVectorDF, CharVectorDF, LogicalVectorDF)
  
  names(outputList)=c("Summary:Numeric", "Summary:Character", "Summary:Logical")
  
  return(outputList)
}
  


numVector<-c(1,4,2,1,5,NA,2,3)
charVector<-c("Apple", "Apple", NA, "Banana", "Peach", "Banana","Banana", "Orange")
logicalVector<-c(FALSE, TRUE, TRUE, FALSE,FALSE, NA, NA, TRUE)
combineddDf<-data.frame(numVector, charVector, logicalVector)
getSummary(combineddDf)


#Result

# $`Summary:Numeric`
# Max                   Min                  Mean                Median        First Quartile       Thirsd Quartile 
# 5.000000              1.000000              2.571429              2.000000              1.000000              4.000000 
# Standard Deviation Missing Values' Count 
# 1.399708              1.000000 
# 
# $`Summary:Character`
# No. of distinct Elements Max occurance of an element         Max occured element 
# 4                           3                           2 
# 
# $`Summary:Logical`
# Positive Count      Negative Count Positive Proportion            NA Count 
# 3.000               3.000               0.375               2.000 

  
