begin
    execute immediate 'drop user application_admin CASCADE';
exception
    when others then
        if sqlcode!=-1918 then
            raise;
        end if;    
end;
/


CREATE user application_admin identified by "Qwerty@123456";
GRANT connect, resource to application_admin with admin option;
GRANT unlimited tablespace to application_admin with admin option;
GRANT create user to application_admin with admin option;
GRANT CREATE VIEW TO application_admin with admin option;
GRANT drop user to application_admin with admin option;

