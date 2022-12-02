create table hotel(
hotel_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
hotel_name varchar(20) not null,
hotel_address varchar(40) not null,
hotel_email varchar(20) not null
);
select * from hotel;
desc hotel;
insert into hotel values(default,'The Oberoi Udaivilas','Pichola, Udaipur, Rajasthan,313001 India','oberoi@gmail.com');

create table customer(
customer_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
hotel_id number references hotel(hotel_id) not null,
customer_name varchar(35) not null,
customer_email varchar(30) unique not null,
ssn varchar(09),
country varchar(20) not null
);
select* from customer;
desc customer;
insert into customer values(default,1,'Jeff Roberts','jeffroberts@gmail.com','4575N5RT','USA');
insert into customer values(default,1,'Julia Michaels','juliamichaels@gmail.com','9T4YAW24','Cannada');
insert into customer values(default,1,'Su Yin','suyin@gmail.com','XX8899$Y','China');
insert into customer values(default,1,'Shivani Singh','shivanisingh@gmail.com','','India');

create table room_type(
room_type_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
meal_plan varchar(40) not null,
price decimal(10,2) not null,
room_type_description varchar(20) unique not null
);
select * from room_type;
desc room_type;
insert into room_type values(default,'Breakfast,Lunch,Dinner',50000.0,'Standard');
insert into room_type values(default,'Breakfast,Lunch,Dinner',35000.0,'Deluxe');
insert into room_type values(default,'Breakfast,Lunch,Dinner',100000.0,'Suite');

create table reservations(
reservation_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
customer_id number references customer(customer_id) not null,
no_of_days varchar(20) not null,
check_in date not null,
check_out date not null
);
select * from reservations;
desc reservations;

insert into reservations values(default,1,'3 days',TO_DATE('2022/12/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/12/18 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
insert into reservations values(default,4,'4 days',TO_DATE('2022/10/10 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/10/14 12:00:00', 'yyyy/mm/dd hh:mi:ss'));
insert into reservations values(default,2,'7 days',TO_DATE('2022/04/12 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2022/04/16 12:00:00', 'yyyy/mm/dd hh:mi:ss'));

create table room(
room_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
room_no number not null,
room_type_id number references room_type(room_type_id) not null,
availability_status VARCHAR2 (1),
reservation_id number references reservations(reservation_id)
);
select * from room;
desc room;

insert into room values(default,201,2,'T',1);
insert into room values(default,316,3,'T',3);
insert into room values(default,411,1,'T',2);
insert into room values(default,202,2,'F','');
insert into room values(default,203,3,'F','');
insert into room values(default,310,1,'F','');



create table payment(
payment_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
customer_id number references customer(customer_id) not null,
payment_date date not null,
payment_method varchar(20) unique not null
);
select * from payment;
desc payment;
insert into payment values(default,1,TO_DATE('2022/08/13 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Card');
insert into payment values(default,4,TO_DATE('2022/10/03 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Venmo');
insert into payment values(default,2,TO_DATE('2022/03/18 10:00:00', 'yyyy/mm/dd hh:mi:ss'),'Apple Pay');

create table transactions(
transaction_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
transaction_date date not null,
transaction_name varchar(20) not null,
amount decimal(10,2) not null,
reservation_id number references reservations(reservation_id) not null,
payment_id number references payment(payment_id) not null
);
select * from transactions;
desc transactions;

insert into transactions values(default,TO_DATE('2022/08/13 10:10:00', 'yyyy/mm/dd hh:mi:ss'),'Jeff',35045.99,1,1);
insert into transactions values(default,TO_DATE('2022/10/03 11:30:00', 'yyyy/mm/dd hh:mi:ss'),'Shivani',50045.99,2,2);
insert into transactions values(default,TO_DATE('2022/03/18 12:45:00', 'yyyy/mm/dd hh:mi:ss'),'Julia',100439.99,3,3);
