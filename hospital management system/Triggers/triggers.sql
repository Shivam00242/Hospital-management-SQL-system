--🔹 TRIGGERS 

--Create a trigger that:
--Automatically reduces medicine stock
--When a new record is inserted into prescriptions.
create table medicines_log
(
  medicine_id int identity (400,1),
  actiontype varchar(10),
  actiondate date
  );
create trigger trg_medicines
on medicines 
after insert
as 
begin
insert into medicines_log(actiontype,actiondate)
  select 'Insert',getdate()
  from inserted
end;

insert into medicines (medicen_name,stock,price) values
('Dolo',120,50.00)

select * from medicines
select * from medicines_log

--Create a trigger that:
--Automatically updates room status to 'Available'
--When dischargedate is updated (patient discharged).

create table log_admissions
(
  actiontype varchar(10),
  actiontime date,
  );

  create trigger trg_admissions
  on admissions
  after update
  as
  begin
  update rooms
  set rooms.status='Available'
  from rooms
  join inserted on rooms.room_id =inserted.room_id
  join deleted on deleted.admission_id=inserted.admission_id
  where deleted.dischargedate is null
  and inserted.dischargedate is not null;
  insert into log_admissions (actiontype,actiontime)
  select 'Insert',getdate()
  from inserted
end;
update admissions
set dischargedate='2025-12-16'
where patient_id=103

select * from rooms 
select * from admissions
select * from log_admissions