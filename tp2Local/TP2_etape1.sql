-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tp2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tp2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tp2` DEFAULT CHARACTER SET utf8 ;
USE `tp2` ;

-- -----------------------------------------------------
-- Table `tp2`.`local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`local` (
  `id_local` INT NOT NULL AUTO_INCREMENT,
  `nom_local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_local`),
  INDEX `idxLocal` (`id_local` ASC) INVISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp2`.`fabricant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`fabricant` (
  `id_fabricant` INT NOT NULL AUTO_INCREMENT,
  `nom_fabricant` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fabricant`),
  INDEX `idxNomFabricant` (`nom_fabricant` ASC) INVISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp2`.`poste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`poste` (
  `id_poste` INT NOT NULL AUTO_INCREMENT,
  `desc_poste` VARCHAR(45) NULL,
  `desc_processeur` VARCHAR(45) NULL,
  `nb_ram_mem` VARCHAR(45) NULL,
  `tail_disque_giga` INT NULL,
  `id_fabricant` INT NULL,
  `id_local` INT NULL,
  PRIMARY KEY (`id_poste`),
  INDEX `fk_tbl_local_id_local1_idx` (`id_local` ASC) INVISIBLE,
  INDEX `fk_tbl_fabricant_id_fabricant_idx` (`id_fabricant` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_local_id_local1`
    FOREIGN KEY (`id_local`)
    REFERENCES `tp2`.`local` (`id_local`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_fabricant_id_fabricant`
    FOREIGN KEY (`id_fabricant`)
    REFERENCES `tp2`.`fabricant` (`id_fabricant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp2`.`editeur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`editeur` (
  `id_editeur` INT NOT NULL,
  `nom_editeur` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_editeur`),
  INDEX `idxNomEditeur` (`nom_editeur` ASC) INVISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp2`.`logiciel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`logiciel` (
  `id_logiciel` INT NOT NULL AUTO_INCREMENT,
  `nom_logiciel` VARCHAR(45) NOT NULL,
  `nb_licence` INT NULL,
  `id_editeur` INT NULL,
  PRIMARY KEY (`id_logiciel`),
  INDEX `fk_id_editeur_idx` (`id_editeur` ASC) INVISIBLE,
  CONSTRAINT `fk_id_editeur`
    FOREIGN KEY (`id_editeur`)
    REFERENCES `tp2`.`editeur` (`id_editeur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp2`.`poste_has_tbl_logiciel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`poste_has_tbl_logiciel` (
  `id_poste` INT NOT NULL,
  `id_logiciel` INT NOT NULL,
  PRIMARY KEY (`id_poste`, `id_logiciel`),
  INDEX `fk_tbl_logiciel_id_logiciel1_idx` (`id_logiciel` ASC) INVISIBLE,
  CONSTRAINT `fk_tbl_logiciel_id_logiciel1`
    FOREIGN KEY (`id_logiciel`)
    REFERENCES `tp2`.`logiciel` (`id_logiciel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_poste_id_poste1`
    FOREIGN KEY (`id_poste`)
    REFERENCES `tp2`.`poste` (`id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp2`.`usager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`usager` (
  `id_usager` INT NOT NULL AUTO_INCREMENT,
  `nom_usager` VARCHAR(45) NOT NULL,
  `prenom_usager` VARCHAR(45) NOT NULL,
  `telephone_usager` INT NULL,
  `id_local` INT NULL,
  PRIMARY KEY (`id_usager`),
  INDEX `fk_tbl_local_id_local1_idx` (`id_local` ASC) INVISIBLE,
  CONSTRAINT `fk_tbl_local_id_local1`
    FOREIGN KEY (`id_local`)
    REFERENCES `tp2`.`local` (`id_local`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp2`.`usager_has_tbl_poste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`usager_has_tbl_poste` (
  `id_usager` INT NOT NULL,
  `id_poste` INT NOT NULL,
  PRIMARY KEY (`id_usager`, `id_poste`),
  INDEX `fk_tbl_poste_id_poste2_idx` (`id_poste` ASC) INVISIBLE,
  CONSTRAINT `fk_tbl_usager_id_usager1`
    FOREIGN KEY (`id_usager`)
    REFERENCES `tp2`.`usager` (`id_usager`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_poste_id_poste2`
    FOREIGN KEY (`id_poste`)
    REFERENCES `tp2`.`poste` (`id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp2`.`peripherique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp2`.`peripherique` (
  `id_peripherique` INT NOT NULL AUTO_INCREMENT,
  `nom_peripherique` VARCHAR(45) NOT NULL,
  `id_poste` INT NULL,
  `id_fabricant` INT NULL,
  PRIMARY KEY (`id_peripherique`),
  INDEX `idxPeripherique` (`nom_peripherique` ASC) INVISIBLE,
  INDEX `fk_tbl_post_id_poste3_idx` (`id_poste` ASC) INVISIBLE,
  INDEX `fk_tbl_fabricant_id_fabricant2_idx` (`id_fabricant` ASC) INVISIBLE,
  CONSTRAINT `fk_tbl_post_id_poste3`
    FOREIGN KEY (`id_poste`)
    REFERENCES `tp2`.`poste` (`id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_fabricant_id_fabricant2`
    FOREIGN KEY (`id_fabricant`)
    REFERENCES `tp2`.`fabricant` (`id_fabricant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
