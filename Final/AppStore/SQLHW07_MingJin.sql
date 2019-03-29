create table logger2( msg varchar(max), machineName varchar(MAx), username varchar(MAX), empID char(9), oldjobID int, newjobID int, oldjoblvl int, newjoblvl int)
drop trigger tgr_employee_update5
drop table logger2
create trigger tgr_employee_update5
on employee
for update
as
if(update(job_lvl))
begin
declare @Newid smallint, @Newlevel tinyint
select @Newlevel = (select job_lvl from inserted)
insert into logger2(msg, machineName,username,empID,oldjoblvl,newjoblvl)
select 'LEVEL CHANGE', @@SERVERNAME, USER, emp_id, d.job_lvl ,@Newlevel 
from 
deleted d
end;
ELSE 
begin
select @Newid = (select job_id from inserted)
insert into logger2(msg, machineName,username,empID,oldjobID,newjobID)
select 'PROMOTION', @@SERVERNAME, USER, emp_id, d.job_id ,@Newid 
from 
deleted d
end;

update employee
set job_id = 9 where emp_id ='MAP77183M'

update employee
set job_lvl = 141 where emp_id ='VPA30890F'

select * from employee

select * from logger2




