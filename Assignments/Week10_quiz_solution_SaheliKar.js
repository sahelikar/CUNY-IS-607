/////Week 10 Quiz Answers by Saheli Kar /////////////////
mongoimport --collection zips --file "C:\Users\sonatushi\Google Drive\CUNY Data Analytics\IS-607\zips.json"

use test
//Required Questions
//1. Which states have populations less than eight million?


db.zips.aggregate( { $group :
                         { _id : "$state",
                           totalPop : { $sum : "$pop" } } },
                       { $match : {totalPop : { $lt : 8000000 } } } )


//2. What is the fifth largest city in New York?
                       
var myCursor = db.zips.aggregate({$match:{state:"NY"}},
{$group:{_id:{state:"$state",city:"$city"},pop:{$sum:"$pop"}}},
{ $sort : { pop : -1 }},
{ $limit : 5 });

myCursor.result[4]

//3. What is the total number of cities in each state according to this data set?
db.zips.aggregate([ 
{ $group: { _id:
    {state: "$state", city:"$city"}, 
    count: { $sum: 1} } },
    
{ $group: {
        _id: {
            state: "$_id.state",
        },
        "distinctCount": { $sum: 1 }
    }}
]);
    
/// Challenge part /////
db.zips.update(
{state:{$in:["CT", "ME","MA","NH", "RI","VT"]} }  ,
 {$set:{Division:NumberInt(1), Region:"Northeast"}},
 { multi: true }
);
 
db.zips.update(
{state:{$in:["NY", "NJ", "PA"]} }  ,
 {$set:{Division:NumberInt(2), Region:"Northeast"}},
 { multi: true }
);
 
db.zips.update(
{state:{$in:["IL", "IN", "MI", "OH", "WI"]} }  ,
 {$set:{Division:NumberInt(3), Region:"Midwest"}},
 { multi: true }
);
 
 
db.zips.update(
{state:{$in:["IA", "KS", "MN", "MO", "NE", "ND", "SD"]} }  ,
 {$set:{Division:NumberInt(4), Region:"Midwest"}},
 { multi: true }
);
 
db.zips.update(
{state:{$in:["DE", "FL", "GA", "MD", "NC", "SC", "VA", "DC","WV"]} }  ,
 {$set:{Division:NumberInt(5), Region:"South"}},
 { multi: true }
); 
 
db.zips.update(
{state:{$in:["AL", "KY", "MS", "TN"]} }  ,
 {$set:{Division:NumberInt(6), Region:"South"}},
 { multi: true }
);
 
db.zips.update(
{state:{$in:["AR", "LA", "OK", "TX"]} }  ,
 {$set:{Division:NumberInt(7), Region:"South"}},
 { multi: true }
);
 
db.zips.update(
{state:{$in:["AZ", "CO", "ID", "MT", "NV", "NM", "UT", "WY"]} } ,
 {$set:{Division:NumberInt(8), Region:"West"}},
 { multi: true }
);
 
db.zips.update(
{state:{$in:["AK", "CA", "HI", "OR", "WA"]} } ,
 {$set:{Division:NumberInt(9), Region:"West"}},
 { multi: true }
);
 
////1. What is the average city population by region?
var map2 = function(){ 
     var value = {
     count: 1,
     pop: this.pop
    };

    emit(this.Region, value)
}

var reduce2 = function(key,valuesCombo) {
     reducedVal = { count: 0, pop: 0 };
     for (var idx = 0; idx < valuesCombo.length; idx++) {
     reducedVal.count += valuesCombo[idx].count;
     reducedVal.pop += valuesCombo[idx].pop;
    }
 return reducedVal;
}

var finalize2 = function(key, reducedVal) {
 reducedVal.avg = reducedVal.pop/reducedVal.count;
 return reducedVal;
}
db.zips.mapReduce( map2, reduce2, { out: "mapreduced2", finalize: finalize2 } )

db.mapreduced2.find()


//2. Which region has the most people? The fewest?

var myCursor = db.mapreduced2.find();
var maxPop = myCursor.next().value.pop;
var minPop = myCursor.next().value.pop;
var MaxPopRegion = myCursor.next()._id;
var MinPopRegion = myCursor.next()._id;

while(myCursor.hasNext())
{
    var nextVal = myCursor.next();
    if(nextVal.value.pop>maxPop)
    {
        maxPop=nextVal.value.pop;
        MaxPopRegion = nextVal._id;
    }
    if(nextVal.value.pop<minPop)
    {
        minPop=nextVal.value.pop;
        MinPopRegion = nextVal._id;    }
}
print("MaxPopRegion: "+MaxPopRegion+"::MaxPop:"+maxPop);
print("MinPopRegion: "+MinPopRegion+"::MinPop:"+minPop);

//3. What is the total population of each district?

var map3 =  function(){emit(this.Division, this.pop)};

var reduce3 = function(keyDivision, valuespop) { return Array.sum(valuespop); }

db.zips.mapReduce( map3, reduce3, { out: "mapreduced3" } )

db.mapreduced3.find()

