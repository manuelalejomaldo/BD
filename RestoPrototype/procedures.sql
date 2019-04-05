#
#procédure pour récuperer le menu d'un restaurant comme une liste de produits
#
drop procedure if exists menuResto;
DELIMITER $$
CREATE PROCEDURE menuResto(IN p_idResto INT)
BEGIN
	select p.idProduit, nomProd,prixProd,imgProd from produits as p
	inner join menu_produits as mp on p.idProduit=mp.idProduit
	inner join menus as m on mp.idMenu=m.idMenu
	inner join restaurants as r on m.idResto=r.idResto
	where r.idResto=p_idResto;
END $$
DELIMITER ;

call menuResto(1);

drop procedure if exists searchResto;
DELIMITER $$
CREATE PROCEDURE searchResto(IN p_codePostal CHAR(7))
BEGIN
	
    SELECT idResto FROM restaurants where idAdrs=(select idAdrs from adresses where codePostal= p_codePostal);
END $$
DELIMITER ;

describe comptes;

drop procedure if exists nomPrenonUser;
DELIMITER $$
CREATE PROCEDURE nomPrenonUser(IN p_nomUtilisateur VARCHAR(20), IN p_motPasse VARCHAR(40))
BEGIN

SELECT concat(prenom,' ' ,nom) as nomPrenom FROM comptes WHERE nomUtilisateur=p_nomUtilisateur AND motPasse=p_motPasse;
	
END $$
DELIMITER ;

#
##Procedure pour obtenir le id type du compte d'un utlisateur
#


drop procedure if exists getTypeCompte;
DELIMITER $$
CREATE PROCEDURE getTypeCompte(IN p_nomUtilisateur VARCHAR(20))
BEGIN
	SELECT notpCmpt as tcompte from comptes where nomUtilisateur=p_nomUtilisateur;

END $$
DELIMITER ;

call getTypeCompte('lesuperchef');
#
#Procedure pour obtenir les infos d'un produit 'a partir de son id
#
drop procedure if exists getProduit;
DELIMITER $$
CREATE PROCEDURE getProduit(IN p_idProd INT(11))
BEGIN
	SELECT * FROM produits WHERE idProduit=p_idProd;
END $$
DELIMITER ;


#
#Procedure pour ajouter un produit 'a un menu
#
drop procedure if exists menuProduit;
DELIMITER $$
CREATE PROCEDURE menuProduit(IN p_idResto INT(11),IN p_idProduits INT(11))
BEGIN
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO menu_produits (idMenu,idProduit)
		VALUES (p_idResto,p_idProduits);
END $$

DELIMITER ;