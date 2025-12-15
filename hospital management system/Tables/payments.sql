create table payments
 (
   payment_id int identity(700,1) primary key,
   bill_id int,
   amountpaid decimal (10,2),
   paymentmode varchar (20) check ( paymentmode in ('Cash','Card','UPI')),
   foreign key (bill_id) references bills(bill_id)
   );