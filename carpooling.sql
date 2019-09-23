use mysql;
create database carpooling;
CREATE table member_details( member_id INT auto_increment, 
 first_name VARCHAR(40) NOT NULL,
 last_name VARCHAR(40), 
 gender VARCHAR(10), 
 email VARCHAR(40) NOT NULL,
 phonenumber VARCHAR(10),
 driving_licence_number VARCHAR(40),
 driving_licence_validation_form VARCHAR(40),
 date_time DATETIME DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(member_id)
 );
 CREATE table car_details(
 car_id int auto_increment,
 vehicle_name varchar(40),
 make varchar(40),
 make_year int,
 date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
 primary key(car_id)
 );
 
 create table member_car_details(
 member_car_id int auto_increment,
 member_id int,
 car_id int,
 car_registration_number varchar(40),
 car_color varchar(40),
 date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
 primary key(member_car_id),
 foreign key(member_id) references member_details(member_id) on delete set null,
 foreign key(car_id) references car_details(car_id) on delete set null
 );
 create table city(
 city_id int auto_increment,
 city_name varchar(40),
 state varchar(40),
 country varchar(40),
 date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
 primary key(city_id)
 );
 create table journey_details(
 journey_id int auto_increment,
 member_car_id int,
 date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
 travel_start_time  time,
 source_city_id int,
 destination_city_id int,
 persons int,
 money_per_head varchar(50),
 primary key(journey_id),
 foreign key(member_car_id) references member_car_details(member_car_id) on delete set null,
 foreign key(source_city_id) references city(city_id) on delete set null,
 foreign key(destination_city_id) references city(city_id) on delete set null
 );
 create table midway_city(
 midway_id int auto_increment,
 journey_id int,
 city_id int,
 source varchar(40),
 issue_contribution varchar(40),
 date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
 primary key(midway_id),
 foreign key(journey_id) references journey_details(journey_id) on delete set null,
 foreign key(city_id) references city(city_id) on delete set null
 );
 create table request(
 request_id int auto_increment,
 requester_id int,
 journey_id int,
 midway_city_id int,
 date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
 request_status_id int ,
 primary key(request_id),
 foreign key(requester_id) references member_car_details(member_car_id) on delete set null,
 foreign key(journey_id) references journey_details(journey_id) on delete set null,
 foreign key(midway_city_id) references city(city_id) on delete set null
);
 
create table request_status(
request_status_id int auto_increment,
description varchar(200),
date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
primary key(request_status_id)
);
 show tables;
 
 