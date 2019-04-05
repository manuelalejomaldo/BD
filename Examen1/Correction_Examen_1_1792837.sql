# Manuel Alejandro Maldonado 

-- Corrigé de l'examen 1

-----------------------------------------------------------------------

--- Mes commentaire sont précédés de mes initiales JPD
--- Résultat : 
--- Début de la partie 1 : 7 sur 10
--- Modification et insertion dans biblio: 23 sur 25
--- Partie 2 : 22 sur 30

--- Total  : 52 sur 65
-- -------------------------------------------------------------------

use biblio;

/*
1. 
*/

select 
		count(table_name)
	from INFORMATION_SCHEMA.TABLES
    WHERE table_schema = "biblio";

/*
2. 
*/

use biblio;
show index from tbl_livres;

-- --show full columns from tbl_livres;
/*
la cardinality (15) de l’idx_titre est 1 â 1,  pour reorganiser la sorti pour requetes
 a partir du titre
*/

/*
3. 
*/
select * from biblio.tbl_sujets;
select count(biblio.tbl_sujets.id_sujet) as "Nb Sujets"
	from biblio.tbl_sujets;
    
/*
4. 
*/

select  biblio.tbl_sujets.sujet as "Sujet",
		biblio.tbl_sujets.id_sujet as "Id Sujet"
	from biblio.tbl_sujets
    where biblio.tbl_sujets.id_sujet = 5;
    
/*
5. 
*/
select 	biblio.tbl_livres.id_livre as "Id Livre",
		biblio.tbl_livres.titre as "Titre"
	from biblio.tbl_livres
    where biblio.tbl_livres.id_livre = 10;
    
/*
6.
*/

select *
	from biblio.tbl_livres
    order by biblio.tbl_livres.titre asc;
-- JPD Seulement les titre
-- Moins 1

/*
7. 
*/

select * from biblio.tbl_sujets;
select * from biblio.tbl_livres;
select count(biblio.tbl_livres.id_sujet) as "Nb Livres sujet = informatique"
	from biblio.tbl_livres
    inner join biblio.tbl_sujets
		on biblio.tbl_livres.id_sujet = biblio.tbl_sujets.id_sujet
	where biblio.tbl_sujets.sujet = "informatique";
-- JPD moins 1 avec une sous requête
-- Bonne requête :
select count(*) As 'Nombre de livre informatique'
from tbl_livres 
where id_sujet = (select id_sujet from tbl_sujets where sujet like 'informatique');

/*
8. 
*/

select * from biblio.tbl_editeurs;


select 
		count(id_livre) as "Nb Livres publiés par Éditions Yvon Blais"
    from tbl_livres
	inner join tbl_editeurs
		on tbl_editeurs.id_editeur = tbl_livres.id_editeur
	where nom_editeur like '%Éditions Yvon Blais%'; 
-- JPD moins 1 avec une sous requête
-- Bonne requête :
select count(id_livre) as 'Nombre de livre Yvons Blais'
from tbl_livres as l inner join tbl_editeurs as e on l.id_editeur = e.id_editeur
where e.id_editeur = (select id_editeur from tbl_editeurs where nom_editeur like 'Éditions Yvon Blais');
/*

9. Ajouter les tables suivantes à votre base de données :
*/
/*Table «tbl_membre», comprenant les champs suivants :
 un numéro de membre qui agit comme clé primaire;
 un nom;
 un prénom.
 Index sur les champs nom et prénom. Cet index doit s’appeler idxNomLong
*/

CREATE TABLE IF NOT EXISTS biblio.tbl_membre 
(
		id_membre INT NOT NULL AUTO_INCREMENT,
		nom_membre VARCHAR(45) NOT NULL,
		prenom_membre VARCHAR(45) NOT NULL,
	PRIMARY KEY (id_membre),
	INDEX idxNomLong (nom_membre,prenom_membre ) 
  )
  ENGINE = InnoDB;
  
  /*Table « tbl_pret », comprenant les champs suivant :
 un numéro de prêt qui agit comme clé primaire;
 une date de prêt;
 une date de retour;
 un numéro de membre qui est clé externe de la table « tbl_membre »;
 ainsi qu'un numéro de livre qui est une clé externe de la table « tbl_livre »*/


