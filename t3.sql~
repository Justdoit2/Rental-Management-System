CREATE OR REPLACE PROCEDURE t3(owner_param IN PropertyOwner.ownerName%type)
AS
CURSOR rental_cur IS
  SELECT * FROM Rental WHERE Rental.OwnName=owner_param AND Rental.supervisorId IN (SELECT Employees.employeeId
FROM Employees WHERE Employees.branchId IS NOT NULL);

result_rec rental_cur%rowtype;
BEGIN
  IF NOT rental_cur%ISOPEN
THEN
  OPEN rental_cur;
END IF;
LOOP
    FETCH rental_cur INTO result_rec;
    EXIT WHEN rental_cur%NOTFOUND;
    dbms_output.put_line('RentalNo: ' || result_rec.RentNum);
  END LOOP;
close rental_cur;
END;
/
show errors;

/*
SQL> start t3.sql

Procedure created.

No errors.
SQL> exec t3('Keeks')
RentalNo: r1
RentalNo: r2
RentalNo: r3

PL/SQL procedure successfully completed.

SQL>
*/