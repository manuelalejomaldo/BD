drop database if exists rempart;
create database rempart;

use rempart;

select @@Global.sql_mode;
select @@session.sql_mode;

set sql_mode='allow_invalid_dates';

create table partie(
	idPartie int primary key auto_increment,
    datePartie datetime not null default "0000-00-00 00:00:00",
    visiteur varchar(25) not null default 'null',
    local varchar(25) not null default 'null');
    
load data infile '//home//manumaldo//BD//BD//Exercice12//REMPARTS.CSV'
into table partie
columns terminated by '|'
optionally enclosed by '"'
escaped by '"'
lines terminated by '\n'
ignore 1 lines
(datePartie,visiteur,locaL);