drop database if exists vrtic;
create database vrtic character set utf8;
use vrtic;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\vrtic.sql


create table vrtic(
    sifra int not null primary key auto_increment,
    naziv varchar (50) not null,
    adresa varchar(50) not null
);

create table odgojiteljica(
    sifra int not null primary key auto_increment,
    vrtic int not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    strucnasprema varchar(50) not null
);

create table djeca(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    vrtic int not null 
    );


create table skupina1(
    sifra int not null primary key auto_increment,
    djeca int not null,
    odgojiteljica int not null
);

create table skupina2(
    sifra int not null primary key auto_increment,
    djeca int not null,
    odgojiteljica int not null
);

alter table odgojiteljica add foreign key (vrtic) references vrtic(sifra);
alter table skupina1 add foreign key (djeca) references djeca(sifra);
alter table skupina1 add foreign key (odgojiteljica) references odgojiteljica(sifra);
alter table skupina2 add foreign key (djeca) references djeca(sifra);
alter table skupina2 add foreign key (odgojiteljica) references odgojiteljica(sifra);
alter table djeca add foreign key (vrtic) references vrtic(sifra);




# 1

insert into vrtic(sifra,naziv,adresa) values
(null,'Vrtić Sv. Leopolda','Prva ulica 1 Osijek');


# 3-6


insert into odgojiteljica (sifra,vrtic,ime,prezime,strucnasprema) values
(null,1,'Ivana','Ivić','Odgojiteljica'),
(null,1,'Petra','Perić','Odgojiteljica');

insert into odgojiteljica (sifra,vrtic,ime,prezime,strucnasprema) values
(null,1,'Teacher','Tičović','Odgojiteljica'),
(null,1,'Karla','Karlić','Odgojiteljica');


# 1-20

insert into djeca (sifra,ime,prezime,vrtic) values
(null,'Ljubo','Milić',1),
(null,'Andrej','Horvatinčić',1),
(null,'Ljerka','Marić',1),
(null,'Vinko','Radić',1),
(null,'Vjekoslav','Debeljak',1),
(null,'Ranka','Petković',1),
(null,'Elizabeta','Vidović',1),
(null,'Dragana','Cindrić',1),
(null,'Sandra','Hrvat',1),
(null,'Mislava','Petković',1),
(null,'Helena','Nikolić',1),
(null,'Mihael','Kos',1),
(null,'Predrag','Ivanec',1),
(null,'Irena','Jurišić',1),
(null,'Hrvojka','Barišić',1),
(null,'Lorena','Pavlović',1),
(null,'Vjera','Pavić',1),
(null,'Hrvojka','Blažević',1),
(null,'Leo','Jerković',1),
(null,'Ankica','Jović',1);



# 1-10 


insert into skupina1 (sifra,djeca,odgojiteljica) values
(null,1,1),
(null,2,1),
(null,3,1),
(null,4,1),
(null,5,1),
(null,6,2),
(null,7,2),
(null,8,2),
(null,9,2),
(null,10,2);



# 1-10

insert into skupina2 (sifra,djeca,odgojiteljica) values
(null,11,3),
(null,12,3),
(null,13,3),
(null,14,3),
(null,15,3),
(null,16,4),
(null,17,4),
(null,18,4),
(null,19,4),
(null,20,4);





