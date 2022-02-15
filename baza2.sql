create database paczkomaty
go 
use paczkomaty 
go 

create table  Auto
(
ID_Auto int Identity (1,1)  NOT NULL  PRIMARY KEY,
Marka varchar(35) NOT NULL,
Model varchar(50) NOT NULL,
Nr_Rejestracyjn varchar(20) NOT NULL,
Data_Rejestracji DATE NOT NULL,
Frima_flotowa VARCHAR(MAX)NOT NULL,
constraint CHK_Auto check (Data_Rejestracji < getdate ())
)
create table Pracownicy (
ID_Pracownicy int Identity (1,1) NOT NULL PRIMARY KEY, 
Stanowisko VARCHAR(20) NOT NULL,
Glowna_siedziba VARCHAR(40) NOT NULL,
Imie VARCHAR(40) NOT NULL,
Nazwisko VARCHAR(40)NOT NULL,
Pesel INTEGER not null,
Miasto VARCHAR(20) NOT NULL,
Kod_pocztowy VARCHAR (5) NOT NULL ,
Ulica VARCHAR(40) NOT NULL,
Nr_ulicy VARCHAR (10)NOT NULL,
Nr_telefonu_pryw BIGINT  NOT NULL ,
Nr_telefonu_sluz BIGINT NULL  ,
Od_kiedy_zaturdniony DATE NOT NULL ,
Zwolnienie DATE NULL
)

create table Paczkomat_Nadania 
(
ID_Paczkomat_Nadania int Identity (1,1) NOT NULL  PRIMARY KEY, 
Symbol_ind TEXT,
Miasto VARCHAR(20),
Kod_pocztowy TEXT NOT NULL,
Ulica VARCHAR(40) NOT NULL,
Nr_ulicy TEXT  NOT NULL,
Ilosc_S INT  NULL,
Ilosc_M INT   NULL,
Ilosc_l INT  NULL,
Ilosc_XL INT NULL,
Ilosc_XLL INT NULL
)
create table Paczkomat_Odbioru 
(
ID_Paczkomat_Odbioru  int Identity (1,1) NOT NULL  PRIMARY KEY, 
Symbol_ind TEXT,
Miasto VARCHAR(20),
Kod_pocztowy TEXT NOT NULL,
Ulica VARCHAR(40) NOT NULL,
Nr_ulicy TEXT  NOT NULL,
Ilosc_S INT  NULL,
Ilosc_M INT   NULL,
Ilosc_l INT  NULL,
Ilosc_XL INT NULL,
Ilosc_XLL INT NULL
)
 create table Nadawca (
ID_Nadawca int Identity (1,1) NOT NULL  PRIMARY KEY,
Imie VARCHAR(20) NOT NULL,
Nazwisko VARCHAR(20) NOT NULL ,
Adres_email nvarchar(255) NULL,
Nr_telefonu char(20) NOT NULL ,
Miasto VARCHAR(20) NOT NULL,
Kod_pocztowy  varchar(5) NOT NULL,
Ulica VARCHAR(40) NOT NULL,
Nr_ulicy TEXT NOT NULL
)
create table Odbiorca (
ID_Odbiorca int Identity (1,1) NOT NULL  PRIMARY KEY,
Imie VARCHAR(20) NOT NULL,
Nazwisko VARCHAR(20) NOT NULL ,
Adres_email nvarchar(255) NULL,
Nr_telefonu char(20) NOT NULL ,
Miasto VARCHAR(20) NOT NULL,
Kod_pocztowy  varchar(5) NOT NULL,
Ulica VARCHAR(40) NOT NULL,
Nr_ulicy TEXT NOT NULL
)
 Create table Kategoria
(
ID_Kategoria  int Identity (1,1) NOT NULL  PRIMARY KEY, 
Rozmiar varchar(3),
Cena MONEY 
)
Create table Sortownia
(
ID_Sotownia  int Identity (1,1) NOT NULL  PRIMARY KEY, 
Numer_Sortowni  varchar(5)  NOT NULL,
Nr_telefonu char(20) NOT NULL ,
Miasto VARCHAR(20) NOT NULL,
Kod_pocztowy  varchar(5) NOT NULL,
Ulica VARCHAR(40) NOT NULL,
Nr_ulicy TEXT NOT NULL
)

