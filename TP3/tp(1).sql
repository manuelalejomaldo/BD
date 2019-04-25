
#Travail pratique 3
#Gestion d’un parc de stationnement

#Paul-Elvis Tcheumeni
#Dominic Tremblay 
#2018-04-20

-- --------------------------------------------
--TP3
/
-- -------------------------------------------

--- Jean-Pierre Duchesneau, correction :
------------------------------------------
/*
	MCD : 10 sur 10
				
	DDL : 20 sur 20  
		
	DML : 20 sur 20

	programmabilitée : 26 sur 50 %
		Vos test son mal découpés. Il aurait mieux value les placer après chaque besoin.
	Besoin 1 : 3/10
		Voir les notes dans la section.
	Besoin 2 : 15/15
	Besoin 3 : 3/10
		Voir les notes dans la section.
	Besoin 4 : 5/15

BON TRAVAIL DANS L'ENSEMBLE.		
Résultat : 76 sur 100


Chercher JPD pour trouver mes notes.
*/


########################################################################################################################################################
#Etape 1 Section DDL Creation de la BD
#Ajout des contraintes et des index
#######################################################################################################################################################
DROP DATABASE IF EXISTS bdstationnement;
CREATE DATABASE bdstationnement;

-- MySQL Workbench Synchronization
-- Generated: 2018-04-09 16:34
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Paul-Elvis

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER SCHEMA `bdstationnement`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_occasionnels` (
  `id_occasionnels` INT(11) NOT NULL AUTO_INCREMENT,
  `No_automatique` VARCHAR(50) NULL DEFAULT NULL,
  `date_debut` DATETIME NULL DEFAULT NULL,
  `date_fin` DATETIME NULL DEFAULT NULL,
  `montant_paye` DECIMAL(9,2) NULL DEFAULT NULL,
  `id_tarifs` INT(11) NULL DEFAULT NULL,
  `id_type_paiement` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_occasionnels`),
  INDEX `FK_tbl_occasionnels_id_tarifs` (`id_tarifs` ASC),
  INDEX `FK_tbl_occasionnels_id_type_paiement` (`id_type_paiement` ASC),
  INDEX `idx_no_automatique` (`No_automatique` ASC),
  INDEX `idx_date_debut` (`date_debut` ASC),
  INDEX `idx_date_fin` (`date_fin` ASC),
  INDEX `idx_montant_paye` (`montant_paye` ASC),
  CONSTRAINT `FK_tbl_occasionnels_id_tarifs`
    FOREIGN KEY (`id_tarifs`)
    REFERENCES `bdstationnement`.`tbl_tarifs` (`id_tarifs`),
  CONSTRAINT `FK_tbl_occasionnels_id_type_paiement`
    FOREIGN KEY (`id_type_paiement`)
    REFERENCES `bdstationnement`.`tbl_type_paiement` (`id_type_paiement`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_type_paiement` (
  `id_type_paiement` INT(11) NOT NULL AUTO_INCREMENT,
  `nom_type_paiement` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_paiement`),
  INDEX `idx_nom_type_paiement` (`nom_type_paiement` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_abonnes` (
  `id_abonne` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  `prenom` VARCHAR(50) NULL DEFAULT NULL,
  `code_postal` CHAR(7) NULL DEFAULT NULL,
  `ville` VARCHAR(50) NULL DEFAULT NULL,
  `telephone` CHAR(15) NULL DEFAULT NULL,
  `courriel` VARCHAR(100) NULL DEFAULT NULL,
  `id_type_paiement` INT(11) NOT NULL,
  `id_type_personne` INT(11) NOT NULL,
  PRIMARY KEY (`id_abonne`),
  INDEX `FK_tbl_abonnes_id_type_paiement` (`id_type_paiement` ASC),
  INDEX `FK_tbl_abonnes_id_type_personne` (`id_type_personne` ASC),
  INDEX `idx_nom_prenom` (`nom` ASC, `prenom` ASC),
  INDEX `idx_code_postal` (`code_postal` ASC),
  CONSTRAINT `FK_tbl_abonnes_id_type_paiement`
    FOREIGN KEY (`id_type_paiement`)
    REFERENCES `bdstationnement`.`tbl_type_paiement` (`id_type_paiement`),
  CONSTRAINT `FK_tbl_abonnes_id_type_personne`
    FOREIGN KEY (`id_type_personne`)
    REFERENCES `bdstationnement`.`tbl_type_personne` (`id_type_personne`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_type_personne` (
  `id_type_personne` INT(11) NOT NULL AUTO_INCREMENT,
  `nom_type_personne` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_personne`),
  INDEX `idx_nom_type_personne` (`nom_type_personne` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_tarifs` (
  `id_tarifs` INT(11) NOT NULL AUTO_INCREMENT,
  `type_temps` VARCHAR(25) NULL DEFAULT NULL,
  `tarification` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tarifs`),
  INDEX `idx_type_temps` (`type_temps` ASC),
  INDEX `idx_tarification` (`tarification` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_vehicule` (
  `id_vehicule` INT(11) NOT NULL AUTO_INCREMENT,
  `no_plaque` CHAR(8) NULL DEFAULT NULL,
  `modele` VARCHAR(25) NULL DEFAULT NULL,
  `couleur` VARCHAR(25) NULL DEFAULT NULL,
  `id_place` INT(11) NOT NULL,
  PRIMARY KEY (`id_vehicule`),
  INDEX `FK_tbl_vehicule_id_place` (`id_place` ASC),
  INDEX `idx_no_plaque` (`no_plaque` ASC),
  INDEX `idx_modele` (`modele` ASC),
  CONSTRAINT `FK_tbl_vehicule_id_place`
    FOREIGN KEY (`id_place`)
    REFERENCES `bdstationnement`.`tbl_place` (`id_place`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_abonnements` (
  `id_abonnement` INT(11) NOT NULL AUTO_INCREMENT,
  `date_debut` DATE NULL DEFAULT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `montant_paye` DECIMAL(9,2) NULL DEFAULT NULL,
  `no_carte_credit` VARCHAR(25) NULL DEFAULT NULL,
  `id_abonne` INT(11) NOT NULL,
  `id_vehicule` INT(11) NOT NULL,
  `id_tarifs` INT(11) NOT NULL,
  PRIMARY KEY (`id_abonnement`),
  INDEX `FK_tbl_abonnements_id_abonne` (`id_abonne` ASC),
  INDEX `FK_tbl_abonnements_id_vehicule` (`id_vehicule` ASC),
  INDEX `FK_tbl_abonnements_id_tarifs` (`id_tarifs` ASC),
  INDEX `idx_date_debut` (`date_debut` ASC),
  INDEX `idx_date_fin` (`date_fin` ASC),
  INDEX `idx_montant_paye` (`montant_paye` ASC),
  INDEX `idx_no_carte_credit` (`no_carte_credit` ASC),
  CONSTRAINT `FK_tbl_abonnements_id_abonne`
    FOREIGN KEY (`id_abonne`)
    REFERENCES `bdstationnement`.`tbl_abonnes` (`id_abonne`),
  CONSTRAINT `FK_tbl_abonnements_id_vehicule`
    FOREIGN KEY (`id_vehicule`)
    REFERENCES `bdstationnement`.`tbl_vehicule` (`id_vehicule`),
  CONSTRAINT `FK_tbl_abonnements_id_tarifs`
    FOREIGN KEY (`id_tarifs`)
    REFERENCES `bdstationnement`.`tbl_tarifs` (`id_tarifs`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_place` (
  `id_place` INT(11) NOT NULL AUTO_INCREMENT,
  `numero` INT(11) NULL DEFAULT NULL,
  `id_type_place` INT(11) NOT NULL,
  PRIMARY KEY (`id_place`),
  INDEX `FK_tbl_place_id_type_place` (`id_type_place` ASC),
  INDEX `idx_numero` (`numero` ASC),
  CONSTRAINT `FK_tbl_place_id_type_place`
    FOREIGN KEY (`id_type_place`)
    REFERENCES `bdstationnement`.`tbl_type_place` (`id_type_place`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdstationnement`.`tbl_type_place` (
  `id_type_place` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_place`),
  INDEX `idx_description` (`description` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



#######################################################################################################################################################
#Etape 2 Section DML - Insertion des données.

USE bdstationnement;
#######################################################################################################################################################

# table type de paiement
# Type paiement ( E = argents comptants, B = chèque, C = carte de crédit)
INSERT INTO tbl_type_paiement (nom_type_paiement) VALUES ("E"),("B"),("C");

#######################################################################################################################################################

# table type de personne
# Type de personne (P = personne physique et S = société)
INSERT INTO tbl_type_personne (nom_type_personne) VALUES ("P"),("S");

######################################################################################################################################################

# Table tarifs
# Type de tarifs 1 heure = 5$, 1 jour = 20$, 1 mois = 240$ et 1 an = 2500$
 INSERT INTO tbl_tarifs (type_temps, tarification) VALUES ("1 heure", 5), ("1 jour", 20), ("1 mois", 240), ("1 an", 2500);
 
 ######################################################################################################################################################
 
# table abonnes
# Inserer les donnees dans la table abonnes
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Wooten","Xandra","K6T 5C8","Geraldton-Greenough","1-258-835-3367","est.Nunc@Mauris.edu",2,1),("Kelley","Sarah","A4L 8X3","Morinville","1-457-303-1253","dapibus@rutrum.net",3,2),("Bridges","Maris","N8M 7C7","Cockburn","1-373-586-1129","primis.in@mattisornare.co.uk",2,1),("Bryan","Karina","C3J 5G0","Herenthout","1-686-166-8974","bibendum@mitempor.edu",1,1),("Blair","Ann","J3B 6P7","Ledbury","1-363-598-3873","pede@vulputateveliteu.net",1,1),("Clarke","Daria","N3Z 8A6","Norman","1-596-233-8072","consectetuer@tellusfaucibus.org",3,2),("Glover","Dale","T6P 5G3","Rishra","1-307-615-9202","nec.urna.suscipit@et.net",2,1),("Bowers","Winifred","M7X 6Z6","Boorsem","1-478-223-0150","Aenean.gravida@acfacilisis.net",1,1),("Roman","Baker","E7J 3Y2","San Valentino in Abruzzo Citeriore","1-535-206-2614","risus@euismodacfermentum.ca",3,2),("Randall","Tamekah","J5X 5X1","College","1-322-477-0052","vitae.erat.Vivamus@arcu.net",2,1);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Thomas","Signe","K0B 6S6","Orilla","1-880-154-7502","fermentum.metus.Aenean@dui.com",1,2),("Dawson","Xyla","E5R 3S6","Bègles","1-556-134-1653","sed@Nunclectuspede.org",1,2),("Berger","Jana","J5A 3W2","Haut-Ittre","1-936-936-7334","non@sollicitudinorcisem.co.uk",3,1),("Bennett","Jane","X7N 0H3","Kieldrecht","1-821-708-8341","ullamcorper@Etiam.org",3,1),("Moran","Illiana","G0A 8H3","Akhisar","1-334-446-7650","purus.Duis@parturientmontes.net",3,2),("Roberts","Halee","C9W 1K7","Caxias","1-956-989-5318","ac@risus.com",3,2),("Sloan","Cara","X0C 0Z5","Aklavik","1-647-132-5394","sed@nonquam.edu",3,1),("Booker","William","S4N 3W7","Sulzbach","1-827-949-8645","elit.Curabitur.sed@diamProin.com",2,2),("Lang","Janna","L9S 3M7","Sitapur","1-830-622-2005","Mauris.non@placerategetvenenatis.edu",3,2),("Bonner","Lareina","L6B 9R1","Rijkevorsel","1-423-563-0467","lectus.sit@Aeneanegetmagna.co.uk",2,1);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Daniel","Chadwick","N2X 5T1","Lower Hutt","1-697-654-6895","risus@orcilobortis.net",1,2),("Marshall","Melanie","C5X 8S2","Berwick","1-908-451-7991","auctor.ullamcorper.nisl@ornare.co.uk",1,1),("Boyd","Jakeem","B3M 8H3","Maranguape","1-518-550-5160","euismod.mauris.eu@pulvinararcu.com",3,1),("Perez","Aurora","V6H 2M2","Hereford","1-715-332-1607","et.magnis@ornareplacerat.net",1,2),("Mercado","Sonya","L0V 7B9","Pereto","1-731-841-2797","gravida@feugiatnecdiam.net",3,1),("Fletcher","Keiko","P2Y 5G1","Duisburg","1-903-118-2190","blandit.Nam@ipsumSuspendissesagittis.org",2,1),("Bauer","Ebony","J5V 6T5","Castelbuono","1-241-228-2006","fermentum@necquam.ca",3,2),("Palmer","Cara","G2J 8K3","Leominster","1-489-864-2839","eget.metus@malesuadafringilla.org",3,2),("Osborne","Iris","X2A 6P2","HomprŽ","1-447-165-2232","semper.auctor.Mauris@disparturientmontes.org",3,1),("Crawford","Clarke","N9W 7Y5","Lethbridge","1-893-830-6037","lacus.Nulla@fermentum.ca",2,2);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Walters","Charlotte","E4K 0E8","Vegreville","1-328-583-2802","et.netus@hendrerita.net",1,2),("Blake","Marcia","G6Z 1R3","Heppignies","1-986-187-7925","urna.Ut.tincidunt@pedeCumsociis.com",2,2),("Buck","Jessica","J3H 2E4","Baunatal","1-607-687-9855","adipiscing.ligula@rhoncusProinnisl.edu",2,2),("Garrison","Ava","K2N 3H7","Snaaskerke","1-768-517-2287","eleifend.vitae.erat@malesuada.net",2,1),("Mcmahon","Beatrice","X5V 3Y9","Tribogna","1-763-669-7698","Nulla.aliquet.Proin@eratSednunc.com",2,1),("Mack","Kirby","P6C 4N1","Newton Abbot","1-959-895-3442","vel@lacus.net",2,1),("Mills","Alfreda","X6V 0A1","Whitby","1-874-517-9344","mi.eleifend.egestas@tinciduntorci.edu",2,1),("Fox","Kitra","L8J 6T4","Gdańsk","1-941-387-3128","Phasellus.in@massarutrum.com",3,1),("Oneill","Amity","L4V 0E0","Frederick","1-844-249-2224","amet.consectetuer@disparturientmontes.org",2,1),("Guzman","Nichole","K7G 5H1","Boussu-lez-Walcourt","1-295-183-1597","mi.lorem.vehicula@vitae.ca",3,1);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Browning","Whoopi","G7S 0M5","Naro","1-700-300-0568","lacus@lacus.com",2,2),("Harrell","Theodore","V4C 4Y5","Villafranca d'Asti","1-364-233-7024","nec.ligula@elit.net",2,2),("Morin","Zorita","X7W 0E0","Wilmont","1-732-466-7025","Ut.nec@dignissimlacusAliquam.com",2,1),("Watts","Deacon","P8R 2J4","Olathe","1-352-239-2604","libero@porttitorscelerisqueneque.org",2,1),("Pollard","Ebony","A9Y 2X8","Betim","1-777-159-0883","ac@vitae.co.uk",1,1),("Jennings","Adria","T9C 9T2","Virginia Beach","1-391-668-0946","posuere@et.net",3,2),("Moses","Anika","S1S 9G3","Villenave-d'Ornon","1-472-121-1443","elit.pretium@enim.edu",2,2),("Fuller","Eleanor","N4C 9V7","Balfour","1-526-175-8773","pede.Praesent.eu@orcilobortisaugue.com",1,1),("Rodriguez","Suki","H8E 6Y5","Pumanque","1-960-508-8340","Ut@lectus.co.uk",2,1),("Finley","Tatyana","T3W 4X0","Mansfield","1-951-808-5654","arcu.et@augueSed.net",1,1);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Farmer","Isaiah","B6X 8E1","Putre","1-716-511-7527","rutrum.magna@sitamet.net",3,2),("Reilly","Kyra","J9Y 1P6","Vilvoorde","1-806-982-6460","eros@Aliquamgravida.com",3,1),("Tanner","Fuller","K2E 0B2","Baie-Comeau","1-411-874-8717","Aenean@enim.edu",2,1),("Stephens","Xantha","N4Z 1W0","Zirl","1-215-415-9351","leo.Vivamus@luctussitamet.com",1,1),("Rios","Kyra","S8Y 1L0","Mantova","1-461-578-3215","at.velit@Nuncsollicitudincommodo.co.uk",2,2),("Melendez","Mannix","B1B 0T6","São Gonçalo","1-319-519-5887","Maecenas@ultrices.org",3,1),("Hobbs","Marah","N9S 3E2","Cherain","1-643-243-7397","Donec.tempor.est@dignissim.com",3,2),("Hays","Imelda","Y1H 1S5","Fratta Todina","1-979-417-4575","ad.litora.torquent@dignissimMaecenas.edu",2,2),("Crosby","Wilma","A4L 5A3","Cavaion Veronese","1-591-135-1957","faucibus.orci.luctus@luctus.co.uk",2,2),("Rasmussen","Dorothy","H2A 7J7","Port Hope","1-675-741-1156","dictum@Etiamligulatortor.ca",3,2);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("English","Idona","S7N 6M8","Kendal","1-535-423-2754","vehicula.et.rutrum@euplacerateget.co.uk",1,2),("Hubbard","Hadassah","V6V 3G1","Jasper","1-765-222-6272","Ut@luctus.edu",2,1),("Navarro","Cain","V5T 5J7","Leverkusen","1-256-969-6535","Phasellus.ornare.Fusce@consectetuer.edu",2,1),("Sharp","Jelani","L9V 2G3","Huntsville","1-865-575-8738","non.lobortis.quis@dolorNullasemper.com",3,2),("Landry","Rachel","M5P 4L9","Penicuik","1-377-979-0533","auctor.quis.tristique@CurabiturmassaVestibulum.org",2,2),("Bridges","Larissa","P2Z 1J5","Montebelluna","1-873-902-0081","magnis.dis.parturient@infelis.net",3,2),("Stephens","Orson","K4J 6J2","Rixensart","1-367-159-5756","sapien.gravida@liberoduinec.ca",1,1),("Morrison","Austin","P1W 2R3","Montefiore dell'Aso","1-728-438-8025","Proin.vel.nisl@massaMaurisvestibulum.ca",2,2),("Trevino","Ulla","N2X 5J1","Istres","1-217-505-3964","mus.Donec@quamquisdiam.ca",3,2),("Barlow","Emi","Y2C 9G8","Castelbuono","1-622-794-8579","sodales.purus.in@malesuadaid.org",3,2);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Hodge","Beverly","S7P 0C8","Maracanaú","1-828-881-6834","metus.Aenean@aliquetodioEtiam.net",1,1),("Sears","Ashely","K1L 5W4","North Saanich","1-206-743-7674","est.Nunc@rutrumjusto.ca",1,1),("Wade","Mufutau","E9P 1J2","Kapfenberg","1-252-805-3145","nunc.In.at@In.co.uk",3,2),("Spence","Shad","Y0E 0J5","Cobquecura","1-301-186-5408","pede.nec.ante@egetvenenatis.co.uk",2,2),("Stevenson","Kerry","H5A 1E9","Tumba","1-254-629-4778","sem.egestas@condimentum.edu",2,2),("Mckay","Germaine","N0K 5B5","Banff","1-110-870-8564","nisi@blanditmattisCras.co.uk",3,1),("Battle","Gary","B8T 6P7","Bahraich","1-902-250-7203","sed@VivamusrhoncusDonec.ca",3,2),("Potter","Halee","J3L 1N9","Lauder","1-617-489-2245","Nam@lacuspedesagittis.edu",2,2),("Morrow","Chelsea","R5W 4B0","Bruck an der Mur","1-285-385-1077","hendrerit@nibh.com",2,1),("Burris","Carol","C3V 3P3","Licantén","1-190-856-9205","quam.dignissim.pharetra@metus.edu",3,1);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Holder","Derek","P2H 2A7","Casnate con Bernate","1-679-786-5571","ornare.libero.at@pede.co.uk",1,1),("Mcclain","Sybill","T0R 1R9","Anand","1-208-997-2402","Suspendisse.ac@euismodmauris.edu",1,1),("Britt","Jennifer","N3Z 0A4","Bodmin","1-455-620-5944","Etiam.vestibulum@leoelementum.ca",3,2),("Simon","Sacha","N9T 5N4","Wierde","1-931-522-8623","morbi.tristique@malesuada.ca",1,2),("Kirkland","Oprah","K1A 1J6","Susegana","1-798-951-4097","Nam@adipiscingelitCurabitur.ca",1,1),("Parker","Benedict","C0V 5Z8","Vitrolles","1-369-803-9017","condimentum@loremlorem.edu",2,1),("Giles","Oscar","K4L 6E2","Caccamo","1-385-431-9799","dui@pretium.co.uk",1,2),("Fields","Eaton","E8L 6B1","Batiscan","1-777-813-2208","sodales.purus@eueros.edu",1,2),("Mcgee","Autumn","C6H 8G7","Batiscan","1-892-819-2681","semper@loremeumetus.edu",1,2),("Russo","Kasimir","Y6J 2A3","Tay","1-946-859-7831","ante.dictum@rutrumjustoPraesent.ca",3,1);
INSERT INTO tbl_abonnes (nom,prenom,code_postal,ville,telephone,courriel,id_type_paiement,id_type_personne) VALUES ("Garrison","Odessa","B0J 3V9","St. Clears","1-149-118-4099","arcu@eteuismod.org",3,1),("Gordon","Colorado","T9Y 0C8","Salt Spring Island","1-481-640-5677","tellus.sem@ornareplaceratorci.ca",1,2),("Pace","Nicholas","E4X 6N1","Qu�bec City","1-886-505-2438","Cras@nequenon.net",2,2),("Cooper","Beatrice","J2L 4S6","Berwick","1-420-533-1288","dui.augue@arcuacorci.com",1,1),("Hoover","Herman","G8Y 6R9","Francavilla Fontana","1-334-788-1411","ante@sed.ca",2,1),("Allison","Calista","C8M 0Z3","Recife","1-594-151-6713","erat.in.consectetuer@Loremipsum.com",3,2),("Nieves","Angela","V1M 8A5","Corswarem","1-446-139-9145","non.sapien@aliquamarcu.net",2,1),("Cotton","Casey","H9N 1M5","Waarmaarde","1-819-395-1124","neque.et@euodiotristique.com",1,1),("Alford","Ainsley","X1V 6N8","Achalpur","1-684-625-5605","placerat@pharetra.co.uk",3,1),("Winters","Owen","E5E 2W5","Ussassai","1-450-190-2254","elementum.sem@cursuset.ca",2,1);


#########################################################################################################################################################

# table type de place
# Type de place  Plein air, couvert niveau 1, couvert niveau 2, couvert niveau 3, couvert niveau 4 et couvert niveau 5
INSERT INTO tbl_type_place (description) VALUES ("plein air"),("couvert niveau 1"), ("couvert niveau 2"),("couvert niveau 3"),("couvert niveau 4"),("couvert niveau 5");

#######################################################################################################################################################
# Procedure pour remplir la table places
# Elle prend en parametre un entier (le nombre de place)
# et la reparti comme suit
# 500 places pour plein air
# 400 places pour couvert niveau 1
# 400 places pour couvert niveau 2
# 400 places pour couvert niveau 3
# 400 places pour couvert niveau 4
# 400 places pour couvert niveau 5
########################################################################################################################################################

#Etape 3 Section programmabilitée.

#######################################################################################################################################################
DROP PROCEDURE IF EXISTS remplir_place;
DELIMITER $
CREATE PROCEDURE remplir_place(in p_NombrePlace int)
BEGIN

   #Declaration des variables
   DECLARE v_i int default 1;
	 
   # Gestion d'erreur
   IF p_NombrePlace <= 0 or p_NombrePlace > 2500 THEN
	  SELECT 'Le nombre de place ne doit pas etre inferieur a 0 ni superieur a 2500' 
      AS Erreur;
   ELSE


     #boucle qui remplir les champs des de la table places (2500 places)
     WHILE v_i <= p_NombrePlace DO

		#remplir les champs des places plein air (500 places)
        IF v_i <= 500 THEN
             INSERT INTO tbl_place (numero, id_type_place) VALUES (v_i, 1);
             SET v_i = v_i + 1 ;
        END IF;

        #remplir les champs des places couvert niveau 1 (400 places)
        IF v_i > 500 and v_i <= 900 THEN
           INSERT INTO tbl_place (numero, id_type_place) VALUES (v_i, 2);
           SET v_i = v_i + 1 ;
        END IF;
      
        #remplir les champs des places couvert niveau 2 (400 places)
	    IF v_i > 900 and v_i <= 1300 THEN
           INSERT INTO tbl_place (numero, id_type_place) VALUES (v_i, 3);
           SET v_i = v_i + 1 ;
        END IF;
      
        #remplir les champs des places couvert niveau 3 (400 places)
		IF v_i > 1300 and v_i <= 1700 THEN
           INSERT INTO tbl_place (numero, id_type_place) VALUES (v_i, 4);
		   SET v_i = v_i + 1 ;
        END IF;
      
        #remplir les champs des places couvert niveau 4 (400 places)
	    IF v_i > 1700 and v_i <= 2100 THEN
           INSERT INTO tbl_place (numero, id_type_place) VALUES (v_i, 5);
           SET v_i = v_i + 1 ;
        END IF;
      
        #remplir les champs des places couvert niveau 5 (400 places)
	    IF v_i > 2100 and v_i <= p_NombrePlace THEN
           INSERT INTO tbl_place (numero, id_type_place) VALUES (v_i, 6);
           SET v_i = v_i + 1 ;
        END IF;
     END WHILE;
     
     SELECT  'Places correctement enregistré' AS message ;
  END IF;
END $
DELIMITER ;

#######################################################################################################################################################
#Appel de la procedure remplir_place qui prend en parametre 2500 et remplir la table
call remplir_place(2500);
select * from tbl_place;
#######################################################################################################################################################

#table vehicule
# Inserer les donnes dans la table vehicule
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("H2Z 6D8","Nissan","violet",1),("I1N 6L1","Hyundai Motors","vert",2),("O7Q 8M9","JLR","rouge",3),("K6D 0T6","Buick","rouge",4),("S3U 7L9","Volvo","vert",5),("H5G 8T2","Volkswagen","vert",6),("Q7V 5U4","Nissan","rouge",7),("Z9D 0J8","Dongfeng Motor","indigo",8),("I1B 2A8","Audi","orange",9),("W5D 0A5","Kenworth","orange",10);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("L7G 9C7","Daimler","bleu",11),("F0X 7B7","Seat","vert",12),("Z0Z 0Z4","Daimler","vert",13),("Q3L 8S9","Chrysler","rouge",14),("S5H 1R3","Skoda","rouge",15),("D2D 6A6","Jeep","vert",16),("Z5B 9E5","Isuzu","orange",17),("I2B 0U6","Buick","indigo",18),("W6W 6O0","RAM Trucks","jaune",19),("E6L 8S0","Dodge","orange",20);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("J8S 7R4","Honda","bleu",21),("D4R 1Y4","Vauxhall","vert",22),("Z6G 6T9","Mitsubishi Motors","vert",23),("G3Z 0F5","Kenworth","jaune",24),("H7O 4G9","Daihatsu","jaune",25),("D7K 8Y7","Ford","rouge",26),("R9Q 1A7","Kenworth","jaune",27),("T4O 2B3","Subaru","indigo",28),("A2M 2F2","Jeep","indigo",29),("C9Y 7L2","Volvo","bleu",30);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("T3V 0P0","Smart","jaune",31),("E8M 0G0","Peugeot","indigo",32),("C9S 5T8","Skoda","bleu",33),("G1B 3D8","Toyota","rouge",34),("L8Z 9D7","Vauxhall","indigo",35),("K3Q 6H7","Buick","vert",36),("C7V 7G2","Chrysler","violet",37),("T2N 6N7","Nissan","violet",38),("B5N 9X8","Honda","indigo",39),("T1Y 9L0","Mazda","violet",40);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("D7X 1Y9","Skoda","vert",41),("Y2K 3B2","Mazda","jaune",42),("L2S 4E1","Honda","vert",43),("Y4M 0X8","Audi","rouge",44),("M3Y 7T7","JLR","bleu",45),("E2Q 7K2","Daihatsu","jaune",46),("W5P 2R6","Hyundai Motors","bleu",47),("O5F 4M4","BMW","violet",48),("R5G 3Y2","Jeep","rouge",49),("K6I 5Y2","Daihatsu","rouge",50);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("O3N 5W7","Mercedes-Benz","jaune",51),("A0A 8Y4","Isuzu","vert",52),("Y7J 0D4","FAW","vert",53),("G5Z 0O5","Seat","orange",54),("N3M 1U7","Lexus","orange",55),("B0V 0A5","Mazda","violet",56),("G2H 2D8","GMC","bleu",57),("R5Y 2U7","Porsche","rouge",58),("G3V 1T2","Hyundai Motors","rouge",59),("X6J 8E6","Smart","vert",60);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("K2K 6P4","Subaru","violet",61),("Q0H 8B7","Tata Motors","indigo",62),("T1S 1Z7","Cadillac","rouge",63),("W0T 4C5","Infiniti","indigo",64),("B2M 5Q4","Dongfeng Motor","orange",65),("X1R 0Q3","Buick","vert",66),("I0O 0I3","Ford","bleu",67),("F7V 3U9","Fiat","violet",68),("Q0T 9X0","Chevrolet","vert",69),("C0W 6E2","Mahindra and Mahindra","indigo",70);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("J4E 8Z1","Jeep","jaune",71),("U8R 1Q6","Renault","bleu",72),("B5R 9H0","Fiat","rouge",73),("F6O 3C9","Maruti Suzuki","jaune",74),("Q2Z 0G1","Daimler","orange",75),("C5V 6K7","Lincoln","jaune",76),("Q9S 0D8","Isuzu","jaune",77),("I7Q 2C1","Maruti Suzuki","violet",78),("H9R 3Z5","Tata Motors","orange",79),("U1T 6H9","Dongfeng Motor","violet",80);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("D1Y 7S1","Buick","violet",81),("H5C 4F8","Seat","jaune",82),("Z7G 2C0","Chrysler","indigo",83),("F0O 6P9","FAW","violet",84),("K6Z 0S7","General Motors","violet",85),("W3M 4G7","Dodge","bleu",86),("W5B 3I1","Subaru","bleu",87),("Q1F 7A7","Mazda","rouge",88),("J2H 2N9","Daihatsu","indigo",89),("L5R 1P4","Mitsubishi Motors","bleu",90);
INSERT INTO tbl_vehicule (no_plaque,modele,couleur,id_place) VALUES ("U6R 1T2","Maruti Suzuki","rouge",91),("Q5T 5B9","Kia Motors","vert",92),("M3T 9C2","Smart","jaune",93),("Z3V 6G2","Smart","bleu",94),("R8O 1F2","Cadillac","orange",95),("O4X 5L7","Seat","indigo",96),("S6A 9X4","GMC","indigo",97),("D8P 6F4","Isuzu","indigo",98),("S2C 3M9","Lincoln","rouge",99),("Y8C 6A0","Jeep","violet",100);


#######################################################################################################################################################
# Procedure pour ajoute un abonnement dans la table
# Elle prend en parametre la duree en entier (MOIS) 
# Le numero de la carte de credit en varchar 
# L'id d'abonne et l'id du vehicule en entier
#######################################################################################################################################################
DROP PROCEDURE IF EXISTS ajouter_abonnement;
DELIMITER $
CREATE PROCEDURE ajouter_abonnement
(in p_duree int, in p_NoCarteCredit varchar(25), in p_idAbonne int , in p_idVehicule int)
BEGIN

	DECLARE v_mois int;
	DECLARE v_annee int;
	DECLARE v_resteModulo int;
          
	SELECT tarification FROM tbl_tarifs where id_tarifs = 3 into v_mois;
	SELECT tarification FROM tbl_tarifs where id_tarifs = 4 into v_annee;
	SET v_resteModulo = p_duree % 12;
	
   # Gestion d'erreur
   IF p_duree <= 0 or CHAR_LENGTH(p_NoCarteCredit) < 19 # 19 represente le nombre caractere de la carte de credit 
   or p_idAbonne <= 0 or p_idVehicule <= 0 THEN
	      SELECT 'La duree ne doit pas etre inferieur ou egale a 0' 
          UNION
		  SELECT 'Le numero de carte de credit ne doit pas etre null' 
          UNION
          SELECT 'L\'id d\'abonne ne doit pas etre inferieur ou egale a 0' 
          UNION
          SELECT 'L\'id du vehicule ne doit pas etre inferieur ou egale a 0' 
          AS Erreur;
   ELSE
   
		  IF (p_duree - v_resteModulo) % 12 = 0 THEN
          INSERT INTO tbl_abonnements (date_debut, date_fin, montant_paye, 
          no_carte_credit, id_abonne, id_vehicule, id_tarifs) 
	      VALUES (CURDATE(), DATE_ADD( CURDATE() , INTERVAL p_duree MONTH), 
          ((p_duree - v_resteModulo) /12) * v_annee + (v_resteModulo * v_mois), 
          p_NoCarteCredit, p_idAbonne, p_idVehicule, 4);
         
          ELSE 
          INSERT INTO tbl_abonnements (date_debut, date_fin, montant_paye, 
          no_carte_credit, id_abonne, id_vehicule, id_tarifs) 
	      VALUES (CURDATE(), DATE_ADD( CURDATE() , INTERVAL p_duree MONTH), 
          p_duree * v_mois, p_NoCarteCredit, p_idAbonne, p_idVehicule, 3);
          END IF;
          
          SELECT  'Abonnement correctement enregistré' AS message ;
    END IF;              
END $
DELIMITER ;




#######################################################################################################################################################

# Creation d'un trigger sur la table abonnement (JPD ? Table occasionnels)
# Ce trigger declenchera insertion d'un numero automatique
# lorsqu'on vehicule occasionels entre 
DROP TRIGGER IF EXISTS before_insert_tbl_occasionnels
DELIMITER $
    CREATE TRIGGER before_insert_tbl_occasionnels
    BEFORE INSERT on bdstationnement.tbl_occasionnels
    FOR EACH ROW
    
    BEGIN
		DECLARE v_compteur int(2) UNSIGNED ZEROFILL;
        SELECT COUNT(*) from tbl_occasionnels into v_compteur;
        SET v_compteur = v_compteur + 1;
		IF NEW.No_automatique IS NULL THEN
                SET NEW.No_automatique = concat(DATE_FORMAT(curdate() , '%Y%m%d' ) , v_compteur);
		END IF ;
    END $
DELIMITER ; 

#######################################################################################################################################################
# Procedure pour ajoute un abonnement dans la table (JPD ? un occasionnels)
# Elle ne prend aucun parametre juste la date presente est insere dans la table occasionnels 
DROP PROCEDURE IF EXISTS entre_occasionnels;
DELIMITER $
CREATE PROCEDURE entre_occasionnels()
BEGIN
	  INSERT INTO tbl_occasionnels (date_debut) 
	  VALUES (NOW());
      SELECT  'Entre occasionnels correctement enregistré' AS message ;
         
END $
DELIMITER ;




########################################################################################################################################################

# Procedure pour ajoute un abonnement dans la table (JPD vous avons de la difficulté avec Abonné et occasionnel)
# Elle prend en parametre une duree en entier (HEURE) et le type de paiement 
# 1 = Argents comptants
# 2 = Chèque
# 3 = Carte de crédit
########################################################################################################################################################
DROP PROCEDURE IF EXISTS sortie_occasionnels;
DELIMITER $
CREATE PROCEDURE sortie_occasionnels
(in p_nomeroAutomatique varchar(50), in p_tarifs int, in p_type_paiement int)
BEGIN
     
   # Gestion d'erreur
   # 10 nombre de caractere dans numero automatique
   IF CHAR_LENGTH(p_nomeroAutomatique) < 10 or p_tarifs <= 0 or p_type_paiement <= 0 THEN
		  SELECT 'Le numero automatique ne doit pas etre null' 
          UNION
          SELECT 'Le tarif ne doit pas etre inferieur ou egale a 0' 
          UNION
          SELECT 'Le type de paiement ne doit pas etre inferieur ou egale a 0' 
          AS Erreur;
   ELSE 
    
        UPDATE tbl_occasionnels
        SET date_fin = NOW() , 
		montant_paye = calculer_montant(p_nomeroAutomatique),
        id_tarifs = p_tarifs,
        id_type_paiement = p_type_paiement
        WHERE No_automatique = p_nomeroAutomatique;
      
        SELECT  'Sortie occasionnels correctement enregistré' AS message ;
    END IF;
END $
DELIMITER ;


#######################################################################################################################################################
# Creation d'un trigger sur la table abonnement
# Ce trigger declenchera insertion du montant a paye et le id tarifs
# apres l'insertion dans la table 
#######################################################################################################################################################
DROP FUNCTION IF EXISTS calculer_montant
DELIMITER $
    CREATE FUNCTION calculer_montant(p_nomeroAutomatique varchar(50))
    RETURNS DECIMAL
       
    BEGIN
          DECLARE v_duree int;
          DECLARE v_montant int;
          DECLARE v_date_debut datetime;
          DECLARE v_resteModulo int;
       
          select date_debut into v_date_debut  
          from  tbl_occasionnels where No_automatique = p_nomeroAutomatique;


		  SET v_duree = TIMESTAMPDIFF(hour, v_date_debut, now());
          SET v_resteModulo = v_duree % 24;

				
		  IF (v_duree - v_resteModulo) % 24 = 0 THEN
				 SET v_montant = (((v_duree - v_resteModulo) / 24) * 20) + (v_resteModulo * 5) ;
		  ELSE 
				 SET v_montant = v_duree * 5;
		  END IF;
          
          RETURN v_montant;

    END $
DELIMITER ; 




#######################################################################################################################################################
# Les besions
#1. L’entreprise souhaite pouvoir savoir quelles sont les places occupées par des abonnements à tout moment.
#— Ce moment doit être déterminé par une date passé en paramètre.
#— La tableau renvoyé doit comporter les informations suivantes : Place, véhicule, date début, date fin, et un nombre total.
#######################################################################################################################################################


#Fonction qui prends en parametre une date et retourne un tableau comportant  
# la place, le véhicule, la date début, la date fin, et un nombre total
DROP PROCEDURE IF EXISTS places_occupes;
DELIMITER $
CREATE PROCEDURE places_occupes(p_date date)
	BEGIN
	      # Gestion de l'erreur 
          IF CHAR_LENGTH(p_date) < 10 THEN # 10 nombre de caractere dans date
		      SELECT 'La date ne doit pas etre null' 
              AS Erreur;
          ELSE
              select tbl_place.numero as 'Numero de place', tbl_vehicule.no_plaque as 'Plaque vehicule', 
              tbl_abonnements.date_debut, tbl_abonnements.date_fin, count(tbl_place.numero) as 'Nombre total'
              from tbl_abonnements
              inner join tbl_vehicule
              on tbl_abonnements.id_vehicule = tbl_vehicule.id_vehicule
              inner join tbl_place
              on tbl_vehicule.id_place = tbl_place.id_place
              where p_date >= tbl_abonnements.date_debut and p_date <= tbl_abonnements.date_fin 
              group by tbl_place.numero , tbl_vehicule.no_plaque , 
              tbl_abonnements.date_debut, tbl_abonnements.date_fin;
          END IF;
    END$
DELIMITER ; 



#######################################################################################################################################################
#2 Elle souhaite pouvoir afficher sur un panneau à l’entrée du stationnement, et ce, en permanence,
#le nombre de places disponibles au niveau des stationnements en plein air et des stationnements couverts.
# — Il faut que les valeurs soient mise à jour dès l’inscription d’un nouveau véhicule et la sortie d’un véhicule.
# — Les places réservé aux abonnés ne doivent pas être disponible.
#######################################################################################################################################################
# La fonction compte et retourne en entier du nombre de place qu'occupe les occasionnels dans le stationnement
DROP FUNCTION IF EXISTS nombre_occasionnels;
DELIMITER $
CREATE FUNCTION nombre_occasionnels()
RETURNS int(11)
	BEGIN
          DECLARE v_valeur int;
          DECLARE v_nbOccassionels int;
          
          #Compte les occassionnels present dans le stationnement
		  SELECT COUNT(id_occasionnels) from tbl_occasionnels 
          WHERE tbl_occasionnels.date_fin is null
          INTO v_nbOccassionels;
          

          #Retourne les places occupees
		  SET v_valeur = v_nbOccassionels ;

	RETURN v_valeur;

    END$
    DELIMITER ; 



#######################################################################################################################################################

#Fonction qui compte et retourne en entier du nombre de place qu'occupe les abonnes dans le stationnement
DROP FUNCTION IF EXISTS nombre_abonnes;
DELIMITER $
CREATE FUNCTION nombre_abonnes()
RETURNS int(11)
	BEGIN
          DECLARE v_valeur int;
          DECLARE v_nbAbonnes int;
          
          #Compte les abonnes donc la date de fin est superieur a la date actuel
		  SELECT COUNT(id_abonnement) from tbl_abonnements 
          WHERE tbl_abonnements.date_fin >= now()
          INTO v_nbAbonnes;
          

          #Retourne les places occupees
		  SET v_valeur = v_nbAbonnes ;

	RETURN v_valeur;

    END$
DELIMITER ; 

-- JPD Sans test, vos procédure ne vaux rien chez un client. Si vous n'avez pas eu le temps il faut le préciser.
-- Test par JPD:
select nombre_abonnes();
-- La tableau renvoyé doit comporter les informations suivantes : Place, véhicule, date début, date fin, et un nombre total.
-- 3 sur 10
#######################################################################################################################################################
#2 La procedure affiche le nombre de place total presentement disponible dans le stationnement
DROP PROCEDURE IF EXISTS panneau_affichage;
DELIMITER $
CREATE PROCEDURE panneau_affichage()
BEGIN    
    #Soustrait du total des places, les places occupees par les abonnes et occasionnels
    DECLARE v_placeDisponible int;
    
    SET v_placeDisponible = 2500 - (nombre_abonnes() + nombre_occasionnels());
    
    select v_placeDisponible as 'Nombre de place disponible';

END$
DELIMITER ;


#######################################################################################################################################################
#3. Elle souhaite aussi obtenir les totaux des montants par carte de crédit et en argent comptant par
#jour pour contrôler ses dépôts en banque. Donc ces montants comportent les abonnements et les occasionnels.
# E = argents comptants, B = chèque, C = carte de crédit
#######################################################################################################################################################
DROP PROCEDURE IF EXISTS montant_abonne;
DELIMITER $
CREATE PROCEDURE montant_abonne()
BEGIN  


     select nom_type_paiement as 'Type de paiement', sum(montant_paye)  as Total
     from tbl_abonnements
     inner join tbl_abonnes
     on tbl_abonnements.id_abonne = tbl_abonnes.id_abonne
     inner join tbl_type_paiement
     on tbl_abonnes.id_type_paiement = tbl_type_paiement.id_type_paiement
     where nom_type_paiement = 'E'
     
     union
     
	 select nom_type_paiement as 'Type de paiement', sum(montant_paye) as Total 
     from tbl_abonnements
     inner join tbl_abonnes
     on tbl_abonnements.id_abonne = tbl_abonnes.id_abonne
     inner join tbl_type_paiement
     on tbl_abonnes.id_type_paiement = tbl_type_paiement.id_type_paiement
     where nom_type_paiement = 'C';
     
	
END$
DELIMITER ;
#######################################################################################################################################################

DROP PROCEDURE IF EXISTS montant_occasionnel;
DELIMITER $
CREATE PROCEDURE montant_occasionnel()
BEGIN  

	 select nom_type_paiement as 'Type de paiement', sum(montant_paye) as Total
     from tbl_occasionnels
     inner join tbl_type_paiement
     on tbl_occasionnels.id_type_paiement = tbl_type_paiement.id_type_paiement
     where nom_type_paiement = 'E' 
     
     union
     
	 select nom_type_paiement as 'Type de paiement', sum(montant_paye) as Total
     from tbl_occasionnels
     inner join tbl_type_paiement
     on tbl_occasionnels.id_type_paiement = tbl_type_paiement.id_type_paiement
     where nom_type_paiement = 'C' ;

     
END$
DELIMITER ;


#######################################################################################################################################################
# 4. De plus, elle souhaite avoir une procédure qui donne la ventilation dans un tableau des sommes
# perçues par type de personne (physique ou société), les véhicules occasionnels. Ce moment doit
# être déterminé par une date de début et de fin passées en paramètre.
# Voici un exemple du tableau renvoyé :
######################################################################################################################################################
DROP PROCEDURE IF EXISTS ventillation_occasionnel;
DELIMITER $
CREATE PROCEDURE ventillation_occasionnel()
BEGIN  

	 select count(id_occasionnels) as nombre, sum(montant_paye) as somme
     from tbl_occasionnels;

END$
DELIMITER ;

#########################################################################################################################################################
DROP PROCEDURE IF EXISTS ventillation_abonne;
DELIMITER $
CREATE PROCEDURE ventillation_abonne()
BEGIN  

	 select nom_type_personne, count(*) as nombre, sum(montant_paye) as somme
     from tbl_abonnements
     inner join tbl_abonnes
     on tbl_abonnements.id_abonne = tbl_abonnes.id_abonne
     inner join tbl_type_personne
     on tbl_abonnes.id_type_personne = tbl_type_personne.id_type_personne
     where nom_type_personne = 'P'
     
     union 
     
	 select nom_type_personne, count(*) as nombre, sum(montant_paye) as somme
     from tbl_abonnements
     inner join tbl_abonnes
     on tbl_abonnements.id_abonne = tbl_abonnes.id_abonne
     inner join tbl_type_personne
     on tbl_abonnes.id_type_personne = tbl_type_personne.id_type_personne
     where nom_type_personne = 'S';
  
END$
DELIMITER ;





############################################################################################################################################################
# Section TEST UNITAIRE

#Occasionnels
# 1 - Au depart le staionnement a 2500 places de disponible 
call panneau_affichage();


# 2 - je vais entre 5 vehicules occasionnel dans le stationnment
call entre_occasionnels();   # vehicule 1
call entre_occasionnels();   # vehicule 2
call entre_occasionnels();   # vehicule 3
call entre_occasionnels();   # vehicule 4
call entre_occasionnels();   # vehicule 5


# 3 - le panneau d'affichage se reduit de 5 places
call panneau_affichage();



# 4 - Je fais sortir les 5 vehicules occasionnales  a des heure differentes 
# chaque vehicule a la sortie prend en paramentre un numero automatique genere automatiquement, 
# son tarif et son type de paiement sont prit en paramentre.
# concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'01') est la concatenation du numero automatique pour faire le text
# Je modifie la date d'entree a une date passe pour mon test
# Type de Paiment (1 = argents comptants, 2 = chèque, 3 = carte de crédit)
# Tarif (1 = 1 Heure, 2 = 1 Jour)

########################## Sortie 1 Vehicule occasionnel ################################
# Pour 4 heure il doit payer 20.00$
update tbl_occasionnels
set date_debut = DATE_SUB(now() , INTERVAL 4 hour)  
where No_automatique = concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'01');

# j'appele la procedure sortie pour faire la sortie du vehicure
call sortie_occasionnels(concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'01'),1,1);

# Le panneau d'affichage augmente d'une place
call panneau_affichage();
select * from tbl_occasionnels;
##########################################################################################

########################## Sortie 2 Vehicule occasionnel ################################
# Pour 10 heure il doit payer 50.00$
update tbl_occasionnels
set date_debut = DATE_SUB(now() , INTERVAL 10 hour)  
where No_automatique = concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'02');

