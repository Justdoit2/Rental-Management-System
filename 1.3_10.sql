create or replace procedure withinNextTwoMonths as 
cursor a1 is
  select * from Rental where supervisorId in (select supId from LeaseAgreement where endDateLease <= (select add_months(sysdate,2) from dual));
amt_a1 a1%rowtype;
begin 
  if not a1%isopen
then
  open a1;
end if;
loop
  fetch a1 into amt_a1;
  exit when a1%notfound;
  dbms_output.put_line(amt_a1.OwnName|| ' '||amt_a1.city_Address);
end loop;
close a1;
end;
/
show errors;

/*

Procedure created.

SQL> show errors;
No errors.       
SQL>
SQL>
SQL> set serveroutput on
SQL> exec withinNextTwoMonths()
Keeks Pluto
Keeks Earth
Keeks Mars

PL/SQL procedure successfully completed.

SQL>







*/

  