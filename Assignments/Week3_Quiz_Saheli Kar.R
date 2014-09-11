################## Week 3 Quiz- Saheli Kar ###################

# Question 1

findMean<-function(nVector){
  return(sum(nVector)/length(nVector))
}
# Result:
# nVector<-c(1,5,6,4,9,3,5)
# findMean(nVector)
#[1] 4.714286

# Question 2
findMean<-function(nVector){
  sum=0
  count=0
  for(val in nVector){
    if(is.na(val) | is.null(val)){  #checking for NA or Null data
      break
    }
    sum=sum+val
    count=count+1
  }
  if(count==0){
    print("Valid mean cannot be calculated")
  }
  else{
    print(paste("The valid mean is ", sum/count))
  }
}
# Result:
#nVector<-c(1,5,NA,4,NA,3,5)
#findMean(nVector)
#[1] "The valid mean is  3"


#Question 3
getFactors<-function(input){
  # Evaluates the factors of the input
  numericfactors=c(1)
  
  for(i in 2:input){
    if((input%%i) == 0){
      numericfactors<-c(numericfactors, i)
    }
  }
  return(numericfactors)
}

gcf<-function(a,b){
  
  if(a<0 |b<0){
    print("Please input two positive integers")
    return()
  }
  if(a==b){
    return(a) #if both number are same then they themselves will be the gcf
  }
  
  f1List<-getFactors(a)
  f2List<-getFactors(b)
  
  #putting the list into dataaframes with a new column count
  #there can be a better way to do this but trying to avoid the for loop 
  #and trying to use newly learnt R functions
  
  dt1<-data.frame(count=rep(1, times=length(f1List)),fList=f1List)
  dt2<-data.frame(count=rep(1, times=length(f2List)),fList=f2List)
  

  require(plyr)
  
  commonFactors<-join(x=dt1, y=dt2, type="inner", match="all")
  
  gcf<-max(commonFactors$fList)
  
  return(gcf)
}
#Result:
# gcf(6,18)
#Joining by: count, fList
#[1] 6

# gcf(6,18)
#Joining by: count, fList
#[1] 6


#Question 4
EuclidianGCF<-function(a,b){
  
  if(a<0 |b<0){
    print("Please input two positive integers")
    return()
  }
  if(a==b){
    return(a) #if both number are same then they themselves will be the gcf
  }
  
  divisor<-1  #initializing gcf with 1 since 1 is the common factor for all numbers
  
  
  # using Euclidian agorithm
  if(a<b){
    divisor<-a
    dividend<-b
  }
  else{
    divisor<-b
    dividend<-a
  }
  repeat{
    remainder<-dividend%%divisor
    if(remainder==0){
      break
    }
   
    dividend<-divisor
    divisor<-remainder
  }
  
  return(divisor)
}
#Result:
# EuclidianGCF(30,18)
#[1] 6


#Question 5
calculateExpression<-function(x,y){
  return((x^2*y)+(2*x*y)-(x*y^2))
}
#Result:
# calculateExpression(4,5)
#[1] 20


#Question 6
Week3_price<-read.csv("C:\\Users\\sonatushi\\Google Drive\\CUNY Data Analytics\\IS-607\\week-3-price-data.csv", header=TRUE)
Week3_make_model<-read.csv("C:\\Users\\sonatushi\\Google Drive\\CUNY Data Analytics\\IS-607\\week-3-make-model-data.csv", header=TRUE)

MergedData<-merge(x=Week3_price, y=Week3_make_model, by.x=c("ModelNumber"), by.y=c("ModelNumber"), all=FALSE)
#Result:
#MergedData:
# ModelNumber ID  Color Mileage Price   Make    Model Year
# 1         1091  1   Blue   36281 12400 Toyota    Camry 2010
# 2         1091  6    Red   61130  9900 Toyota    Camry 2010
# 3         1091 17 Silver   43017 11700 Toyota    Camry 2010
# 4         1091 10   Blue   56095 10400 Toyota    Camry 2010
# 5         1091 24   Blue   31204 12900 Toyota    Camry 2010
# 6         1091 18   Blue   53126 10700 Toyota    Camry 2010
# 7         1142  3    Red   45827 11400 Toyota    Camry 2011
# 8         1142  5  White   38426 12200 Toyota    Camry 2011
# 9         1142 20  White   48504 11100 Toyota    Camry 2011
# 10        1142  9  White   64466  9600 Toyota    Camry 2011
# 11        1142  2  Black   30107 13000 Toyota    Camry 2011
# 12        1142 13 Silver   54342 10600 Toyota    Camry 2011
# 13        1142 14 Silver   40757 11900 Toyota    Camry 2011
# 14        1254  7    Red   68400  9200 Toyota  Corolla 2010
# 15        1254  4  White   63624  9600 Toyota  Corolla 2010
# 16        1254 26  Green   34716 12500 Toyota  Corolla 2010
# 17        1908  8  White   31863 12800 Toyota  Corolla 2011
# 18        2111 19  Black   42945 11700   Ford    Focus 2010
# 19        2111 16  White   36216 12400   Ford    Focus 2010
# 20        2200 21  White   46494 11400   Ford    Focus 2011
# 21        2310 22 Silver   57672 10200   Ford Explorer 2010
# 22        2310 23  Black   53942 10600   Ford Explorer 2010
# 23        2310 28  White   37107 12300   Ford Explorer 2010
# 24        2312 11  Black   47647 11200   Ford Explorer 2011
# 25        2312 15    Red   42685 11700   Ford Explorer 2011
# 26        2312 27    Red   30479 13000   Ford Explorer 2011
# 27        2312 25    Red   52674 10700   Ford Explorer 2011

