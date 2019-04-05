# Fabio Fonseca

/*
Question 1 :
*/
use biblio;
select count(table_name)
	from INFORMATION_SCHEMA.TABLES
    WHERE table_schema = 'biblio';

/*
Question 2 : 
*/
show index from tbl_livres;
# la cardinality de l'idx_titre est 15

/*
Question 3 :
*/
select count(*) from tbl_sujets;    
    
/*
Question 4 : 
*/
select * from tbl_sujets
	where id_sujet = 5;
    
/*
Question 5 : 
*/
select titre from tbl_livres 
	where id_livre = 10;
    
/*
Question 6 : 
*/
select titre from tbl_livres
	order by titre asc;
    
/*
Question 7 : 
*/
select count(id_livre) from tbl_livres
	inner join tbl_sujets
		on tbl_sujets.id_sujet = tbl_livres.id_sujet
	where sujet = 'informatique';
    
/*
Question 8 :  
*/
select * from tbl_livres; #
select count(id_livre) from tbl_livres
	inner join tbl_editeurs
		on tbl_editeurs.id_editeur = tbl_livres.id_editeur
	where nom_editeur like '%Éditions Yvon Blais%'; 

/*
Question 9 : 
*/
create table if not exists  tbl_membre (
  id_membre INT NOT NULL AUTO_INCREMENT,
  nom_membre VARCHAR(45) NOT NULL,
  prenom_membre VARCHAR(45) NOT NULL,
  primary key (id_membre),
  index idxNomLong (nom_membre, prenom_membre) 
)ENGINE = InnoDB;

-- ne marche pas
/*
create table if not exists tbl_pret (
	id_pret INT NOT NULL AUTO_INCREMENT,
	date_pret date default null,
	date_retour date  default null,
	id_membre int null,
	id_livre int null,
	primary key (id_pret),
    #constraint pk_id_pret primary key (id_pret),
    
    constraint fk_id_membre_tbl_membre foreign key (id_membre) references tbl_membre(id_membre),
    constraint fk_id_livre_tbl_livre foreign key (id_livre) references tbl_livres(id_livre)
    
	#CONSTRAINT fk_tbl_membre_id_membre FOREIGN KEY (id_membre) REFERENCES biblio.tbl_membre (id_membre),
	#CONSTRAINT fk_tbl_livre_id_livre2 FOREIGN KEY (id_livre) REFERENCES biblio.tbl_livres (id_livre)  
)ENGINE = InnoDB;
*/

/*
Question 10. 
Donnez le code vous permettant d’ajouter les trois (3) enregistrements suivants dans les bonnes tables.

Attention, vous devez respecter l’intégrité pour les tables : éditeur, sujet, auteur et
auteur_livre.

Vous devez utiliser des sous-requêtes dans vos insertions pour les champs qui font 
référence à d’autre table.

auteur, 
Sigmund Freud, (2010) Psychologie de la vie amoureuse, Éditeur : Payot, 104 pages.

Marc Batty, Médéric Morel, Jean-Luc Raffaëlli, et Michel Delattre. Big data et machine
learning: manuel du data scientist. Éditeur: Dunod, 2015.

Soutou, Christian. Programmer avec MySQL: SQL, transactions, PHP, Java,
optimisations. Éditeur : Eyrolles, 2013.
*/
/*
select * from tbl_livres;

insert into tbl_auteurs (nom)
	value();

-- insert autor

select *
	from  biblio.tbl_auteurs
    where  biblio.tbl_auteurs.nom = "Freud, Sigmund";
    
insert into biblio.tbl_auteurs (nom)
	value("Freud, Sigmund");
-- id = 24

-- insert editeur
select * from biblio.tbl_editeurs;

select 	biblio.tbl_editeurs.nom_editeur,
		biblio.tbl_editeurs.id_editeur
	from biblio.tbl_editeurs
    where biblio.tbl_editeurs.nom_editeur = "Payot";
    
insert into biblio.tbl_editeurs (nom_editeur)
	value("Payot");
-- id = 15 

-- insert sujet
select * 
	from biblio.tbl_sujets
    where biblio.tbl_sujets.sujet = "Psychologie";
-- resultad : id =  10

-- insert type de publications
select * 
	from biblio.tbl_type_publications
    where biblio.tbl_type_publications.type_publcation = "Livres";
-- id = 2

insert into biblio.tbl_livres 
	(titre, annee_publication, nb_page, id_editeur ,id_sujet, id_type_publication)
	values("Psychologie de la vie amoureuse", "2010", 104, 15,10, 2);
    
select * from biblio.tbl_livres ;
select biblio.tbl_livres.id_livre, biblio.tbl_livres.titre
	from biblio.tbl_livres
    where biblio.tbl_livres.titre = "Psychologie de la vie amoureuse";

-- id livre = 18
select * from biblio.tbl_auteur_livre ;
insert into biblio.tbl_auteur_livre (id_auteur,id_livre)
	value (24,18);
*/
    
/*
Question 11. 
Afficher les trois derniers enregistrements de la table tbl_livres. Vous devez utiliser la clause
Limit. (2 points)
*/
select * from tbl_livres
	order by id_livre desc
    limit 3;

/*
Question 12 : 
*/
select 
	tbl_livres.titre as Titre,    
	tbl_auteurs.nom as 'Auteurs',
	tbl_livres.annee_publication as 'Année de publications'
	from tbl_livres 
    inner join biblio.tbl_auteur_livre
		on biblio.tbl_livres.id_livre = biblio.tbl_auteur_livre.id_livre
	inner join biblio.tbl_auteurs
		on biblio.tbl_auteur_livre.id_auteur = biblio.tbl_auteurs.id_auteur;
        
/*
Question 13 :
*/
/*
use information_schema;
select * from tables
	where table_schema like 'marketingv2';
*/
/*
select table_schema 'marketingv2', 
table_name 'Table',
data_length / 1024 / 1024 as 'Taille table(Mo)',
index_length / 1024 / 1024 as 'Taille index(Mo)',
(data_length + index_length) / 1024 / 1024 / 'Taille totale par table(Mo)'
from information_schema.tables where table_schema like '%test%';
*/

use marketingv2;

/*
Question 14 :
*/
select * from tbl_contrat
	inner join tbl_client
    on tbl_client.id_client = tbl_contrat.id_client
    order by id_ville, tbl_client.id_client;

/*
Question 15 :
*/
select sum(nombre * prix_unitaire) from tbl_detail_contrat;

/*

Question 16 :
*/
select sum(nombre * prix_unitaire) from tbl_detail_contrat
	inner join tbl_contrat
		on tbl_contrat.id_contrat = tbl_detail_contrat.id_contrat
		group by id_client;

/*
Question 17
*/
/*alter table tbl_client
	add column CodeClient varchar(6) not null;
	
    #ALTER TABLE tbl_client ADD CodeClient VARCHAR(6) NOT NULL DEFAULT 'concat'(nom_client(3) code_postal_client(3));
/*

Question 18
*/
select
  date(date_contrat) AS 'Date',
  CURDATE(),
  datediff(date_contrat, CURDATE()) AS 'Jours'
from tbl_contrat;

/*
Question 19

*/
/*
select concat(nom_rep, ' ', prenom_rep), count(tbl_appel.id_representant), count(tbl_rendez_vous.id_representant) from tbl_representant 
	inner join tbl_appel
		on tbl_appel.id_representant = tbl_representant.id_representant
	inner join tbl_rendez_vous
		on tbl_rendez_vous.id_representant = tbl_representant.id_representant
	group by tbl_representant.id_representant, tbl_appel.id_representant, tbl_rendez_vous.id_representant