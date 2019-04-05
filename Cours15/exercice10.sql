use elevagech24;
select concat(
				"Un(e) ", elevagech24.espece.nom_courant,
                " coute ", elevagech24.espece.prix, " euros." ) as Solution
	from Espece;

select concat_ws(" ", "Un(e)", nom_courant,"coute",prix) as Solution2 from espece;

select animal.nom, espece.nom_courant 
	from animal
	inner join espece on animal.id = espece.id
	where espece.nom_courant = "Chat"
			and substring (nom,2,1) = "a";
            
select replace(replace(nom,"a","@"),"e","3") as Solution 
	from animal
	inner join espece on animal.espece_id = espece.id
    where espece.nom_courant like "Perroquet%";
    
    
select nom, nom_courant
	from animal
    inner join espece on animal.espece_id = espece.id
    where nom_courant = "Chien" and char_length(nom) MOD 2=0;

select count(*) from race;

select count(elevagech24.animal.pere_id) 
	from elevagech24.animal
    inner join elevagech24.espece on elevagech24.espece.id = elevagech24.animal.id
    where elevagech24.espece.nom_courant = "Chien";
    
select max(elevagech24.animal.date_naissance)
	from elevagech24.animal
    where elevagech24.animal.sexe = "F";
    
select elevagech24.espece.nom_courant as Espece,
		avg(elevagech24.race.prix) as "Prix Moyen"
	from elevagech24.race
		inner join elevagech24.espece on elevagech24.race.espece_id = elevagech24.espece.id
	where elevagech24.espece.nom_courant in ("Chat","Chien")
	group by elevagech24.espece.nom_courant with rollup;
    
select sexe, count(*), group_concat(elevagech24.animal.nom separator ", ")
	from elevagech24.animal
		inner join elevagech24.espece on elevagech24.animal.espece_id = elevagech24.espece.id
	where elevagech24.espece.nom_courant = "Perroquet amazone"
    group by elevagech24.animal.sexe;
  -- -6  
select elevagech24.race.nom, count(elevagech24.animal.race_id) as nombre
	from elevagech24.race
    left join elevagech24.animal on elevagech24.animal.race_id = elevagech24.race.id
    group by elevagech24.race.nom
    having nombre = 0;
    
    -- --7
select elevagech24.espece.nom_latin, 	
		count(elevagech24.animal.espece_id) as nombre
	from elevagech24.espece
		left join elevagech24.animal on elevagech24.animal.espece_id = elevagech24.espece.id
	where elevagech24.animal.sexe = "M" or elevagech24.animal.id is null
    group by elevagech24.espece.nom_latin
    having nombre < 5;
    
    
-- -8
select  elevagech24.animal.sexe , 
		elevagech24.race.nom ,
        elevagech24.espece.nom_courant ,
        count(*) as nombre
	from elevagech24.animal
		inner join espece on animal.espece_id = espece.id
        inner join race on animal.race_id = race.id
	where animal.sexe is not null
    group by espece.nom_courant , race.nom , sexe with rollup;
    
-- - 9

select 	elevagech24.espece.nom_courant , 
		sum( coalesce(race.prix , espece.prix)) as somme
	from animal
		inner join espece on espece.id = animal.espece_id
        left join race on race.id = animal.race_id
	where animal.nom in ("Parlotte" , "Spoutnik" , "Caribou" , 
						"Cartouche" , "Cali" , "Canaille" , "Yoda" ,
                        "Zambo" , "Lulla")
	group by espece.nom_courant with rollup;
        
    