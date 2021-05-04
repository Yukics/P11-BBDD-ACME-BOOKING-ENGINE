create user customer01 PASSWORD 'password'; --With this line we create customer01 and assign its password
comment on role customer01 is 'Bookings owner'; --This is just a comment about customer01
create database "Bookings" with owner customer01; --We are creating our database and assign it to our user

create schema "bookings"; --We create the schema where we will be working on
comment on schema "bookings" is 'Actual Bookings Schema'; --Just a comment
alter schema "bookings" owner to customer01; --We set customer01 as the owner of this schema, btw it should already be, because hereditary ownership

create table "bookings"."FACILITIES"
(
    id               integer     not null
        constraint "FACILITIES_pkey"
            primary key,
    name             varchar(50) not null,
    cust_cost        money       not null,
    guest_cost       money       not null,
    purchase_cost    money       not null,
    maintenance_cost money       not null
);

comment on table  "bookings"."FACILITIES" is 'What you can reserve';

alter table  "bookings"."FACILITIES"
    owner to customer01;

create table  "bookings"."CUSTOMERS"
(
    id             integer      not null
        constraint "CUSTOMERS_pkey"
            primary key,
    lastname       varchar(40)  not null,
    firstname      varchar(40)  not null,
    address        varchar(120) not null,
    zip            numeric(5)   not null,
    phonenumber    varchar(14)  not null,
    recommended_id integer
        constraint "CUSTOMERS_recommended_id_fkey"
            references  "bookings"."CUSTOMERS"
            on update cascade,
    registerdate   timestamp    not null
);

comment on table  "bookings"."CUSTOMERS" is 'People';

alter table  "bookings"."CUSTOMERS"
    owner to customer01;

create table  "bookings"."BOOKINGS"
(
    fac_id         integer   not null
        constraint "BOOKINGS_fac_id_fkey"
            references  "bookings"."FACILITIES"
            on update cascade,
    cust_id        integer   not null
        constraint "BOOKINGS_cust_id_fkey"
            references  "bookings"."CUSTOMERS"
            on update cascade,
    start_datetime timestamp not null,
    nhours         integer   not null,
    constraint bookings_pk
        primary key (fac_id, cust_id, start_datetime)
);

comment on table  "bookings"."BOOKINGS" is 'Reservations';

alter table  "bookings"."BOOKINGS"
    owner to customer01;
