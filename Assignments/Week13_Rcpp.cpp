// Week-13 Quiz Part1 by Saheli Kar
#include <Rcpp.h>
using namespace std;
using namespace Rcpp;

// [[Rcpp::export]]
int factorialCpp(int x) {
  
  if(x<0){
    cout<<"Please enter a positive integer";
    return -1;
  }
  else{ 
    if(x==0 || x==1){
      return x;
    }
    else{
      return x*factorialCpp(x-1);
    }
  }
  

}

/*** R
require(rbenchmark)

factorialR<-function(x){
  if(x<0){
    print("Please enter a positive integer")
  }
  else {
    if(x==0 | x==1){
      return(x)
    }
    else{
      return (x*factorialR(x-1))
    }
  }
  
}

start_time<-as.numeric(Sys.time())
factorialCpp(10)
end_time<-as.numeric(Sys.time())
elapsed_time<- end_time-start_time

print ("The execution time in C++ is:")
elapsed_time




start_time<-as.numeric(Sys.time())
factorialR(10)
end_time<-as.numeric(Sys.time())
elapsed_time<- end_time-start_time

print ("The execution time in R is:")
elapsed_time

##Part 1(B) of the Quiz

benchmark( s1 <- factorialCpp(10), order="elapsed", replications=1000)

benchmark( s2 <- factorialR(10), order="elapsed", replications=1000)


  
*/
//Results::
//[1] "The execution time in C++ is:"

// elapsed_time
//[1] 0.001000166

//[1] "The execution time in R is:"

// elapsed_time
//[1] 0.002000093

// benchmark( s1 <- factorialCpp(10), order="elapsed", replications=1000)
//                    test replications elapsed relative user.self sys.self user.child sys.child
//1 s1 <- factorialCpp(10)         1000       0       NA         0        0         NA        NA

// benchmark( s2 <- factorialR(10), order="elapsed", replications=1000)
//                  test replications elapsed relative user.self sys.self user.child sys.child
// s2 <- factorialR(10)         1000    0.05        1      0.05        0         NA        NA
  