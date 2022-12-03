--Drop FUNCTIONS if exists
BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX customer_name_index';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -00955 THEN
         RAISE;
      END IF;
END;
/

CREATE OR REPLACE FUNCTION total_Customers  
RETURN number IS  
   total number(2) := 0;  
BEGIN  
   SELECT count(*) into total  
   FROM customer;  
    RETURN total;  
END;  
/  

CREATE OR REPLACE FUNCTION Total_Rooms_Available 
RETURN number IS  
   rooms_available number(2) := 0;  
BEGIN  
   SELECT count(*) into rooms_available  
   FROM room where availability_status='T';  
    RETURN rooms_available;  
END;  
/  

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



    

CREATE OR REPLACE PACKAGE hotel_mgmt AS 
   FUNCTION total_Customers 
      RETURN NUMBER; 
   FUNCTION Total_Rooms_Available
      RETURN NUMBER; 
   function is_room_Available(input_room_no number)
   return VARCHAR;
   PROCEDURE display_PaymentDetails(input_customer_id NUMBER);
END hotel_mgmt; 
/

    


create index customer_name_index on customer(customer_name);

--select * from customer where customer_name like 'S%';

--select total_Customers from dual;
--select * from customer;


--select * from room;


--select * from room;

--SELECT owner,object_name FROM all_objects WHERE object_type = 'FUNCTION' AND owner='APPLICATION_ADMIN';

--SELECT owner,object_name FROM all_objects WHERE object_type = 'PROCEDURE' AND owner='APPLICATION_ADMIN';

GRANT EXECUTE on total_Customers to Manager;
GRANT EXECUTE on Total_Rooms_Available to Manager;
GRANT EXECUTE on is_room_Available to Manager;
GRANT EXECUTE on display_PaymentDetails to Manager;