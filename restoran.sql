drop database if exists restoran;
create database restoran character set utf8;
use restoran;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\restoran.sql

create table restoran(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50)
);

create table jelovnik(
    sifra int not null primary key auto_increment,
    kategorija int,
    naziv varchar(50),
    restoran int not null
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

alter table jelovnik add foreign key (restoran) references restoran(sifra);
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




# 1

insert into restoran (sifra,naziv,adresa) values
(null,'Restoran Bijelo-plavi','Ul. Martina Divalta 8');




# 1-5

insert into jelovnik (sifra,kategorija,naziv,restoran) values
(null,1,'Lagani ručak',1),
(null,2,'Pizza i rakija',1),
(null,3,'Pizza i pivo',1),
(null,4,'Meso i vino',1),
(null,5,'Riba i aperitiv',1);

