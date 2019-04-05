/*
TP2 
Groupe: 
	Manuel Alejandro Maldonado 
    Modeste Peresoso
    Juan Carlos Todo le ayudan
*/
-- --------------------------------
CREATE DATABASE  IF NOT EXISTS `TP2` DEFAULT CHARACTER SET utf8 ;
USE `TP2`;

-- --------------------------------
-- Étape 1: création des tables
-- --------------------------------

-- -----------------------------------------------------
-- Table `TP2`.`local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`local` (
  `nom_Local` INT NOT NULL AUTO_INCREMENT,
  `nb_bureau` VARCHAR(45) NOT NULL,
  `nb_prise_eth` VARCHAR(45) NOT NULL,
  `imprimante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nom_Local`))
ENGINE = InnoDB;

CREATE INDEX `idxLocal` ON `TP2`.`local` (`nom_Local` ASC);

-- -----------------------------------------------------
-- Table `TP2`.`fabricant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`fabricant` (
  `nom_fabricant` INT NOT NULL AUTO_INCREMENT,
  `nom_fabricant` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nom_fabricant`))
ENGINE = InnoDB;

CREATE INDEX `idxNomFabricant` ON `TP2`.`fabricant` (`nom_fabricant` ASC, `nom_fabricant` ASC);


-- -----------------------------------------------------
-- Table `TP2`.`poste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`poste` (
  `id_poste` INT NOT NULL AUTO_INCREMENT,
  `desc_poste` VARCHAR(45) NULL,
  `desc_processeur` VARCHAR(45) NULL,
  `nb_ram_mo` VARCHAR(45) NULL,
  `tail_disque_giga` INT NULL,
  `id_local` INT NULL,
  `id_fabricant` INT NULL,
  PRIMARY KEY (`id_poste`),
  CONSTRAINT `tbl_local_id_local1_idx`
    FOREIGN KEY (`id_local`)
    REFERENCES `TP2`.`local` (`nom_Local`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tbl_fabricant_idx`
    FOREIGN KEY (`id_fabricant`)
    REFERENCES `TP2`.`fabricant` (`nom_fabricant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_fabricant_idx` ON `TP2`.`poste` (`id_fabricant` ASC) ;

CREATE INDEX `fk_tbl_local_id_local1_idx` ON `TP2`.`poste` (`id_local` ASC) ;


-- -----------------------------------------------------
-- Table `TP2`.`editeur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`editeur` (
  `nom_editeur` INT NOT NULL AUTO_INCREMENT,
  `nom_editeur` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nom_editeur`))
ENGINE = InnoDB;

CREATE INDEX `idxNomEditeur` ON `TP2`.`editeur` (`nom_editeur` ASC);


-- -----------------------------------------------------
-- Table `TP2`.`logiciel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`logiciel` (
  `nom_logiciel` INT NOT NULL AUTO_INCREMENT,
  `nom_logiciel` VARCHAR(45) NOT NULL,
  `nb_licence` INT NULL,
  `id_editeur` INT NOT NULL,
  PRIMARY KEY (`nom_logiciel`),
  CONSTRAINT `id_editeuridx`
    FOREIGN KEY (`id_editeur`)
    REFERENCES `TP2`.`editeur` (`nom_editeur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_id_editeuridxidx` ON `TP2`.`logiciel` (`id_editeur` ASC) ;


-- -----------------------------------------------------
-- Table `TP2`.`poste_has_tbl_logiciel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`poste_has_tbl_logiciel` (
  `id_poste` INT NULL,
  `id_logiciel` INT NULL,
  CONSTRAINT `fk_tbl_logiciel_id_logiciel1_idx`
    FOREIGN KEY (`id_logiciel`)
    REFERENCES `TP2`.`logiciel` (`nom_logiciel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_poste_id_poste1_idx`
    FOREIGN KEY (`id_poste`)
    REFERENCES `TP2`.`poste` (`id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_logiciel_id_logiciel1_idx` ON `TP2`.`poste_has_tbl_logiciel` (`id_logiciel` ASC);

CREATE INDEX `fk_tbl_poste_id_poste1_idx` ON `TP2`.`poste_has_tbl_logiciel` (`id_poste` ASC);

-- -----------------------------------------------------
-- Table `TP2`.`peripherique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`peripherique` (
  `id_peripherique` INT NULL,
  `nom_peripherique` VARCHAR(45) NOT NULL,
  `id_fabricant` INT NOT NULL,
  `id_poste` INT NULL,
  PRIMARY KEY (`id_peripherique`),
  CONSTRAINT `tbl_fabricant_id_fabricant`
    FOREIGN KEY (`id_fabricant`)
    REFERENCES `TP2`.`poste` (`id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idxPeripherique` ON `TP2`.`peripherique` (`id_peripherique` ASC);

CREATE INDEX `fk_tbl_fabricant_id_fabricant_idx` ON `TP2`.`peripherique` (`id_fabricant` ASC);


-- -----------------------------------------------------
-- Table `TP2`.`usager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`usager` (
  `id_usager` INT NOT NULL AUTO_INCREMENT,
  `nom_usager` VARCHAR(45) NOT NULL,
  `prenom_usager` VARCHAR(45) NOT NULL,
  `telephone_usager` INT NULL,
  `id_local` INT NULL,
  PRIMARY KEY (`id_usager`),
  CONSTRAINT `fk_tbl_local_id_local2_idx`
    FOREIGN KEY (`id_local`)
    REFERENCES `TP2`.`local` (`nom_Local`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_local_id_local2_idx` ON `TP2`.`usager` (`nom_usager` ASC, `prenom_usager` ASC);

CREATE INDEX ON `TP2`.`usager` (`id_local` ASC);


-- -----------------------------------------------------
-- Table `TP2`.`usager_has_tbl_poste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP2`.`usager_has_tbl_poste` (
  `id_usager` INT NULL,
  `id_poste` INT NULL,
  CONSTRAINT `fk_tbl_usager_id_usager1_idx`
    FOREIGN KEY (`id_usager`)
    REFERENCES `TP2`.`usager` (`id_usager`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_poste_id_poste2_idx`
    FOREIGN KEY (`id_poste`)
    REFERENCES `TP2`.`poste` (`id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_usager_id_usager1_idx` ON `TP2`.`usager_has_tbl_poste` (`id_usager` ASC);

CREATE INDEX `fk_ tbl_poste_id_poste2_idx` ON `TP2`.`usager_has_tbl_poste` (`id_poste` ASC);











