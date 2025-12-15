--🔹 WINDOW FUNCTIONS

--For each doctor, show Doctor name Each appointment date
--Total number of appointments handled by that doctor

select doctors.doctor_name,appointments.appointment_date,
count(*) over (partition by doctors.doctor_name)as 'total_appointments'
from doctors
join appointments
on doctors.doctor_id=appointments.doctor_id