CREATE OR REPLACE PROCEDURE createLeaseAgree(renterName_param LeaseAgreement.renterName%type,startDateLease_param LeaseAgreement.startDateLease%type,
endDateLease_param LeaseAgreement.endDateLease%type,depositAmount_param LeaseAgreement.depositAmount%type,
rentAmount_param LeaseAgreement.rentAmount%type, supId_param LeaseAgreement.supId%type)
AS
BEGIN
  INSERT INTO LeaseAgreement VALUES(renterName_param,startDateLease_param,endDateLease_param,depositAmount_param,rentAmount_param,supId_param);
END;
/
show errors;

/*
SQL> exec createLeaseAgree('Dan',date '2016-11-13', date '2017-05-17',700,500,'e1');

PL/SQL procedure successfully completed.

SQL> select * from leaseagreement;

RENTERNAME           STARTDATE ENDDATELE DEPOSITAMOUNT RENTAMOUNT SUPID
-------------------- --------- --------- ------------- ---------- -----
Alma                 01-JAN-18 01-JAN-19           500        550 e1
Alma                 13-JUN-17 13-DEC-17           800        700 e1
Alma                 01-JAN-15 01-JAN-16           400        440 e1
Dan                  13-NOV-16 13-MAY-17           600        600 e2
Dan                  13-NOV-16 17-MAY-17           700        500 e1

SQL>






*/