create table Reklamacje
(
ID_Reklamacje int Identity (1,1) NOT NULL  PRIMARY KEY,
Nr_Reklacaji VARCHAR(10) NOT NULL,
Status_Reklacji TEXT NOT NULL,
)
create table Paczka
(
ID_Paczka  int  Identity (1,1) NOT NULL  PRIMARY KEY,
Nr_Paczki varchar(5)  NOT NULL,
Status_Paczki VARCHAR(100)
)
/* łaczenie tabel*/
alter table Pracownicy 
add dodane_auto bit  not null
alter table Pracownicy 
add ID_Sotownia int, ID_Auto int
alter table Pracownicy 
add FOREIGN KEY (ID_Sotownia) REFERENCES Sortownia(ID_Sotownia)
alter table Pracownicy 
add FOREIGN KEY (ID_Auto) REFERENCES Auto(ID_Auto)
alter table Paczka 
add ID_Nadawca int,ID_Odbiorca int, ID_Paczkomat_Odbioru int,ID_Paczkomat_Nadania int,ID_Kategoria int, ID_Reklamacje int,ID_Pracownicy int
alter table Paczka 
add FOREIGN KEY (ID_Nadawca) REFERENCES Nadawca(ID_Nadawca)
alter table Paczka 
add FOREIGN KEY (ID_Paczkomat_Odbioru) REFERENCES Paczkomat_Odbioru(ID_Paczkomat_Odbioru)
alter table Paczka 
add FOREIGN KEY (ID_Paczkomat_Nadania) REFERENCES Paczkomat_Nadania(ID_Paczkomat_Nadania)
alter table Paczka 
add FOREIGN KEY (ID_Kategoria) REFERENCES Kategoria(ID_Kategoria)
alter table Paczka 
add FOREIGN KEY (ID_Odbiorca) REFERENCES Odbiorca(ID_Odbiorca)
alter table Paczka 
add FOREIGN KEY (ID_Pracownicy) REFERENCES Pracownicy(ID_Pracownicy)
alter table Paczka 
add FOREIGN KEY (ID_Reklamacje) REFERENCES Reklamacje(ID_Reklamacje)
/*koniec dodania łączeń*/

/* dodanie danych do tabeli auto*/
INSERT INTO dbo.Auto
VALUES ('Fiat','Ducato','WX67G40','2022-01-05','flotona'),('Fiat','Ducato','WX67G41','2022-01-05','flotona'),('Fiat','Ducato','WX22G41','2022-01-05','flotona'),('Fiat','Ducato','WX11G41','2022-01-05','flotona'),('Fiat','Ducato','WX1CG41','2022-01-05','flotona')
INSERT INTO dbo.Auto
VALUES ('Renault','MASTER','SK1234A','2021-12-05','flotona'),('Renault','MASTER','SK21323A','2021-12-05','flotona'),('Renault','MASTER','SK1221A','2021-12-05','flotona'),('Renault','MASTER','SK2133A','2021-12-05','flotona'),('Renault','MASTER','SK5555K','2021-12-05','flotona')
INSERT INTO dbo.Auto
VALUES ('Ford','Transit','SK2133X','2020-06-22','flotona'),('Ford','Transit','SK2133X','2020-06-22','flotona'),('Ford','Transit','SK2123X','2020-06-22','flotona'),('Ford','Transit','SK2233X','2020-06-22','flotona'),('Ford','Transit','SK3333X','2020-06-22','flotona'),('Ford','Transit','SK2222X','2020-06-22','flotona'),('Ford','Transit','SK6669X','2020-06-22','flotona'),('Ford','Transit','SK9996X','2020-06-22','flotona'),('Ford','Transit','SK1298X','2020-06-22','flotona'),('Ford','Transit','SK9876X','2020-06-22','flotona'),('Ford','Transit','SK5678X','2020-06-22','flotona'), ('Ford','Transit','SK2823X','2020-06-22','flotona')
SELECT * FROM AUTO

/* zapytanie do tabeli*/
SELECT * 
FROM AUTO
WHERE Data_Rejestracji >='2021.12.31'
ORDER BY Marka 
/*dodanie danych do tabeli kategoria*/
INSERT INTO dbo.Kategoria
VALUES ('S','10.99'),('M','13.99'),('L','15.99'),('XL','16.99'),('XLL','20.99')
/*dodanie danych do tabeli Nadawca*/
INSERT INTO dbo.Nadawca 
VALUES ('Adam','Nowak','adamnowak@gmail.com','672829124','Katowice','40002','Powstańców','2/2')
INSERT INTO dbo.Nadawca 
VALUES ('Wiesław','Wilk','lubieplacki@gmail.com','543762345','Świnoujście','50539','Kostki','59'),
('Feliks','Tomczyk','tak12@gmail.com','223323234','Suwałki','26880','Chabrowa','5')
INSERT INTO dbo.Nadawca 
VALUES ('Victoria','Nowak','nowak12@gmail.com','698367852','Jaworzno','44203','Parkowa','50'),
('Janina','Marciniak','maarciniak@gmail.com','5318527534','Świnoujście','64167','Orzechowa','25'),
('Nina','Zalewska','nzalewska@gmail.com','698254169','Poznań','60480','Parkowa','85'),
('Beata','Ratajczak','bratajczak12@gmail.com','521954758','Gorzów Wielkopolski','44967','Zamkowa','2/4')
/* dodanie danych do tabeli odbiorca*/
INSERT INTO dbo.Odbiorca
VALUES ('Victoria','Nowak','nowak12@gmail.com','698367852','Jaworzno','44203','Parkowa','50'),
('Janina','Marciniak','maarciniak@gmail.com','5318527534','Świnoujście','64167','Orzechowa','25'),
('Nina','Zalewska','nzalewska@gmail.com','698254169','Poznań','60480','Parkowa','85'),
('Beata','Ratajczak','bratajczak12@gmail.com','521954758','Gorzów Wielkopolski','44967','Zamkowa','2/4'),
('Wiesław','Wilk','lubieplacki@gmail.com','543762345','Świnoujście','50539','Kostki','59'),
('Feliks','Tomczyk','tak12@gmail.com','223323234','Suwałki','26880','Chabrowa','5'),
('Adam','Nowak','adamnowak@gmail.com','672829124','Katowice','40002','Powstańców','2/2')

