create database exercice4;

CREATE TABLE TblMaintenance (
	Numero int not null PRIMARY KEY,
	jour char ( 3 ) not null,
	Machine varchar ( 3 ) not null ,
	Vitesse int null ,
	Temperature  int not null,
	Heure time not null default '00:00:00',
	Evenement varchar ( 255 ) not null 
) engine InnoDB;


