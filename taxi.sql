drop database if exists taxi;
create database taxi character set utf8;
use taxi;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\taxi.sql



create table taxisluzba(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table vozilo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
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
    polazak time not null,
    trajanje int not null,
    cijena decimal(18,2) not null,
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




# 1 i 4 vozac 2-3 korisnik

insert into osoba (sifra,ime,prezime,brojtelefona) values
(null,'Pero','Perica','031222205'),
(null,'Marko','Markec','0911112223'),
(null,'Petra','Pereca','0994445553');

insert into osoba (sifra,ime,prezime,brojtelefona) values
(null,'Ivana','Ivanovska','031222205');





# 1-2 korisnici

insert into korisnik (sifra,osoba) values
(null,2),
(null,3);




# 1-2 usluga

insert into usluga (sifra,polazak,trajanje,cijena,korisnik) values
(null,'12:31',17,19.99,1),
(null,'13:48',45,45.99,2);





# 1 - 2

insert into vozilo (sifra,naziv) values
(null,'BMW M3');


insert into vozilo (sifra,naziv) values
(null,'Ford Focus');


# 1

insert into taxisluzba (sifra,naziv) values
(null,'Taxi Osijek');



# 1-2

insert into vozac (sifra,osoba,usluga,vozilo,taxisluzba) values
(1,1,1,1,1),
(2,4,2,2,1);