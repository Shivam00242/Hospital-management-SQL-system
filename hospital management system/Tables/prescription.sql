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