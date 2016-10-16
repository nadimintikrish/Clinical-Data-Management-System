spool project.out  
set echo on
-- 
-- author: <<< Nadiminti Naga Venkata Krishna Nadiminti >>>
---author:	<<< Raveena Pendyam >>>
---author: <<< Swati Gupta >>>
---author: <<< Amith Kumar Aellanki >>>
---author: <<< Bishal Chamling >>>
-------------------------------------------------------------------
SET SERVEROUTPUT ON 
SET VERIFY OFF

SET FEEDBACK OFF
---Drop Tables------
DROP TRIGGER IC_SALARY;
DROP TRIGGER dIC_TA;
---Drop Tables------
Drop table PhysicianHistory CASCADE CONSTRAINTS;
Drop table Schedule CASCADE CONSTRAINTS;
Drop table Physician CASCADE CONSTRAINTS;
Drop table Nurse CASCADE CONSTRAINTS;
Drop table Dept_Hospital CASCADE CONSTRAINTS;
Drop table Emp_Hospital CASCADE CONSTRAINTS;
Drop table symptoms CASCADE CONSTRAINTS;
Drop table Prescription CASCADE CONSTRAINTS;
Drop table Visit CASCADE CONSTRAINTS;
Drop table Patient CASCADE CONSTRAINTS;
Drop table Medicine CASCADE CONSTRAINTS;

----Creating Tables------

Create Table Emp_Hospital(
EmpID  Integer,
First_name varchar (20),
Mid_Name varchar (20),
Last_Name varchar (20),
Address varchar(30),
DepNO Integer,
constraint pIC1 primary key (EmpID));

Create table Dept_Hospital(
DepID Integer,
DepName varchar(20),
MgrID Integer,
MgrStartdate Date,
constraint dIC1 primary key (DepID));

Create table Physician(
EmpID Integer,
SuperId Integer,
Salary Integer,
constraint phyIC1 primary key (EmpID));

Create Table Nurse(
EmpId Integer,
Degree varchar(20),
Job_assigned varchar(20),
Salary Integer,
SuperID Integer,
constraint nurIC1 primary key (EmpID));

Create table Patient(
PID integer,
disease varchar(20),
address varchar(30),
pinCode integer,
constraint patIC1 primary key (PID));

Create table Medicine(
DrugId varchar(25),
disease varchar(20),
constraint medIC1 primary key(DrugId));

Create table Schedule (
EmpID integer,
ScheduleId INTEGER,
surgery varchar(20),
startTime TIMESTAMP,
endTime TIMESTAMP,
constraint schIC1 primary key (EmpID,ScheduleId));

Create table Visit(
VisitId integer,
pid integer,
vDate date,
DrugId varchar(25),
EmpId integer,
constraint tIC1 primary key (VisitId,pid,DrugId));

create table symptoms(
PId integer,
patsymp varchar(100),
constraint SympIC1 primary key(PId,patsymp));


create table Prescription(
VisitId integer,
DrugId varchar(25),
pid integer,
presdays integer,
pillsperday integer,
constraint PresIC1 primary key(DrugId,VisitId,pid));


create table PhysicianHistory(
HDate date,
EmpId integer,
Specialization VARCHAR(50),
Description VARCHAR(50),
School VARCHAR(50),
constraint PHIC1 primary key(HDate,EmpId));
-------------Insert into Tables-----------------

----EMP_Hospital-----

Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (1,'Dave','A','john','642 Dallas Houston TX',1);
Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (2,'James','V','Wong','821 Stone Houston TX ',2);
Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (3,'Krishna','M','Narayan','555 Oak Houston TX',3);
Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (4,'Alex','S','Mond','898 Ferris Houston TX',4);
Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (5,'Joyce','K','Smith','222 leoarnd Houston TX',3);
Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (6,'John','P','Arnold','476 Plymoth Houston TX',1);
Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (7,'Megan','H','Sree','900 Fulton Houston TX',2);
Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (8,'Alisha','B','Mac','181 Castle Houston TX',1);
Insert into EMP_HOSPITAL (EMPID,FIRST_NAME,MID_NAME,LAST_NAME,ADDRESS,DEPNO) values (9,'Jennifer','R','Anniston','242 Cascade Houston TX',2);

