set serveroutput on;

--Drop VIEWS if exists
BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW Hotel_View';
    EXECUTE IMMEDIATE 'DROP VIEW Customer_View';
    EXECUTE IMMEDIATE 'DROP VIEW Transaction_Details_View';
    EXECUTE IMMEDIATE 'DROP VIEW Sales_View';
    EXECUTE IMMEDIATE 'DROP VIEW Search_View';
    EXECUTE IMMEDIATE 'DROP VIEW Hotel_View_FOR_CUSTOMERS';
    EXECUTE IMMEDIATE 'DROP VIEW BOOKED_ROOMS';
   
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

CREATE VIEW Customer_View AS SELECT application_admin.customer.customer_name AS Name, application_admin.customer.customer_email AS Email, application_admin.customer.country AS Country, application_admin.hotel.hotel_name AS HotelName
FROM application_admin.customer
INNER JOIN application_admin.hotel ON application_admin.customer.hotel_id= application_admin.hotel.hotel_id order by application_admin.customer.customer_name;


CREATE VIEW Hotel_View AS 
SELECT application_admin.hotel.hotel_name AS Name, 
application_admin.hotel. hotel_address AS Location, 
application_admin.hotel.hotel_email AS Email, 
application_admin.customer.customer_name AS Customers,
application_admin.reservations.check_in AS Check_In_Date,
application_admin.reservations.no_of_days As Duration_Of_Stay
FROM application_admin.customer
INNER JOIN application_admin.hotel ON application_admin.customer.hotel_id= application_admin.hotel.hotel_id
INNER JOIN application_admin.reservations ON application_admin.customer.customer_id= application_admin.reservations.customer_id;



CREATE VIEW Transaction_Details_View AS 
SELECT application_admin.customer.customer_name AS Registered_Customer_Name, 
application_admin.payment.payment_method AS Payment_Method,
application_admin.transactions.transaction_name AS Transaction_Name,
application_admin.transactions.transaction_date AS Transaction_Date,
application_admin.transactions.amount AS Transaction_Amount
FROM application_admin.payment
JOIN application_admin.customer ON 
application_admin.payment.customer_id=application_admin.customer.customer_id 
JOIN application_admin.transactions ON
application_admin.transactions.payment_id= application_admin.payment.payment_id;



CREATE VIEW Sales_View AS 
SELECT application_admin.customer.customer_name AS Booking_Name, 
application_admin.room.room_no AS Room_Booked,
application_admin.transactions.transaction_date AS Booking_Transaction_Date,
application_admin.transactions.amount AS Booking_Price,
application_admin.reservations.check_in AS Booking_Date,
application_admin.reservations.no_of_days As Booking_Duration
FROM application_admin.reservations
JOIN application_admin.customer ON 
application_admin.reservations.customer_id=application_admin.customer.customer_id 
JOIN application_admin.transactions ON
application_admin.transactions.reservation_id=application_admin.reservations.reservation_id
JOIN application_admin.room ON
application_admin.room.reservation_id=application_admin.reservations.reservation_id;



CREATE VIEW Search_View AS 
SELECT application_admin.room_type.room_Type_description AS Type_of_Rooms_Available, 
application_admin.room_type.meal_plan AS Meal_Plan,
application_admin.room_type.price AS Room_Price,
application_admin.room.room_no AS Room_Number,
application_admin.room.availability_status AS Room_Availability
FROM application_admin.room
JOIN application_admin.room_type ON 
application_admin.room.room_type_id=application_admin.room_type.room_type_id where application_admin.room.availability_status='T';


CREATE VIEW BOOKED_ROOMS AS 
SELECT application_admin.room_type.room_Type_description AS Type_of_Rooms_Available, 
application_admin.room_type.meal_plan AS Meal_Plan,
application_admin.room_type.price AS Room_Price,
application_admin.room.room_no AS Room_Number,
application_admin.room.availability_status AS Room_Availability
FROM application_admin.room
JOIN application_admin.room_type ON 
application_admin.room.room_type_id=application_admin.room_type.room_type_id where application_admin.room.availability_status='F';


CREATE VIEW Hotel_View_FOR_CUSTOMERS AS 
SELECT application_admin.hotel.hotel_name AS Name, 
application_admin.hotel. hotel_address AS Location, 
application_admin.hotel.hotel_email AS Email
FROM application_admin.hotel;



GRANT SELECT,INSERT,UPDATE ON application_admin.customer_view TO Manager;
GRANT SELECT ON application_admin.hotel_view TO Manager;
GRANT SELECT ON application_admin.transaction_details_view TO Manager;
GRANT SELECT ON application_admin.sales_view TO Manager;
GRANT SELECT ON application_admin.search_view TO Manager;
GRANT SELECT ON application_admin.BOOKED_ROOMS TO Manager;
  

GRANT SELECT,UPDATE ON application_admin.customer_view TO Customer;
GRANT SELECT ON application_admin.Hotel_View_FOR_CUSTOMERS TO Customer;
GRANT SELECT ON application_admin.search_view TO Customer;






