--------------------------------------------------------------- CREATE TABLE SQL SCRIPTS ------------------------------------------------------

--DROP TABLE BOOK;
create table Book(
BookId varchar(20) NOT NULL, 
BookName varchar(100) NOT NULL, 
Author varchar(50) NOT NULL, 
NumberOfCopies int NOT NULL,
Category varchar(20),
PRIMARY KEY(BookId)
);

--DROP TABLE Member;
create table Member(
MemberId varchar(20) NOT NULL,
Name varchar(50) NOT NULL,
SSN integer NOT NULL,
Address varchar(100) NOT NULL,
Membership_StartDate DATE NOT NULL,
Membership_EndDate DATE NOT NULL,
PRIMARY KEY(MemberId));


--DROP TABLE Location;
create table Location(
LocationCode varchar(10) NOT NULL,
RackNo varchar(10) NOT NULL,
ShelfNo varchar(10) NOT NULL,
PRIMARY KEY (LocationCode));


--DROP TABLE BookCopy;
create table BookCopy(
CopyCode varchar(20) NOT NULL, 
BookId varchar(20) NOT NULL,
Available boolean NOT NULL,
Blocked boolean NOT NULL,
BlockeBy varchar(20),
CheckedOutBy varchar(20),
LocationCode varchar(20),
PRIMARY KEY(CopyCode),
FOREIGN KEY (BookId) REFERENCES BOOK(BookID),
FOREIGN KEY (BlockeBy) REFERENCES Member(MemberId),
FOREIGN KEY (CheckedOutBy) REFERENCES Member(MemberId),
FOREIGN KEY (LocationCode) REFERENCES Location(LocationCode)
);

--DROP table CheckInOut;
create table CheckInOut(
EntryCode varchar(20) NOT NULL,
CopyCode varchar(20) NOT NULL,
CheckOut DATE NOT Null,
DueDate DATE NOT NULL,
CheckIn DATE,
PRIMARY KEY(EntryCode),
FOREIGN KEY (CopyCode) REFERENCES BookCopy(CopyCode)
);

--DROP table Invoice;
create table Invoice(
InvoiceNumber varchar(20),
MemberId varchar(20),
InvoicedAmount float,
InvoiceType varchar(50),
InvoicedDate Date,
Settlement Boolean,
SettlementDate Date,
PRIMARY KEY(InvoiceNumber),
FOREIGN KEY(MemberId) references Member(MemberId)
);


--------------------------------------------------------------- INSERT SCRIPTS TO POPULATE TABLES ------------------------------------------------------
insert into Book(BookId, BookName, Author, NumberOfCopies, Category) values('NATCHASE', 'Chasing the Sun', 'Natatlia Sylvester', 10, 'Fiction');
insert into Book(BookId, BookName, Author, NumberOfCopies, Category) values('LITDEARD', 'Dear Daughter', 'Little Elizabeth', 8, 'Fiction');
insert into Book(BookId, BookName, Author, NumberOfCopies, Category) values('EVEDOUBL', 'The Double Life of Paul de Man', 'Evelyn Barish', 8, 'Biography');
insert into Book(BookId, BookName, Author, NumberOfCopies, Category) values('GARMOSTD', 'The Most Dangerous Animal of All', 'Gary L. Stewart', 10, 'Biography');

insert into Member(MemberId, Name, SSN, Address, Membership_StartDate, Membership_EndDate) values('ABC000001', 'John Blake', 1234567890, '123 ABC Avenue, New York, NY - 10005', '2012-01-31', '2017-01-30');
insert into Member(MemberId, Name, SSN, Address, Membership_StartDate, Membership_EndDate) values('ABC000002', 'Ron Vigilio', 1234567891, '123 DEF Avenue, New York, NY - 10004', '2012-02-28', '2017-02-27');
insert into Member(MemberId, Name, SSN, Address, Membership_StartDate, Membership_EndDate) values('ABC000003', 'Kathy Barke', 1234567892, '123 GHI Avenue, New York, NY - 10001', '2013-02-28', '2018-02-27');

insert into Location(LocationCode, RackNo, ShelfNo) values('220-008', 220, 8);
insert into Location(LocationCode, RackNo, ShelfNo) values('310-001', 310, 1);
insert into Location(LocationCode, RackNo, ShelfNo) values('981-007', 981, 7);
insert into Location(LocationCode, RackNo, ShelfNo) values('281-006', 281, 6);


