########################### Week-9 Assignment by Saheli Kar #################################


##Command line import scripts into Mongodb is given in comments
#mongoimport --db unitedstates --collection usdata --type tsv --headerline --file "C:\districtdata.txt"
#mongoimport --db unitedstates --collection usdata --type tsv --headerline --file "C:\inhabitedterritorydata.txt"
#mongoimport --db unitedstates --collection usdata --type csv --headerline --file "C:\statedata.csv"

#install.packages("rmongodb")

require(rmongodb)
require(jsonlite)
library(splitstackshape)


mongo <- mongo.create()


mongo <- mongo.create(host = "localhost")
if(mongo.is.connected(mongo) == TRUE){
  db <- "unitedstates"
  mongo.get.database.collections(mongo, db)
}


coll <- "unitedstates.usdata"

if(mongo.is.connected(mongo) == TRUE){
  json <- "{\"state\":{\"$ne\": null}}"
  cursor <- mongo.find(mongo, coll, json)
  state <- mongo.cursor.to.data.frame(cursor)
  state_df <- tbl_df(state)
  
  json <- "{\"federal_district\":{\"$ne\": null}}"
  cursor <- mongo.find(mongo, coll, json)
  federal <- mongo.cursor.to.data.frame(cursor)
  federal_df <- tbl_df(federal)
  
  json <- "{\"territory\":{\"$ne\": null}}"
  cursor <- mongo.find(mongo, coll, json)
  territory <- mongo.cursor.to.data.frame(cursor)
  territory_df <- tbl_df(territory)
}


## Cleaning territory data
new_territory_df<-cSplit_e(territory_df, "territorial_status", drop=TRUE, type = "character", fill=0)

