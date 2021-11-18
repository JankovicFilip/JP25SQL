drop database if exists restoran;
create database restoran character set utf8;
use restoran;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\restoran.sql

create table restoran(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    jelovnik int,
    adresa varchar(50)
);

create table jelovnik(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2),
    kategorija int,
    naziv varchar(50)
);

create table kategorija(
    sifra int not null primary key auto_increment,
    jela int,
    drinks int
);

create table jela(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2),
    naziv varchar(50)
);

create table drinks(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2),
    naziv varchar(50)
);

alter table restoran add foreign key (jelovnik) references jelovnik(sifra);
alter table jelovnik add foreign key (kategorija) references kategorija(sifra);
alter table kategorija add foreign key (jela) references jela(sifra);
alter table kategorija add foreign key (drinks) references drinks(sifra);




# 1-5

insert into drinks (sifra,cijena,naziv) values
(null,25.99,'Jim Beam Whisky'),
(null,20.99,'Rakija Šljivovica'),
(null,10.99,'Osječko Pivo'),
(null,12.99,'Graševina'),
(null,24.99,'Jack Daniels');



# 1-5

insert into jela (sifra,cijena,naziv) values
(null,19.99,'Bečki odrezak'),
(null,20.99,'Pizza Slavonska'),
(null,20.99,'Pizza Osječka'),
(null,19.99,'Miješano meso'),
(null,25.99,'Losos file');




# 1-5

insert into kategorija (sifra,jela,drinks) values
(null,1,1),
(null,2,2),
(null,3,3),
(null,4,4),
(null,5,5);




# 1-5

insert into jelovnik (sifra,cijena,kategorija,naziv) values
(null,45.98,1,'Bečki odrezak i Jim Beam'),
(null,41.98,2,'Pizza Slavnoska i Šljivovica'),
(null,31.98,3,'Pizza Osječka i Osječko pivo'),
(null,32.98,4,'Miješano meso i Graševina'),
(null,50.98,5,'Losos file i Jack Daniels');



# 1-5

insert into restoran (sifra,naziv,jelovnik,adresa) values
(null,'Bijelo plavi',1,null),
(null,'Restoran Coppacabana',2,null),
(null,'Restoran Korola',3,null),
(null,'Hotel Osijek',4,null),
(null,'Hotel Waldinger',5,null);








