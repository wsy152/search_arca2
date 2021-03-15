-- MySQL Workbench Synchronization
-- Generated: 2021-03-15 17:07
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: glauc

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `db_arca_teste`.`tb_cartsproducts` (
  `idcartproduct` INT(11) NOT NULL AUTO_INCREMENT,
  `idcart` INT(11) NOT NULL,
  `idproduct` INT(11) NOT NULL,
  `dtremoved` DATETIME NOT NULL,
  `dtregister` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcartproduct`),
  INDEX `FK_cartsproducts_products_idx` (`idproduct` ASC),
  CONSTRAINT `fk_cartsproducts_products`
    FOREIGN KEY (`idproduct`)
    REFERENCES `db_arca_teste`.`tb_company` (`idcomapany`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_arca_teste`.`tb_categories` (
  `idcategory` INT(11) NOT NULL AUTO_INCREMENT,
  `cdescategory` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`idcategory`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_arca_teste`.`tb_company` (
  `idcomapany` INT(11) NOT NULL AUTO_INCREMENT,
  `ctitle` VARCHAR(100) NOT NULL,
  `cphone` VARCHAR(15) NOT NULL,
  `caddress` VARCHAR(100) NOT NULL,
  `czipcode` VARCHAR(10) NOT NULL,
  `cdescription` VARCHAR(200) NOT NULL,
  `tb_state_idstate` INT(11) NOT NULL,
  `tb_city_idcity` INT(11) NOT NULL,
  PRIMARY KEY (`idcomapany`),
  INDEX `fk_tb_company_tb_state1_idx` (`tb_state_idstate` ASC),
  INDEX `fk_tb_company_tb_city1_idx` (`tb_city_idcity` ASC),
  CONSTRAINT `fk_tb_company_tb_state1`
    FOREIGN KEY (`tb_state_idstate`)
    REFERENCES `db_arca_teste`.`tb_state` (`idstate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_company_tb_city1`
    FOREIGN KEY (`tb_city_idcity`)
    REFERENCES `db_arca_teste`.`tb_city` (`idcity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_arca_teste`.`tb_companycategories` (
  `idcategory` INT(11) NOT NULL,
  `idproduct` INT(11) NOT NULL,
  PRIMARY KEY (`idcategory`, `idproduct`),
  INDEX `fk_productscategories_products_idx` (`idproduct` ASC),
  CONSTRAINT `fk_productscategories_categories`
    FOREIGN KEY (`idcategory`)
    REFERENCES `db_arca_teste`.`tb_categories` (`idcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productscategories_products`
    FOREIGN KEY (`idproduct`)
    REFERENCES `db_arca_teste`.`tb_company` (`idcomapany`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_arca_teste`.`tb_users` (
  `iduser` INT(11) NOT NULL AUTO_INCREMENT,
  `ulogin` VARCHAR(64) NOT NULL,
  `upassword` VARCHAR(256) NOT NULL,
  `inadmin` TINYINT(4) NOT NULL DEFAULT '0',
  `username` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_arca_teste`.`tb_city` (
  `idcity` INT(11) NOT NULL AUTO_INCREMENT,
  `citdescription` VARCHAR(100) NOT NULL,
  `tb_state_idstate` INT(11) NOT NULL,
  PRIMARY KEY (`idcity`),
  INDEX `fk_tb_city_tb_state1_idx` (`tb_state_idstate` ASC),
  CONSTRAINT `fk_tb_city_tb_state1`
    FOREIGN KEY (`tb_state_idstate`)
    REFERENCES `db_arca_teste`.`tb_state` (`idstate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_arca_teste`.`tb_state` (
  `idstate` INT(11) NOT NULL AUTO_INCREMENT,
  `stdescription` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idstate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
