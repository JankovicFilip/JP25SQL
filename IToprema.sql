drop database if exists IToprema;
create database IToprema character set utf8;
use IToprema;

# mysql -uedunova -pedunova --default_character_set=utf8 < d:\JP25\JP25SQL\IToprema.sql
# između values i zagrada ne smije biti razmak u redovima


create table shop(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    radnik int not null
);

    create table gpu(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2)
);

create table cpu(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal
);

create table ram(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2)
);

create table ssd(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2)
);

create table napajanje(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2)
);

create table produkti(
    sifra int not null primary key auto_increment,
    gpu int not null,
    cpu int not null,
    ram int not null,
    ssd int not null,
    napajanje int not null
);

create table radnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    iban varchar(50) not null,
    placa decimal(18,2),
    kupac int not null
);

create table kupac(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    nacinplacanja int not null,
    produkti int not null
);


create table nacinplacanja(
    sifra int not null primary key auto_increment,
    kartica int,
    gotovina int,
    preuzece int not null
    );

create table kartica(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    vrsta varchar(50) not null,
    obrok int not null,
    internet boolean not null,
    valuta varchar(50) not null
);


create table gotovina(
    sifra int not null primary key auto_increment,
    valuta varchar(50) not null,
    obrok int not null
);


create table obrok(
    sifra int not null primary key auto_increment,
    brojobroka varchar(50)
);


create table preuzece(
    sifra int not null primary key auto_increment,
    dostava boolean,
    utrgovini boolean
);




alter table produkti add foreign key (gpu) references gpu(sifra);
alter table produkti add foreign key (cpu) references cpu(sifra);
alter table produkti add foreign key (ram) references ram(sifra);
alter table produkti add foreign key (ssd) references ssd(sifra);
alter table produkti add foreign key (napajanje) references napajanje(sifra);

alter table radnik add foreign key (kupac) references kupac(sifra); 


alter table shop add foreign key (radnik) references radnik(sifra);

alter table kupac add foreign key (nacinplacanja) references nacinplacanja(sifra);
alter table kupac add foreign key (produkti) references produkti(sifra);



alter table nacinplacanja add foreign key (kartica) references kartica(sifra);
alter table nacinplacanja add foreign key (gotovina) references gotovina(sifra);
alter table nacinplacanja add foreign key (preuzece) references preuzece(sifra);

alter table kartica add foreign key (obrok) references obrok(sifra);
alter table gotovina add foreign key (obrok) references obrok(sifra);




# 1-10

insert into cpu (sifra,naziv,cijena) values
(null,'Procesor Intel Core i7-10700KF',2499.99),
(null,'Procesor AMD Ryzen 7 3700X',2399.99),
(null,'Procesor Intel Core i5-11600K)',2199.99),
(null,'Procesor Intel Core i5-11600KF',2099.99),
(null,'Procesor Intel Core i5-11500',1999.99),
(null,'Procesor Intel Core i5-11600',1949.99),
(null,'Procesor Intel Core i5-10500',1749.99),
(null,'Procesor Intel Core i5-11400',1599.99),
(null,'Procesor Intel Core i5-11400F',1499.99),
(null,'Procesor AMD Ryzen 5 5600X',2599.99);


# 1-10


insert into gpu (sifra,naziv,cijena) values
(null,'Grafička Asus TUF Gaming Radeon RX6900XT OC',14299.99),
(null,'Grafička MSI AMD Radeon RX6800XT Gaming X Trio',11999.99),
(null,'Grafička XFX AMD Radeon RX6800XT',11999.99),
(null,'Grafička Asus AMD Radeon ROG Strix RX6700XT',9599.99),
(null,'Grafička ASRock AMD Radeon RX6700XT',9299.99),
(null,'Grafička Asus GeForce RTX3070',9499.99),
(null,'Grafička Inno3D GeForce RTX3060',5799.99),
(null,'Grafička Inno3D GeForce RTX3060 Twin X2 OC',5499.99),
(null,'Grafička Palit GeForce RTX3060 Dual',5299.99),
(null,'Grafička Palit GeForce GTX1660Ti Dual',4799.99);



# 1-10


insert into napajanje (sifra,naziv,cijena) values
(null,'PSU Fortron Hydro PTM Pro, 1200W, 80+ Platinum',1914.34),
(null,'PSU Seasonic Prime Ultra Gold, 1000W, 80+ Gold',1751.56),
(null,'PSU SilverStone Strider Platinum 1000W 80+ Plat',1673.68),
(null,'PSU Thermaltake Toughpower DPS G 850W 80+ Plat',1459.16),
(null,'PSU Gigabyte P1000GM, 1000W, 80+ Gold',1410.60),
(null,'PSU Seasonic Focus GX-1000, 1000W, 80+ Gold',1410.16),
(null,'PSU Fractal Ion+ 2, 860W, 80+ Platinum',1402.84),
(null,'PSU Fractal Ion+ 2, 760W, 80+ Platinum',1315.66),
(null,'PSU Thermaltake Toughpower iRGB Plus, 850W, 80+',1313.10),
(null,'PSU Corsair RM850x, 850W, 80+ Gol',1219.13);



# 1-10

