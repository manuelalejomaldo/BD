use tp2;
/*
1. Donnez la commande vous donnant le nombre de tables que comporte la base de données
Biblio. (1 point)
*/
use biblio;
select count(table_name)
	from INFORMATION_SCHEMA.TABLES
    WHERE table_schema = "biblio";



/*
2. Afficher les index de la table « tbl_livres ». A partir de la sortie, donner la cardinality de
l’idx_titre. (1 point) Donnez la commande et la réponse en commentaire.
*/
use biblio;
show index from tbl_livres;

-- --show full columns from tbl_livres;
/*
la cardinality (15) de l’idx_titre est 1 â 1,  pour reorganiser la sorti pour requetes
 a partir du titre
*/

/*
3. Quelle commande vous permet de savoir combien de sujets comportent la base de données.
(1 point)
*/
select * from biblio.tbl_sujets;
select count(biblio.tbl_sujets.id_sujet) as "Nb Sujets"
	from biblio.tbl_sujets;
    
/*
4. Quelle commande vous permet de savoir quel sujet contient le « id_sujet » numéro 5.
(1 point)
*/

select  biblio.tbl_sujets.sujet as "Sujet",
		biblio.tbl_sujets.id_sujet as "Id Sujet"
	from biblio.tbl_sujets
    where biblio.tbl_sujets.id_sujet = 5;
    
/*
5. Quelle commande vous permet d’afficher le titre du livre qui contient le « id_livre » 
numéro 10. (1 point)
*/
select 	biblio.tbl_livres.id_livre as "Id Livre",
		biblio.tbl_livres.titre as "Titre"
	from biblio.tbl_livres
    where biblio.tbl_livres.id_livre = 10;
    
/*
6. Faites sortir les titres de livres, en ordre alphabétique ascendant . (1 point)
*/

select *
	from biblio.tbl_livres
    order by biblio.tbl_livres.titre asc;
    
/*7. À l’aide d’une requête et d’une sous-requête. Donnez le nombre de livres traites 
du sujet « informatique ». (2 points) id_sujet = 5
*/

select * from biblio.tbl_sujets;
select * from biblio.tbl_livres;
select count(biblio.tbl_livres.id_sujet) as "Nb Livres sujet = informatique"
	from biblio.tbl_livres
    inner join biblio.tbl_sujets
		on biblio.tbl_livres.id_sujet = biblio.tbl_sujets.id_sujet
	where biblio.tbl_sujets.sujet = "informatique";
    
/*8. À l’aide d’une requête et d’une sous-requête. Combien de livres ont été publiés 
par Éditions Yvon Blais ». (2 point)
*/

select * from biblio.tbl_auteurs;
select * from biblio.tbl_auteur_livre;

select count(biblio.tbl_auteur_livre.id_auteur) as "Nb Livres publiés pour  Yvon Blais"
	from biblio.tbl_auteur_livre
    inner join biblio.tbl_auteurs
		on biblio.tbl_auteur_livre.id_auteur = biblio.tbl_auteurs.id_auteur
	where biblio.tbl_auteur_livre.id_auteur = "Yvon Blais";
    
    select count(biblio.tbl_auteur_livre.id_auteur) as "Nb Livres publiés pour "
	from biblio.tbl_auteur_livre
    inner join biblio.tbl_auteurs
		on biblio.tbl_auteur_livre.id_auteur = biblio.tbl_auteurs.id_auteur
	-- where biblio.tbl_auteurs.nom like  "%Guérin%" ;
    where biblio.tbl_auteur_livre.id_auteur = 10;
    

/*
Modification de la structure de votre base de données (9 points)
9. Ajouter les tables suivantes à votre base de données :
*/
/*Table «tbl_membre», comprenant les champs suivants :
 un numéro de membre qui agit comme clé primaire;
 un nom;
 un prénom.
 Index sur les champs nom et prénom. Cet index doit s’appeler idxNomLong
*/
use biblio;
CREATE TABLE IF NOT EXISTS biblio.tbl_membre (
  id_membre INT NOT NULL AUTO_INCREMENT,
  nom_membre VARCHAR(45) NOT NULL,
  prenom_membre VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_membre),
  INDEX idxNomLong (nom_membre,prenom_membre ) 
  )ENGINE = InnoDB;


/*Table « tbl_pret », comprenant les champs suivant :
 un numéro de prêt qui agit comme clé primaire;
 une date de prêt;
 une date de retour;
 un numéro de membre qui est clé externe de la table « tbl_membre »;
 ainsi qu'un numéro de livre qui est une clé externe de la table « tbl_livre »*/


