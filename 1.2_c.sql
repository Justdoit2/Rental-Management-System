create or replace trigger hardest_part 
before insert or update on LeaseAgreement
for each row 
begin 
  if (:new.enddatelease >add_months(:new.startdatelease,12)) or (:new.enddatelease<add_months(:new.startdatelease,6)) then
      RAISE_APPLICATION_ERROR(-20001,'Need to lease minimum 6 months and maximum a year');
  end if;
end;
/
show errors;
/*
elsif (:new.enddatelease =add_months(:new.startdatelease,6)) then
    dbms_output.put_line('hi');
    update LeaseAgreement
    set rentAmount=rentAmount + (rentAmount * 0.10)
    where :new.renterName=LeaseAgreement.renterName and :new.supId=LeaseAgreement.supId;
insert into leaseagreement values('Dan',Date '2011-01-01',Date '2017-05-01', 5, 5, 'e2');
delete from leaseagreement  where rentamount=5;


*/