CREATE TABLE IF NOT EXISTS biblio.tbl_pret 
(
	id_pret INT NOT NULL AUTO_INCREMENT,
	date_pret datetime DEFAULT NULL,
	date_retour datetime DEFAULT NULL,
	id_membre INT NOT NULL ,
	id_livre INT NOT NULL ,
  PRIMARY KEY (id_pret),  
  
  CONSTRAINT `fk_tbl_membre_id_membre`
    FOREIGN KEY (`id_membre`)
    REFERENCES biblio.tbl_membre (id_membre)  
  )
  ENGINE = InnoDB;
  
   ALTER TABLE biblio.tbl_pret  ADD
	  CONSTRAINT `fk_tbl_livre_id_livre3`
		FOREIGN KEY (`id_livre`)
		REFERENCES biblio.tbl_livres (id_livre);
  -- JPD moins 1 manque la dernière contrainte. il aura fallu changer ton type pour id_livre en unsigned.

  /*
10. 
*/
/*
 Sigmund Freud, (2010) Psychologie de la vie amoureuse, Éditeur : Payot,104 pages.
*/


-- insert autor
-- verifier que n'exciste pas pour dubpliquer 
select *
	from  biblio.tbl_auteurs
    where  biblio.tbl_auteurs.nom = "Freud, Sigmund";
    
insert into biblio.tbl_auteurs (nom)
	value("Freud, Sigmund");

select @auter1 := (select biblio.tbl_auteurs.id_auteur
	from  biblio.tbl_auteurs
    where  biblio.tbl_auteurs.nom = "Freud, Sigmund");
-- id = 24

/*------------------------------------------------*/
-- insert editeur
select * from biblio.tbl_editeurs;

select 	biblio.tbl_editeurs.nom_editeur,
		biblio.tbl_editeurs.id_editeur
	from biblio.tbl_editeurs
    where biblio.tbl_editeurs.nom_editeur = "Payot";
    
insert into biblio.tbl_editeurs (nom_editeur)
	value("Payot");
    
select @id_editeur1 := (select biblio.tbl_editeurs.id_editeur 
	from biblio.tbl_editeurs
    where biblio.tbl_editeurs.nom_editeur = "Payot");
-- id = 15 

/*------------------------------------------------*/
-- id sujet 

select * 
	from biblio.tbl_sujets;
    
select * 
	from biblio.tbl_sujets
    where biblio.tbl_sujets.sujet = "Psychologie";

select @id_sujet1 := ( select biblio.tbl_sujets.id_sujet
						from biblio.tbl_sujets
						where biblio.tbl_sujets.sujet = "Psychologie");
-- resultad : id =  10

/*------------------------------------------------*/
--  type de publications
select * 
	from biblio.tbl_type_publications
    where biblio.tbl_type_publications.type_publcation = "Livres";

select @id_type_publications := (	select biblio.tbl_type_publications.id_type_publication
									from biblio.tbl_type_publications
									where biblio.tbl_type_publications.type_publcation = "Livres");
-- id = 2

/*------------------------------------------------*/
-- insert livre avec d'information
insert into biblio.tbl_livres 
	(titre, annee_publication, nb_page, id_editeur ,id_sujet, id_type_publication)
	values(
				"Psychologie de la vie amoureuse", 
				"2010", 
                104, 
                id_editeur1,
                d_sujet1, 
                id_type_publications);
    
select * from biblio.tbl_livres ;

-- id Livre
select biblio.tbl_livres.id_livre, biblio.tbl_livres.titre
	from biblio.tbl_livres
    where biblio.tbl_livres.titre = "Psychologie de la vie amoureuse";

-- id livre = 18

-- insert au tableau 
select * from biblio.tbl_auteur_livre ;
insert into biblio.tbl_auteur_livre (id_auteur,id_livre)
	value (auter1,18);

/*
 Marc Batty, Médéric Morel, Jean-Luc Raffaëlli, et Michel Delattre. Big data et machine
learning: manuel du data scientist. Éditeur: Dunod, 2015.
*/
-- pour les autrs  Marc Batty, Médéric Morel, Jean-Luc Raffaëlli, et Michel Delattre.
select biblio.tbl_auteurs.id_auteur,biblio.tbl_auteurs.nom
	from biblio.tbl_auteurs;

