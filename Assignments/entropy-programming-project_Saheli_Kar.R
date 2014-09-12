############################### Entropy Project- Saheli Kar #################################################

#Part 1 - calculates the entropy of the target #####################################
entropy<-function(vector){
  
  df<-data.frame(count=rep(1,times=length(vector)),vector)  # Forming a data frame with count for each record and the input target.
  
  
  aggregatedDf<-aggregate(count~vector, df, sum)   # aggregating the count column over vector using the function sum 
  
  total<-length(vector)   # calculating the total count, the value for n in our entropy formula

  
  calculatedEntropy<-0  # initialising the variable where we will calculate the entropy value
  
  for(i in 1:dim(aggregatedDf)[1]){ #iterating through the aggregated dataframe to calculate the entropy
    calculatedEntropy<-calculatedEntropy+((aggregatedDf$count[i]/total)*log(aggregatedDf$count[i]/total,2))
  }
  calculatedEntropy<-calculatedEntropy*(-1)
  
  return(calculatedEntropy)
  
}



#Part 2 - calculates the entropy over a partition  ##############################
infogain<-function(vector, partition){
  
  df<-data.frame(count=rep(1,times=length(vector)),vector, partition) # forming a dataframe with count of each record, the target vector and the partition vector
  
  uniquePartitionValues<-unique(partition) # forming a vector with the unique values from of the partition vectors
  
  myList <- vector(mode = "list", length = length(uniquePartitionValues)) #initialising the myList variable which will hold the subvectors partitioned by the unique partition values
  
  
  # looping through the target to partiotion them into subvectors by the unique partition values
  for(i in 1:dim(df)[[1]]){
    for(j in 1:length(uniquePartitionValues)){
     
      if(df$partition[i]==uniquePartitionValues[j]){
        
        myList[[j]]<-c(myList[[j]],df$vector[i])
        break
      }
    }
  }


  combinedEntropy<-0 #initialising the variable  that will hold the entropy of the target over the partition
  
  for(vec in myList){ #looping through each of the subvectors to calculate the combined entropy
    combinedEntropy<-combinedEntropy+(length(vec)/length(vector))*entropy(vec)
  }
  finalInfoGain<-entropy(vector)-combinedEntropy # calculating the infogain
 
  return(finalInfoGain)

}




## Part 3 - @inputDf is a data frame that has number of partition attributes and a traget. 
## It returns the column number of the partition vector for which the infogain is max
## and a vector infogain values from all the partitions in a list.
decide<-function(inputDf){
  maxInfoGain<-0 # the variable that will hold the max infogain value by one of the partition vector
  columnNum<-0
  infoGainVector<-c() # the vector that will hold the infogain values for each partition
  columnNum
  for(i in 1:(length(inputDf)-1)){ #looping through all the partition to calculate the max infogain and the individual infogains
  
    igain<-infogain(as.vector(inputDf[,length(inputDf)]), as.vector(inputDf[,i]))
    infoGainVector<-c(infoGainVector, igain)
    if(igain>maxInfoGain){
      maxInfoGain<-igain
      columnNum<-i
    }
  }
  
  return(list(columnNum, infoGainVector))
  
}


# Results

# data1<- read.csv(file.choose(), header=TRUE)
# entropy(as.vector(data1[,4]))
# [1] 0.9832692

# infogain(as.vector(data1[,4]), as.vector(data1[,1]))
# [1] 2.411565e-05

# infogain(as.vector(data1[,4]), as.vector(data1[,2]))
# [1] 0.2599038

# infogain(as.vector(data1[,4]), as.vector(data1[,3]))
# [1] 0.002432707

# decide(data1)
#[[1]]
#[1] 2

#[[2]]
#[1] 2.411565e-05 2.599038e-01 2.432707e-03