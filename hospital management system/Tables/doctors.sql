create table doctors
(  
   doctor_id int identity (200,1) primary key,
   doctor_name varchar (20) ,
   specialization varchar (30),
   department_id int,
   phone_no varchar (20) unique,
   foreign key (department_id) references  departments(departments_id)
   );