----Dept_Hospital-----

Insert into DEPT_HOSPITAL (DEPID,DEPNAME,MGRID,MGRSTARTDATE) values (1,'Orthopedics',1,to_date('21-MAR-92','DD-MON-RR'));
Insert into DEPT_HOSPITAL (DEPID,DEPNAME,MGRID,MGRSTARTDATE) values (2,'Cardiologist',2,to_date('03-JAN-87','DD-MON-RR'));
Insert into DEPT_HOSPITAL (DEPID,DEPNAME,MGRID,MGRSTARTDATE) values (3,'Neurologist',3,to_date('29-JAN-89','DD-MON-RR'));
Insert into DEPT_HOSPITAL (DEPID,DEPNAME,MGRID,MGRSTARTDATE) values (4,'Pathologist',4,to_date('11-JAN-91','DD-MON-RR'));


---Medicine------

Insert into MEDICINE (DRUGID,DISEASE) values ('5003','Bone tumor');
Insert into MEDICINE (DRUGID,DISEASE) values ('7098','Inflammatory disease');
Insert into MEDICINE (DRUGID,DISEASE) values ('4789','Hemophelia');
Insert into MEDICINE (DRUGID,DISEASE) values ('2984','Alphasia');

----Nurse------

Insert into NURSE (EMPID,DEGREE,JOB_ASSIGNED,SALARY,SUPERID) values (6,'LPN','Forensic',100000,null);
Insert into NURSE (EMPID,DEGREE,JOB_ASSIGNED,SALARY,SUPERID) values (7,'BSN','Practitioner',50000,6);
Insert into NURSE (EMPID,DEGREE,JOB_ASSIGNED,SALARY,SUPERID) values (8,'AND','Informatics',68000,6);
Insert into NURSE (EMPID,DEGREE,JOB_ASSIGNED,SALARY,SUPERID) values (9,'RN','Surgical',82000,6);

----Patient-----

Insert into PATIENT (PID,DISEASE,ADDRESS,PINCODE) values (1,'Inflammatory disease','678 east state TX',50038);
Insert into PATIENT (PID,DISEASE,ADDRESS,PINCODE) values (2,'Hypertensive disease','234 calvin street TX',49503);
Insert into PATIENT (PID,DISEASE,ADDRESS,PINCODE) values (3,'Hemophelia','445 briar lane TX',49085);
Insert into PATIENT (PID,DISEASE,ADDRESS,PINCODE) values (4,'Alphasia','67 Devos street TX',42174);
Insert into PATIENT (PID,DISEASE,ADDRESS,PINCODE) values (5,'Bone tumor','Fulton 2341 TX',59876);

---Physician-----

Insert into PHYSICIAN (EMPID,SUPERID,SALARY) values (1,2,200000);
Insert into PHYSICIAN (EMPID,SUPERID,SALARY) values (2,null,270000);
Insert into PHYSICIAN (EMPID,SUPERID,SALARY) values (3,2,170000);
Insert into PHYSICIAN (EMPID,SUPERID,SALARY) values (4,2,168000);
Insert into PHYSICIAN (EMPID,SUPERID,SALARY) values (5,2,188000);

---Physician History----