insert into BookCopy(CopyCode, BookId, Available, Blocked, BlockeBy, CheckedOutBy, LocationCode) values('NATCHASE01', 'NATCHASE', FALSE, FALSE, NULL, 'ABC000001', NULL);
insert into BookCopy(CopyCode, BookId, Available, Blocked, BlockeBy, CheckedOutBy, LocationCode) values('NATCHASE02', 'NATCHASE', FALSE, TRUE, 'ABC000002', 'ABC000003', NULL);
insert into BookCopy(CopyCode, BookId, Available, Blocked, BlockeBy, CheckedOutBy, LocationCode) values('LITDEARD01', 'LITDEARD', TRUE, FALSE, NULL, NULL, '220-008');
insert into BookCopy(CopyCode, BookId, Available, Blocked, BlockeBy, CheckedOutBy, LocationCode) values('LITDEARD02', 'LITDEARD', FALSE, FALSE, NULL, 'ABC000002', NULL);
insert into BookCopy(CopyCode, BookId, Available, Blocked, BlockeBy, CheckedOutBy, LocationCode) values('EVEDOUBL01', 'EVEDOUBL', FALSE, TRUE, 'ABC000003', NULL, '981-007');
insert into BookCopy(CopyCode, BookId, Available, Blocked, BlockeBy, CheckedOutBy, LocationCode) values('EVEDOUBL02', 'EVEDOUBL', FALSE, FALSE, NULL, 'ABC000001', NULL);
insert into BookCopy(CopyCode, BookId, Available, Blocked, BlockeBy, CheckedOutBy, LocationCode) values('GARMOSTD01', 'GARMOSTD', TRUE, FALSE, NULL, NULL, '310-001');
insert into BookCopy(CopyCode, BookId, Available, Blocked, BlockeBy, CheckedOutBy, LocationCode) values('GARMOSTD02', 'GARMOSTD', TRUE, FALSE, NULL, NULL, '310-001');


insert into CheckInOut(EntryCode, CopyCode, CheckOut, DueDate, CheckIn) values('NATCHASE01-20140321', 'NATCHASE01', '2014-03-21', '2014-04-06', '2014-04-05');
insert into CheckInOut(EntryCode, CopyCode, CheckOut, DueDate, CheckIn) values('NATCHASE01-20141001', 'NATCHASE01', '2014-10-01', '2014-10-15', NULL);
insert into CheckInOut(EntryCode, CopyCode, CheckOut, DueDate, CheckIn) values('NATCHASE02-20141005', 'NATCHASE02', '2014-10-05', '2014-10-19', NULL);
insert into CheckInOut(EntryCode, CopyCode, CheckOut, DueDate, CheckIn) values('LITDEARD01-20140321', 'LITDEARD01', '2014-03-21', '2014-04-06', '2014-04-05');
insert into CheckInOut(EntryCode, CopyCode, CheckOut, DueDate, CheckIn) values('LITDEARD02-20141005', 'LITDEARD02', '2014-10-05', '2014-10-18', NULL);
insert into CheckInOut(EntryCode, CopyCode, CheckOut, DueDate, CheckIn) values('EVEDOUBL01-20141003', 'EVEDOUBL01', '2014-10-03', '2014-10-17', NULL);
insert into CheckInOut(EntryCode, CopyCode, CheckOut, DueDate, CheckIn) values('EVEDOUBL02-20141002', 'EVEDOUBL02', '2014-09-28', '2014-10-10', '2014-10-11');
--insert into CheckInOut(EntryCode, CopyCode, CheckOut, DueDate, CheckIn) values('GARMOSTD01-20140922', 'GARMOSTD01', '2014-09-22', '2014-10-07', '2014-10-06');

delete from Invoice
insert into Invoice(InvoiceNumber, MemberId, InvoicedAmount, InvoiceType, InvoicedDate, Settlement, SettlementDate) 
values('ABC000001-001', 'ABC000001', 1, 'Fine', '2014-10-12', FALSE, NULL);
insert into Invoice(InvoiceNumber, MemberId, InvoicedAmount, InvoiceType, InvoicedDate, Settlement, SettlementDate) 
values('ABC000002-001', 'ABC000002', 25, 'Renewal Fee', '2013-02-28', FALSE, '2013-02-28');
insert into Invoice(InvoiceNumber, MemberId, InvoicedAmount, InvoiceType, InvoicedDate, Settlement, SettlementDate) 
values('ABC000002-002', 'ABC000002', 3, 'Fine', '2014-03-28', TRUE, '2014-03-30');



--------------------------------------------------------------- JOINS ON TABLES ------------------------------------------------------

-- INNER JOIN -- 

select a.BookId, a.BookName, a.Author, b.CopyCode, b.Available, b.Blocked from Book a INNER JOIN BookCopy b ON a.BookId = b.BookId;

-- LEFT OUTER JOIN --
select MEMBER.Name, MEMBER.SSN, MEMBER.Address, Invoice.InvoiceNumber, Invoice.InvoicedAmount, Invoice.InvoiceType, Invoice.InvoicedDate 
from MEMBER left outer join  Invoice on MEMBER.MemberId = Invoice.MemberId;

-- RIGHT OUTER JOIN --
select BookCopy.CopyCode, BookCopy.Available, BookCopy.Blocked, Location.RackNo, Location.ShelfNo
from BookCopy right outer join Location on BookCopy.LocationCode = Location.LocationCode;

--FULL OUTER JOIN -- 


