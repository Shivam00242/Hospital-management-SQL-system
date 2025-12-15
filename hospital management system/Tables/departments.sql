create table departments
(
   departments_id int primary key identity(1,1),
   department_name varchar (20) unique not null
   );