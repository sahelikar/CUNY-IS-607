########################### week6quiz.R - Saheli Kar #################################
# [For your convenience], here is the provided code from Jared Lander's R for Everyone, 
# 6.7 Extract Data from Web Sites

install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool

# 1. What type of data structure is bowlpool? 
class(bowlPool)
# bowlfowl is dataframe

summary(bowlPool)
# The variables V1, V2 and V3 in bowlPool are character vector

####################################################################################

# 2. Suppose instead you call readHTMLTable() with just the URL argument,
# against the provided URL, as shown below

theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)

# What is the type of variable returned in hvalues?
class(hvalues)
# hvalues is a list

######################################################################################

# 3. Write R code that shows how many HTML tables are represented in hvalues
getTableCount<-function(url){
  htmlTableDf <- readHTMLTable(theURL)
  count<-0
  for(i in 1:length(hvalues)){
   if(!is.null(hvalues[[i]])){
      count<-count+1
    }
  }
  return (paste("The number of tables in ",url,"=", count, sep=" "))
}
getTableCount(theURL)

[1] "The number of tables in  http://www.w3schools.com/html/html_tables.asp = 2"

######################################################################################

# 4. Modify the readHTMLTable code so that just the table with Number, 
# FirstName, LastName, # and Points is returned into a dataframe


theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)
hvaluesDf<-as.data.frame(c(""))
for(i in 1:length(hvalues)){
  if(!is.null(hvalues[[i]])){
    headers<-names(hvalues[[i]])
    show(headers)
    if(('Number' %in%  headers) & ('First Name' %in% headers) & ('Last Name' %in% headers) & ('Points' %in% headers)){
      hvaluesDf<-hvalues[[i]]
      show(hvaluesDf)
      break
    }
  }
}


######################################################################################

# 5. Modify the returned data frame so only the Last Name and Points columns are shown.
require(dplyr)
selectedCols<-select(hvaluesDf,`Last Name`, Points)
show(selectedCols)

######################################################################################

# 6 Identify another interesting page on the web with HTML table values.  
# This may be somewhat tricky, because while
# HTML tables are great for web-page scrapers, many HTML designers now prefer 
# creating tables using other methods (such as <div> tags or .png files). 
# The url is assigned in theURL variable

theURL <- "http://www.dailygainsletter.com/nyse-stock-market-holidays-schedule/"

##########################################################################################

# 7 How many HTML tables does that page contain?
getTableCount(theURL)
## [1] "The number of tables in  http://www.dailygainsletter.com/nyse-stock-market-holidays-schedule/ = 2"

##########################################################################################

# 8 Identify your web browser, and describe (in one or two sentences) 
# how you view HTML page source in your web browser.

## I generally use Chrome. Also use IE sometimes. To get the HTML page source I right click on the web page 
## and select View Page Source. That opens up the HTML source file. I generally copy all to a Textpad which 
## generally shows the html source in a formmated way.
