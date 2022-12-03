set serveroutput on;

--Drop Tables if exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ROOM';
    EXECUTE IMMEDIATE 'DROP TABLE ROOM_TYPE';
    EXECUTE IMMEDIATE 'DROP TABLE TRANSACTIONS';
    EXECUTE IMMEDIATE 'DROP TABLE RESERVATIONS';
    EXECUTE IMMEDIATE 'DROP TABLE PAYMENT';
    EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER';
    EXECUTE IMMEDIATE 'DROP TABLE HOTEL';  
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

create table hotel(
hotel_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
hotel_name varchar(20) not null,
hotel_address varchar(40) not null,
hotel_email varchar(20) not null
);

create table customer(
customer_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
hotel_id number references hotel(hotel_id) not null,
customer_name varchar(35) not null,
customer_email varchar(30) unique not null,
ssn varchar(09),
country varchar(20) not null
);


create table room_type(
room_type_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
meal_plan varchar(40) not null,
price decimal(20,2) not null,
room_type_description varchar(20) unique not null
);

create table reservations(
reservation_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
customer_id number references customer(customer_id) not null,
no_of_days number not null,
check_in date not null,
check_out date not null
);

create table room(
room_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
room_no number not null,
room_type_id number references room_type(room_type_id) not null,
availability_status VARCHAR2 (1),
reservation_id number references reservations(reservation_id)
);


create table payment(
payment_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
customer_id number references customer(customer_id) not null,
payment_date date not null,
payment_method varchar(20) not null
);

create table transactions(
transaction_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
transaction_date date not null,
transaction_name varchar(20) not null,
amount decimal(10,2) not null,
reservation_id number references reservations(reservation_id) unique not null,
payment_id number references payment(payment_id) unique not null
);

GRANT SELECT, UPDATE ON application_admin.hotel TO Manager;
GRANT SELECT, INSERT, UPDATE ON application_admin.room TO Manager;
GRANT SELECT, INSERT, UPDATE ON application_admin.room_type TO Manager;
GRANT SELECT, INSERT, UPDATE ON application_admin.customer TO Manager;

GRANT SELECT ON application_admin.transactions TO Manager;
GRANT SELECT ON application_admin.payment TO Manager;
GRANT SELECT ON application_admin.reservations TO Manager;




GRANT SELECT ON application_admin.room_type TO Customer;
GRANT INSERT ON application_admin.transactions TO Customer;
GRANT INSERT ON application_admin.payment TO Customer;
GRANT INSERT, UPDATE ON application_admin.reservations TO Customer;
