Drop database if exists rempart;
create database rempart;

use rempart;
create table partie(
idPartie int primary key auto_increment,
datePartie datetime not null default '0000-00-00 00:00:00',
visiteur varchar(25) not null default 'null',
local varchar(25) not null default 'null');


LOAD DATA LOCAL INFILE '//Users//jpduches//Dropbox//420-419-SF-H19-4383//Exercices//Exercice11FunctionDate//code//REMPARTS.CSV'
INTO TABLE partie
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(datePartie,visiteur, local);

select version();

Error Code: 29. File 'C:\Users\jpduchesneau\Dropbox\420-419-SF-H18-4381\Exercices\Mysql\Exercice11FunctionDate\code\REMPARTS.CSV' not found (Errcode: 13 - Permission denied)

show variables like "sql_mode";


select * from partie;

-- Donner le nombre de partie  en janvier.

select count(*) from partie where month(datePartie)=1;

-- Combien de fois les Remparts joue un deuxième jour du mois ?

select count(*) from partie where day(datePartie)=2;

-- Sélectionnez les partie qui ont lieu dans les 8 premières semaine de l'année 2013.
select * from partie where weekofyear(datePartie)<9;

--  Afficher le jour (en chiffres)  et le mois  (en toutes lettres), les visiteurs et les locaux 
-- Pour les parties ayant lieu à l'extérieur dans les deux dernières semaine de l'année 2012.
select datePartie, day(datePartie) as Jour, monthname(datePartie) as mois, visiteur, local
from partie
where Week(datePartie) >50;

-- Même chose que la question précédente, mais placer la date dans un seule champ avec jour en lettre, date en chiffre, mois en lettre et années en chiffre. Ex('Sunday 30 December 2012')
select datePartie, date_format(datePartie, '%W %d %M %Y') as Jour, monthname(datePartie) as mois, visiteur, local
from partie
where Week(datePartie) >50;

-- Afficher la première partie, la dernière partie et calculer la différence (nombre de jour) entre la première et la dernière partie

select min(datePartie) as PremièrePartie, max(datePartie) As DernièrePartie,
	datediff(max(datePartie), min(datePartie)) as nbJour 
from partie;
-- Afficher la date des partie dans le format suivant Frideay, 12 dec 2013 à 07:00 PM
select date_format(datePartie, '%W, %d %b %Y à %l:%i %p ') as PremièrePartie
from partie;