insert into biblio.tbl_auteurs (nom)	value("Batty, Marc");
-- ID 25
insert into biblio.tbl_auteurs (nom)	value("Morel, Médéric");
-- id 26
insert into biblio.tbl_auteurs (nom)	value("Raffaëlli, Jean-Luc");
-- id 27

-- pour Éditeur: Dunod
select 
		biblio.tbl_editeurs.id_editeur,
		biblio.tbl_editeurs.nom_editeur 
	from biblio.tbl_editeurs
    where biblio.tbl_editeurs.nom_editeur =  "Dunod";
-- il n'existe pas 
insert into biblio.tbl_editeurs (nom_editeur)
	value("Dunod");
-- id_editeur = 16
    
-- insert livre avec d'information
insert into biblio.tbl_livres 
	(titre, annee_publication,  id_editeur ,id_sujet, id_type_publication)
	values(
		"Big data et machine learning: manuel du data scientist", 
        "2015",  16,5, 2);
-- insert au tableau 
select * from biblio.tbl_auteur_livre ;
insert into biblio.tbl_auteur_livre (id_auteur,id_livre) value (25,19);
insert into biblio.tbl_auteur_livre (id_auteur,id_livre) value (26,19);
insert into biblio.tbl_auteur_livre (id_auteur,id_livre) value (27,19);
/*
 Soutou, Christian. Programmer avec MySQL: SQL, transactions, PHP, Java,
optimisations. Éditeur : Eyrolles, 2013.
*/
-- pour Éditeur: Dunod
select 
		biblio.tbl_editeurs.id_editeur,
		biblio.tbl_editeurs.nom_editeur 
	from biblio.tbl_editeurs
    where biblio.tbl_editeurs.nom_editeur =  "Eyrolles";

-- id_editeur Eyrolles = 9

-- insert livre avec d'information
insert into biblio.tbl_livres 
	(titre, annee_publication,  id_editeur ,id_sujet, id_type_publication)
	values(
		"Programmer avec MySQL: SQL, transactions, PHP, Java,
optimisations", 
        "2015",  9, 5, 2);
    
-- JPD ton code est difficile à lire !
-- Moins 1 mauvaise années

-- Voici le miens :
-- Question 10
insert into tbl_auteurs(nom) value ('Sigmund Freud'),('Marc Batty'),('Médéric Morel'),
('Jean-Luc Raffaëll'),('Michel Delattre'),('Christian Soutou');
-- 1 point
insert into tbl_editeurs(nom_editeur) value('Payot'),('Dunod');
-- 1 point
insert into tbl_livres (titre, sous_titre, annee_publication, nb_page, id_editeur,id_sujet, id_type_publication)
value ('Psychologie de la vie amoureuse','null' ,2010,104,
(select id_editeur from tbl_editeurs where nom_editeur like 'Payot'),
(select id_sujet from tbl_sujets where sujet like 'Psychologie'),
(select id_type_publication from tbl_type_publications where type_publcation like 'Livres'));
-- 3 points
insert into tbl_livres (titre, sous_titre, annee_publication, nb_page, id_editeur,id_sujet, id_type_publication)
value ('Big data et machine learning: manuel du data scientist','null' ,2015,'null',
(select id_editeur from tbl_editeurs where nom_editeur like 'Dunod'),
(select id_sujet from tbl_sujets where sujet like 'Informatique'),
(select id_type_publication from tbl_type_publications where type_publcation like 'Livres'));
-- 3 points
insert into tbl_livres (titre, sous_titre, annee_publication, nb_page, id_editeur,id_sujet, id_type_publication)
value ('Programmer avec MySQL: SQL','transactions, PHP, Java, optimisations' ,2013,'null',
(select id_editeur from tbl_editeurs where nom_editeur like 'Eyrolles'),
(select id_sujet from tbl_sujets where sujet like 'Informatique'),
(select id_type_publication from tbl_type_publications where type_publcation like 'Livres'));
-- 3 points
insert into tbl_auteur_livre value 
(24,18),
(26,19),(27,19),(28,19),(29,19),
(30,20);
/*
11. 
*/
SELECT * FROM biblio.tbl_livres;
SELECT * 
	FROM biblio.tbl_livres  
    order by biblio.tbl_livres.id_livre desc
    LIMIT 3;
    
/*
12.
  */

