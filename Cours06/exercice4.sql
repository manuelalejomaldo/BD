create TABLE TBL_MAINTENANCE (
	id_mnt int not null PRIMARY key,
	Mnt_jour char (3) not null
    CHECK ( VALUE IN ('Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim')),
    Mnt_Machine char (8) not null,
    Mnt_Vitesse tinyint UNSIGNED CHECK ( VALUE > 0),
    Mnt_temperature tinyint CHECK (VALUE > -30),
    Mnt_Heure time not null,
    Mnt_Evenement varchar(50) not null,
    CONSTRAINT UK_MAC_JOUR_HEURE UNIQUE (Mnt_Machine, Mnt_jour, Mnt_Heure));
show tables;

CREATE TABLE Animal (
	id smallint unsigned NOT NULL auto_increment,
    espece varchar(40) NOT NULL,
    sexe CHAR(1),
    date_naissance datetime NOT NULL,
    nom varchar(30),
    commentaires TEXT,
    primary key (id)) ENGINE=InnoDB;


INSERT INTO Animal VALUES ( 1 , 'chien' , 'M' , '2017-04-05 13:43:00' , 'Oli' , 
	'Mordille beaucoup' ) ;
insert INTO Animal values (2, 'chat', NULL, '2017-03-24 02:23:00', 'Luna', null);
insert into Animal values (null,'chat','F','2017-09-13 15:02:00', 'Béa', null);

select * from Animal;

insert into Animal (espece,sexe,date_naissance) values ('tortue','F',
	'2009-08-03 05:12:00');
    
insert into Animal (nom, commentaires, date_naissance, espece)
	values ('Choupi', 'Né sans oreille gauche','2010-10-03 16:44:00','chat');
    
insert into Animal (espece, sexe, date_naissance, nom)
values('chien','F','2008-12-06 05:18:00','Caroline'),
('chat','M', '2008-09-11 15:38:00','Bagherra'),
('tortue',null,'2010-08-23 05:18:00',null);



insert into TBL_MAINTENANCE (id_mnt,Mnt_jour,Mnt_Machine,Mnt_Vitesse,Mnt_temperature,
	Mnt_Heure,Mnt_Evenement)
values(147,'Ven','Masicot',null, null, '21:18',"Défault de lame"),
(63,'Sam','Relieuse',16,null,'16:15:00','Arrêt pour maintenance'),
(87,'Jeu','Presse',6,62,'11:40:00','Bavure dencre'),
(79,'Sam','Relieuse',16,null,'17:11:00','Reprise'),
(89,'Mar','Presse',6,55,'08:28:00','Recadrage'),
(132,'Mar','Presse',8,68,'09:58:00','Changement encre'),
(111,'Mer','Massicot',null,null,'10:17:00','Graissage coulisseau');
    
alter table tbl_maintenance
ADD INDEX idx_machine (Mnt_Machine ASC);

select * from TBL_MAINTENANCE;

alter table tbl_maintenance
add column Mnt_Verifie char(3) null
check ( value in ('oui','non')) After Mnt_Evenement;