# j'appele la procedure sortie pour faire la sortie du vehicure
call sortie_occasionnels(concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'02'),1,2);

# Le panneau d'affichage augmente d'une place
call panneau_affichage();
select * from tbl_occasionnels;
##########################################################################################


########################## Sortie 3 Vehicule occasionnel ################################
# Pour 1 heure il doit payer 5.00$
update tbl_occasionnels
set date_debut = DATE_SUB(now() , INTERVAL 1 hour)  
where No_automatique = concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'03');

# j'appele la procedure sortie pour faire la sortie du vehicure
call sortie_occasionnels(concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'03'),1,3);

# Le panneau d'affichage augmente d'une place
call panneau_affichage();
select * from tbl_occasionnels;
##########################################################################################


########################## Sortie 4 Vehicule occasionnel ################################
# Pour 24 heures il doit payer la journee 20.00$
update tbl_occasionnels
set date_debut = DATE_SUB(now() , INTERVAL 24 hour) 
where No_automatique = concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'04');

# j'appele la procedure sortie pour faire la sortie du vehicure
call sortie_occasionnels(concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'04'),2,1);

# Le panneau d'affichage augmente d'une place
call panneau_affichage();
select * from tbl_occasionnels;
##########################################################################################


########################## Sortie 5 Vehicule occasionnel ################################
# Pour 25 heures il doit payer 1 jour et une heure 25.00$
update tbl_occasionnels
set date_debut = DATE_SUB(now() , INTERVAL 25 hour)  
where No_automatique = concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'05');