SELECT 
	biblio.tbl_livres.titre as Titre,    
	biblio.tbl_auteurs.nom as "Les Auteurs",
	biblio.tbl_livres.annee_publication as "L'année de publications"  
    
	FROM biblio.tbl_livres 
    
    inner join biblio.tbl_auteur_livre
		on biblio.tbl_livres.id_livre = biblio.tbl_auteur_livre.id_livre
	inner join biblio.tbl_auteurs
		on biblio.tbl_auteur_livre.id_auteur = biblio.tbl_auteurs.id_auteur ;
        
/*
13
*/
use marketingv2;
    
select 
		table_schema "marketingv2", 
        table_name "table",
        data_length / 1024  as "Taille tables(Kb)",
        index_length / 1024 as "Taille index (Kb)",
        (data_length + index_length) / 1024 as "Taille total (Kb)"
        
	from information_schema.tables 
    where table_schema like "marketingv2";

/*
14
*/

select * from marketingv2.tbl_contrat;
select 	marketingv2.tbl_client.nom_client as "Client",
		marketingv2.tbl_ville.ville as "ville"
	from marketingv2.tbl_client
    inner join marketingv2.tbl_contrat
		on marketingv2.tbl_client.id_client = marketingv2.tbl_contrat.id_client
	inner join marketingv2.tbl_ville
		on marketingv2.tbl_client.id_ville = marketingv2.tbl_ville.id_ville
	order by marketingv2.tbl_ville.ville asc, 	marketingv2.tbl_client.nom_client asc;
        
/*
15
*/

select * from marketingv2.tbl_detail_contrat;

select sum(marketingv2.tbl_detail_contrat.prix_unitaire) as "Le montant des contrats"
	from marketingv2.tbl_detail_contrat;
-- JPD moins 5 les deux requêtes ne renvoit pas ce que je veux.
-- Voici la bonne :
SELECT SUM(nombre*prix_unitaire) AS 'Valeur totale des contrat'
FROM tbl_client AS b INNER JOIN tbl_contrat AS c
ON b.id_client=c.id_client
INNER JOIN tbl_detail_contrat as d
ON c.id_contrat=d.id_contrat;

/*
16
*/

select 
		marketingv2.tbl_client.nom_client as "Nom Client",
        sum(marketingv2.tbl_detail_contrat.prix_unitaire) as "Montant"
    from marketingv2.tbl_client
    inner join marketingv2.tbl_contrat
		on marketingv2.tbl_client.id_client = marketingv2.tbl_contrat.id_client
	inner join marketingv2.tbl_detail_contrat
		on marketingv2.tbl_contrat.id_contrat = marketingv2.tbl_detail_contrat.id_contrat
	group by marketingv2.tbl_contrat.id_client
;

/*
17
*/

select 
		concat(marketingv2.tbl_client.nom_client, 
			marketingv2.tbl_client.code_postal_client)  as "CodeClient"
    from marketingv2.tbl_client
    where CodeClient is not null;
-- --pendiente
-- JPD moins 2 voici :
SELECT CONCAT(LEFT(nom_client,3),RIGHT(code_postal_client,3)) AS 'CodeClient'
FROM tbl_client
WHERE code_postal_client is not null;

/* 
18
*/
select
	date(date_contrat) as "Date de la signature de chaque contrat" ,
	datediff(date(date_contrat), date(CURDATE())) AS "Nb Jours écoulé"
	from marketingv2.tbl_contrat;
-- JPD moins 1 Inversion des dates pour avoir un nombre possitif.

/*
19
*/



select 	
		concat(marketingv2.tbl_representant.nom_rep, " ", prenom_rep) as "Nom Representant", 
        Appels as "Nb de rendez-vous par representant",
		Rendez_Vous as "Nb d’appels par Representant"
        
 from tbl_representant 
	inner join 
		(	select 	tbl_appel.id_representant, 
					count(*) as Appels 
				from tbl_appel 
                group by tbl_appel.id_representant)
    tbl_appel_count
		on tbl_appel_count.id_representant = tbl_representant.id_representant
	inner join 
		(	select tbl_rendez_vous.id_representant, 
				count(*) as Rendez_Vous 
                from tbl_rendez_vous 
                group by tbl_rendez_vous.id_representant)
    tbl_rendez_vous_count
		on tbl_rendez_vous_count.id_representant = tbl_representant.id_representant;
	 
    
