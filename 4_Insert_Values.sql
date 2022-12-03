set serveroutput on;

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
--create or replace procedure insert_room_type(meal_plan in varchar,amount in decimal,room_type_description in varchar)   
--AS
--v_count number;
--e_unique_name exception;
--BEGIN
--select count(*) into v_count from room_type where price=amount;
--if(v_count=0) then
--insert into room_type values(default,meal_plan,amount,room_type_description);    
--DBMS_OUTPUT.PUT_LINE('room_type Added');
--else
--raise e_unique_name;
--end if;
--commit;
--exception
--when e_unique_name then DBMS_OUTPUT.PUT_LINE('The room_type already exists');
--when others then raise;
--commit;
--END insert_room_type;
--/

--Trigger to automatically generate room_type for hotel
CREATE OR REPLACE TRIGGER INSERT_ROOM_TYPE
AFTER INSERT ON HOTEL
DECLARE
i NUMBER;
BEGIN
SELECT MAX(hotel_id) INTO i FROM hotel;
insert into room_type values(default,'Breakfast,Lunch,Dinner',3500.0,'Standard');
insert into room_type values(default,'Breakfast,Lunch,Dinner',5000.0,'Deluxe');
insert into room_type values(default,'Breakfast,Lunch,Dinner',10000.0,'Suite');
    DBMS_OUTPUT.PUT_LINE('Room_types created for Hotel '|| i);
END;
/

--Procedure for inserting reservations
create or replace procedure insert_reservations(customerid in number, no_of_days in number, check_in_date in date, check_out_date in date)   
AS
v_count number;
e_unique_name exception;
BEGIN
select count(*) into v_count from reservations where check_in=check_in_date AND customer_id=customerid;
if(v_count=0) then
insert into reservations values(default,customerid,no_of_days,check_in_date,check_out_date);    
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

--Inserting hotel
exec insert_hotel('The Oberoi Udaivilas','Pichola, Udaipur, Rajasthan,313001 India','oberoi@gmail.com');


