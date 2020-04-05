create table users
(
    user_id serial primary key not null,
    fname varchar(50) not null,
    lname varchar(50) not null,
    email varchar(330) unique not null,
    password varchar(100) not null
);



create table hospitals
(
    hospital_id serial primary key not null,
    name varchar(100) not null,
    sname varchar(100) not null,
    admin varchar(330),
    phone_admin varchar(30) not null,
    phone_lab varchar(30) not null,
    address varchar(200),
    email_admin varchar(330),
    email_lab varchar(330),
    patient_capacity int,
    testing_capacity int,
    foreign key (admin) references users(email)
);


create table patients
(
    patient_id serial primary key not null,
    name varchar(100) not null,
    sex varchar(10), -- "Handle genders?"
    hospital_id int not null,
    hospital_ref varchar(100),
    condition varchar(32),
    age int,
    history varchar(1024),
    foreign key (hospital_id) references hospitals(hospital_id)
);



create table administration
(
    doff_id serial primary key not null,
    name varchar(100),
    sname varchar(30),
    admin varchar(330),
    -- off_id int references users(user_id),
--    "Need to make a better location thing"
    --state varchar(30),
    --district varchar(50),
    region varchar(50)
);

create table history_hospital
(
    history_id int primary key not null,
    hospital_id int not null,
    date date,
    active int,
    recovered int,
    deaths int,
    foreign key (hospital_id) references hospitals(hospital_id)
);

create table history_patient
(
    patient_id_rec serial primary key not null,
    patient_id int not null,
    date date,
    condition varchar(32),
    foreign key (patient_id) references patients(patient_id)
);

create table member
(
    memberid serial primary key not null,
    userid varchar(330),
    type varchar(30),
    dashboard_id int not null
);

create table invitation
(
    inviteid serial primary key not null,
    to_user varchar(330),
    from_user varchar(330),
    invited_date date,
    type varchar(30),
    dashboard_id int not null
);


