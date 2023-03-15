-- MySQL Script generated by MySQL Workbench
-- mié 15 mar 2023 13:29:00
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pel·lícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pel·lícula` (
  `idPel·lícula` INT NOT NULL AUTO_INCREMENT,
  `Gènere` VARCHAR(45) NOT NULL,
  `Cine` VARCHAR(45) NOT NULL,
  `Títol` VARCHAR(45) NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  `Durada` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPel·lícula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projecció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projecció` (
  `idProjecció` INT NOT NULL AUTO_INCREMENT,
  `Cine` VARCHAR(45) NOT NULL,
  `Pel·lícula` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Sala` VARCHAR(45) NOT NULL,
  `Pel·lícula_idPel·lícula` INT NOT NULL,
  PRIMARY KEY (`idProjecció`),
  INDEX `fk_Projecció_Pel·lícula1_idx` (`Pel·lícula_idPel·lícula` ASC) VISIBLE,
  CONSTRAINT `fk_Projecció_Pel·lícula1`
    FOREIGN KEY (`Pel·lícula_idPel·lícula`)
    REFERENCES `mydb`.`Pel·lícula` (`idPel·lícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cine` (
  `idCine` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  `Població` VARCHAR(45) NOT NULL,
  `Núm sales` VARCHAR(45) NOT NULL,
  `Projecció_idProjecció` INT NOT NULL,
  PRIMARY KEY (`idCine`),
  INDEX `fk_Cine_Projecció1_idx` (`Projecció_idProjecció` ASC) VISIBLE,
  CONSTRAINT `fk_Cine_Projecció1`
    FOREIGN KEY (`Projecció_idProjecció`)
    REFERENCES `mydb`.`Projecció` (`idProjecció`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa` (
  `idTarifa` INT NOT NULL AUTO_INCREMENT,
  `Cine` VARCHAR(45) NOT NULL,
  `Tipus` VARCHAR(45) NOT NULL,
  `Preu` VARCHAR(45) NOT NULL,
  `Cine_idCine` INT NOT NULL,
  PRIMARY KEY (`idTarifa`),
  INDEX `fk_Tarifa_Cine1_idx` (`Cine_idCine` ASC) VISIBLE,
  CONSTRAINT `fk_Tarifa_Cine1`
    FOREIGN KEY (`Cine_idCine`)
    REFERENCES `mydb`.`Cine` (`idCine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipus de tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipus de tarifa` (
  `idTipus de tarifa` INT NOT NULL AUTO_INCREMENT,
  `Dia de l'espactador` VARCHAR(45) NOT NULL,
  `Jubilat` VARCHAR(45) NOT NULL,
  `Festiu` VARCHAR(45) NOT NULL,
  `Tarifa_idTarifa` INT NOT NULL,
  PRIMARY KEY (`idTipus de tarifa`),
  INDEX `fk_Tipus de tarifa_Tarifa_idx` (`Tarifa_idTarifa` ASC) VISIBLE,
  CONSTRAINT `fk_Tipus de tarifa_Tarifa`
    FOREIGN KEY (`Tarifa_idTarifa`)
    REFERENCES `mydb`.`Tarifa` (`idTarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
