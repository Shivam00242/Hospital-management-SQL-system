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