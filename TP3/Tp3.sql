Create database if not exists GestionParcAuto;
use GestionParcAuto;


create TABLE if not exists type_paiement(
id_type_paiement int (15) not null auto_increment,
nom_paiement varchar (45) not null,
PRIMARY KEY (id_type_paiement),
INDEX idxNom_paiement (nom_paiement ASC)) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

create TABLE if not exists tbl_facture(
  id_facture smallint(6) NOT NULL AUTO_INCREMENT,
  debut_stationnement datetime not null default '0000-00-00 00:00:00',
  fin_stationnement datetime not null default '0000-00-00 00:00:00',
  id_type_paiement int (15) not null,
  montantAPaye INT(11) NULL DEFAULT NULL,
  no_ChequeCarteCredit int (20) null DEFAULT NULL,
   PRIMARY KEY (id_facture),
INDEX idxDebut_stationnement (debut_stationnement ASC),
INDEX idxFin_stationnement (fin_stationnement ASC),
INDEX idxMontantAPaye (montantAPaye ASC),
CONSTRAINT fk_tbl_facture_tbl_type_paiement
FOREIGN KEY (id_type_paiement)
REFERENCES GestionParcAuto.tbl_type_paiement(id_type_paiement))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

create TABLE  if not exists tbl_occasionnel(
id_occassionnel int (15) not null auto_increment,
no_Automatique int (15) not null unique,
debut_stationnement datetime not null default '0000-00-00 00:00:00',
fin_stationnement datetime not null default '0000-00-00 00:00:00',
id_facture int (6) not null, 
primary key (id_occassionnel),
INDEX idxNo_automatique(no_automatique ASC),
INDEX idxDebut_stationnement (debut_stationnement ASC),
INDEX idxFin_stationnement (fin_stationnement ASC),
CONSTRAINT fk_tbl_occasionnel_tbl_facture 
FOREIGN KEY (id_facture)
REFERENCES GestionParcAuto.tbl_facture)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


create table if not exists tbl_vehicule(
id_vehicule int not null auto_increment,
no_vehicule varchar (10) not null unique,
marque varchar (20) null default null,
Modele varchar (20) null default null, 
couleur varchar (10) null default null,
primary key (id_vehicule),
INDEX idxNo_vehicule (no_vehicule ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



create table if not exists tbl_place(
id_place int (15) not null auto_increment,
no_place int  (15) not null unique,
no_vehicule varchar (10) not null unique,
type_place  int (15) not null,
primary key (id_place),
CONSTRAINT fk_tbl_place_tbl_vehicule
FOREIGN KEY (no_vehicule)
REFERENCES  GestionParcAuto.tbl_vehicule(no_vehicule)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET= utf8;


create table if not exists tbl_type_personne(
id_type_personne int (15) not null auto_increment,
nom_personne varchar (45) not null,
PRIMARY KEY (id_type_personne),
INDEX idxNom_personne(nom_personne ASC)) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



create TABLE if not exists tbl_abonnes(
id_abonne int(20) not null auto_increment,
nomRaisonSoc_abonne varchar (45) not null,
prenom_abonne varchar (45) null default NULL,
codePostal varchar(6) not null default NULL,
telephone varchar(10) null default NULL,
courriel_abonne varchar(45) null default NULL, 
id_type_Personne smallint (5) not null,
id_vehicule int (15) not null,
primary key(id_abonne),
INDEX	idxnomRaisonSoc_abonne	(nom_RaisonSoc_abonne ASC),
CONSTRAINT fk_tbl_abonnes_tbl_type_personne
FOREIGN KEY (id_type_personne)
REFERENCES  GestionParcAuto.tbl_type_personne(id_type_personne),
CONSTRAINT fk_tbl_abonnes_tbl_vehicule
FOREIGN KEY (id_vehicule)
REFERENCES  GestionParcAuto.tbl_vehicule(id_vehicule)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET= utf8;



create table if not exists tbl_abonnements(
id_abonnement int (15) not null auto_increment,
no_place int (15) not null unique,
debut_stationnement datetime,
fin_stationnement datetime,
id_abonne int(20) not null,
id_vehicule int (15) not null,
no_chequeCreditCard int (20) not null,
id_place int (15) not null,
id_facture smallint(6) NOT NULL,
montantAPaye INT(11) NULL DEFAULT NULL,
primary key (id_abonnement),
INDEX idxNo_place (no_place  ASC),
INDEX idxDebut_stationnement (debut_stationnement ASC),
INDEX idxFin_stationnement (fin_stationnement ASC),
CONSTRAINT fk_tbl_abonnements_tbl_abonnes
FOREIGN KEY (id_abonne)
REFERENCES  GestionParcAuto.tbl_abonnes(id_abonne),
CONSTRAINT fk_tbl_abonnements_tbl_vehicule
FOREIGN KEY (id_vehicule)
REFERENCES  GestionParcAuto.tbl_vehicule(id_vehicule),
CONSTRAINT fk_tbl_abonnements_tbl_place
FOREIGN KEY (id_place)
REFERENCES  GestionParcAuto.tbl_place(id_place),
CONSTRAINT fk_tbl_abonnements_tbl_facture
FOREIGN KEY (id_facture)
REFERENCES  GestionParcAuto.tbl_facture(id_facture),
CONSTRAINT fk_tbl_abonnements_tbl_facture
FOREIGN KEY (montantAPaye) 
REFERENCES  GestionParcAuto.tbl_facture(montantAPaye)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET= utf8;


















