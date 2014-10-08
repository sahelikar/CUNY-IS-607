###################### Week 6 Assignment by Saheli Kar ######################################
require(rvest)

url<-"http://sourceforge.net/"


categories<-url %>%
html() %>%
html_nodes(".titled h2")%>%
  html_text()


print("The categories of the projects in SourceForge:")
show(categories)

projects<-url %>%
  html() %>% 
  html_nodes("h3 a") %>%
  html_attr("title")


  
print("The Projects SourceForge:")
projects


blog<-url %>%
  html() %>% 
  html_nodes("#blog")

blogTitle<-blog %>%
  html_nodes("a") %>%
  html_attr("title")

#blogTitle<-na.omit(blogTitle)
# not sure why na.omit() did not work here

blogText<-blog %>%
  html_nodes("p") %>%
  html_text()

blogTitleClean<-c()
for(i in 1:length(blogTitle) ){
  if(!is.na(blogTitle[i])){
    blogTitleClean<-c(blogTitleClean, blogTitle[i])
  } 
}

blogTitle<-blogTitleClean

blogDf<- data.frame(blogTitle, blogText)

print("The blogs:")
show(blogDf)
