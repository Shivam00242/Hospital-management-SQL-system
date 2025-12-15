--🔹 ALTER TABLE

--Modify the rooms table so that:
--Default value of status becomes 'Available'.

alter table rooms add constraint df_status
default 'Availablre' for status