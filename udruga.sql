drop database if exists udruga;
create database udruga character set utf8;
use udruga;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\udruga.sql

create table udruga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    djelatnici int,
    sticenici int,
    prostor int,
    volonteri int
    );

create table djelatnici(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    sticenici int,
    udruga varchar(50) not null
);

create table sticenici(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    djelatnici int
);

create table prostor(
    sifra int not null primary key auto_increment,
    kvadratura varchar(50)
);

create table volonteri(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    udruga varchar(50) not null
);

create table osoba(
    volonteri int,
    djelatnici int
);

alter table udruga add foreign key (prostor) references prostor(sifra);
alter table udruga add foreign key (djelatnici) references djelatnici(sifra);
alter table udruga add foreign key (volonteri) references volonteri(sifra);
alter table sticenici add foreign key (djelatnici) references djelatnici(sifra);
alter table osoba add foreign key (volonteri) references volonteri(sifra);
alter table osoba add foreign key (djelatnici) references djelatnici(sifra);