-- MySQL Script generated by MySQL Workbench
-- Thu Mar 14 21:16:39 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pratices-DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pratices-DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pratices-DB` DEFAULT CHARACTER SET utf8 ;
USE `Pratices-DB` ;

-- -----------------------------------------------------
-- Table `Pratices-DB`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pratices-DB`.`endereco` (
  `idendereco` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(100) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`idendereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pratices-DB`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pratices-DB`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `endereco_idendereco` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_endereco_idx` (`endereco_idendereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_endereco`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `Pratices-DB`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pratices-DB`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pratices-DB`.`pedido` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `valor` FLOAT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idpedido`),
  INDEX `fk_pedido_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Pratices-DB`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pratices-DB`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pratices-DB`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pratices-DB`.`produto_has_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pratices-DB`.`produto_has_pedido` (
  `produto_idproduto` INT NOT NULL,
  `pedido_idpedido` INT NOT NULL,
  PRIMARY KEY (`produto_idproduto`, `pedido_idpedido`),
  INDEX `fk_produto_has_pedido_pedido1_idx` (`pedido_idpedido` ASC) VISIBLE,
  INDEX `fk_produto_has_pedido_produto1_idx` (`produto_idproduto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_pedido_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `Pratices-DB`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_pedido_pedido1`
    FOREIGN KEY (`pedido_idpedido`)
    REFERENCES `Pratices-DB`.`pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;