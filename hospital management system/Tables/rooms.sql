create table rooms
(
  room_id int identity (1000,1)primary key,
  room_type varchar (30) check (room_type in ('General','Private','ICU')),
  status varchar(30) check( status in ('Available','Occcupied'))
  );