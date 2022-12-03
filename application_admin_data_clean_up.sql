drop index customer_name_index;

drop trigger insert_room_type;
drop trigger print_price_changes;

drop procedure display_PaymentDetails;
drop procedure remove_room;
drop procedure insertcustomer;

drop function is_room_Available;
drop function get_room_type;
drop function Total_Rooms_Available;
drop function total_customers;

drop view Hotel_View;
drop view Customer_View;
drop view Transaction_Details_View;
drop view Sales_View;
drop view Search_View;
drop view Hotel_View_FOR_CUSTOMERS;

drop table room;
drop table room_type;
drop table transactions;
drop table reservations;
drop table payment;
drop table customer;
drop table hotel;

drop user manager;
drop user customer;

