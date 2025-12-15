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