--Inserting customer
exec insert_customer('Jeff Roberts','jeffroberts@gmail.com','4575N5RT','USA');
exec insert_customer('Julia Michaels','juliamichaels@gmail.com','9T4YAW24','Cannada');
exec insert_customer('Su Yin','suyin@gmail.com','XX8899$Y','China');
exec insert_customer('Shivani Singh','shivanisingh@gmail.com','','India');
exec insert_customer('Julia Roberts','juliaroberts@gmail.com','47775RT7','USA');
exec insert_customer('Bob Marta','bobmarta@gmail.com','9T4YAW24','Ukanda');
exec insert_customer('Chin Man','chinman@gmail.com','7789$Y','China');
exec insert_customer('Arpita Shetty','arpitashetty@gmail.com','','Bangladesh');
exec insert_customer('Mark Kardashian','markk@gmail.com','4556356T','USA');
exec insert_customer('Julia Michaels','juliamichaels@gmail.com','9T444424','Canada');
exec insert_customer('Su Chan','suchan@gmail.com','77889900','China');
exec insert_customer('Archana Ghei','archanaghei@gmail.com','','India');
exec insert_customer('Barney Laureal','barneyl@gmail.com','45744AAT','USA');
exec insert_customer('Anthony Gale','anthonygale@gmail.com','9YYYAW24','Canada');
exec insert_customer('Lin Min Yin','linmin@gmail.com','XX8899$Y','Korea');
exec insert_customer('Asawari Shinde','asawarishinde@gmail.com','','UK');
exec insert_customer('Leysha Magwani','leyshamagwani@gmail.com','4666RN5R','Spain');
exec insert_customer('Akshay Singh','akshaysingh@gmail.com','97777AW24','Canada');
exec insert_customer('Su Yin','suyin@gmail.com','XX8899$Y','China');
exec insert_customer('Can Yemen','canyemen@gmail.com','','Turkey');
exec insert_customer('Hande Ercel','handeercel@gmail.com','YYQ5N5RT','Thailand');
exec insert_customer('Henry Jenner','henryjenner@gmail.com','9T66AK24','Switzerland');
exec insert_customer('Hannah Baker','hannahbaker@gmail.com','HH8899UY','South Africa');
exec insert_customer('Monica Aaswani','monicaaswani@gmail.com','','India');
exec insert_customer('Angie Kate','angiekate@gmail.com','457566RT','USA');
exec insert_customer('Charlie Chaplin','charliechaplin@gmail.com','9T4BBW24','Canada');
exec insert_customer('Victoria Saint','victoriasaint@gmail.com','XX8899$Y','Russia');
exec insert_customer('Shiva Nicole','shivanicole@gmail.com','','Poland');
exec insert_customer('Robert Williams','robertwilliams@gmail.com','4575HHRT','USA');
exec insert_customer('Angelina Jolie','angelinajolie@gmail.com','9T4YAII4','Norway');
exec insert_customer('Jacqueline Kapoor','jkapoor@gmail.com','YY8899UY','Nepal');
exec insert_customer('Murad Marley','muradmarley@gmail.com','','Mexico');
exec insert_customer('Jeff Ramek','jefframek@gmail.com','4575UURT','Indonesia');
exec insert_customer('Kirti Nihalani','kirtinihalani@gmail.com','9T4YNN24','Nepal');
exec insert_customer('Vihan Ray','vihanray@gmail.com','ZZ8899$Y','Malaysia');
exec insert_customer('Priyanka Harjani','priyankaharjani@gmail.com','','India');
exec insert_customer('Laura Roberts','jeffroberts@gmail.com','4575TCRT','USA');
exec insert_customer('Chandler Bing','chandlerbing@gmail.com','9T4Y1224','Macau');
exec insert_customer('Su Min Ka','suminka@gmail.com','XX88996F','Japan');
exec insert_customer('Lewis Alsamari ','lewisalsamari@gmail.com','','Iraq');
exec insert_customer('Will Smith','willsmith@gmail.com','45WWW5RT','USA');
exec insert_customer('Charlie Roman','charlieroman@gmail.com','77889955','Bangladesh');
exec insert_customer('Vardhaman Roman','vardhamanroman@gmail.com','','Costa Rica');
exec insert_customer('Akshay Ghule','akshayghule@gmail.com','457787941','USA');
exec insert_customer('Yash Jadhav','yashjadhav@gmail.com','65419924','Bhutan');
exec insert_customer('Pavan Borole','pavanborole@gmail.com','666899888','India');
exec insert_customer('Shivani Mantri','shivanimantri@gmail.com','','India');
exec insert_customer('Jeff Besos','jeffbesos@gmail.com','457665RT','USA');
exec insert_customer('Robin Charlie','robincharlie@gmail.com','967771811','Barbados');
exec insert_customer('Marsha Billaye','marshab@gmail.com','516187617','Australia');
exec insert_customer('Abdul Syed','abdulsyed@gmail.com','','Pakistan');