# j'appele la procedure sortie pour faire la sortie du vehicure
call sortie_occasionnels(concat(DATE_FORMAT(curdate() , '%Y%m%d' ),'05'),2,3);

# Le panneau d'affichage augmente d'une place
call panneau_affichage();
select * from tbl_occasionnels;
##########################################################################################

# 5 - Abonnes
# Ajout de 13 abonnements
# Chaque abonnement prend en parametre la duree en mois, le numero de la carte de credit
# iD du de l'abonne et iD du vehicule
# les abonnements sont faite en date presente
# Pour le test les dates seront modifiees pour 
call ajouter_abonnement (4, "5543-9860-7568-4566", 1, 9);     # 1 abonnement
call ajouter_abonnement(15, "1111-2222-3333-4444", 76, 89);   # 2 abonnement
call ajouter_abonnement(12, "4321-4321-4321-4321", 100, 78);  # 3 abonnement
call ajouter_abonnement(5, "9876-5432-0987-6543", 86, 9);     # 4 abonnement
call ajouter_abonnement(14, "9999-8888-7777-6666", 55, 76);   # 5 abonnement
call ajouter_abonnement(8, "1122-3344-4455-6677", 65, 1);     # 6 abonnement
call ajouter_abonnement(24, "8765-6788-1265-1764", 100, 6);   # 7 abonnement
call ajouter_abonnement(1, "1654-1764-1874-1874", 1, 80);     # 8 abonnement
call ajouter_abonnement(12, "1245-1265-1287-8734", 69, 54);   # 9 abonnement
call ajouter_abonnement(7, "1265-1654-1654-1654", 10, 60);    # 10 abonnement
call ajouter_abonnement(10, "1394-1266-1759-8734", 70, 4);    # 11 abonnement
call ajouter_abonnement(2, "1276-1764-1764-8734", 89, 98);    # 12 abonnement
call ajouter_abonnement(3, "1765-1764-1874-8734", 4, 47);     # 13 abonnement


