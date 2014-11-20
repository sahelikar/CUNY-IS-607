##Part 1 of Week13 Quiz by Saheli Kar
function getFactorial(n::Int64)
        if(n<0)
                println("Enter a positive integer")
                return -1
        end
        if(n==0 | n==1)
                return n
        else
               return n*getFactorial(n-1)
        end

end

@ elapsed getFactorial(10)
##Result:
##Factorial
##0.003023183