Insert into PHYSICIANHISTORY (HDATE,EMPID,SPECIALIZATION,DESCRIPTION,SCHOOL) values (to_date('01-FEB-85','DD-MON-RR'),1,'House Surgeon','Abc','Gvsu');
Insert into PHYSICIANHISTORY (HDATE,EMPID,SPECIALIZATION,DESCRIPTION,SCHOOL) values (to_date('12-APR-80','DD-MON-RR'),2,'House Surgeon','Abc','Fsu');
Insert into PHYSICIANHISTORY (HDATE,EMPID,SPECIALIZATION,DESCRIPTION,SCHOOL) values (to_date('10-DEC-85','DD-MON-RR'),3,'House Surgeon','Abc','Msu');
Insert into PHYSICIANHISTORY (HDATE,EMPID,SPECIALIZATION,DESCRIPTION,SCHOOL) values (to_date('30-OCT-70','DD-MON-RR'),4,'House Surgeon','Abc','Mit');
Insert into PHYSICIANHISTORY (HDATE,EMPID,SPECIALIZATION,DESCRIPTION,SCHOOL) values (to_date('15-FEB-75','DD-MON-RR'),5,'House Surgeon','Abc','Hpsu');

---Symptoms----

Insert into SYMPTOMS (PID,PATSYMP) values (1,'fatigue-shortness of breath-rapid heartbeat-chest pain');
Insert into SYMPTOMS (PID,PATSYMP) values (2,'chest pain-pain in neck and arms-loss of appetite-foot swelling');
Insert into SYMPTOMS (PID,PATSYMP) values (3,'pain in joints-blood in stool-blood in urine-internal bleeding');
Insert into SYMPTOMS (PID,PATSYMP) values (4,'difficulty speaking-loss of ability to write');
Insert into SYMPTOMS (PID,PATSYMP) values (5,'pain in joints-feeling tired');

---Schedule-----

