create user Customer identified by "Poiuytrew123";
create user Manager identified by "Asdfghjkl123";

GRANT SELECT, UPDATE ON application_admin.hotel TO Manager;
GRANT SELECT, INSERT, UPDATE ON application_admin.room TO Manager;
GRANT SELECT, INSERT, UPDATE ON application_admin.room_type TO Manager;
GRANT SELECT, INSERT, UPDATE ON application_admin.customer TO Manager;

GRANT SELECT ON application_admin.transactions TO Manager;
GRANT SELECT ON application_admin.payment TO Manager;
GRANT SELECT ON application_admin.reservations TO Manager;

GRANT SELECT,INSERT,UPDATE ON application_admin.customer_view TO Manager;
GRANT SELECT ON application_admin.hotel_view TO Manager;
GRANT SELECT ON application_admin.transaction_details_view TO Manager;
GRANT SELECT ON application_admin.sales_view TO Manager;
GRANT SELECT ON application_admin.search_view TO Manager;

GRANT SELECT ON application_admin.hotel TO Customer;
GRANT SELECT ON application_admin.room TO Customer;
GRANT SELECT ON application_admin.room_type TO Customer;
GRANT SELECT, UPDATE ON application_admin.customer TO Customer;

GRANT SELECT, INSERT ON application_admin.transactions TO Customer;
GRANT SELECT, INSERT ON application_admin.payment TO Customer;
GRANT SELECT, INSERT, UPDATE ON application_admin.reservations TO Customer;

GRANT SELECT,UPDATE ON application_admin.customer_view TO Customer;
GRANT SELECT ON application_admin.Hotel_View_FOR_CUSTOMERS TO Customer;
GRANT SELECT ON application_admin.search_view TO Customer;








