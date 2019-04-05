use resto_concept;

show tables ;

#insertion des adresses pour 3 succursales du resto
insert into adresses (noCvq, Rue, Ville, province, codePostal, telephone) 
				values (56, 'Chemin Sainte-foy', 'Québec', 'QC', 'G1S 4V5', '5814445566'),
						(11, 'Chemin Royal', 'Québec', 'QC', 'G4A 0C5', '5814442233'),
                        (44, 'Avenue Cartier', 'Québec', 'QC', 'G2L 4V5', '5814447788');

#insertions pour autres utilisateurs
INSERT INTO adresses (noCvq,Rue,ville,province,codePostal,telephone) VALUES (395,"Sed","Graneros","QC","J9H 1T5","(606) 162-5571"),(134,"rhoncus.","Kapuskasing","QC","A0B 3Z1","(231) 794-7454"),(246,"ac","Couillet","QC","H4G 8P6","(796) 398-0432"),(611,"lobortis","Campolieto","QC","R8B 0G5","(965) 300-4526"),(128,"mauris.","Dietzenbach","QC","K5Y 6J1","(950) 664-1209"),(352,"luctus","Cagnes-sur-Mer","QC","H2C 8Z8","(268) 371-1860"),(687,"mi","Darıca","QC","G3L 8J4","(579) 767-8399"),(425,"pede.","Trevignano Romano","QC","S1W 2C2","(612) 954-3792"),(357,"ultrices","Legnica","QC","X0R 7K2","(437) 885-5145"),(699,"semper","Taber","QC","S9G 2M6","(288) 931-3844");


