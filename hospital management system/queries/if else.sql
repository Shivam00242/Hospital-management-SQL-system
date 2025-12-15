--🔹 IF / ELSE

--Checks whether patient with patient_id = 101 has any bill
--If yes → print 'Bill Generated'
--Else → print 'No Bill Found'

declare @total_amount decimal (10,2)
select @total_amount= totalamount from bills
where patient_id=101
if @total_amount >0
  print 'Bill Generated'
else
  print 'No Bill Found'

--Check total hospital revenue:
--If total revenue > 15000 → print 'High Revenue'
--Else → print 'Low Revenue'
declare @revenue decimal (20,2)
select @revenue =sum(totalamount) from bills
if @revenue >15000
  print 'High Revenue'
else
  print 'Low Revenue'