CREATE TABLE IF NOT EXISTS biblio.tbl_pret (

	id_pret INT NOT NULL AUTO_INCREMENT,
	date_pret datetime DEFAULT NULL,
	date_retour datetime DEFAULT NULL,
	id_membre INT NOT NULL ,
	id_livre INT NOT NULL ,
  PRIMARY KEY (id_pret),  
  
  CONSTRAINT `fk_tbl_membre_id_membre`
    FOREIGN KEY (`id_membre`)
    REFERENCES biblio.tbl_membre (id_membre),
  
  CONSTRAINT `fk_tbl_livre_id_livre2`
    FOREIGN KEY (`id_livre`)
    REFERENCES biblio.tbl_livres (id_livre)  
  )ENGINE = InnoDB;
  
  -- pour verifier
  
  /*
  Insertion de données dans votre base de données (12 points) :
  */
  
  /*
10. Donnez le code vous permettant d’ajouter les trois (3) enregistrements suivants dans 
les bonnes tables.

Attention, vous devez respecter l’intégrité pour les tables : éditeur, sujet, auteur et
auteur_livre.

Vous devez utiliser des sous-requêtes dans vos insertions pour les champs qui font 
référence à d’autre table.

 Sigmund Freud, (2010) Psychologie de la vie amoureuse, Éditeur : Payot,104 pages.

 Marc Batty, Médéric Morel, Jean-Luc Raffaëlli, et Michel Delattre. Big data et machine
learning: manuel du data scientist. Éditeur: Dunod, 2015.

 Soutou, Christian. Programmer avec MySQL: SQL, transactions, PHP, Java,
optimisations. Éditeur : Eyrolles, 2013.

*/


-- insert autor

select *
	from  biblio.tbl_auteurs
    where  biblio.tbl_auteurs.nom = "Freud, Sigmund";
    
insert into biblio.tbl_auteurs (nom)
	value("Freud, Sigmund");
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
-- id = 15 

/*------------------------------------------------*/
-- insert sujet
select * 
	from biblio.tbl_sujets
    where biblio.tbl_sujets.sujet = "Psychologie";
-- resultad : id =  10

/*------------------------------------------------*/
-- insert type de publications
select * 
	from biblio.tbl_type_publications
    where biblio.tbl_type_publications.type_publcation = "Livres";
-- id = 2

/*------------------------------------------------*/
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




    
/*
11. Afficher les trois derniers enregistrements de la table tbl_livres. Vous devez utiliser la clause
Limit. (2 points)*/

SELECT * FROM biblio.tbl_livres  LIMIT 3;

/*
12. Afficher les livres avec les informations suivantes : titre, les auteurs et l’année de
publication. (2 points)
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

/*Partie 2 : Base de données Marketing (30 points)*/

/*13. Quel code vous permet de donner l’espace utilisé par les tables et les index de 
la base de données marketing. (2 point)*/
-- ---???????
/*Sélection des données, données le code permettant :
14. Affichez la liste des clients ayant un contrat en ordre croissant de ville et de client. (3 points)
*/
select * from marketingv2.tbl_contrat;
select 	marketingv2.tbl_client.nom_client as "Client",
		marketingv2.tbl_ville.ville as "ville"
	from marketingv2.tbl_client
    inner join marketingv2.tbl_contrat
		on marketingv2.tbl_client.id_client = marketingv2.tbl_contrat.id_client
	inner join marketingv2.tbl_ville
		on marketingv2.tbl_client.id_ville = marketingv2.tbl_ville.id_ville;	

/*15. Affichez le somme (le montant) des contrats (5 points)*/

select * from marketingv2.tbl_detail_contrat;

select sum(marketingv2.tbl_detail_contrat.prix_unitaire) as "le montant"
	from marketingv2.tbl_detail_contrat;
    


/*16. Afficher la somme (le montant) des contrats par clients (5 points)*/

select 
		marketingv2.tbl_client.nom_client as "Nom Client",
        marketingv2.tbl_detail_contrat.prix_unitaire
    from marketingv2.tbl_client
    inner join marketingv2.tbl_contrat
		on marketingv2.tbl_client.id_client = marketingv2.tbl_contrat.id_client
	inner join marketingv2.tbl_detail_contrat
		on marketingv2.tbl_contrat.id_contrat = marketingv2.tbl_detail_contrat.id_contrat
;

/*
17. Affichez un nouveau champ CodeClient donnant les trois premiers caractères du nom de
clients concaténer avec les trois derniers caractères du code postal. (2 points)*/

select 
		concat(marketingv2.tbl_client.nom_client, 
			marketingv2.tbl_client.code_postal_client)  as "CodeClient"
    from marketingv2.tbl_client
    where CodeClient is not null;

/* 18. Donnez le nombre de jours écoulé depuis la signature de chaque contrat. (5 points)
19. Affichez le nom et prénom des représentants concaténés, le nombre des rendez-vous et le
nombre d’appels pour chacun d’eux (une ligne pour chacun). (8 points)