CREATE OR REPLACE FUNCTION total_Customers  
RETURN number IS  
   total number(2) := 0;  
BEGIN  
   SELECT count(*) into total  
   FROM customer;  
    RETURN total;  
END;  
/  

select total_Customers from dual;
select * from customer;



CREATE OR REPLACE FUNCTION Total_Rooms_Available 
RETURN number IS  
   rooms_available number(2) := 0;  
BEGIN  
   SELECT count(*) into rooms_available  
   FROM room where availability_status='T';  
    RETURN rooms_available;  
END;  
/  

select Total_Rooms_Available from dual;
select * from room;




create or replace function get_room_Type(input_room_no in number)
return VARCHAR
as  
   room_record VARCHAR(20);
begin
   select room_type.room_type_description into room_record 
   from room  
   Inner join room_type on room.room_type_id=room_type.room_type_id
   where room.room_no=input_room_no;
   return(room_record);  
end;
/

select get_room_Type(310) from dual;


create or replace function is_room_Available(input_room_no in number)
return VARCHAR
as  
   room_record VARCHAR(20);
begin
   select room.availability_status into room_record 
   from room  
   where room.room_no=input_room_no;
   return(room_record);  
end;
/

select is_room_Available(310) from dual;
select * from room;


SELECT 
    owner,
    object_name
FROM 
    all_objects
WHERE
    object_type = 'FUNCTION' AND owner='APPLICATION_ADMIN';
    
    
    
create or replace procedure "INSERTCUSTOMER"    
(name IN VARCHAR, email in varchar, ssn in varchar, country in varchar)    
is    
begin    
insert into customer values(default,1,name,email,ssn,country);    
end;    
/



declare
ex exception;
pragma exception_init(ex,-1);
BEGIN
insertcustomer('Khyati Kachhawah','khyati@gmail.com','JKD$1','India');
dbms_output.put_line('record inserted successfully');  
  exception
  when ex then
  dbms_output.put_line('Cannot insert duplicate value');
  when others then
  raise; 
END;    
/    

select * from customer;




CREATE PROCEDURE remove_room(room_no NUMBER) AS
   tot_rooms NUMBER;
   BEGIN
      DELETE FROM room
      WHERE room.room_no = remove_room.room_no;
   tot_rooms := tot_rooms - 1;
   END;
/

DECLARE
        not_exists      EXCEPTION;
        PRAGMA          EXCEPTION_INIT(not_exists, -2443);
BEGIN
remove_room(310);
 EXCEPTION
     WHEN not_exists
     THEN NULL; 
END;    
/    

select * from room;



CREATE or replace PROCEDURE display_PaymentDetails(input_customer_id NUMBER) AS
pay_method payment%ROWTYPE;
BEGIN 
   SELECT * INTO  pay_method
   FROM payment
   WHERE customer_id = input_customer_id;  
   DBMS_OUTPUT.PUT_LINE ('Payment Name: '||  pay_method.payment_method); 
   DBMS_OUTPUT.PUT_LINE ('Payment Date: ' || pay_method.payment_date); 
EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No Payments done!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
END; 
/

EXECUTE display_PaymentDetails(1); 




SELECT 
    owner,
    object_name
FROM 
    all_objects
WHERE
    object_type = 'PROCEDURE' AND owner='APPLICATION_ADMIN';

CREATE OR REPLACE TRIGGER Print_price_changes
  BEFORE DELETE OR INSERT OR UPDATE ON room_type
  FOR EACH ROW
WHEN (new.room_type_id > 0)
DECLARE
    price_diff number;
BEGIN
    price_diff  := :new.price  - :old.price;
   dbms_output.put_line('Old price: ' || :OLD.price); 
   dbms_output.put_line('New price: ' || :NEW.price); 
   dbms_output.put_line('Price difference: ' || price_diff); 
END;
/

insert into room_type values(default,'Lunch',8880.0,'One day room');

UPDATE room_type SET price = price + 500 WHERE room_type_id = 2; 

select * from room_type;



CREATE OR REPLACE TRIGGER insert_room_type 
AFTER INSERT ON room_type
FOR EACH ROW
BEGIN 
insert into room_type values(default,'Breakfast, Dinner',21000.0,'Dorm');
END; 
/ 

select * from room_type;

SELECT 
    owner,
    object_name
FROM 
    all_objects
WHERE
    object_type = 'TRIGGER' AND owner='APPLICATION_ADMIN';
    


create index customer_name_index on customer(customer_name);

select * from customer where customer_name like 'S%';

