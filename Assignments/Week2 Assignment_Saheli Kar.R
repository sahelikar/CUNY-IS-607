########################## Week 2 Quiz answers by Saheli #####################
# Question 1
myVector<-c(1:5,5:9,4:8,8:12)
#Result: 
# [1]  1  2  3  4  5  5  6  7  8  9  4  5  6  7  8  8  9 10 11 12


# Question 2
cVector<- as.character(myVector)
#Result: 
# [1] "1"  "2"  "3"  "4"  "5"  "5"  "6"  "7"  "8"  "9"  "4"  "5"  "6"  "7"  "8"  "8"  "9"  "10" "11" "12"


# Question 3
factorVector<-as.factor(myVector)
#Result: 
# [1] 1  2  3  4  5  5  6  7  8  9  4  5  6  7  8  8  9  10 11 12
# Levels: 1 2 3 4 5 6 7 8 9 10 11 12


# Question 4
levels(factorVector)
#Result: 
# [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12"


# Question 5
resultVector<-3*(myVector)^2-2*(myVector)+1
# Result: 
# [1]   2   9  22  41  66  66  97 134 177 226  41  66  97 134 177 177 226 281 342 409


# Question 6
X<-matrix(c(1,5,8,1,4,9,1,6,4,1,2,7,1,3,4,1,2,9,1,7,6,1,8,4), byrow=TRUE, nrow=8)
show(X)
#     [,1] [,2] [,3]
#[1,]    1    5    8
#[2,]    1    4    9
#[3,]    1    6    4
#[4,]    1    2    7
#[5,]    1    3    4
#[6,]    1    2    9
#[7,]    1    7    6
#[8,]    1    8    4

y<-matrix(c(45.2, 46.9, 31.0, 35.3, 25.0, 43.1, 41.0, 35.1), nrow=8)
show(y)
#     [,1]
#[1,] 45.2
#[2,] 46.9
#[3,] 31.0
#[4,] 35.3
#[5,] 25.0
#[6,] 43.1
#[7,] 41.0
#[8,] 35.1

((solve(t(X)%*%X))%*%t(X))%*%y
#         [,1]
#[1,] 3.153126
#[2,] 1.983743
#[3,] 3.999539


# Question 7
namedList<-setNames(as.list(c(1,2,3,4)), c("Item1", "Item2", "Item3", "Item4"))
#Result:
#$Item1
#[1] 1

#$Item2
#[1] 2

#$Item3
#[1] 3

#$Item4
#[1] 4


# Question 8
charList<-c("a","b","c","d","e","f","g","h","i","j")
factorList<-as.factor(c(9,8,1,8,9,1,8,8,9,1))
numericList<-c(10:19)
dtList<-as.Date(c("2012-06-28", "2013-06-28", "2014-06-28", "2012-07-28", "2013-07-28", "2014-07-28","2012-06-29","2012-06-30","2012-07-29", "2012-07-30"))
dframe<-data.frame(A=charList, B=factorList, C=numericList, D=dtList)
#Result:
#A B  C          D
#1  a 9 10 2012-06-28
#2  b 8 11 2013-06-28
#3  c 1 12 2014-06-28
#4  d 8 13 2012-07-28
#5  e 9 14 2013-07-28
#6  f 1 15 2014-07-28
#7  g 8 16 2012-06-29
#8  h 8 17 2012-06-30
#9  i 9 18 2012-07-29
#10 j 1 19 2012-07-30



# Question 9
myList<-c("A","M","C","D","A","C")
#Creating a factor using the list created aabove
factor1<-as.factor(myList)
#Now adding a new level in the factor1
factor1<-factor(factor1, levels=c(levels(factor1),"B"))
#Adding a new column in the existing factor
factor1<-factor(c(myList,"B"))


# Question 10
data1<- read.csv("temperatures.csv", header=TRUE)
#loaded temperatures.csv from the local directory
#Result:
#City Temperature
#1      New York          75
#2       Toronto          73
#3 San Francisco          80
#4     Las Vegas          95
#5   Los Angeles          85
#6         Miami          90


# Question 11
data2<- read.csv(file.choose(), header=TRUE)
#loading the file choosing from a directory other than current directory
#Result:
#City Temperature
#1      New York          75
#2       Toronto          73
#3 San Francisco          80
#4     Las Vegas          95
#5   Los Angeles          85
#6         Miami          90


