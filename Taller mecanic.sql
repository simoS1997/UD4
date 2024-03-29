-- MySQL Script generated by MySQL Workbench
-- mié 15 mar 2023 13:38:09
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
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `Client` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Població` VARCHAR(45) NOT NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipus_Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipus_Vehicle` (
  `idTipus_Vehicle` INT NOT NULL AUTO_INCREMENT,
  `ID` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipus_Vehicle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicle` (
  `Matricula` INT NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `DNS_Client` VARCHAR(45) NOT NULL,
  `ID_TIPUS_VEHICLE` VARCHAR(45) NOT NULL,
  `Client_Client` INT NOT NULL,
  `Tipus_Vehicle_idTipus_Vehicle` INT NOT NULL,
  PRIMARY KEY (`Matricula`),
  INDEX `fk_Vehicle_Client_idx` (`Client_Client` ASC) VISIBLE,
  INDEX `fk_Vehicle_Tipus_Vehicle1_idx` (`Tipus_Vehicle_idTipus_Vehicle` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Client`
    FOREIGN KEY (`Client_Client`)
    REFERENCES `mydb`.`Client` (`Client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Tipus_Vehicle1`
    FOREIGN KEY (`Tipus_Vehicle_idTipus_Vehicle`)
    REFERENCES `mydb`.`Tipus_Vehicle` (`idTipus_Vehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cita` (
  `Matricula_Vehicle` INT NOT NULL AUTO_INCREMENT,
  `Data` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Vehicle_Matricula` INT NOT NULL,
  PRIMARY KEY (`Matricula_Vehicle`),
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_Matricula`)
    REFERENCES `mydb`.`Vehicle` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
