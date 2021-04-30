create user customer01 PASSWORD 'password'; --With this line we create customer01 and assign its password
comment on role customer01 is 'Bookings owner'; --This is just a comment about customer01
create database "Bookings" with owner customer01; --We are creating our database and assign it to our user


create schema "bookings"; --We create the schema where we will be working on
comment on schema "bookings" is 'Actual Bookings Schema'; --Just a comment
alter schema "bookings" owner to customer01; --We set customer01 as the owner of this schema, btw it should already be, because hereditary ownership

create table "bookings"."CUSTOMERS"( --Customers creation table with autoreferenced foreign key
	id int primary key not null,
	lastname varchar(40) not null,
	firstname varchar(40) not null,
	address varchar(120) not null,
	zip numeric(5) not null,
	phonenumber varchar(14) not null,
	recommended_id int,
	registerdate timestamp not null,
	foreign key (recommended_id) references "bookings"."CUSTOMERS" (id) on update cascade
);
comment on table "bookings"."CUSTOMERS" is 'People';

create table "bookings"."FACILITIES"( --Facilities table with no relations
	id int primary key not null,
	name int not null,
	cust_cost money not null,
	guest_cost money not null,
	purchase_cost money not null,
	maintenance_cost money not null
);
comment on table "bookings"."FACILITIES" is 'What you can reserve';

create table "bookings"."BOOKINGS"( --Bookings table related to customers and facilities
	fac_id int not null,
	cust_id int not null,
	start_datetime timestamp not null,
	nhours int not null,
    foreign key (cust_id) references "bookings"."CUSTOMERS" (id) on update cascade,
    foreign key (fac_id) references "bookings"."FACILITIES" (id) on update cascade,
    PRIMARY KEY (fac_id, cust_id)
);
comment on table "bookings"."BOOKINGS" is 'Reservations';