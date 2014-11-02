///////// Week 10 Assignment by Saheli Kar //////////////////
use test


var map1 = function() {emit(this.state,this.pop);}

var reduce1 = function(keyState, valuespop) { return Array.sum(valuespop); }

db.zips.mapReduce( map1, reduce1, { out: "mapreduced1" } )

db.mapreduced1.find()



