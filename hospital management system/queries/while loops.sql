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