INSERT INTO SCHEDULE (EMPID, SCHEDULEID, SURGERY, STARTTIME, ENDTIME) VALUES (1.0,1.0,'Laproscopy',to_timestamp('2015-01-11 10:10:10', 'YYYY-MM-DD HH24:MI:SS.FF'),to_timestamp('2015-01-11 12:12:12', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO SCHEDULE (EMPID, SCHEDULEID, SURGERY, STARTTIME, ENDTIME) VALUES (1.0,2.0,'ChemoTherapy',to_timestamp('2015-01-11 15:15:15', 'YYYY-MM-DD HH24:MI:SS.FF'),to_timestamp('2015-01-11 17:17:17', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO SCHEDULE (EMPID, SCHEDULEID, SURGERY, STARTTIME, ENDTIME) VALUES (1.0,3.0,'RadioTherapy',to_timestamp('2015-06-26 12:10:10', 'YYYY-MM-DD HH24:MI:SS.FF'),to_timestamp('2015-06-26 13:12:12', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO SCHEDULE (EMPID, SCHEDULEID, SURGERY, STARTTIME, ENDTIME) VALUES (2.0,1.0,'NeuroSurgery',to_timestamp('2015-09-15 10:10:10', 'YYYY-MM-DD HH24:MI:SS.FF'),to_timestamp('2015-09-15 12:12:12', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO SCHEDULE (EMPID, SCHEDULEID, SURGERY, STARTTIME, ENDTIME) VALUES (3.0,1.0,'Circumcision',to_timestamp('2015-09-15 10:10:10', 'YYYY-MM-DD HH24:MI:SS.FF'),to_timestamp('2015-09-15 12:12:12', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO SCHEDULE (EMPID, SCHEDULEID, SURGERY, STARTTIME, ENDTIME) VALUES (4.0,1.0,'Vasectomy',to_timestamp('2015-12-01 00:10:10', 'YYYY-MM-DD HH24:MI:SS.FF'),to_timestamp('2015-12-01 02:12:12', 'YYYY-MM-DD HH24:MI:SS.FF'));

---Prescription------

Insert into PRESCRIPTION (VISITID,DRUGID,PID,PRESDAYS,PILLSPERDAY) values (1,'5003',1,14,2);
Insert into PRESCRIPTION (VISITID,DRUGID,PID,PRESDAYS,PILLSPERDAY) values (2,'7098',1,30,3);
Insert into PRESCRIPTION (VISITID,DRUGID,PID,PRESDAYS,PILLSPERDAY) values (3,'2984',2,30,2);
Insert into PRESCRIPTION (VISITID,DRUGID,PID,PRESDAYS,PILLSPERDAY) values (4,'5003',3,2,3);
Insert into PRESCRIPTION (VISITID,DRUGID,PID,PRESDAYS,PILLSPERDAY) values (5,'4789',4,10,1);
Insert into PRESCRIPTION (VISITID,DRUGID,PID,PRESDAYS,PILLSPERDAY) values (6,'4789',4,15,1);
Insert into PRESCRIPTION (VISITID,DRUGID,PID,PRESDAYS,PILLSPERDAY) values (7,'7098',5,25,2);

-----Visit------------

Insert into VISIT (VISITID,PID,VDATE,DRUGID,EMPID) values (1,1,to_date('01-FEB-15','DD-MON-RR'),'5003',1);
Insert into VISIT (VISITID,PID,VDATE,DRUGID,EMPID) values (2,1,to_date('01-MAR-15','DD-MON-RR'),'7098',1);
Insert into VISIT (VISITID,PID,VDATE,DRUGID,EMPID) values (3,2,to_date('01-APR-15','DD-MON-RR'),'2984',2);
Insert into VISIT (VISITID,PID,VDATE,DRUGID,EMPID) values (4,3,to_date('01-APR-15','DD-MON-RR'),'5003',3);
Insert into VISIT (VISITID,PID,VDATE,DRUGID,EMPID) values (5,4,to_date('01-JUL-15','DD-MON-RR'),'4789',2);
Insert into VISIT (VISITID,PID,VDATE,DRUGID,EMPID) values (6,4,to_date('01-AUG-15','DD-MON-RR'),'4789',3);
Insert into VISIT (VISITID,PID,VDATE,DRUGID,EMPID) values (7,5,to_date('01-DEC-15','DD-MON-RR'),'7098',5);

-------Altering Tables------
----Emp_Hospital--------
ALTER TABLE Emp_Hospital
ADD FOREIGN KEY (DepNO)
REFERENCES Dept_Hospital(DepID)
Deferrable initially deferred;


----Physician------

ALTER TABLE Physician
ADD FOREIGN KEY (EmpID)
REFERENCES Physician(EmpID)
Deferrable initially deferred;

ALTER TABLE Physician
ADD FOREIGN KEY (EmpID)
REFERENCES Emp_Hospital(EmpID)
Deferrable initially deferred;

----Nurse-----------

ALTER TABLE Nurse
ADD FOREIGN KEY (EmpID)
REFERENCES Nurse(EmpID)
Deferrable initially deferred;

ALTER TABLE Nurse
ADD FOREIGN KEY (EmpID)
REFERENCES Emp_Hospital(EmpID)
Deferrable initially deferred;


----Dept_Hospital--------

ALTER TABLE Dept_Hospital
ADD FOREIGN KEY (MgrID)
REFERENCES Emp_Hospital(EmpID)
Deferrable initially deferred;

----Schedule-------

ALTER TABLE Schedule
ADD FOREIGN KEY (EmpID)
REFERENCES Physician(EmpID)
Deferrable initially deferred;

----Visit--------

ALTER TABLE Visit
ADD FOREIGN KEY (EmpID)
REFERENCES Physician(EmpID)
Deferrable initially deferred;

ALTER TABLE Visit
ADD FOREIGN KEY (pid)
REFERENCES Patient(PID)
Deferrable initially deferred;

ALTER TABLE Visit
ADD FOREIGN KEY (DrugId)
REFERENCES Medicine(DrugId)
Deferrable initially deferred;


------symptoms--------

ALTER TABLE symptoms
ADD FOREIGN KEY (PId)
REFERENCES Patient(PID)
Deferrable initially deferred;

-------Prescription----

ALTER TABLE Prescription
ADD FOREIGN KEY (DrugId)
REFERENCES Medicine(DrugId)
Deferrable initially deferred;

ALTER TABLE Prescription
ADD FOREIGN KEY (DrugId,VisitId,pid)
REFERENCES Visit(DrugId,VisitId,pid)
Deferrable initially deferred;

----PhysicianHistory---
ALTER TABLE PhysicianHistory
ADD FOREIGN KEY (EmpId)
REFERENCES Physician(EmpID)
Deferrable initially deferred;

--------Check Constraint------
------Check if Patients' Pincode contains 5 digits(1-attribute)------
alter table patient
add constraint patIC2
CHECK (length(PINCODE)=5);

------Check if JobAsigned= 'Forensic' salary should be greater than 100000 for nurse ----
alter table Nurse
add constraint nurIC2
Check (NOT (Job_Assigned = 'Forensic' AND ( salary <100000))); 

---IC_SALARY--- UPON UPDATING THE SALARY OF A NURSE, VERIFY IF THE SUPERVISEE SALARY IS LESS THAN SUPERVISOR---

CREATE OR REPLACE TRIGGER IC_SALARY
BEFORE 
INSERT OR UPDATE ON NURSE
FOR EACH ROW
DECLARE 
		PRAGMA AUTONOMOUS_TRANSACTION;
		superSalary NURSE.SALARY%TYPE;
BEGIN 
	IF :NEW.SUPERID IS NOT NULL THEN
	SELECT salary INTO superSalary
	FROM NURSE
	WHERE EMPID = :NEW.SUPERID;
	
	IF :NEW.salary >= superSalary 
	THEN
		RAISE_APPLICATION_ERROR (-20001,'+++++ UPDATE OR INSERT REJECTED '|| ' Supervisee salary is not greater than Supervisor Salary');
	ROLLBACK;
	END IF;
	END IF;
END;
/

--------dIC_TA-Check whether the iserted or updated drug in the visit table is presented in Medcine Table----------

CREATE OR REPLACE TRIGGER dIC_TA
BEFORE INSERT OR UPDATE OF DRUGID ON visit
FOR EACH ROW
DECLARE
 drugNum INTEGER;
BEGIN
 SELECT COUNT(*)
 INTO drugNum
 FROM MEDICINE M WHERE M.DRUGID = :NEW.DRUGID;

 IF drugNum < 1
 THEN
 RAISE_APPLICATION_ERROR(-20001, '+++++INSERT or UPDATE rejected. '||
 'The Specified Drug '||:NEW.DRUGID|| ' is not present in the Medicine Repository');
 END IF;
END;
/
---------------------
commit;
SET FEEDBACK ON

----Printing the Tables----
select * from EMP_HOSPITAL;
select * from DEPT_HOSPITAL;
select * from PHYSICIAN;
select * from NURSE;
select * from PATIENT;
select * from MEDICINE;
select * from SCHEDULE;
select * from VISIT;
select * from SYMPTOMS;
select * from PRESCRIPTION;
select * from PHYSICIANHISTORY;

----<SQl Queries>------

---Q1 (Joining Four Tables)-----
----Find the employe id, full name who are physician and have given prescription for the disease ‘Hemophelia’.------

Select h.empid, h.First_name, h.Mid_name, h.Last_name from
emp_hospital h, physician p, visit v, medicine m
where h.empid= p.empid and
p.empid = v.empid and
v.drugid = m.drugid and
m.disease ='Hemophelia';

---Q2 (Self Join)----

----Find pairs of Employee Ids where first physician (in the pairs) has salary greater than
----170000 and his salary must be greater than second physician in the pairs(Self Join).

SELECT P1.SALARY, P2.SALARY
FROM PHYSICIAN P1, PHYSICIAN P2
WHERE P1.SALARY >170000 AND
P1.SALARY > P2.SALARY;

---Q3 SUM,AVG OR MAX----
----Find the Average, sum and maximum salary of the physician(SUM,AVG And MAX Query)------

Select MAX(salary) as MAXsalary, AVG(salary) as AVGsalary, SUM(SALARY) as SUMsalary
from Physician;

-- Q4 Group by, having and Order BY---

---Select the Patients id and the number of visits that has visited more than one times and sort by 
--patient id.

Select P.Pid, count(*) from 
Patient P, Visit V
where P.Pid= V.Pid
group by P.Pid
having count(*) > 1
order by P.Pid;

--Q5 Correlated subquery----
---Select the Employee id, their first name, middle name and last name from hospital employee who are 
---physician and does not have schedule.
Select E.EmpId, E.First_name , E.Mid_Name, E.Last_Name from
Emp_Hospital E, Physician P
where E.EmpId = P.EmpID and 
not exists (Select * from Schedule S where E.EmpId =S.EmpId);

--Q6 Non Correlated subquery----

--Select the Employee id, their first name, middle name and last name from hospital employee who are 
--physician and has not been visited by patient.
Select E.EmpId, E.First_name , E.Mid_Name, E.Last_Name from
Emp_Hospital E, Physician P
where E.EmpId = P.EmpID and 
E.EmpId not in (Select V.EmpId from visit V);
					   
---Q7 Outer Join---
---To find all the medicine details with its prescription.


---Q8 INTERSECT -----
select * from Medicine M FULL OUTER JOIN prescription P ON M.DrugID = P.DrugID;

----To find all the drugs which have a dosage 3 pills per day.

   SELECT drugid
   FROM medicine
   INTERSECT
   SELECT drugid
   FROM prescription
   where pillsperday = '3';

-- Q9 Top -N Query ----  
----Find the top three list of salaries with their employee ID.------

SELECT EMPID, SALARY
FROM (SELECT * FROM PHYSICIAN ORDER BY SALARY DESC)
WHERE ROWNUM <3;

---Q10 Rank Query-----
----Find the Rank of the salary 188000 from the database.-------

SELECT RANK (188000) WITHIN GROUP
(ORDER BY SALARY) "RANK OF SALARY 188000"
FROM PHYSICIAN;

---Q11 Hierarchical Query----
---Find pairs of IDs such that the first ID in the pair is that of an Nurse while the second ID in the pair is that of his /her supervisor.

SELECT EmpID,SuperID
FROM Nurse
START WITH EmpID = 9
CONNECT BY PRIOR SuperID = EmpID;

---Q12 Division Query---
--  To find the every  employee id of the physician who has suggested the patient for dosage of more than  1 Pills per day.
-- Seems like scenarios for the division query has not been fititing the designed relational schema..

SELECT P.EMPID
FROM   PHYSICIAN P 
WHERE  NOT EXISTS ( 
       (SELECT D.DRUGID
        FROM   PRESCRIPTION D
        WHERE  D.PILLSPERDAY >1)
      MINUS
      (SELECT V.DRUGID
        FROM VISIT V
        WHERE  V.PID = P.EMPID))
        order by P.EMPID ;

--- Queries to Test constraints---
---Primary Key------

update Emp_Hospital set EmpID = null where DepNO=1;

---Foreign KEY----

delete from Dept_Hospital where depid=1;

---Update Query to check Constraint patIC2 {1 attribute Check}
update PATIENT set PINCODE=110000 where PID=1;
commit;
---Update Query to check Constraint nurIC2 {2 attribute 1 Row}
update nurse set SALARY=10000 where EMPID=6;
commit;
--Update Query to check trigger IC_SALARY{2 row 1 table IC}---

update nurse set salary=120000 where empid=9;	
commit;
--Update Query to check trigger dIC_TA{2 row 1 table IC}---

update visit set drugid=4799 where visitid=6;
commit;

set echo off
spool off