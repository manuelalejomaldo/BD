#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Outil
#------------------------------------------------------------

CREATE TABLE Outil(
        IdOutil           Int  Auto_increment  NOT NULL ,
        NomOutil          Varchar (50) NOT NULL ,
        PrixUnitaireOutil DECIMAL (15,3)  NOT NULL
	,CONSTRAINT Outil_PK PRIMARY KEY (IdOutil)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Succursale
#------------------------------------------------------------

CREATE TABLE Succursale(
        IdSuccursale  Int  Auto_increment  NOT NULL ,
        NomSuccursale Varchar (50) NOT NULL
	,CONSTRAINT Succursale_PK PRIMARY KEY (IdSuccursale)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RegionAdmin
#------------------------------------------------------------

CREATE TABLE RegionAdmin(
        IdRegionAdm  Int  Auto_increment  NOT NULL ,
        NomRegionAdm Varchar (50) NOT NULL
	,CONSTRAINT RegionAdmin_PK PRIMARY KEY (IdRegionAdm)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ville
#------------------------------------------------------------

CREATE TABLE Ville(
        IdVille     Int  Auto_increment  NOT NULL ,
        NomVille    Varchar (50) NOT NULL ,
        IdRegionAdm Int NOT NULL
	,CONSTRAINT Ville_PK PRIMARY KEY (IdVille)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        IdClient         Int  Auto_increment  NOT NULL ,
        NomClient        Varchar (100) NOT NULL ,
        AddresseClient   Varchar (100) NOT NULL ,
        CodePostalClient Char (6) NOT NULL ,
        TelCient         Varchar (30) NOT NULL ,
        EmailClient      Varchar (50) NOT NULL ,
        NoteClient       Longtext NOT NULL ,
        IdVille          Int NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (IdClient)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contact
#------------------------------------------------------------

CREATE TABLE Contact(
        IdContact       Int  Auto_increment  NOT NULL ,
        PrenomConact    Varchar (50) NOT NULL ,
        NomConact       Varchar (50) NOT NULL ,
        FonctionContact Varchar (50) NOT NULL ,
        TelContact      Varchar (30) NOT NULL ,
        EmailContact    Varchar (100) NOT NULL ,
        NoteContact     Longtext NOT NULL ,
        IdClient        Int NOT NULL ,
        IdContrat       Int NOT NULL
	,CONSTRAINT Contact_PK PRIMARY KEY (IdContact)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Representant
#------------------------------------------------------------

CREATE TABLE Representant(
        IdRepresentant     Int  Auto_increment  NOT NULL ,
        NomRepresentant    Varchar (50) NOT NULL ,
        PrenomRepresentant Varchar (50) NOT NULL ,
        EmailRepresentant  Varchar (100) NOT NULL ,
        TelRepresentant    Varchar (30) NOT NULL ,
        IdContrat          Int NOT NULL ,
        IdSuccursale       Int NOT NULL
	,CONSTRAINT Representant_PK PRIMARY KEY (IdRepresentant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contrat
#------------------------------------------------------------

CREATE TABLE Contrat(
        IdContrat      Int  Auto_increment  NOT NULL ,
        DateContrat    Date NOT NULL ,
        IdRepresentant Int NOT NULL ,
        IdContact      Int NOT NULL
	,CONSTRAINT Contrat_PK PRIMARY KEY (IdContrat)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appel
#------------------------------------------------------------

CREATE TABLE Appel(
        IdAppel         Int  Auto_increment  NOT NULL ,
        Resultad        Longtext NOT NULL ,
        DateAppel       Datetime NOT NULL ,
        DateRappelPrevu Datetime NOT NULL ,
        IdContact       Int NOT NULL ,
        IdRepresentant  Int NOT NULL
	,CONSTRAINT Appel_PK PRIMARY KEY (IdAppel)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Rendez-Vous
#------------------------------------------------------------

CREATE TABLE Rendez_Vous(
        IdRendez_Vous  Int  Auto_increment  NOT NULL ,
        DateRV         Datetime NOT NULL ,
        SujetRv        Longtext NOT NULL ,
        NoteRV         Longtext NOT NULL ,
        ConfirmationRV Char NOT NULL ,
        IdContact      Int NOT NULL ,
        IdRepresentant Int NOT NULL
	,CONSTRAINT Rendez_Vous_PK PRIMARY KEY (IdRendez_Vous)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contenir
#------------------------------------------------------------

CREATE TABLE Contenir(
        IdContrat    Int NOT NULL ,
        IdOutil      Int NOT NULL ,
        NdConections Int NOT NULL
	,CONSTRAINT Contenir_PK PRIMARY KEY (IdContrat,IdOutil)
)ENGINE=InnoDB;




ALTER TABLE Ville
	ADD CONSTRAINT Ville_RegionAdmin0_FK
	FOREIGN KEY (IdRegionAdm)
	REFERENCES RegionAdmin(IdRegionAdm);

ALTER TABLE Client
	ADD CONSTRAINT Client_Ville0_FK
	FOREIGN KEY (IdVille)
	REFERENCES Ville(IdVille);

ALTER TABLE Contact
	ADD CONSTRAINT Contact_Client0_FK
	FOREIGN KEY (IdClient)
	REFERENCES Client(IdClient);

ALTER TABLE Contact
	ADD CONSTRAINT Contact_Contrat1_FK
	FOREIGN KEY (IdContrat)
	REFERENCES Contrat(IdContrat);

ALTER TABLE Contact 
	ADD CONSTRAINT Contact_Contrat0_AK 
	UNIQUE (IdContrat);

ALTER TABLE Representant
	ADD CONSTRAINT Representant_Contrat0_FK
	FOREIGN KEY (IdContrat)
	REFERENCES Contrat(IdContrat);

ALTER TABLE Representant
	ADD CONSTRAINT Representant_Succursale1_FK
	FOREIGN KEY (IdSuccursale)
	REFERENCES Succursale(IdSuccursale);

ALTER TABLE Representant 
	ADD CONSTRAINT Representant_Contrat0_AK 
	UNIQUE (IdContrat);

ALTER TABLE Contrat
	ADD CONSTRAINT Contrat_Representant0_FK
	FOREIGN KEY (IdRepresentant)
	REFERENCES Representant(IdRepresentant);

ALTER TABLE Contrat
	ADD CONSTRAINT Contrat_Contact1_FK
	FOREIGN KEY (IdContact)
	REFERENCES Contact(IdContact);

ALTER TABLE Contrat 
	ADD CONSTRAINT Contrat_Representant0_AK 
	UNIQUE (IdRepresentant);

ALTER TABLE Contrat 
	ADD CONSTRAINT Contrat_Contact1_AK 
	UNIQUE (IdContact);

ALTER TABLE Appel
	ADD CONSTRAINT Appel_Contact0_FK
	FOREIGN KEY (IdContact)
	REFERENCES Contact(IdContact);

ALTER TABLE Appel
	ADD CONSTRAINT Appel_Representant1_FK
	FOREIGN KEY (IdRepresentant)
	REFERENCES Representant(IdRepresentant);

ALTER TABLE Rendez_Vous
	ADD CONSTRAINT Rendez_Vous_Contact0_FK
	FOREIGN KEY (IdContact)
	REFERENCES Contact(IdContact);

ALTER TABLE Rendez_Vous
	ADD CONSTRAINT Rendez_Vous_Representant1_FK
	FOREIGN KEY (IdRepresentant)
	REFERENCES Representant(IdRepresentant);

ALTER TABLE Contenir
	ADD CONSTRAINT Contenir_Contrat0_FK
	FOREIGN KEY (IdContrat)
	REFERENCES Contrat(IdContrat);

ALTER TABLE Contenir
	ADD CONSTRAINT Contenir_Outil1_FK
	FOREIGN KEY (IdOutil)
	REFERENCES Outil(IdOutil);