/* DODANIE DO PACZKOMATU NADANIA*/
INSERT INTO dbo.Paczkomat_Nadania
VALUES ('sk212x','Katowice','40091','Piotra skargi','5','25','10','4',0,0)
INSERT INTO dbo.Paczkomat_Nadania
VALUES ('sk212x','Katowice','40091','Piotra skargi','5','25','10','4',0,0),
('sk123a','Katowice','40004','al. Wojciecha Konfrantego','1a','15','2',0,'5',0),
('sk258b','Katowice','40015','Mariacka Tylna','12','15','1','2',0,'2'),
('sk753s','Katowice','40046','Fiołków','5','25','10','4',0,0),
('sk456a','Katowice','40859','Pukowa','15','25','10','4',0,0),
('sk147f','Katowice','40833','Oborki','17a','25','10','4',0,0),
('ch843a','Chorzów','41506','St. Batorego','30b','25','10','4',0,0),
('sk985e','Katowice','40272','Graniczna','5','25','10','4',0,'11'),
('sk156e','Katowice','40289','Trzech Stawów','5','25','10','4',0,0)
/* do paczkoamtu odbioru*/
INSERT INTO dbo.Paczkomat_Odbioru
VALUES ('sk212x','Katowice','40091','Piotra skargi','5','25','10','4',0,0),
('sk123a','Katowice','40004','al. Wojciecha Konfrantego','1a','15','2',0,'5',0),
('sk258b','Katowice','40015','Mariacka Tylna','12','15','1','2',0,'2'),
('sk753s','Katowice','40046','Fiołków','5','25','10','4',0,0),
('sk456a','Katowice','40859','Pukowa','15','25','10','4',0,0),
('sk147f','Katowice','40833','Oborki','17a','25','10','4',0,0),
('ch843a','Chorzów','41506','St. Batorego','30b','25','10','4',0,0),
('sk985e','Katowice','40272','Graniczna','5','25','10','4',0,'11'),
('sk156e','Katowice','40289','Trzech Stawów','5','25','10','4',0,0),
('sk212x','Katowice','40091','Piotra skargi','5','25','10','4',0,0)

/*dane do reklamacji*/
/*dane do sortowni*/
INSERT INTO dbo.Sortownia
VALUES ('SO159','543267345','Sosnowiec','41218','Innowacyjna','5'),
('PA126','543758192','Pawlikowice','95200','Pawlikowice','150'),
('WX233','543156489','Mroków','05552','Burtynowa','10a'),
('BI259','54315589','Juchnowiec Kościelny','16061','Akacjowa','255a'),
('PO113','543152589','Wągrowiec','62100','Gnieźnieńska','110a'),
('GD219','543122589','Tczew','83110','Przemysłowa','7')

/*dane do paczki*/
select * from Nadawca
select * from Odbiorca
select * from Paczkomat_Nadania
select* from Paczkomat_Odbioru
select * from Kategoria
select * from Pracownicy
/* dane do parcowników*/
INSERT INTO dbo.Pracownicy
VALUES ('Kurier','Katowice','Jan','Kowalksi','852167452','Sosnowiec','41200','Wiśniowa','18/32','531789528','531777825','2009-07-07',null,1,1,16)
INSERT INTO dbo.Pracownicy
VALUES ('Kurier','Warszawa','Andzej','Popielaty','954258745','Mroków','05552','Polowa','28/22','517323238','531733825','2009-07-07',null,1,3,1)
/* dane paczek*/
INSERT INTO dbo.Paczka
VALUES	('00001','Nadana',1,7,1,3,2,null,1),('00002','Odebrana',2,7,1,3,2,null,1)

