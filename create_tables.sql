create table crime_address(
    crime_address_code int not null auto_increment,
    crime_address varchar(100) not null,
    cross_street varchar(50),
    latitude float not null,
    longitude float not null,
    primary key(crime_address_code)
);

create table victim_descent(
	victim_descent_id int not null AUTO_INCREMENT,
	victim_description_code char not null,
    victim_description varchar(100),
    primary key (victim_descent_id)
);

create table status_type(
	status_id int not null AUTO_INCREMENT, 
	status_code varchar(10) not null,
    status_description varchar(50),
    primary key(status_id)
);

create table priority(
	priority_code int not null,
    description varchar(300),
    primary key (priority_code)
);

create table motivation_type(
	mo_code int not null,
    mo_description varchar(300),
    primary key (mo_code)
);


create table weapon_used_type(
	weapon_used_id int not null AUTO_INCREMENT,
	weapon_used_code int, 
    weapon_description varchar(300),
    primary key (weapon_used_id)
);

create table premise_type(
	premise_code int not null,
    premise_description varchar(300),
    primary key (premise_code)
);

create table crime_type(
	crime_code int not null,
    crime_code_description varchar(300),
    primary key (crime_code) 
);


create table area(
area_pk int not null AUTO_INCREMENT,
area_name varchar(50),
reporting_district_num int,
primary key (area_pk)
);

create table crime_record(
	dr_number int not null,
    date_reported date,
    date_occurance date,
    victim_age int,
    victim_sex char,
    time_ocuurance int,
    area_id int,
    priority_code int,
    crime_code int,
    premise_code int,
    weapon_used_id int,
    status_id int,
    victim_descent_id int,
    crime_address_code int,
    primary key (dr_number),
    foreign key (crime_address_code) references crime_address (crime_address_code) on update cascade,
    foreign key (area_id) references area (area_pk) on update cascade,
    foreign key (priority_code) references priority (priority_code) on update cascade,
    foreign key (crime_code) references crime_type (crime_code) on update cascade,
    foreign key (premise_code) references premise_type (premise_code) on update cascade,
    foreign key (weapon_used_id) references weapon_used_type (weapon_used_id) on update cascade,
    foreign key (status_id) references status_type (status_id) on update cascade,
    foreign key (victim_descent_id) references victim_descent (victim_descent_id) on update cascade
);


create table crime_mo(
	dr_number int not null,
    mo_code int not null,
    foreign key (dr_number) references crime_record (dr_number) on update cascade,
    foreign key (mo_code) references motivation_type (mo_code) on update cascade,
	primary key(dr_number,mo_code)
);











