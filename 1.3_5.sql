CREATE OR REPLACE PROCEDURE AvailBranch AS
CURSOR rentals_cur IS
  select branchId,count(*) as rentalsAvailable from (select Rental.*,Employees.branchId from Rental,Employees
WHERE Rental.supervisorId=Employees.employeeId) WHERE status='available' GROUP BY branchId;
result_rec rentals_cur%rowtype;
BEGIN
  IF NOT rentals_cur%ISOPEN
THEN
  OPEN rentals_cur;
END IF;
 LOOP
  FETCH rentals_cur INTO result_rec;
  EXIT WHEN rentals_cur%NOTFOUND;
  dbms_output.put_line('Branch ' || result_rec.branchId || ' has ' || result_rec.rentalsAvailable || ' rentals available');
END LOOP;
close rentals_cur;
END;
/
show errors;
/*
SQL> start t5.sql

Procedure created.

No errors.
SQL> exec AvailBranch()
Branch b2 has 1 rentals available
Branch b1 has 2 rentals available

PL/SQL procedure successfully completed.

SQL>
*/