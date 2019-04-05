-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 16 déc. 2017 à 15:38
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `resto_concept`

CREATE SCHEMA IF NOT EXISTS `resto_concept` DEFAULT CHARACTER SET utf8 ;
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--


use resto_concept;


CREATE TABLE `adresses` (
  `idAdrs` int(11) NOT NULL AUTO_INCREMENT,
  `noCvq` varchar(10) DEFAULT NULL,
  `Rue` varchar(50) NOT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `province` varchar(2) DEFAULT NULL,
  `codePostal` char(7) DEFAULT NULL,
  `telephone` char(15) DEFAULT NULL,
	PRIMARY KEY (`idAdrs`),
	INDEX `idx_codePostal` (`codePostal` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------
--
-- Structure de la table `typecomptes`
--

CREATE TABLE `typecomptes` (
  `idtype` int(11) NOT NULL AUTO_INCREMENT,
  `nomType` varchar(35) CHARACTER SET utf8 NOT NULL,
  	PRIMARY KEY (`idtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Structure de la table `comptes`
--

CREATE TABLE `comptes` (
  `noCompte` int(11) NOT NULL AUTO_INCREMENT,
  `notpCmpt` int(11) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `noAdrs` int(11) NOT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `Courriel` varchar(100) DEFAULT NULL,
  `nomUtilisateur` varchar(20) NOT NULL,
  `motPasse` varchar(40) NOT NULL,
  `Actif` tinyint(1) NOT NULL DEFAULT '1',
  `commentaires` varchar(250) NOT NULL,
	PRIMARY KEY (`noCompte`),
	INDEX `idx_nomUtilisateur` (`nomUtilisateur` ASC),
CONSTRAINT `comptes_ibfk_1`
    FOREIGN KEY (`notpCmpt`)
    REFERENCES `typecomptes` (`idtype`),
CONSTRAINT `adrs_ibfk_2`
    FOREIGN KEY (`noAdrs`)
    REFERENCES `adresses` (`idAdrs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(100) NOT NULL,
	PRIMARY KEY (`idCategorie`),
	INDEX `idx_nomCategorie` (`nomCategorie` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `produits` (
  `idProduit` int(11) NOT NULL AUTO_INCREMENT,
  `nomProd` varchar(100) NOT NULL,
  `descProd` varchar(500) NOT NULL,
  `prixProd` decimal(10,0) NOT NULL,
  `imgProd` varchar(1000) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idProduit`),
  INDEX `idx_prod_ibfk` (`nomProd` ASC),
  CONSTRAINT `prod_ibfk_1`
    FOREIGN KEY (`idCategorie`)
    REFERENCES `categories` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


------------------------------------------------------

--
-- Structure de la table `restaurants`
--

CREATE TABLE `restaurants` (
  `idResto` int(11) NOT NULL AUTO_INCREMENT,
  `nomResto` varchar(150) NOT NULL,
  `idAdrs` int(11) NOT NULL,
  `Actif` tinyint(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`idResto`),
	INDEX `idx_nomResto` (`nomResto` ASC),
	CONSTRAINT `restaurants_ibfk_1`
		FOREIGN KEY (`idAdrs`)
		REFERENCES `adresses` (`idAdrs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `titreMenu` varchar(100) NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `commentaires` varchar(200) NOT NULL,
  `idResto` int(11) NOT NULL,
        PRIMARY KEY (`idMenu`),
        INDEX `idx_titreMenu` (`titreMenu` ASC),
	CONSTRAINT `Menus_ibfk_1`
		FOREIGN KEY (`idResto`)
		REFERENCES `restaurants` (`idResto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `menu_produits`
--

CREATE TABLE `menu_produits` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `idMenu` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
          PRIMARY KEY (`idItem`),
  	CONSTRAINT `menuprod_ibfk_1`
		FOREIGN KEY (`idMenu`)
		REFERENCES `menus` (`idMenu`),
	CONSTRAINT `menuprod_ibfk_2`
		FOREIGN KEY (`idProduit`)
		REFERENCES `produits` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etatcommandes`
--

CREATE TABLE `etatcommandes` (
  `idEtat` int(11) NOT NULL AUTO_INCREMENT,
  `Etat` varchar(35) CHARACTER SET utf8 NOT NULL,
          PRIMARY KEY (`idEtat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Structure de la table `modespaiement`
--

CREATE TABLE `modespaiement` (
  `idMode` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
	PRIMARY KEY (`idMode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `idCommande` int(11) NOT NULL AUTO_INCREMENT,
  `datecommande` datetime NOT NULL,
  `idetat` int(11) NOT NULL,
  `idModePaiement` int(11) NOT NULL,
  `noClient` int(11) NOT NULL,
  `noAdrs` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `commentaires` varchar(250) NOT NULL,
PRIMARY KEY (`idCommande`),
	CONSTRAINT `commandes_ibfk_1`
		FOREIGN KEY (`idModePaiement`)
		REFERENCES `modespaiement` (`idMode`),
	CONSTRAINT `commandes_ibfk_2`
		FOREIGN KEY (`noClient`)
		REFERENCES `comptes` (`noCompte`),
	CONSTRAINT `commandes_ibfk_3`
		FOREIGN KEY (`noAdrs`)
		REFERENCES `adresses` (`idAdrs`),
	CONSTRAINT `commandes_ibfk_4`
		FOREIGN KEY (`idetat`)
		REFERENCES `etatcommandes` (`idEtat`),
	CONSTRAINT `commandes_ibfk_5`
		FOREIGN KEY (`idMenu`)
		REFERENCES `menus` (`idMenu`)
        
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Structure de la table `items_commande`
--

CREATE TABLE `items_commande` (
  `noCommande` int(11) NOT NULL,
  `noProduit` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  	CONSTRAINT `itemcommandes_ibfk_1`
		FOREIGN KEY (`noCommande`)
		REFERENCES `commandes` (`idCommande`),
        	CONSTRAINT `itemcommandes_ibfk_2`
		FOREIGN KEY (`noProduit`)
		REFERENCES `produits` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------


-- --------------------------------------------------------


-- ------------------------------------------------------
   
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