# There are 27 observations. This is what I was expecting.



#Question 7
MergedDataLeft<-merge(x=Week3_price, y=Week3_make_model, by.x=c("ModelNumber"), by.y=c("ModelNumber"), 
                      all=TRUE, all.x=TRUE, all.y=FALSE)

#Result:
# MergedDataLeft
# ModelNumber ID  Color Mileage Price   Make    Model Year
# 1         1091  1   Blue   36281 12400 Toyota    Camry 2010
# 2         1091  6    Red   61130  9900 Toyota    Camry 2010
# 3         1091 17 Silver   43017 11700 Toyota    Camry 2010
# 4         1091 10   Blue   56095 10400 Toyota    Camry 2010
# 5         1091 24   Blue   31204 12900 Toyota    Camry 2010
# 6         1091 18   Blue   53126 10700 Toyota    Camry 2010
# 7         1142  3    Red   45827 11400 Toyota    Camry 2011
# 8         1142  5  White   38426 12200 Toyota    Camry 2011
# 9         1142 20  White   48504 11100 Toyota    Camry 2011
# 10        1142  9  White   64466  9600 Toyota    Camry 2011
# 11        1142  2  Black   30107 13000 Toyota    Camry 2011
# 12        1142 13 Silver   54342 10600 Toyota    Camry 2011
# 13        1142 14 Silver   40757 11900 Toyota    Camry 2011
# 14        1254  7    Red   68400  9200 Toyota  Corolla 2010
# 15        1254  4  White   63624  9600 Toyota  Corolla 2010
# 16        1254 26  Green   34716 12500 Toyota  Corolla 2010
# 17        1908  8  White   31863 12800 Toyota  Corolla 2011
# 18        2111 19  Black   42945 11700   Ford    Focus 2010
# 19        2111 16  White   36216 12400   Ford    Focus 2010
# 20        2200 21  White   46494 11400   Ford    Focus 2011
# 21        2310 22 Silver   57672 10200   Ford Explorer 2010
# 22        2310 23  Black   53942 10600   Ford Explorer 2010
# 23        2310 28  White   37107 12300   Ford Explorer 2010
# 24        2312 11  Black   47647 11200   Ford Explorer 2011
# 25        2312 15    Red   42685 11700   Ford Explorer 2011
# 26        2312 27    Red   30479 13000   Ford Explorer 2011
# 27        2312 25    Red   52674 10700   Ford Explorer 2011
# 28       23120 12  Black   48667 11100   <NA>     <NA>   NA



#Question 8
subset(MergedDataLeft, Year=="2010")
#Result:

# ModelNumber ID  Color Mileage Price   Make    Model Year
# 1         1091  1   Blue   36281 12400 Toyota    Camry 2010
# 2         1091  6    Red   61130  9900 Toyota    Camry 2010
# 3         1091 17 Silver   43017 11700 Toyota    Camry 2010
# 4         1091 10   Blue   56095 10400 Toyota    Camry 2010
# 5         1091 24   Blue   31204 12900 Toyota    Camry 2010
# 6         1091 18   Blue   53126 10700 Toyota    Camry 2010
# 14        1254  7    Red   68400  9200 Toyota  Corolla 2010
# 15        1254  4  White   63624  9600 Toyota  Corolla 2010
# 16        1254 26  Green   34716 12500 Toyota  Corolla 2010
# 18        2111 19  Black   42945 11700   Ford    Focus 2010
# 19        2111 16  White   36216 12400   Ford    Focus 2010
# 21        2310 22 Silver   57672 10200   Ford Explorer 2010
# 22        2310 23  Black   53942 10600   Ford Explorer 2010
# 23        2310 28  White   37107 12300   Ford Explorer 2010



#Question 9

redExpensiveCars<-MergedDataLeft[MergedDataLeft$Color=="Red" &  MergedDataLeft$Price>10000, ]

