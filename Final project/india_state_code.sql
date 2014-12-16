drop table india_state_code;

create table india_state_code(
code varchar(2),
name varchar(100),
category varchar(100),
region varchar(100)
);

copy  india_state_code from 'C:\data\State_codes.csv'  DELIMITERS ',' with NULL as ''