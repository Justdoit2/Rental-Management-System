create or replace procedure showCriteria (l_city in Rental.city_Address%type, l_rooms in Rental.noRooms%type, minRange in number, highRange in number) as
cursor amt_cur is
  select * from rental where city_Address=l_city and noRooms=l_rooms and status='available' and monthlyRent between minRange and highRange;
amt_rec amt_cur%rowtype;
BEGIN
  if not amt_cur%isopen
THEN 
  open amt_cur;
END IF;
LOOP
  fetch amt_cur into amt_rec;
  exit when amt_cur%notfound;
  dbms_output.put_line('Rental Property Results:' || amt_rec.RentNum || ' ' || amt_rec.OwnName || ' ' ||amt_rec.city_Address || ' ' || amt_rec.noRooms || ' ' || amt_rec.monthlyRent);
end loop;
close amt_cur;
end;
/
show errors;

/* inputs: city, noRooms, lowRange, highrange 

SQL> start t4function

Procedure created.

No errors.
SQL> execute showCriteria('Pluto',1,359,401);
Rental Property Results:r2 Keeks Pluto 1 400

PL/SQL procedure successfully completed.

*/