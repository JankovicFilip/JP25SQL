drop database if exists taxi;
create database taxi character set utf8;
use taxi;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\taxi.sql



create table taxisluzba(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table vozilo(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table vozac(
    sifra int not null primary key,
    osoba int not null,
    usluga int not null,
    vozilo int not null,
    taxisluzba int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    polazak time,
    trajanje int,
    cijena decimal(18,2),
    korisnik int not null
);


create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    brojtelefona varchar(50) not null
);


create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null
);


alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table vozac add foreign key (osoba) references osoba(sifra);

alter table usluga add foreign key (korisnik) references korisnik(sifra);

alter table vozac add foreign key (usluga) references usluga(sifra);
alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table vozac add foreign key (taxisluzba) references taxisluzba(sifra);



