CREATE OR REPLACE PROCEDURE avrgRent(input_town Rental.city_Address%type) AS
  avg_rent_available float;
  avg_rent_leased float;
BEGIN
  
  /*start a query into rental*/
  SELECT AVG(monthlyRent) INTO avg_rent_available FROM Rental WHERE Rental.city_Address=input_town AND Rental.status='available';
  SELECT AVG(monthlyRent) INTO avg_rent_leased FROM Rental WHERE Rental.city_Address=input_town AND Rental.status='leased';
  dbms_output.put_line('avg available: ' || avg_rent_available);
  dbms_output.put_line('avg leased: ' || avg_rent_leased);
END;
/
show errors;


/*
SQL> start t9.sql

Procedure created.

No errors.
SQL> exec avrgRent('Pluto')
avg available: 400
avg leased: 900

PL/SQL procedure successfully completed.

*/