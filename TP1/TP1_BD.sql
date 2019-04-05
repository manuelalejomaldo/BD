#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        IdClient         Int  Auto_increment  NOT NULL ,
        TelCient         Varchar (10) NOT NULL ,
        EmailClient      Varchar (50) NOT NULL ,
        NoteClient       Longtext NOT NULL ,
        NomClient        Varchar (50) NOT NULL ,
        AddresseClient   Varchar (50) NOT NULL ,
        CodePostalClient Varchar (6) NOT NULL
	,CONSTRAINT Client_Idx INDEX (NomClient,AddresseClient,CodePostalClient)
	,CONSTRAINT Client_PK PRIMARY KEY (IdClient)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Outil
#------------------------------------------------------------

CREATE TABLE Outil(
        IdOutil           Int  Auto_increment  NOT NULL ,
        NomOutil          Varchar (10) NOT NULL ,
        PrixUnitaireOutil DECIMAL (15,3)  NOT NULL
	,CONSTRAINT Outil_PK PRIMARY KEY (IdOutil)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Succursale
#------------------------------------------------------------

CREATE TABLE Succursale(
        IdSuccursale  Int  Auto_increment  NOT NULL ,
        NomSuccursale Varchar (20) NOT NULL
	,CONSTRAINT Succursale_PK PRIMARY KEY (IdSuccursale)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contact
#------------------------------------------------------------

CREATE TABLE Contact(
        IdContact       Int  Auto_increment  NOT NULL ,
        FonctionContact Varchar (50) NOT NULL ,
        TelContact      Varchar (20) NOT NULL ,
        EmailContact    Varchar (20) NOT NULL ,
        NoteContact     Longtext NOT NULL ,
        PrenomConact    Varchar (20) NOT NULL ,
        NomConact       Varchar (20) NOT NULL ,
        IdClient        Int NOT NULL ,
        IdContrat       Int NOT NULL
	,CONSTRAINT Contact_Idx INDEX (PrenomConact,NomConact)
	,CONSTRAINT Contact_PK PRIMARY KEY (IdContact)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Representant
#------------------------------------------------------------

CREATE TABLE Representant(
        IdRepresentant     Int  Auto_increment  NOT NULL ,
        EmailRepresentant  Varchar (30) NOT NULL ,
        TelRepresentant    Varchar (30) NOT NULL ,
        NomRepresentant    Varchar (20) NOT NULL ,
        PrenomRepresentant Varchar (20) NOT NULL ,
        IdContrat          Int NOT NULL ,
        IdSuccursale       Int NOT NULL
	,CONSTRAINT Representant_Idx INDEX (NomRepresentant,PrenomRepresentant)
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




	=======================================================================
	   Désolé, il faut activer cette version pour voir la suite du script ! 
	=======================================================================
