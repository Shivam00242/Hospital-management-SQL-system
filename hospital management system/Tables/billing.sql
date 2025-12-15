create table bills 
(
  bill_id int identity (600,1) primary key,
  patient_id int,
  totalamount decimal (10,2),
  billdate date default getdate(),
  foreign key (patient_id) references patients(patient_id)
  );