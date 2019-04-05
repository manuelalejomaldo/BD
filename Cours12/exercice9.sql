use marketing;
create temporary table tmp_contrat
	like marketing.tbl_contrat;
    
select * from tmp_contrat;
select * from tbl_contrat;

describe tmp_contrat;
describe tbl_contrat;

insert into tmp_contrat
	select * from tbl_contrat
	where tbl_contrat.id_representant = 4;
    
insert into tmp_contrat (id_contrat,date_contrat,id_representant,id_client)
				values(7,'2019-03-08',1,1);
                
insert into tmp_contrat (id_contrat,date_contrat,id_representant,id_client)
				values(8,'2019-03-08',2,2);
                

select count(*)  from  tmp_contrat;

delete from tmp_contrat;

create temporary table tmp_contrat2
	select * from tbl_contrat;

select count(*)  from  tmp_contrat2;
select *  from  tmp_contrat2;

drop table if exists tmp_contrat;
drop table if exists tmp_contrat2;

set SQL_MODE = 'ALLOW_INVALID_DATES';

CREATE temporary TABLE contrat(
	id_contrat int unsigned primary key auto_increment,
    date_contrat date not null default '0000-00-00',
    date_maj datetime not null default current_timestamp,
    id_representant int not null,
    id_contact int not null)
    select * from tbl_contrat;
    
describe contrat;
select * from contrat;
select * from marketing.tbl_representant;

insert into contrat(date_contrat,id_representant,id_contact)
	values ('2019-03-08',7,9);

select * from contrat order by contrat.id_contrat desc;
insert into contrat(date_contrat,id_representant,id_contact)
	values ('2019-03-08',999,999);

select * from marketing.tbl_contact;
insert into contrat(date_contrat,id_representant,id_contact)
	value (
		current_date(),
		(select id_representant 
				from marketing.tbl_representant 
				where nom_rep like 'Duchesneau' and prenom_rep = 'Jean-Pierre'),
        (select marketing.tbl_contact.id_contact 
				from marketing.tbl_contact
                where nom_contact like 'Bergeron' and prenom_contact like 'Yvan'));


create view v_resumeClient as select c.id_client , 
			c.nom_client as Nom, 
            adresse_client  as Adresse,
            v.ville as Ville,
            c.code_postal_client as CP
		from client as c inner join ville as v
			on c.id_ville = v.id_ville
		order by c.nom_client;