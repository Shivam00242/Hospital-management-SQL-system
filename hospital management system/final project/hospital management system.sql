create database hospitalmanagement_system
use hospitalmanagement_system

create table departments
(
   departments_id int primary key identity(1,1),
   department_name varchar (20) unique not null
   );
   insert into departments (department_name) values
   ('Cardiology'),
   ('Neurology'),
   ('Orthopedics'),
   ('Pediatrics'),
   ('Genral Medicine')

create table patients 
(  
   patient_id int primary key identity (100,1),
   patient_name varchar(20),
   gender varchar(10),
   dob date,
   phone_no varchar(10) unique,
   address varchar(50),
   created_at datetime default current_timestamp
   );

   insert into patients (patient_name,gender,dob,phone_no,address) values 
('robin','male','2005-03-21',9888279182,'chandigarh , sector 20 , hous no 706'),
('aryan rana','male','2004-12-22',9888279162,'chandigarh , sector 22 , hous no 805'),
('muskan','female','2002-05-12',9888279545,'chandigarh , sector 21 , hous no 732'),
('aditi','female','2004-08-16',988821516,'chandigarh , sector 32 , hous no 756'),
('aman','male','2005-09-30',9465479122,'chandigarh , sector 34, hous no 875')

create table doctors
(  
   doctor_id int identity (200,1) primary key,
   doctor_name varchar (20) ,
   specialization varchar (30),
   department_id int,
   phone_no varchar (20) unique,
   foreign key (department_id) references  departments(departments_id)
   );
   
 insert into doctors (doctor_name,specialization,department_id,phone_no) values 
 ('Dr.Shivam','Cardiologist',1,'9005334422'),
 ('Dr.Sunita Rao','Neurologist',2,'9056233555'),
 ('Dr.Mohit Jain','Orthopedics',3,'9636414422'),
 ('Dr.Sejal','Pediatrics',4,'9502666555')

create table rooms
(
  room_id int identity (1000,1)primary key,
  room_type varchar (30) check (room_type in ('General','Private','ICU')),
  status varchar(30) check( status in ('Available','Occcupied'))
  );
select * from rooms
 insert into rooms (room_type,status) values 
('General','Available'),
('ICU','Occcupied'),
('Private','Available'),
('General','Occcupied'),
('Private','Available')

create table appointments
(
   appointments_id int identity(300,1),
   patient_id int,
   doctor_id int,
   appointment_date date,
   appointment_time time,
   status varchar(20)  check (status in ('Scheduled','Completed','Cancelled')),
   foreign key (patient_id) references patients (patient_id),
   foreign key (doctor_id) references doctors (doctor_id)
   );
insert into appointments (patient_id,doctor_id,appointment_date,appointment_time,status) values
(100,202,'2025-12-15','10:30:00','Completed'),
(101,203,'2025-12-20','10:30:00','Scheduled'),
(103,204,'2025-12-22','10:30:00','Completed'),
(104,205,'2025-12-25','10:30:00','Cancelled')


create table admissions
 (
   admission_id int identity (1000,1),
   patient_id int,
   room_id int,
   admission_date date,
   dischargedate date,
   foreign key (patient_id) references patients(patient_id),
   foreign key (room_id) references rooms (room_id)
   );
insert into admissions (patient_id,room_id,admission_date,dischargedate) values
(100,1000,'2025-11-25','2025-12-11'),
(101,1001,'2025-11-30',null),
(103,1002,'2025-12-10',null),
(104,1003,'2025-12-11','2025-12-13')

create table medicines
(
  medicine_id int identity(400,1) primary key,
  medicen_name varchar(100),
  stock int check (stock>=0),
  price decimal(10,2)
  );
 
insert into medicines (medicen_name,stock,price) values
('Paracetamol',200,10.00),
('Amoxicillin',150,25.00),
('Ibuprofen',100,15.00),
('insulin',50,120.00);



create table prescriptions
(
  prescription_id int identity(500,1) primary key,
  patient_id int,
  doctor_id int,
  medicine_id int,
  quantity int check(quantity >0),
  prescription_date date default getdate(),
  foreign key (patient_id) references patients(patient_id),
  foreign key (doctor_id) references doctors (doctor_id),
  foreign key (medicine_id) references medicines (medicine_id)
  );
insert into prescriptions (patient_id,doctor_id,medicine_id,quantity) values
(100,202,400,5),
(101,203,401,3),
(103,204,403,2),
(104,205,404,4);


create table bills 
(
  bill_id int identity (600,1) primary key,
  patient_id int,
  totalamount decimal (10,2),
  billdate date default getdate(),
  foreign key (patient_id) references patients(patient_id)
  );
  select * from bills
  insert into bills (patient_id,totalamount) values 
  (100,8500.00),
  (101,6200.00),
  (103,3000.00);


 create table payments
 (
   payment_id int identity(700,1) primary key,
   bill_id int,
   amountpaid decimal (10,2),
   paymentmode varchar (20) check ( paymentmode in ('Cash','Card','UPI')),
   foreign key (bill_id) references bills(bill_id)
   );

insert into payments(bill_id,amountpaid,paymentmode) values 
(600,8500.00,'UPI'),
(601,5000.00,'Card'),
(602,3000.00,'Cash')


--🔹 ALTER TABLE

--Modify the rooms table so that:
--Default value of status becomes 'Available'.

alter table rooms add constraint df_status
default 'Availablre' for status


--🔹 GROUP BY

--Find the total bill amount generated by each patient using bills and patients.
select patients.patient_id, patients.patient_name, sum(bills.totalamount) as  total_bill_amount
from patients
join bills
on patients.patient_id = bills.patient_id
group by patients.patient_id
,patients.patient_name

--Find the number of appointments handled by each doctor.
select doctors.doctor_id,doctors.doctor_name,count(appointments.status) as appointment_handled_by_doctor
from doctors
join appointments
on doctors.doctor_id=appointments.doctor_id
group by doctors.doctor_id,doctors.doctor_name

--Find patients whose total bill amount is greater than 5000.

select totalamount
from bills
where totalamount>5000


--🔹 UPDATE

--Increase the price of all medicines by 10% where stock is less than 100
update medicines
set price= ((price/100)*10)+price
where stock<100
select * from medicines


--🔹 IF / ELSE

--Checks whether patient with patient_id = 101 has any bill
--If yes → print 'Bill Generated'
--Else → print 'No Bill Found'

declare @total_amount decimal (10,2)
select @total_amount= totalamount from bills
where patient_id=101
if @total_amount >0
  print 'Bill Generated'
else
  print 'No Bill Found'

--Check total hospital revenue:
--If total revenue > 15000 → print 'High Revenue'
--Else → print 'Low Revenue'
declare @revenue decimal (20,2)
select @revenue =sum(totalamount) from bills
if @revenue >15000
  print 'High Revenue'
else
  print 'Low Revenue'


--🔹 LOOPS (WHILE)

--Using a WHILE loop, insert 5 new rooms with:
--room_type = 'General'
--status = 'Available'

declare @counter int
set @counter =1
while @counter<=5 
begin 
    insert into rooms(room_type,status) values ('General','Available')
    set @counter += 1;
end

select * from rooms



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


--🔹 WINDOW FUNCTIONS

--For each doctor, show Doctor name Each appointment date
--Total number of appointments handled by that doctor

select doctors.doctor_name,appointments.appointment_date,
count(*) over (partition by doctors.doctor_name)as 'total_appointments'
from doctors
join appointments
on doctors.doctor_id=appointments.doctor_id





