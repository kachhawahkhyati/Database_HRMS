set serveroutput on;

--Drop FUNCTIONS if exists
BEGIN
    EXECUTE IMMEDIATE 'DROP FUNCTION Find_Customer_Id';
    EXECUTE IMMEDIATE 'DROP FUNCTION Get_room_Type_id';
    EXECUTE IMMEDIATE 'DROP FUNCTION Find_Reservation_Id';
    EXECUTE IMMEDIATE 'DROP FUNCTION Find_Payment_Id';
    EXECUTE IMMEDIATE 'DROP FUNCTION Calculate_Price';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -4043 THEN
         RAISE;
      END IF;
END;
/



CREATE OR REPLACE FUNCTION Find_Customer_Id(input_customer_name in varchar) 
RETURN number IS  
   customer_id number(2) := 0;  
BEGIN  
   SELECT customer_id into customer_id  
   FROM application_admin.customer where customer.customer_name=input_customer_name;  
    RETURN customer_id;  
END;  
/  


create or replace function get_room_Type_id(input_room_no in number)
return NUMBER
as  
   room_id number(2) := 0; 
begin
   select room_type.room_type_id into room_id 
   from application_admin.room  
   Inner join application_admin.room_type on room.room_type_id=room_type.room_type_id
   where room.room_no=input_room_no;
   return(room_id);  
end;
/

CREATE OR REPLACE FUNCTION Find_Reservation_Id(input_customer_id in number) 
RETURN number IS  
   reservation_id number(2) := 0;  
BEGIN  
   SELECT reservation_id into reservation_id  
   FROM application_admin.reservations where reservations.customer_id=input_customer_id;  
    RETURN reservation_id;  
END;  
/ 

CREATE OR REPLACE FUNCTION Find_Payment_Id(input_customer_id in number) 
RETURN number IS  
   payment_id number(2) := 0;  
BEGIN  
   SELECT payment_id into payment_id  
   FROM application_admin.payment where payment.customer_id=input_customer_id;  
    RETURN payment_id;  
END;  
/ 

CREATE OR REPLACE FUNCTION Calculate_Price(input_room_type_id in number, no_of_days in decimal) 
RETURN DECIMAL IS  
   priced decimal(10,2) := 0;  
BEGIN  
   SELECT room_type.price into priced  
   FROM application_admin.room_type where room_type_id=input_room_type_id;
   RETURN (priced*no_of_days);
END;  
/ 

create or replace procedure update_room(room_number in number, roomtype_id in number, status in varchar, reservationid in number)
IS
BEGIN
UPDATE room set 
room_type_id=roomtype_id,
availability_status=status,
reservation_id=reservationid
where
room_no=room_number;
DBMS_OUTPUT.PUT_LINE('Updated Room');
END update_room;
/

GRANT EXECUTE ON Find_Customer_Id to customer;
GRANT EXECUTE ON Get_room_Type_id to customer;
GRANT EXECUTE ON Find_Reservation_Id to customer;
GRANT EXECUTE ON Find_Payment_Id to customer;
GRANT EXECUTE ON Calculate_Price to customer;

GRANT EXECUTE ON update_room to customer;