 /* lease agreement ref rental supId and rentalAmount */
create table Branches ( branchNo varchar (5) primary key, phoneNo Integer, street varchar(20), city varchar(5), zip integer);

insert into Branches values('b2',1111111111,'Sunnyvale','CA',94087);

create table Employees (employeeId varchar(5) primary key, branchId varchar(5), name varchar(20), phone integer,
 jobDesignation varchar(10) CHECK (jobDesignation in ('Manager','Supervisor')), 
foreign key (branchId) references Branches(branchNo));


Table created.

 create table Manager(employeeId varchar(5), startDate Date, foreign key (employeeId) references Employees(employeeId));


create table Supervisor (employeeId varchar(5) primary key, startDate Date, foreign key (employeeId) references Employees(employeeId));


create table PropertyOwner(ownerName varchar(20) primary key, homePhone integer, workPhone integer, money decimal(10,2));

create table Rental(RentNum varchar (5) primary key, supervisorId varchar(5), OwnName varchar(20), city_Address varchar(20), noRooms integer, 
monthlyRent DECIMAL(7,2), status varchar(20) CHECK (status in('available','leased')),startDateAvail date, 
foreign key (supervisorId) references Employees(employeeId),foreign key (OwnName) references PropertyOwner(ownerName));

Table created

create table Renter (renterName varchar(20) primary key, homePhone integer, workPhone integer,
 friendName varchar(20), friendPhone varchar(20), money DECIMAL(7,2));

create table LeaseAgreement( renterName varchar(20), startDateLease date, endDateLease date, 
depositAmount DECIMAL(7,2), rentAmount DECIMAL(7,2) , supId varchar (5), 
foreign key (renterName) references Renter(renterName),
foreign key (supId) references Supervisor(employeeId));
/*
select startdatelease from leaseagreement;

select enddatelease from leaseagreement where enddatelease = (select add_months(sysdate,2) from dual);
select * from leaseagreement inner join (select add_months(sysdate,2) from dual);
SELECT enddatelease
FROM leaseagreement
INNER JOIN (select add_months(ssydate,2) from dual)
ON leaseagreement;

select enddatelease from leaseagreement inner join on
   leaseagreement.enddatelease=(select add_months(sysdate,2) from dual);
select enddatelease from leaseagreement where enddatelease <= (select add_months(sysdate,2) from dual);
select enddatelease from leaseagreement where enddatelease >= (select add_months(sysdate,2) from dual);
select enddatelease from leaseagreement where enddateleuments (6).pdfase>(select add_months(date '2016-11-13', 12) from dual) or enddatelease< (select add_months(date '2016-11-13',6) from dual);
update leaseagreement set enddatelease =date '2000-01-01' where rentamount=600;
insert into leaseagreement values ( 'Alma', DATE '2017-02-13',DATE '2017-12-13', 800.00, 500.00,'e1');
insert into leaseagreement values ( 'Dan', DATE '2016-11-13',DATE '2017-05-17', 700.00, 500.00,'e2');
delete from leaseagreement where depositamount=800;
update rental set monthlyrent =500 where depositamount =800;


/* for every supervisor, also list their properties(rental Properties ) sort it by supervisor) 

generatea  list of rental properties and sort it by supervisor */
*/