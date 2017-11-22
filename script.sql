-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema qini
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `qini` ;

-- -----------------------------------------------------
-- Schema qini
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `qini` DEFAULT CHARACTER SET utf8 ;
USE `qini` ;

-- -----------------------------------------------------
-- Table `qini`.`Estacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qini`.`Estacion` ;

CREATE TABLE IF NOT EXISTS `qini`.`Estacion` (
  `idEstacion` INT NOT NULL AUTO_INCREMENT,
  `nombreEstacion` VARCHAR(45) NULL,
  `bicicletasEstacion` INT NULL,
  `servidoresEstacion` INT NULL,
  PRIMARY KEY (`idEstacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qini`.`FranjaGlobal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qini`.`FranjaGlobal` ;

CREATE TABLE IF NOT EXISTS `qini`.`FranjaGlobal` (
  `idFranjaGlobal` INT NOT NULL AUTO_INCREMENT,
  `idEstacion` INT NOT NULL,
  `horaInicio` TIME NULL,
  `horaFinal` TIME NULL,
  `tiempoServicioPromedio` FLOAT NULL,
  `tiempoColaPromedio` FLOAT NULL,
  `existenciaCiclasPromedio` INT NULL,
  PRIMARY KEY (`idFranjaGlobal`, `idEstacion`),
  CONSTRAINT `fk_FranjaGlobal_Estacion1`
    FOREIGN KEY (`idEstacion`)
    REFERENCES `qini`.`Estacion` (`idEstacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FranjaGlobal_Estacion1_idx` ON `qini`.`FranjaGlobal` (`idEstacion` ASC);


-- -----------------------------------------------------
-- Table `qini`.`EsperaActual`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qini`.`EsperaActual` ;

CREATE TABLE IF NOT EXISTS `qini`.`EsperaActual` (
  `idEsperaActual` INT NOT NULL AUTO_INCREMENT,
  `idEstacion` INT NOT NULL,
  `duracionEspera` FLOAT NULL,
  PRIMARY KEY (`idEsperaActual`, `idEstacion`),
  CONSTRAINT `fk_EsperaActual_Estacion`
    FOREIGN KEY (`idEstacion`)
    REFERENCES `qini`.`Estacion` (`idEstacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EsperaActual_Estacion_idx` ON `qini`.`EsperaActual` (`idEstacion` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
