## Part 1(A) of Week 13 Quiz by Saheli Kar
import timeit

setup='''
def getFactorial(x):
    if x<0:
        print "Input a positive integer"
        return -1
    else:
        if x==0 or x==1 :
            return x
        else:
            return x*getFactorial(x-1)
'''

n=1

t=timeit.Timer(" getFactorial(10)", setup=setup)
print 'Time required by getFactorial function executing ', t.timeit(n)

##Result::Time required by getFactorial function executing  2.63905337156e-05
