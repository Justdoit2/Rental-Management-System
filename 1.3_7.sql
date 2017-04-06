create or replace procedure showLease(l_renter in Renter.renterName%type) as
cursor amt_cur is
  select * from LeaseAgreement where renterName=l_renter;
amt_rec amt_cur%rowtype;
begin
  if not amt_cur%isopen
then 
  open amt_cur;
end if;
loop
  fetch amt_cur into amt_rec;
  exit when amt_cur%notfound;
  dbms_output.put_line('Lease Results:' || amt_rec.renterName || ' ' || amt_rec.startDateLease || ' ' || amt_rec.endDateLease || ' ' || amt_rec.depositAmount || ' ' || amt_rec.rentAmount || ' '||amt_rec.supId);
end loop;
close amt_cur;
end;
/
show errors;
 
/*
SQL> start t7function

Procedure created.

No errors.
SQL> exec showLease('Alma');
Lease Results:Alma 01-JAN-18 01-JAN-19 500 500 e1
Lease Results:Alma 01-JAN-17 01-JAN-18 400 400 e1

PL/SQL procedure successfully completed.

SQL>





*/








  