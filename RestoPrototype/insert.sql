--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`idAdrs`, `noCvq`, `Rue`, `ville`, `province`, `codePostal`, `telephone`) VALUES
(1, '154', 'la lune', 'Quebec', 'QC', 'G1X 3T3', '418-547-1234'),
(2, '198', 'Mars', 'Quebec', 'QC', 'G1K 3C3', '418-524-8484'),
(3, '128', 'Jupiter', 'Quebec', 'QC', 'G1K 3C4', '418-524-3414'),
(4, '587', 'La terre', 'Quebec', 'QC', 'G2F 4T5', '418-148-1482'),
(5, '569', 'Le soleil', 'Quebec', 'QC', 'G1F 4T7', '418-952-3654');


--
-- Déchargement des données de la table `typecomptes`
--

INSERT INTO `typecomptes` (`idtype`, `nomType`) VALUES
(1, 'Admin'),
(2, 'Gérant'),
(3, 'Chef'),
(4, 'Livreur'),
(5, 'Client');


--
-- Déchargement des données de la table `comptes`
--

INSERT INTO `comptes` (`noCompte`, `notpCmpt`, `prenom`, `nom`, `noAdrs`, `telephone`, `Courriel`, `nomUtilisateur`, `motPasse`, `Actif`, `commentaires`) VALUES
(1, 1, 'Alain', 'Bernad', 1, '418-148-1482', 'alain@yahoo.com', 'alainber', '12345678', 1, ''),
(2, 3, 'bob', 'LE super', 1, '418-952-3654', 'monchef@concept.ca', 'lesuperchef', '123456789', 1, ''),
(3, 5, 'Eric', 'lavisite', 2, '418-148-2382', 'labonne@yahoo.com', 'ericlavivi', '12345678', 1, ''),
(4, 5, 'Marie', 'La france', 3, '418-952-5754', 'france@gmail.com', 'francemarie', '123456789', 1, '');




--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCategorie`, `nomCategorie`) VALUES
(1, 'Promotions'),
(2, 'Pizza'),
(3, 'Poutines'),
(4, 'Hamburgers'),
(5, 'Poulet'),
(6, 'Pates'),
(7, 'Salade'),
(8, 'Desserts'),
(9, 'Boissons');



--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`idProduit`, `nomProd`, `descProd`, `prixProd`, `imgProd`, `idCategorie`) VALUES
(1, 'Duo pizza 12 pouces', 'Obtenez deux pizzas de notre éventail complet pour un prix incroyable !', '16', 'images/deuxpizzas.jpg', 1),
(2, 'Deux poutines', 'Obtenez deux poutines de format régulier pour seulement 15$ !', '15', 'images/poutine.jpg', 1),
(3, 'Le burger du Prince', 'Le burger du Prince, frite régulière et canette de liqueur de votre choix.', '9', 'images/trioprince.jpg', 1),
(4, 'La lasagne du chef', 'La lasagne suprême de notre chef émoustillera vos papilles !', '14', 'images/lasagnechef.jpg', 1),
(5, 'Special du chef', 'Description: Obtenez deux pizzas de notre ï¿½ventail complet pour un prix incroyable !', '18', 'images/pizzaquebecoise.jpg', 2),
(6, 'Pizza All-Dressed', 'Une pizza composée de fromage, peperonnis, champignons et piments verts.', '8', 'images/pizzaalldressed.jpg', 2),
(7, 'Pizza québécoise', 'Sauce tomates, boeuf haché, oignons, fromage.', '10', 'images/pizzaquebecoise.jpg', 2),
(8, 'Club sandwich (viande blanche)', 'Des tranches de poulet rôti (viande blanche), tomates, bacon, laitue frisée entre des tranches de pain grillé, le tout servi avec l’accompagnement de votre choix, sauce BBQ, salade de chou et 2 sachets de mayonnaise. ', '14', 'images/clubSandwich.jpg', 4),
(9, 'Burger artisan', 'Effiloché de porc nappé de sauce whisky BBQ, rondelles d’oignon, salade de chou, laitue frisée et tartinade de poivrons rouges grillés. Le tout servi dans un pain burger avec graines de pavot. \r\n', '12', 'images/burgerPorcEffiloche.jpg', 4),
(10, 'Économix avec boisson gazeuse (2 à 9 repas)', 'Repas pour 2 personnes et plus (prix indiqué par personne). Combinaison de quarts de poulet cuisse et quarts de poulet poitrine (50%/50%). ', '10', 'images/economixBoissonGazeuse.jpg', 1),
(11, 'Shish Royal', 'Délicieuse délicatesse exotique.', '6', 'images/shishTaouk.jpg', 7),
(12, 'Spaghetti Yolonaise', 'Delicieux spaghetti maison', '10', 'images/spagYolonaise.jpg', 6);

-- --
--
-- Déchargement des données de la table `restaurants`
--

INSERT INTO `restaurants` (`idResto`, `nomResto`, `idAdrs`, `Actif`) VALUES
(1, 'La lune brillante', 1, 1),
(2, 'Mon Mars', 2, 1),
(3, 'Velo', 3, 0);


--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`idMenu`, `titreMenu`, `actif`, `commentaires`, `idResto`) VALUES
(1, 'Menu de l\'été sur la lune', 1, '', 1),
(2, 'Menu de l\'hiver sur la lune', 0, 'n\'est pas actif', 1),
(3, 'Menu festival', 1, '', 2),
(4, 'Un menu santé ', 1, 'Super humm', 3);



--
-- Déchargement des données de la table `menu_produits`
--

INSERT INTO `menu_produits` (`idItem`, `idMenu`, `idProduit`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 8),
(5, 1, 9),
(6, 1, 10),
(7, 2, 12),
(8, 2, 11),
(9, 2, 9),
(10, 2, 6),
(11, 2, 8),
(12, 2, 1),
(13, 3, 7),
(14, 3, 3);


--
-- Déchargement des données de la table `etatcommandes`
--

INSERT INTO `etatcommandes` (`idEtat`, `Etat`) VALUES
(0, 'Refusée'),
(1, 'Acceptée'),
(2, 'En préparation'),
(3, 'Prête à livrer'),
(4, 'En livraison'),
(5, 'Livrée avec succès'),
(6, 'Problème de livraison'),
(7, 'Autre');


--
-- Déchargement des données de la table `modespaiement`
--

INSERT INTO `modespaiement` (`idMode`, `description`) VALUES
(1, 'Argents comptants'),
(2, 'Crédit'),
(3, 'Débit'),
(4, 'Coupons'),
(5, 'Carte cadeau');


--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`idCommande`, `datecommande`, `idetat`, `idModePaiement`, `noClient`, `noAdrs`, `idMenu`, `commentaires`) VALUES
(1, '2017-10-03 01:30:00', 5, 2, 3, 2, 1, ''),
(2, '2017-11-13 11:33:18', 3, 1, 3, 2, 1, ''),
(3, '2017-12-11 11:30:10', 1, 2, 3, 4, 2, ''),
(4, '2017-11-10 12:32:20', 3, 4, 2, 3, 1, ''),
(5, '2017-12-12 10:39:50', 4, 1, 3, 3, 3, '');


--
-- Déchargement des données de la table `items_commande`
--

INSERT INTO `items_commande` (`noCommande`, `noProduit`, `qte`) VALUES
(2, 2, 1),
(2, 1, 4),
(2, 8, 3),
(1, 1, 1),
(1, 4, 1),
(1, 2, 1),
(3, 11, 1),
(3, 12, 1),
(4, 2, 20),
(4, 4, 1),
(4, 8, 1),
(4, 10, 10),
(5, 11, 1);
