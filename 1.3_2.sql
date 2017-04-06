create or replace procedure t2function as 
cursor c1 is
  select supervisorId, RentNum, OwnName,city_address,noRooms,monthlyRent from Rental order by supervisorId;
amt_c1 c1%rowtype;
BEGIN
  if not c1%ISOPEN 
THEN
  open c1;
END IF;
LOOP
  fetch c1 into amt_c1;
  exit when c1%notfound;
  dbms_output.put_line(amt_c1.supervisorId || ' ' || amt_c1.RentNum || ' ' || amt_c1.OwnName || ' ' || amt_c1.city_address || ' '|| amt_c1.noRooms || ' ' || amt_c1.monthlyRent);
end loop;
close c1;
end;
/
show errors;

/*

SQL> exec t2function()
e1 r1 Keeks Earth 2 500
e1 r2 Keeks Pluto 1 400
e2 r3 Keeks Mars 6 600

PL/SQL procedure successfully completed.

SQL>



*/

