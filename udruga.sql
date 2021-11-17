drop database if exists udruga;
create database udruga character set utf8;
use udruga;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\udruga.sql

create table udruga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    djelatnici int,
    prostor int,
    volonteri int
    );

create table djelatnici(
    sifra int not null primary key auto_increment,
    osoba int not null,
    sticenici int not null
);

create table sticenici(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    kvadratura varchar(50)
);

create table volonteri(
    sifra int not null primary key auto_increment,
    osoba int not null,
    sticenici int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

alter table udruga add foreign key (prostor) references prostor(sifra);
alter table udruga add foreign key (djelatnici) references djelatnici(sifra);
alter table udruga add foreign key (volonteri) references volonteri(sifra);

alter table djelatnici add foreign key (osoba) references osoba(sifra);
alter table djelatnici add foreign key (sticenici) references sticenici(sifra);
alter table volonteri add foreign key (osoba) references osoba(sifra);
alter table volonteri add foreign key (sticenici) references sticenici(sifra);



# 1-4 12, 20, 32, 120

insert into prostor (sifra,kvadratura) values
(null,12),
(null,20),
(null,32),
(null,120);


# 1-4

insert into osoba (sifra,ime,prezime) values
(null,'Marija','Marić'),
(null,'Petra','Petrić'),
(null,'Marin','Marinković'),
(null,'Ivan','Ivanušec');




# 1-4

insert into sticenici (sifra,naziv) values
(null,'Njemački ovčar'),
(null,'Husky'),
(null,'Aljaski malamut'),
(null,'Siberijska mačka');


# 1-2

insert into djelatnici (sifra,osoba,sticenici) values
(null,1,1),
(null,2,2);



# 1-2

insert into volonteri (sifra,osoba,sticenici) values
(null,3,3),
(null,4,4);

# 1-2

insert into udruga (sifra,naziv,djelatnici,prostor,volonteri) values
(null,'Azil Osijek',1,4,1),
(null,'Azil Osijek',2,3,2);