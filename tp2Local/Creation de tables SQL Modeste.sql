-- Création de la BD
CREATE DATABASE POSTE_CLIENTS;
USE POSTE_CLIENTS;
 -- Création de la table tbl_local
CREATE table tbl_local(
id_local int auto_increment NOT NULL PRIMARY KEY,
nom_local varchar(45) not null
 
 )engine =InnoDB;
 -- Création de la table tbl_fabricant
 CREATE table tbl_fabricant(
id_fabricant int auto_increment NOT NULL PRIMARY KEY,
nom_fabricant varchar(45) not null
 )engine =InnoDB;
 
 -- Création de la table tbl_editeur
 CREATE table tbl_editeur(
id_editeur INT auto_increment NOT NULL PRIMARY KEY,
nom_editeur varchar(45) NOT NULL
  )engine =InnoDB;
  
-- Création de la table tbl_poste
   CREATE table tbl_poste(
id_poste INT auto_increment NOT NULL PRIMARY KEY,
nom_editeur varchar(45) NOT NULL,
id_fabricant int,
CONSTRAINT fk_tbl_poster_tbl_fabricant FOREIGN KEY ( id_fabricant) REFERENCES tbl_fabricant( id_fabricant)
  )engine =InnoDB;
 
  -- Création de la table tbl_usager
   CREATE table tbl_usager(
id_usager int auto_increment NOT NULL PRIMARY KEY,
nom_usager varchar(45) NOT NULL,
prenom_usager varchar(45) NOT NULL,
telephone_usager INT, 
 id_local INT ,
CONSTRAINT fk_tbl_usager_tbl_local FOREIGN KEY ( id_local) REFERENCES tbl_local( id_local)
 )engine =InnoDB;
 
  -- Création de la table tbl_peripherique
   CREATE table tbl_peripherique(
 id_peripherique int auto_increment NOT NULL PRIMARY KEY,
 nom_peripherique varchar(45) NOT NULL,
  id_poste INT, 
 id_fabricant INT ,
CONSTRAINT fk_tbl_peripherique_tbl_poste FOREIGN KEY ( id_poste) REFERENCES tbl_poste( id_poste),
CONSTRAINT fk_tbl_peripherique_tbl_fabricant FOREIGN KEY ( id_fabricant) REFERENCES tbl_fabricant( id_fabricant)
 )engine =InnoDB;
 -- Création de la table tbl_logiciel
   CREATE table tbl_logiciel(
 id_logiciel int auto_increment NOT NULL PRIMARY KEY,
 id_editeur INT,
 nom_logiciel varchar(45) NOT NULL,
  nb_licence INT, 
  id_fabricant INT ,
CONSTRAINT fk_tbl_logiciel_tbl_editeur FOREIGN KEY ( id_editeur) REFERENCES tbl_editeur( id_editeur)
)engine =InnoDB;

-- Création de la table tbl_poste_has_tbl_usager
   CREATE table tbl_poste_has_tbl_usager(
  id_poste INT,
  id_usager  INT,
 PRIMARY KEY (id_poste,id_usager),
CONSTRAINT fk_tbl_poste_has_tbl_usager_tbl_usager FOREIGN KEY ( id_usager) REFERENCES tbl_usager( id_usager),
CONSTRAINT fk_tbl_poste_has_tbl_usager_tbl_poste FOREIGN KEY ( id_poste) REFERENCES tbl_poste( id_poste)
)engine =InnoDB;

-- Création de la table tbl_poste_has_tbl_usager
   CREATE table tbl_poste_has_tbl_logiciel(
  id_poste INT,
  id_logiciel  INT,
 PRIMARY KEY (id_poste,id_logiciel),
CONSTRAINT fk_tbl_poste_has_tbl_logiciel_tbl_logiciel FOREIGN KEY ( id_logiciel) REFERENCES tbl_logiciel( id_logiciel),
CONSTRAINT fk_tbl_poste_has_tbl_logiciel_tbl_poste FOREIGN KEY ( id_poste) REFERENCES tbl_poste( id_poste)
)engine =InnoDB;
  
  
 
 



