---------------------------------------------Week 8 Quiz-Saheli Kar -----------------------------------------
-- drop table AppleEmployee;
create table AppleEmployee
(EmpId int, 
Name varchar(50) NOT NULL,
Designation varchar(50) NOT NULL,
Department varchar(50),
SupervisorId int,
CurrentEmployee Boolean,
PRIMARY KEY(EmpId));


--(1) Create a single table that includes information for the CEO, the SVP of IOS Software, and the SVP, Chief Financial Officer. 
-- Also include information for the direct reports of the two SVPs. [You should have a single table with 8 rows].

--delete from AppleEmployee;
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(1, 'Steve Jobs', 'CEO', NULL, NULL, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(10, 'Scott Forstall', 'SVP', 'IOS Software', 1, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(8, 'Peter Oppenheimer', 'SVP, Chief Financial Officer', 'Finance', 1, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(20, 'Kim Vorrath', 'VP, Program Management', 'IOS Software', 10, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(25, 'Isabel Ge Mahe', 'VP, IOS Wireless Software', 'IOS Software', 10, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(27, 'Henri Lamiraux', 'VP, Engg, IOS Apps', 'IOS Software', 10, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(19, 'Betsy Rafael', 'VP, Controller', 'Finance', 8, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(21, 'Gary Wipfler', 'VP, Treasurer', 'Finance', 8, True);


--(2) Write a query that displays all of the information in the table.
select * from AppleEmployee;

--(3) Assume that (a) Tim Cook replaces Steve Jobs as CEO, and (b) Apple (hypothetically) hires Susan Wojcicki 
-- away from Google to replace Tim Cook at COO, with the COO reports unchanged.
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(2, 'Timothy Cook', 'Cheif Operating Officer', 'Operations', 1, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(5, 'Bob Mansfield', 'SVP, Mac Hardware Engineering', 'Operations', 2, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(6, 'Jeffrey Williams', 'SVP, Mac Hardware Engineering', 'Operations', 2, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(31, 'John Couch', 'VP, Education Sales', 'Operations', 2, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(32, 'John Brandon', 'VP, Channel Sales', 'Operations', 2, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(33, 'Michael Enger', 'VP, Iphone Sales', 'Operations', 2, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(34, 'Douglas Beck', 'VP, Apple Japan', 'Operations', 2, True);
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId, CurrentEmployee) values(35, 'Jeniffer Bailey', 'VP, Online Stores', 'Operations', 2, True);

--Promote Tim
update AppleEmployee set Designation='CEO', Department=NULL, SupervisorId=NULL where EmpId=2 and CurrentEmployee=True;
--Hire Susan Wojcicki
insert into AppleEmployee(EmpId, Name, Designation, Department, SupervisorId,CurrentEmployee) values(40, 'Susan Wojcicki', 'Cheif Operating Officer', 'Operations', 1, True);
-- Assign the Reportees of Tim to Susan
update AppleEmployee set SupervisorId=40 where SupervisorId=2 and CurrentEmployee=True;
-- Assign the Reportees of Steve to Tim
update AppleEmployee set SupervisorId=2 where SupervisorId=1 and CurrentEmployee=True;
-- Release Steve
--Here I am not deleting the record, to preserve the employeeId. An organisation dont reassign the empids of the employees who had left to new employees.  
--It will also help us to retrive the information of the last designation of the employee when he left the organisation.
update AppleEmployee set CurrentEmployee=False where EmpId=1;












