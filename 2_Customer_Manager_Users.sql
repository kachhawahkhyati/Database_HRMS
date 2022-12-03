begin
    execute immediate 'drop user Customer cascade';
    execute immediate 'drop user Manager cascade';
exception
    when others then
        if sqlcode!=-1918 then
            raise;
        end if;    
end;
/

create user Customer identified by "Poiuytrew123";
GRANT connect, resource to Customer;
GRANT unlimited tablespace to Customer;

create user Manager identified by "Asdfghjkl123";
GRANT connect, resource to Manager;
GRANT unlimited tablespace to Manager;

