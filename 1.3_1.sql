CREATE OR REPLACE PROCEDURE t1(branchNo_param IN Branches.branchNo%type) AS
CURSOR emp_cur IS
  SELECT Rental.* FROM Rental WHERE Rental.supervisorId IN
  (SELECT Employees.employeeId FROM Employees WHERE Employees.branchId=
  (SELECT Branches.branchNo FROM Branches WHERE Branches.branchNo=branchNo_param));

result_rec emp_cur%rowtype;
l_managerName Employees.name%type;
BEGIN
  SELECT Employees.name INTO l_managerName FROM Employees WHERE Employees.jobDesignation='Manager' AND Employees.branchId=
  (SELECT Branches.branchNo FROM Branches WHERE Branches.branchNo=branchNo_param);
  dbms_output.put_line('Manager: ' || l_managerName);
  IF NOT emp_cur%ISOPEN
THEN
  OPEN emp_cur;
END IF;
LOOP

  FETCH emp_cur INTO result_rec;
  EXIT WHEN emp_cur%NOTFOUND;
  dbms_output.put_line('Rental #: ' || result_rec.RentNum ||' Property owner: ' || result_rec.OwnName);

END LOOP;
close emp_cur;
END;
/
show errors;

/*

SQL> exec t1('b1')
Manager: Helen
Rental #: r1 Property owner: Keeks
Rental #: r2 Property owner: Keeks

PL/SQL procedure successfully completed.




*/


