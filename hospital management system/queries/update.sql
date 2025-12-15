--🔹 UPDATE

--Increase the price of all medicines by 10% where stock is less than 100
update medicines
set price= ((price/100)*10)+price
where stock<100
select * from medicines