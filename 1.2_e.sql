CREATE OR REPLACE TRIGGER lease_increase_rent after INSERT ON LeaseAgreement
For each row
BEGIN
  UPDATE Rental SET Rental.monthlyRent=(Rental.monthlyRent*1.1);
  dbms_output.put_line('Trig fired!');
END property_leased_trig;
/
show errors;

/*
update rental set monthlyrent =900 where monthlyrent =990;


SQL> insert into leaseagreement values ( 'Alma', DATE '2017-05-13',DATE '2017-12-13', 800.00, 700.00,'e1');
Trig fired!

1 row created.

SQL> select * from rental;

RENTN SUPER OWNNAME              CITY_ADDRESS            NOROOMS MONTHLYRENT
----- ----- -------------------- -------------------- ---------- -----------
STATUS               STARTDATE
-------------------- ---------
r1    e1    Keeks                Earth                         2         550
leased               13-MAR-16

r2    e1    Keeks                Pluto                         1         440
available            14-MAR-17

r3    e2    Keeks                Mars                          6         660
available            14-MAR-17


RENTN SUPER OWNNAME              CITY_ADDRESS            NOROOMS MONTHLYRENT
----- ----- -------------------- -------------------- ---------- -----------
STATUS               STARTDATE
-------------------- ---------
r4    e2    Jade                 Pluto                         5         990
leased               04-APR-40


SQL>





*/