CREATE OR REPLACE TRIGGER limit_manager_trig BEFORE INSERT ON Employees
--l_employeeId Manager.employeeId%type;
  /*SELECT Branches.branchNo INTO l_employeeId FROM Branches WHERE Branches.employeeId=:new.employeeId;*/
FOR EACH ROW
DECLARE
  l_count integer;
BEGIN
    SELECT COUNT(*) INTO l_count FROM Employees WHERE jobDesignation='Manager' AND Employees.branchId=:new.branchId;
  dbms_output.put_line('total: ' || l_count);
  IF l_count > 0 THEN
    raise_application_error(-20000,'Limit one manager per branch');
  END IF;
END;
/
show errors;
/*
insert into employees values  ('e4', 'b1', 'test', 343434343,'Manager');

ERROR at line 1:
ORA-20000: Limit one manager per branch
ORA-06512: at "ANIU.LIMIT_MANAGER_TRIG", line 7
ORA-04088: error during execution of trigger 'ANIU.LIMIT_MANAGER_TRIG'

*/