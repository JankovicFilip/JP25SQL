drop database if exists frizerskisalon;
create database frizerskisalon character set utf8;
use frizerskisalon;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\frizerskisalon.sql

create table salon(
    sifra int not null primary key auto_increment,
    naziv varchar(50)not null,
    adresa varchar(50)
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    djelatnik int not null,
    kupac int not null,
    cijena decimal(18,2),
    datum datetime,
    salon int not null
);

create table kupac(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);


alter table djelatnik add foreign key (osoba) references osoba(sifra);
alter table kupac add foreign key (osoba) references osoba(sifra);

alter table usluga add foreign key (djelatnik) references djelatnik(sifra);
alter table usluga add foreign key (kupac) references kupac(sifra);
alter table usluga add foreign key (salon) references salon(sifra);





# 1-2 djelatnik, 3-6 kupac

insert into osoba (sifra,ime,prezime) values
(null,'Marin','Marić'),
(null,'Petra','Perić'),
(null,'Filip','Janković'),
(null,'John','Travolta'),
(null,'Leonardo','Di Caprio'),
(null,'Luka','Modrić');




# 1-2

insert into djelatnik (sifra,osoba) values
(null,1),
(null,2);




# 1-4

insert into kupac (sifra,osoba) values
(null,3),
(null,4),
(null,5),
(null,6);



# 1

insert into salon (sifra,naziv,adresa) values
(null,'S Lady','Radičeva 25');



# 5-8 sifra

insert into usluga (sifra,naziv,djelatnik,kupac,cijena,datum,salon) values
(null,'Šišanje i bojanje',1,1,120.99,'2021-11-19',1),
(null,'Šišanje na čelavo',1,2,30.99,'2021-11-18',1),
(null,'Šišanje',2,3,49.99,'2021-11-20',1),
(null,'Šišanje i frizura',2,4,59.99,'2021-11-21',1);





