CREATE OR REPLACE TRIGGER property_leased_trig before INSERT ON LeaseAgreement
For each row
BEGIN
  UPDATE Rental SET status='leased' WHERE  supervisorId =(select distinct supervisorId from Rental where 
  supervisorId in (select distinct supId from LeaseAgreement where LeaseAgreement.supId=:new.supId)) and Rental.monthlyrent=:new.rentAmount;
END property_leased_trig;
/
show errors;


/*  insert when rentamoutn and supervisor id from rental included for lease
insert into leaseagreement values ( 'Alma', DATE '2019-01-01',DATE '2020-01-01', 500.00, 500.00,'e2');

1 row created.

SQL> select * from rental;

RENTN SUPER OWNNAME              CITY_ADDRESS            NOROOMS MONTHLYRENT
----- ----- -------------------- -------------------- ---------- -----------
STATUS               STARTDATE
-------------------- ---------
r1    e1    Keeks                Earth                         2         500
leased               13-MAR-16

r2    e1    Keeks                Pluto                         1         400
available            14-MAR-17

r3    e2    Keeks                Mars                          6         600
available            14-MAR-17


RENTN SUPER OWNNAME              CITY_ADDRESS            NOROOMS MONTHLYRENT
----- ----- -------------------- -------------------- ---------- -----------
STATUS               STARTDATE
-------------------- ---------
r4    e2    Jade                 Pluto                         5         900
leased               04-APR-40






 */