# 6 - Verification du panneau d'affichage (13 places occupe)
call panneau_affichage();
# Verification de la table abonnement
select * from tbl_abonnements;
################################################################################################



# 7 - Je modifier les 3 premier abonnements pour faire des test sur les fin d'abonnement 
################# Abonnement 1 #################################################################
# 4 mois 
update tbl_abonnements
set date_debut = DATE_SUB(curdate() , INTERVAL 5 month) , 
date_fin = DATE_SUB(curdate() , INTERVAL 1 month),       
montant_paye = 4 * 240
where id_abonnement = 1;

# Appel du panneau d'affichage
call panneau_affichage();
################################################################################################

################# Abonnement 2 #################################################################
# 15 mois = 1 an et 3 mois
update tbl_abonnements
set date_debut = DATE_SUB(curdate() , INTERVAL 12 month) , 
date_fin = curdate(),                                      
montant_paye = 2500 + (3 * 240)
where id_abonnement = 2;

# Appel du panneau d'affichage
call panneau_affichage();
################################################################################################

################# Abonnement 3 #################################################################
# 12 mois = 1 an
update tbl_abonnements
set date_debut = DATE_SUB(curdate() , INTERVAL 3 month) , 
date_fin = DATE_SUB(curdate() , INTERVAL 1 month),        
montant_paye = 2500
where id_abonnement = 3;