#Result:
# ModelNumber ID Color Mileage Price   Make    Model Year
# 7         1142  3   Red   45827 11400 Toyota    Camry 2011
# 25        2312 15   Red   42685 11700   Ford Explorer 2011
# 26        2312 27   Red   30479 13000   Ford Explorer 2011
# 27        2312 25   Red   52674 10700   Ford Explorer 2011


#Question 10
redExpensiveCars[, c("ID", "Mileage", "Price", "Make", "Model", "Year")]

# Result:
# ID Mileage Price   Make    Model Year
# 7   3   45827 11400 Toyota    Camry 2011
# 25 15   42685 11700   Ford Explorer 2011
# 26 27   30479 13000   Ford Explorer 2011
# 27 25   52674 10700   Ford Explorer 2011


#Question 11
countChars<-function(charVector){
  
  return(nchar(charVector, allowNA=FALSE))
}

#Result:
#fruits<-c("Apple","Mango", "Strawberry", "Banana", "Peach")
#countChars(fruits)
#[1]  5  5 10  6  5


#Question 12
concatenateCharVectors<-function(v1, v2){
  return(paste(v1,v2, collapse=" "))
}

#Result:
#fruits
#[1] "Apple"      "Mango"      "Strawberry" "Banana"     "Peach" 
#color<-c("Red", "Yellow", "Red", "Yellow", "Orange")

#concatenateCharVectors(color, fruits)
#[1] "Red Apple Yellow Mango Red Strawberry Yellow Banana Orange Peach"


#Question 13
getsubstring<-function(stringVector){
  require(stringr)
  substringvector<-c()
  for(str in stringVector){
    firstVowel<-str_extract(string=str, ignore.case("[aeiou]{1}")) #check if vowel is present and then extract the firstvowel
    
    if(is.na(firstVowel) ){     #if firstvowel does not present then add NA to the vector to be returned
      substringvector<-c(substringvector, NA)
    }
    else{
      locationVector<-gregexpr(pattern=firstVowel, str)[[1]]  #locates the position of the first vector
      pos<-locationVector[1]  #which(str_detect(string=str, ignore.case(firstVowel)))
      if((pos+2)>nchar(str)){ # if more character is not there after the pos then take whatever is left there in str
        substringvector<-c(substringvector, str_sub(string=str, start = pos, end = nchar(str)))
      }
      else{   #substring the str with first vowel and with two letters after it
        substringvector<-c(substringvector, str_sub(string=str, start = pos, end = pos+2)) 
      }
        
    }
  }
  return(substringvector)
}

#Result:
# strV<-getsubstring(fruits)
# strV
#[1] "App" "ang" "awb" "ana" "eac"

# strV<-getsubstring(c("Sky", "Sun","Moon"))
# strV
# [1] NA    "un"  "oon"


#Question 14
month<-c(12, 5, 6, 9, 4)
day<-c(7, 31, 15, 20, 22)
year<-c(2000:2004)

datedf<-data.frame(month, day, year)


createDateDF<-function(datedf){
  require(lubridate)
  formattedDt<-c()
  for(i in 1:dim(datedf)[1]){
    dtStr<-paste(c(datedf[i,1],datedf[i,2],datedf[i,3]), collapse="-")
    formattedDt<-c(formattedDt,as.character(mdy(dtStr)))
  }
  datedf<-data.frame(datedf, formattedDt)
  return(datedf)
}
  
#Result:
# createDateDF(datedf)
# month day year formattedDt
# 1    12   7 2000       11298
# 2     5  31 2001       11473
# 3     6  15 2002       11853
# 4     9  20 2003       12315
# 5     4  22 2004       12530



#Question 15
strToDate<-function(str){
  require(stringr)
  splitList<-strsplit(str, "-")   #split the string to get indiavidual values for month, day andyear
  vectorform<-splitList[[1]]           #convert the list into vector so that we can extract the individual values
  return(as.Date(paste(c(vectorform[3], vectorform[2], vectorform[1]), collapse="-"))) #construct the correct format for date and then convert it to Date variable
}
Result:
# strToDate("22-08-2013")
#[1] "2013-08-22"


  #Question 16
getMonth<-function(date){
  strdt<-as.character(date)
  require(stringr)
  splitList<-strsplit(strdt, "-") 
  vectorform<-splitList[[1]]
  return(vectorform[2])
}
#result:
# getMonth("2013-08-22")


#Question 17
seq(as.Date("2005/1/1"), as.Date("2014/12/31"), by="day")
#Result: 
# head(seq(as.Date("2005/1/1"), as.Date("2014/12/31"), by="day"))
# [1] "2005-01-01" "2005-01-02" "2005-01-03" "2005-01-04" "2005-01-05" "2005-01-06"
# tail(seq(as.Date("2005/1/1"), as.Date("2014/12/31"), by="day"))
#[1] "2014-12-26" "2014-12-27" "2014-12-28" "2014-12-29" "2014-12-30" "2014-12-31"
