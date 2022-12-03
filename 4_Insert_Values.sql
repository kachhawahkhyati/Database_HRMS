--Procedure for inserting hotel
create or replace procedure insert_hotel(name in varchar, address in varchar, email in varchar)    
AS
v_count number;
e_unique_name exception;
BEGIN
select count(*) into v_count from hotel where hotel_name=name;
if(v_count=0) then
insert into hotel values(default,name,address,email);   
DBMS_OUTPUT.PUT_LINE('Hotel Added');
else
raise e_unique_name;
end if;
commit;
exception
when e_unique_name then DBMS_OUTPUT.PUT_LINE('The hotel already exists');
when others then raise;
commit;
END insert_hotel;
/

--Procedure for inserting customer
create or replace procedure insert_customer(name IN VARCHAR, email in varchar, ssn in varchar, country in varchar)   
AS
v_count number;
e_unique_name exception;
BEGIN
select count(*) into v_count from customer where customer_email=email;
if(v_count=0) then
insert into customer values(default,1,name,email,ssn,country);    
DBMS_OUTPUT.PUT_LINE('Customer Added');
else
raise e_unique_name;
end if;
commit;
exception
when e_unique_name then DBMS_OUTPUT.PUT_LINE('The customer already exists');
when others then raise;
commit;
END insert_customer;
/

--Procedure for inserting room_type
create or replace procedure insert_room_type(meal_plan in varchar,amount in decimal,room_type_description in varchar)   
AS
v_count number;
e_unique_name exception;
BEGIN
select count(*) into v_count from room_type where price=amount;
if(v_count=0) then
insert into room_type values(default,meal_plan,amount,room_type_description);    
DBMS_OUTPUT.PUT_LINE('room_type Added');
else
raise e_unique_name;
end if;
commit;
exception
when e_unique_name then DBMS_OUTPUT.PUT_LINE('The room_type already exists');
when others then raise;
commit;
END insert_room_type;
/


--Procedure for inserting reservations
create or replace procedure insert_reservations(customer_id in number, no_of_days in number, check_in_date in date, check_out_date in date)   
AS
v_count number;
e_unique_name exception;
BEGIN
select count(*) into v_count from reservations where check_in=check_in_date;
if(v_count=0) then
insert into reservations values(default,customer_id,no_of_days,check_in_date,check_out_date);    
DBMS_OUTPUT.PUT_LINE('reservations Added');
else
raise e_unique_name;
end if;
commit;
exception
when e_unique_name then DBMS_OUTPUT.PUT_LINE('The reservations already exists');
when others then raise;
commit;
END insert_reservations;
/


--Procedure for inserting room
create or replace procedure insert_room(room_number in number, room_type_id in number, availability_status in varchar, reservation_id in number)   
AS
v_count number;
e_unique_name exception;
BEGIN
select count(*) into v_count from room where room_no=room_number;
if(v_count=0) then
insert into room values(default,room_number,room_type_id,availability_status,reservation_id);    
DBMS_OUTPUT.PUT_LINE('room Added');
else
raise e_unique_name;
end if;
commit;
exception
when e_unique_name then DBMS_OUTPUT.PUT_LINE('The room already exists');
when others then raise;
commit;
END insert_room;
/

--Procedure for inserting payment
create or replace procedure insert_payment(customerid in number,payment_date in date,payment_method in varchar)   
AS
v_count number;
e_unique_name exception;
BEGIN
select count(*) into v_count from payment where customer_id=customerid ;
if(v_count=0) then
insert into payment values(default,customerid,payment_date,payment_method);    
DBMS_OUTPUT.PUT_LINE('payment Added');
else
raise e_unique_name;
end if;
commit;
exception
when e_unique_name then DBMS_OUTPUT.PUT_LINE('The payment already exists');
when others then raise;
commit;
END insert_payment;
/


--Procedure for inserting transactions
create or replace procedure insert_transactions(transaction_date in date, transaction_name in varchar,amount in decimal, reservation_id in number,paymentid in number) 
AS
v_count number;
e_unique_name exception;
BEGIN
select count(*) into v_count from transactions where payment_id=paymentid;
if(v_count=0) then
insert into transactions values(default,transaction_date,transaction_name,amount,reservation_id,paymentid);    
DBMS_OUTPUT.PUT_LINE('transactions Added');
else
raise e_unique_name;
end if;
commit;
exception
when e_unique_name then DBMS_OUTPUT.PUT_LINE('The transactions already exists');
when others then raise;
commit;
END insert_transactions;
/
----------------------------------------------------------------------------------------------------------------
--Inserting Hotel
exec insert_hotel('The Oberoi Udaivilas','Pichola, Udaipur, Rajasthan,313001 India','oberoi@gmail.com');

--Inserting Customer
exec insert_customer('Jeff Roberts','jeffroberts@gmail.com','4575N5RT','USA');
exec insert_customer('Julia Michaels','juliamichaels@gmail.com','9T4YAW24','Cannada');
exec insert_customer('Su Yin','suyin@gmail.com','XX8899$Y','China');
exec insert_customer('Shivani Singh','shivanisingh@gmail.com','','India');

--Inserting Room_type
exec insert_room_type('Breakfast,Lunch,Dinner',3500.0,'Standard');
exec insert_room_type('Breakfast,Lunch,Dinner',5000.0,'Deluxe');
exec insert_room_type('Breakfast,Lunch,Dinner',10000.0,'Suite');

--Inserting reservations
exec insert_reservations(1,3,TO_DATE('2022/12/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/12/18 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(2,7,TO_DATE('2022/04/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/04/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(4,4,TO_DATE('2022/10/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/14 12:00:00', 'yyyy/mm/dd hh:mi:ss'));

--Inserting room
exec insert_room(201,2,'F',1);
exec insert_room(411,1,'F',2);
exec insert_room(316,3,'F',3);
exec insert_room(202,2,'T','');
exec insert_room(203,3,'T','');
exec insert_room(310,1,'T','');

--Inserting Payment
exec insert_payment(1,TO_DATE('2022/08/13 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(2,TO_DATE('2022/03/18 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(4,TO_DATE('2022/10/03 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');

--Inserting Transactions
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Shweta Bulchandani',15000,1,1);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Julia',24500,2,2);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Farheen Zubair',40000,3,3);

GRANT EXECUTE ON insert_reservations to customer;
GRANT EXECUTE ON insert_room to customer;
GRANT EXECUTE ON insert_payment to customer;
GRANT EXECUTE ON insert_transactions to customer;




----------------------------------------------------------------------------------------------------------------



