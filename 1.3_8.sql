
/*Show the renters who rented more than one rental property.*/
create or replace procedure MoreThanOne as
cursor a1 is
  select * from renter where rentername in(select rentername from leaseagreement having count(*)>1 group by rentername);
amt_a1 a1%rowtype;
BEGIN
  if not a1%isopen
then
  open a1;
end if;
loop
  fetch a1 into amt_a1;
  exit when a1%notfound;
  dbms_output.put_line('The renters with more than one are:' || amt_a1.renterName || ' '||amt_a1.homePhone
  || ' '||amt_a1.workPhone|| ' '||amt_a1.friendName || ' ' ||amt_a1.friendPhone|| ' '||amt_a1.money);
end loop;
close a1;
end;
/
show errors;

  
/*
SQL> start t8.sql

Procedure created.


Procedure created.

No errors.
SQL> exec MoreThanOne()
The renters with more than one are:Alma 1121222 45344566 Biden 555344 1000

PL/SQL procedure successfully completed.

SQL>


*/

