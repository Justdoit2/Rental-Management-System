create or replace trigger updaterent_trig
before insert on LeaseAgreement
for each row
begin
  update LeaseAgreement
  set rentAmount=:new.rentAmount*1.1
  where :new.enddatelease = add_months(:new.startdatelease,6);
end updaterent_trig;
/
show errors;