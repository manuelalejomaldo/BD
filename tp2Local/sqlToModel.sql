-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
  `id_local` INT(11) NOT NULL AUTO_INCREMENT,
  `nom_local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_local`),
  INDEX `idxLocal` (`id_local` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
