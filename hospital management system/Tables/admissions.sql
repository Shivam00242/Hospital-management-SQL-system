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