--Inserting reservations(customer_id,no_of_days)
exec insert_reservations(1,3,TO_DATE('2022/12/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/12/18 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(2,7,TO_DATE('2022/04/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/04/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(4,4,TO_DATE('2022/10/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/14 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(3,1,TO_DATE('2022/08/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/08/17 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(5,3,TO_DATE('2021/01/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2021/10/13 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(6,2,TO_DATE('2021/04/05 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2021/04/07 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(7,1,TO_DATE('2022/12/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/12/17 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(8,2,TO_DATE('2022/10/08 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(9,3,TO_DATE('2022/07/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/07/15 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(10,4,TO_DATE('2022/02/06 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/02/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(11,5,TO_DATE('2021/10/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2021/10/15 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(12,6,TO_DATE('2022/09/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/04/18 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(13,1,TO_DATE('2022/05/01 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/05/02 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(14,2,TO_DATE('2021/11/11 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2021/11/13 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(15,3,TO_DATE('2022/04/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2021/04/15 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(16,4,TO_DATE('2022/09/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/09/20 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(17,5,TO_DATE('2022/01/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/01/15 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(18,6,TO_DATE('2022/02/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/04/18 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(19,7,TO_DATE('2022/04/01 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/04/07 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(20,1,TO_DATE('2022/10/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/11 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(21,2,TO_DATE('2021/04/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2021/04/14 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(22,3,TO_DATE('2022/09/17 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/09/20 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(23,4,TO_DATE('2022/10/19 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/14 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(24,5,TO_DATE('2022/06/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/06/23 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(25,6,TO_DATE('2022/10/11 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(26,1,TO_DATE('2022/07/09 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/07/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(27,1,TO_DATE('2022/04/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/04/13 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(28,2,TO_DATE('2022/03/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/03/18 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(29,2,TO_DATE('2022/05/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/05/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(30,3,TO_DATE('2022/03/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/03/15 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(31,3,TO_DATE('2022/06/17 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/06/20 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(32,4,TO_DATE('2020/10/20 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2020/10/24 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(33,4,TO_DATE('2020/08/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2020/08/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(34,5,TO_DATE('2022/06/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/06/15 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(35,5,TO_DATE('2022/10/01 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/05 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(36,6,TO_DATE('2022/05/11 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/05/17 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(37,6,TO_DATE('2022/12/01 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/12/07 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(38,1,TO_DATE('2022/10/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/11 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(39,1,TO_DATE('2021/04/15 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2021/04/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
exec insert_reservations(40,3,TO_DATE('2022/12/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/12/13 12:00:00', 'yyyy/mm/dd hh:mi:ss'));


--Inserting room
exec insert_room(201,2,'F',1);
exec insert_room(411,1,'F',2);
exec insert_room(316,3,'F',3);
exec insert_room(202,2,'T','');
exec insert_room(203,3,'T','');
exec insert_room(310,1,'T','');
exec insert_room(204,2,'F',4);
exec insert_room(205,3,'F',5);
exec insert_room(206,1,'F',6);
exec insert_room(207,2,'T','');
exec insert_room(208,3,'T','');
exec insert_room(209,1,'T','');
exec insert_room(210,2,'F',7);
exec insert_room(211,3,'F',8);
exec insert_room(301,1,'F',9);
exec insert_room(302,2,'T','');
exec insert_room(303,3,'T','');
exec insert_room(304,1,'T','');
exec insert_room(305,2,'F',10);
exec insert_room(306,3,'F',13);
exec insert_room(307,1,'F',12);
exec insert_room(308,3,'T','');
exec insert_room(309,1,'T','');
exec insert_room(311,2,'F',11);
exec insert_room(312,3,'F',14);
exec insert_room(401,1,'F',15);
exec insert_room(402,2,'T','');
exec insert_room(403,3,'T','');
exec insert_room(404,1,'T','');
exec insert_room(405,2,'F',16);
exec insert_room(406,3,'F',17);
exec insert_room(407,1,'F',18);
exec insert_room(408,3,'T','');
exec insert_room(409,1,'T','');
exec insert_room(413,2,'F',19);
exec insert_room(412,3,'F',20);
exec insert_room(101,1,'F',21);
exec insert_room(102,2,'T','');
exec insert_room(103,3,'T','');
exec insert_room(104,1,'T','');
exec insert_room(105,2,'F',22);
exec insert_room(106,3,'F',23);
exec insert_room(107,1,'F',24);
exec insert_room(108,3,'T','');
exec insert_room(109,1,'T','');
exec insert_room(113,2,'F',25);
exec insert_room(112,3,'F',26);
exec insert_room(111,1,'F',27);
exec insert_room(110,2,'T','');
exec insert_room(114,3,'T','');
exec insert_room(115,1,'T','');


--Inserting Payment
exec insert_payment(1,TO_DATE('2022/08/13 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(2,TO_DATE('2022/03/18 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(4,TO_DATE('2022/10/03 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(21,TO_DATE('2022/08/13 12:30:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(20,TO_DATE('2022/11/03 09:20:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(19,TO_DATE('2022/01/18 01:00:00', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(11,TO_DATE('2022/12/03 03:00:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(14,TO_DATE('2022/11/29 10:08:09', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(12,TO_DATE('2022/07/10 07:10:10', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(9,TO_DATE('2021/08/13 12:00:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(10,TO_DATE('2021/10/03 10:03:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(18,TO_DATE('2020/03/18 10:19:19', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(41,TO_DATE('2020/11/13 11:00:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(24,TO_DATE('2022/12/23 10:20:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(25,TO_DATE('2020/01/28 10:03:00', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(27,TO_DATE('2022/07/13 12:30:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(29,TO_DATE('2022/01/23 09:20:20', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(39,TO_DATE('2020/02/18 10:50:20', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(31,TO_DATE('2022/02/28 10:20:30', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(34,TO_DATE('2021/03/31 08:08:09', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(32,TO_DATE('2020/05/30 07:10:10', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(39,TO_DATE('2020/01/03 12:00:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(30,TO_DATE('2022/02/03 10:03:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(38,TO_DATE('2022/02/02 10:19:19', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(41,TO_DATE('2022/01/18 02:20:54', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(44,TO_DATE('2021/01/03 12:09:34', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(42,TO_DATE('2020/02/09 07:10:40', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(3,TO_DATE('2021/09/28 10:20:30', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(5,TO_DATE('2021/09/30 08:08:09', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(6,TO_DATE('2020/10/30 07:10:10', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(7,TO_DATE('2020/10/03 12:00:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(8,TO_DATE('2022/11/03 10:03:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(9,TO_DATE('2022/11/02 10:19:19', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(13,TO_DATE('2022/12/18 02:20:54', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(15,TO_DATE('2021/12/03 08:09:34', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(16,TO_DATE('2020/08/09 07:10:40', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');
exec insert_payment(17,TO_DATE('2020/08/05 12:50:40', 'yyyy/mm/dd hh:mi:ss'),'Card');
exec insert_payment(18,TO_DATE('2022/07/04 10:13:50', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
exec insert_payment(22,TO_DATE('2022/07/04 08:17:19', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');


--Inserting Transactions
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Shweta Bulchandani',15000,1,1);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Julia',24500,2,2);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Farheen Zubair',40000,3,3);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Shivani',35045.99,4,4);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Julia',50045.99,5,5);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Bob',100439.99,6,6);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Chin Man',35045.99,7,7);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Arpita Shetty',50045.99,8,8);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Mark K',100439.99,9,9);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Michaels',35045.99,10,10);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Su Chan',50045.99,11,11);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Archana Ghei',100439.99,12,12);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Barney',35045.99,13,13);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Anthony',50045.99,14,14);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Lin Min Yin',100439.99,15,15);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Shinde',35045.99,16,16);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Leysha',50045.99,17,17);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Akshay Singh',100439.99,18,18);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Su Yin',35045.99,19,19);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Can Yemen',50045.99,20,20);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Hande Ercel',100439.99,21,21);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Kris Jenner',35045.99,22,22);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Hannah Baker',50045.99,23,23);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Monica Aaswani',100439.99,24,24);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Shiva',35045.99,28,28);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Robert',50045.99,29,29);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Angelina',100439.99,30,30);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Kamrin Kapoor',35045.99,31,31);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Murad Marley',50045.99,32,32);
exec insert_transactions(TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Jeff Ramek',100439.99,33,33);
exec insert_transactions(TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Jeff',35045.99,34,34);
exec insert_transactions(TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Vihan Ray',50045.99,35,35);

GRANT EXECUTE ON insert_reservations to customer;
GRANT EXECUTE ON insert_room to customer;
GRANT EXECUTE ON insert_payment to customer;
GRANT EXECUTE ON insert_transactions to customer;


