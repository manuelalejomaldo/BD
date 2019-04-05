CREATE DATABASE nom_base;
show databases;
create database etudiant character set 'utf8';
drop database etudiant;
create database etudiant character set 'utf8';
show tables;
use etudiant;
create table TblProgrammes(
	id_programme char(6) not null,
    nom_programme varchar(100),
    date_inscription timestamp,
    primary key(id_programme),
    index idx_prog(nom_programme asc)
) engine = InnoDB;

describe TblProgrammes;

create table TblCours(
	id_cours char(10) not null,
    nom_cours varchar(100) not null,
    nb_heure tinyint null,
    date_insertion timestamp,
    id_programme char(6) not null,
    primary key (id_cours ),
		index idx_nomcours (nom_cours ASC),
        index fk_TblCours_TblProgrammes_idx (id_programme asc),
        constraint fk_TblCours_TblProgrammes
        foreign key (id_programme)
			references TblProgrammes (id_programme)
            on delete no action
            on update no action
)engine = InnoDB;
show tables;
create table TblEtudiants(
	id_etudiant int not null auto_increment,
    nom_etudiant varchar(45) null,
    prenom_etudiant varchar(45) null,
    date_creation timestamp,
    id_programme char(6) not null,
primary key (id_etudiant),
index idx_nom_long (nom_etudiant ASC, 
	prenom_etudiant asc),
index fk_tbl_etudiants_TblProgrammes1_idx
	(id_programme ASC),
constraint fk_tbl_etudiants_tblProgrammes1
	foreign key (id_programme)
    references TblProgrammes (id_programme)
    on delete no action
    on update no action
    ) engine = InnoDB;
   
   