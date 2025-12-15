create table medicines
(
  medicine_id int identity(400,1) primary key,
  medicen_name varchar(100),
  stock int check (stock>=0),
  price decimal(10,2)
  );