# Question 12
#Couldn't find any website with pipe delimitted data. But found comma delimitted data. 
#If to read a file with pipe delimitted we have to use sep="|"
pew_data <- read.csv("http://bit.ly/11I3iuU", header=TRUE, sep=",")



#Question 13
myFactorial<-function(input)
{
  if(input<0){
    print("Please enter a positive value")
    return
  }
  if(input==0 | input==1){
    return(1)
  }
  else{
    return(input*myFactorial(input-1))
  }
  
}

myFactorial(12)
#Result:479001600


#Question 14
coumpounInterest<-function(numYear, principal, roi){
  monthList<-c(1:12)
  dayNum<-c(31,28,31,30,31,30,31,31,30,31,30,31)
  monthdf<-data.frame(monthList, dayNum)
  countNum<-numYear*12
  interest<-0.0
  
  for(i in 1:countNum){
    if(i%%12==0){
      monthlyInterest<-principal*roi*monthdf[12, 2]/365/100
    }
    else{
      monthlyInterest<-principal*roi*monthdf[i%%12, 2]/365/100
    }
    interest<-(interest+monthlyInterest)
  }
  
  return(ceiling(interest))
}


coumpounInterest(6,1500,6.24)
#Result:
562



#question 15
myVector<-c(1:5,5:9,4:8,8:12)
sum<-0
for(i in 1:20){
  if(i%%3==0){
    sum<-sum+myVector[i]
  }
}
show(sum)
#Result: 39


#Question 16
myLoopCalculator<-function(input){
  sum<-0
  for(i in 1:10){
    sum<-sum+(input^i)
  }
  return(sum)
}
myLoopCalculator(2)
#Result:2046


#Question 17
myLoopCalculator2<-function(input){
  sum<-0
  count<-1
  while(i<11){
    sum<-sum+(input^i)
    i<-i+1
  }
  return(sum)
}
myLoopCalculator2(2)
#Result:2046

#Question 18
myLoopCalculator3<-function(input, loopCount){
  if(loopCount<0){
    print("Enter positive value for loopCount")
    return
  }
  
  if(loopCount==0){
    return(1)
  } 
  if(loopCount==1){
    return(input)
  }  
  else{
    return((input^loopCount)+myLoopCalculator3(input,loopCount-1) )
  }
}
myLoopCalculator3(2,10)
#Result:2046


#Question 19
numericVector<-c(seq(from=20, to=50, by=5))
show(numericVector)
#Result:
#[1] 20 25 30 35 40 45 50


#Question 20
mYRepeatedVector<-c(rep("examples", times=10))
show(mYRepeatedVector)
#Result:
# [1] "examples" "examples" "examples" "examples" "examples" "examples" "examples" "examples" "examples" "examples"


#Question 21
quadrarticEq<-function(a,b,c){
  print(paste("The quadratic equation is:",a,"x^2+",b,"x+",c))
  discriminant<- b^2-(4*a*c)
  solutions<-list(NA, NA)

  if(discriminant==0){
    print("The quadratic equation has one solution")
    solutions[1]<- -b/(2*a)
    
  }
  else{
    if(discriminant>0){
      print("The quadratic equation has two real solutions")
      solutions[1]<- (-b+sqrt(discriminant))/(2*a)
      solutions[2]<- (-b-sqrt(discriminant))/(2*a)
    }
    else{
      print("The quadratic equation has two imaginary solutions")
      solutions[1]<- paste(-b/(2*a),"+i",sqrt(-discriminant)/(2*a))
      solutions[2]<- paste(-b/(2*a),"-i",sqrt(-discriminant)/(2*a))
    }
  }
  return(solutions)
}

quadrarticEq(5,4,6)
#Result:
#[1] "The quadratic equation is: 5 x^2+ 4 x+ 6"
#[1] "The quadratic equation has two imaginary solutions"
#[[1]]
#[1] "-0.4 +i 1.01980390271856"

#[[2]]
#[1] "-0.4 -i 1.01980390271856"

quadrarticEq(1,-2,-4)
#Result:
#[1] "The quadratic equation is: 1 x^2+ -2 x+ -4"
#[1] "The quadratic equation has two real solutions"
#[[1]]
#[1] 3.236068

#[[2]]
#[1] -1.236068

quadrarticEq(1,-4,4)
#Result:
#[1] "The quadratic equation is: 1 x^2+ -4 x+ 4"
#[1] "The quadratic equation has one solution"
#[[1]]
#[1] 2

#[[2]]
#[1] NA
