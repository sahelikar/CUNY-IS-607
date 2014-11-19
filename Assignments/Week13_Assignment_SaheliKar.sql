-- Part 1
-- Show the airport Name, with its latitude and longitude and the weather info for the flights which has delay more than 10

select 
a.name Aiport_name, 
a.lat latitude, 
a.lon longitude,
b.year yr,
b.month mnth,
b.day _day,
b.hour hr,
b.dep_delay dep_delay,
b.flight flight,
c.temp temperature,
c.dewp dewp,
c.humid humid,
c.wind_dir wind_dir,
c.wind_speed wind_speed,
c.wind_gust wind_gust,
c.precip precip,
c.pressure pressure,
c.visib visib
from airports a, flights b, weather c
where a.faa = b.origin
and b.origin=c.origin
and b.year = c.year
and b.month = c.month
and b.day = c.day
and b.hour = c.hour
and b.dep_delay>10;


--Time required 4462 ms

CREATE INDEX faa_index
   ON airports (faa ASC NULLS LAST);

CREATE INDEX origin_index
   ON flights (origin ASC NULLS LAST);

CREATE INDEX group_index
   ON weather (origin ASC NULLS LAST, month ASC NULLS LAST, hour ASC NULLS LAST, year ASC NULLS LAST, day ASC NULLS LAST);

CREATE INDEX group2_index
   ON flights (year ASC NULLS LAST, month ASC NULLS LAST, day ASC NULLS LAST, hour ASC NULLS LAST, origin ASC NULLS LAST);

--Time required 4177 ms


--Part 2

--Show the net delay time, the seating capacity, and the average temperature and average windspeed for the day for each flight.


create table flight_info (
flight int,
seats int,
dep_delay int,
arr_delay int,
avg_temp float,
avg_wind_speed float
);

insert into flight_info
select
b.flight,
a.seats seats,
b.dep_delay dep_delay,
b.arr_delay arr_delay,
c.avg_temp avg_temp,
c.avg_wind_speed avg_wind_speed
from planes a, flights b, 
(select origin, day, avg(temp) avg_temp, avg(wind_speed) avg_wind_speed from weather group by day, origin) c
where a.tailnum = b.tailnum
and b.origin=c.origin
and b.day = c.day;

select * from flight_info;


create view flight_info_view AS
select
b.flight,
a.seats seats,
b.dep_delay dep_delay,
b.arr_delay arr_delay,
c.avg_temp avg_temp,
c.avg_wind_speed avg_wind_speed
from planes a, flights b, 
(select origin, day, avg(temp) avg_temp, avg(wind_speed) avg_wind_speed from weather group by day, origin) c
where a.tailnum = b.tailnum
and b.origin=c.origin
and b.day = c.day;

select * from flight_info_view;

-- Table --
-- A table in the databse holds real data

--View --
-- A view doesnt hold the real data. It only stores a select statement. When a view is called it executes the query and shows the result to us.
-- In the above created view it store the select statement scrpted in its creation. We acn use this view if we want to use this select stament in any of the query. 
-- We dont have to write the whole select statemnet again.