# Appel du panneau d'affichage
call panneau_affichage();
################################################################################################


# 8 - Test place occupe pas les abonnes en date passe en parametre
call places_occupes(DATE_SUB(CURDATE() , INTERVAL 1 month) );
call places_occupes(DATE_ADD(CURDATE() , INTERVAL 4 month) );

call places_occupes(DATE_SUB(CURDATE() , INTERVAL 5 month) );
call places_occupes(DATE_ADD(CURDATE() , INTERVAL 10 month) );

call places_occupes(DATE_SUB(CURDATE() , INTERVAL 10 month) );
call places_occupes(DATE_ADD(CURDATE() , INTERVAL 12 month) );

-- JPD Sommes nous dans une nouvelles section ? Besoin 3 

# 9 - montant total des abonnes
# E = argents comptants, B = chèque, C = carte de crédit
call montant_abonne();
-- JPD C'est pour quand ? Les libéllés aurait du être modifié par professionaliste.

# montant total des occasionnels
call montant_occasionnel();
-- JPD Une requête unions ou l'insertion dans une table temporaire aurait êté facile pour faire juste un appel.
-- Très faible 3 sur 10

-- JPD Sommes nous dans une nouvelles section ? Besoin 4

# 10 - Ventillation des abonnes
# P = personne physique, S = Societe
call ventillation_abonne();
#Ventillation des occasionnels
# les occasionnel sont tous des personnes physique
call ventillation_occasionnel();
-- JPD Une requête unions ou l'insertion dans une table temporaire aurait êté facile pour faire juste un appel.
-- Très faible 5 sur 15
######################################################################################################################################################