insert into ram (sifra,naziv,cijena) values
(null,'RAM PC-42600 16 GB G.SKILL Trident Z Royal Elite',2944.05),
(null,'RAM PC-42600 16 GB G.SKILL Trident Z Royal Elite',274.05),
(null,'RAM PC-28800 32 GB G.SKILL Trident Z Neo',2564.05),
(null,'RAM PC-32000 16 GB G.SKILL Trident Z Royal Elite',2469.05),
(null,'RAM PC-32000 16 GB G.SKILL Trident Z Royal Elite',2469.05),
(null,'RAM PC-32000 16 GB G.SKILL Trident Z Royal',2279.05),
(null,'RAM PC-32000, 16 GB, G.SKILL Trident Z Neo',2089.05),
(null,'RAM PC-40500, 16 GB G.SKILL Trident Z Royal Elite',1899.05),
(null,'RAM PC-32000, 16 GB, G.SKILL Ripjaws V',1804.05),
(null,'RAM PC-25600, 32 GB, KINGSTON',1376.05);




# 1-10

insert into ssd (sifra,naziv,cijena) values
(null,'SSD 2000 GB SAMSUNG 970 Evo Plus NVMe M.2',2279.05),
(null,'SSD 2000 GB LC POWER Phenom Pro Series',2184.05),
(null,'SSD 2000 GB SAMSUNG 870 EVO',2184.05),
(null,'SSD 1000 GB SAMSUNG 980 PRO NVMe M.2',1519.05),
(null,'SSD 2000 GB KINGSTON NV1 SNVS/2000G M.2/NVMe PCIe',1462.05),
(null,'SSD 2000 GB SAMSUNG 870 QVC Basic',1424.05),
(null,'SSD 500 GB SAMSUNG 980 PRO NVMe M.2',968.05),
(null,'SSD 1000 GB CRUCIAL P2 CT1000P2SSD8, M.2',825.05),
(null,'SSD 1000 GB CRUCIAL MX500',816.05),
(null,'SSD 1000 GB KINGSTON A2000',787.05);

# 1-12

insert into obrok (sifra,brojobroka) values
(null,'1 mjesec'),
(null,'2 mjeseca'),
(null,'3 mjeseca'),
(null,'4 mjeseca'),
(null,'5 mjeseci'),
(null,'6 mjeseci'),
(null,'7 mjeseci'),
(null,'8 mjeseci'),
(null,'9 mjeseci'),
(null,'10 mjeseci'),
(null,'11 mjeseci'),
(null,'12 mjeseci');



# 1-5

insert into gotovina (sifra,valuta,obrok) values
(null,'Kuna',1),
(null,'Yen',3),
(null,'Euro',6),
(null,'Dollar',9),
(null,'Funta',12);




# 1-5

insert into kartica (sifra,naziv,vrsta,obrok,internet,valuta) values
(null,'Erste','Master card',1,false,'Kuna'),
(null,'Erste','Diners',3,false,'Euro'),
(null,'Addiko','Maestro',6,true,'Funta'),
(null,'Zaba','Master card',9,true,'Kuna'),
(null,'Zaba','Visa',12,true,'Yen');





# 1-5 u trgovini 6-10 dostava

insert into preuzece (sifra,dostava,utrgovini) values
(null,false,true),
(null,false,true),
(null,false,true),
(null,false,true),
(null,false,true),
(null,true,false),
(null,true,false),
(null,true,false),
(null,true,false),
(null,true,false);



# 1-5 kartica,dostava(true), a 6-10 gotovina, u trgovini(false)

insert into nacinplacanja (sifra,kartica,gotovina,preuzece) values
(null,1,null,6),
(null,2,null,7),
(null,3,null,8),
(null,4,null,9),
(null,5,null,10),
(null,null,1,1),
(null,null,2,2),
(null,null,3,3),
(null,null,4,4),
(null,null,5,5);




# 1-10

insert into produkti (sifra,gpu,cpu,ram,ssd,napajanje) values
(null,1,1,1,1,1),
(null,2,2,2,2,2),
(null,3,3,3,3,3),
(null,4,4,4,4,4),
(null,5,5,5,5,5),
(null,6,6,6,6,6),
(null,7,7,7,7,7),
(null,8,8,8,8,8),
(null,9,9,9,9,9),
(null,10,10,10,10,10);



# # 1-5 gotovina, u trgovini(false), a 6-10 kartica,dostava(true)


insert into kupac (sifra,ime,prezime,nacinplacanja,produkti) values
(null,'Zorka','Perković',6,1),
(null,'Mutimir','Rukavina',7,2),
(null,'Braslav','Stolar',8,3),
(null,'Mato','Ivančić',9,4),
(null,'Senka','Pavić',10,5),
(null,'Jelena','Galić',1,6),
(null,'Pribislav','Barišić',2,7),
(null,'Matija','Jerković',3,8),
(null,'Tanja','Brajković',4,9),
(null,'Tomo','Matijević',5,10);








# 4-5

insert into radnik (sifra,ime,prezime,iban,placa,kupac) values
(null,'Petra','Pejić','HR9323400099727465948',5555.21,1),
(null,'Višnja','Tomić','HR9824840084689622665',5779.21,6);





# 1-2

insert into shop (sifra,naziv,radnik) values
(null,'PCbuilder',1),
(null,'PCbuilder',2);



















