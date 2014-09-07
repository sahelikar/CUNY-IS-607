######################### Week 2 Assignment solutions by Saheli Kar ###################
#Question 1-a
queue<-c("James", "Mary", "Steve", "Alex", "Patricia")
show(queue)
#Result:
# [1] "James"    "Mary"     "Steve"    "Alex"     "Patricia"

#Question 1-b
queue<-c(queue, "Harold")
show(queue)
#Result:
# [1] "James"    "Mary"     "Steve"    "Alex"     "Patricia" "Harold"  

#Question 1-c
queue<-c(queue[2:length(queue)])
show(queue)
#Result:
# [1] "Mary"     "Steve"    "Alex"     "Patricia" "Harold" 

#Question 1-d
#Pam is not there in the initial list. So recreating the list from 1-c with Pam standing behind Steve
queue<-c( "Mary", "Steve", "Pam", "Alex", "Patricia", "Harold")
for(i in 1:length(queue)){
  if(queue[i]=="Pam"){
    queue[i]=queue[i-1]
    queue[i-1]="Pam"
  }
}
show(queue)
#Result:
#[1] "Mary"     "Pam"      "Steve"    "Alex"     "Patricia" "Harold"  


#Question 1-e
queue<-c(queue[1:length(queue)-1])
show(queue)
#Result:
# [1] "Mary"     "Pam"      "Steve"    "Alex"     "Patricia"

#Question 1-f
for(i in 1:length(queue)){
  print(queue[i]=="Alex")
  if(queue[i]=="Alex"){
   
    for(j in i:(length(queue)-1)){
    
      queue[j]<-queue[j+1]
    }
    queue<-c(queue[1:length(queue)-1])

    break
  }
}

show(queue)
#Result:
#[1] "Mary"     "Pam"      "Steve"    "Patricia"


#Question 1-g
for(i in 1:length(queue)){
  if(queue[i]=="Patricia"){
    print(paste("The position of Patricia is", i))
    break
  }
}
#Result
# [1] "The position of Patricia is 4"


#Question 1-h
print(paste("The number of people in the queue is ",length(queue)))
#Result
# [1] "The number of people in the queue is  4"




#Question 2
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




#Question 3
count<-0
for(i in 1:1000){
  if((i%%3!=0) & (i%%7!=0) & (i%%11!=0) ){
    count<-count+1
  }
}

print(count)
#Result:520



#Question 4
pythagorean<-function(f,g,h){
  myVectorList<-c(f,g,h)
  sum<-0
  for(i in 1:3){
    if(myVectorList[i]!=max(myVectorList)){
      sum<-sum+myVectorList[i]^2
    }
  }
  if(max(myVectorList)^2==sum){
    print("The numbers form a Pythagorean")
  }
  else{
    print("The numbers don't form a Pythagorean")
  }
    
}
  
