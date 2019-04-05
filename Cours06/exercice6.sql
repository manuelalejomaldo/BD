use marketing;
show tables;
select* from representant;
select count(*) from representant;
select concat(nom_rep, ',',prenom_rep) as Nom, id_succursale
	from representant
    order by concat(nom_rep, ',',prenom_rep);

-- ---1.  Principe des jointures
select *
	from succursale
    inner join representant
    on succursale.id_succursale = representant.id_representant;
    
-- ---1.1 jointure interne

SELECT 	Suc.id_succursale , 
		nom_succursale, 
		CONCAT( nom_rep , " , " , prenom_rep ) AS NomRep
	FROM	succursale AS suc
	INNER JOIN representant AS rep
	ON suc.id_succursale = rep.id_succursale
	ORDER BY CONCAT( nom_rep , " , " , prenom_rep ) ;
    
    SELECT 	Suc.id_succursale as Id, 
		nom_succursale  as NomSuc,
		CONCAT( nom_rep , " , " , prenom_rep ) AS NomRep
	FROM	succursale AS suc
	INNER JOIN representant AS rep
	ON suc.id_succursale = rep.id_succursale
	ORDER BY CONCAT( nom_rep , " , " , prenom_rep ) ;
    
    SELECT 	Suc.id_succursale as Id, 
		nom_succursale  as NomSuc,
		CONCAT( nom_rep , " , " , prenom_rep ) AS NomRep
	FROM	succursale AS suc
	INNER JOIN representant AS rep
	ON suc.id_succursale = rep.id_succursale
	ORDER BY Id;
    
-- ---1.3 jointure interne
select nom_succursale
	from succursale
    left join representant
    on succursale.id_succursale =  representant.id_succursale;
    
select * from representant;
select * from succursale;
    
select nom_succursale, CONCAT( nom_rep , " , " , prenom_rep ) AS NomRep
	from succursale
    left join representant
    on succursale.id_succursale =  representant.id_succursale
    where id_representant is  not null;
    
select nom_succursale, CONCAT( nom_rep , " , " , prenom_rep ) AS NomRep
	from succursale
    left join representant
    on succursale.id_succursale =  representant.id_succursale
    where id_representant is  null;
    
select nom_succursale, CONCAT( nom_rep , " , " , prenom_rep ) AS NomRep
	from succursale
    left join representant
    on succursale.id_succursale =  representant.id_succursale
    where representant.id_succursale is  null;
    
use marketing;
insert into representant (nom_rep, prenom_rep,id_succursale)
	values ("Terry", "Waspistan", 8);

select * from representant;

insert into succursale (nom_succursale,id_ville)
	value 
		("Pont-Rouge", (select id_ville 
							from ville 
							where ville like "Pont-Rouge")),
        ("Lévis", (select id_ville
						from ville
                        where ville like "Lévis"));

select * from succursale;

select succursale.id_succursale, nom_succursale
	from succursale
    left join representant
    on succursale.id_succursale =  representant.id_succursale
    where representant.id_succursale is  null;
    
select succursale.id_succursale, nom_succursale
	from succursale
    left join representant
    on succursale.id_succursale =  representant.id_succursale
    where representant.id_succursale is not null;

select concat(nom_rep,",",prenom_rep), succursale.nom_succursale
	from succursale
		right join representant
			on succursale.id_succursale = representant.id_succursale;

select concat(nom_rep,",",prenom_rep), succursale.nom_succursale
	from succursale
		right join representant
			on succursale.id_succursale = representant.id_succursale
	where representant.id_representant is not null;
    
select concat(nom_rep,",",prenom_rep), succursale.nom_succursale
	from succursale
		right join representant
			on succursale.id_succursale = representant.id_succursale
	where representant.id_representant is  null;
    
alter table representant modify column id_succursale int null;

insert into representant (nom_rep,prenom_rep, telephone_rep, tel_poste_rep, email_rep, note_rep, date_maj, id_succursale)
	values("Bouchard", "Oliver", Null, null, "obouchard@gmail.com", null,null,null);
select * from representant;

select concat(nom_rep,",",prenom_rep), succursale.nom_succursale
	from succursale
		right join representant
			on succursale.id_succursale = representant.id_succursale
	where representant.id_succursale is  null;
    
    -- ---1.4 Jointure interne avec plus de deux tables
    use marketing;
select 	marketing.succursale.nom_succursale as "Nom Succursale",
			concat(nom_rep,", ", prenom_rep) as "Nom représentant",
            id_contrat as "No. contrat",
            cast (date_contrat as Date) as "Date"
		from marketing.representant
        inner join contrat
			on marketing.representant.id_representant = marketing.contrat.id_representant
		inner join marketing.succursale
			on marketing.representant.id_succursale = marketing.succursale.id_succursale;

    
select * from marketing.representant;

select 	marketing.succursale.nom_succursale as "Nom Succursale",
		concat(nom_rep,", ", prenom_rep) as "Nom représentant",
        marketing.contrat.id_contrat as "no contrat",
        marketing.contrat.date_contrat  as "Date"
	from marketing.representant
    inner join marketing.contrat
		on marketing.representant.id_representant = marketing.contrat.id_representant
	inner join marketing.succursale
		on marketing.representant.id_succursale = marketing.succursale.id_succursale;
    
select marketing.succursale.nom_succursale as "Nom succursale",
	sum(marketing.outil_has_contrat.id_outil * marketing.outil.prixConnexion) as "Montant des contrats"
    from marketing.outil
	inner join marketing.outil_has_contrat as det
		on marketing.outil_has_contrat.id_outil = marketing.outil.id_outil
	inner join marketing.contrat
		on marketing.outil_has_contrat.id_contrat = marketing.contrat.id_contrat
	

		