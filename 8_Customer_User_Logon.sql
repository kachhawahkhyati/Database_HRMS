-- RM select * from application_admin.hotel;
-- select * from application_admin.room_type;

select * from application_admin.Hotel_View_FOR_CUSTOMERS;
-- RM select * from application_admin.customer_view;

  
select * from customer;
select application_admin.Find_Customer_Id('Su Yin') from dual;
-- reservation_id,customer_id,no_of_days,check_in,check_out
-- write a procedure to insert reservation
exec application_admin.insert_reservations(3,10,TO_DATE('2022/10/20 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/20 12:00:00', 'yyyy/mm/dd hh:mi:ss'));

--insert into application_admin.reservations values(default,3,10,TO_DATE('2022/10/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/20 12:00:00', 'yyyy/mm/dd hh:mi:ss'));

-- room 

select * from application_admin.search_view;

-- To fetch room_type_id

select application_admin.get_room_Type_id(203)from dual;

-- fetch reservation_id

select application_admin.find_reservation_id(3,TO_DATE('2022/10/20 12:00:00', 'yyyy/mm/dd hh:mi:ss')) from dual;

--select * from reservations where customer_id=3;


-- room_type_id,availability_status,reservation_id
--use update function
exec application_admin.update_room(203,3,'F',41);


-- payment_id, customer_id
exec application_admin.insert_payment(3,TO_DATE('2022/10/03 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
--to make payment fetch payment_id, input is customer_id
select application_admin.find_payment_id(3) from dual;


-- roomtype, no_of_days = calculate price 

select application_admin.calculate_price(3,10) from dual;

--reservation_id, payment_id
exec application_admin.insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Shweta Bulchandani',100000,41,26);

-- make transaction

--select * from room;
--select * from reservations;
--select * from payment;
--select * from transactions;
--select * from customer;