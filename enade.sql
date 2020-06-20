-- MySQL Workbench Synchronization
-- Generated: 2020-06-14 19:25
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: C.Tiago

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `enade`.`tbTipoUsuario` (
  `idTipoUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeTipoUsuario` VARCHAR(45) NULL DEFAULT 'Aluno',
  PRIMARY KEY (`idTipoUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `enade`.`tbUsuario` (
  `idUsuario` INT(11) NOT NULL,
  `nomeUsuario` VARCHAR(45) NOT NULL,
  `emailUsuario` VARCHAR(45) NOT NULL,
  `senhaUsuario` VARCHAR(255) NOT NULL,
  `tbTipoUsuario_idTipoUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `emailUsuario_UNIQUE` (`emailUsuario` ASC) ,
  INDEX `fk_tbUsuario_tbTipoUsuario_idx` (`tbTipoUsuario_idTipoUsuario` ASC) ,
  CONSTRAINT `fk_tbUsuario_tbTipoUsuario`
    FOREIGN KEY (`tbTipoUsuario_idTipoUsuario`)
    REFERENCES `enade`.`tbTipoUsuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `enade`.`tbTipoQuestao` (
  `idTipoQuestao` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeTipoQuestao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoQuestao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `enade`.`tbQuestao` (
  `idQuestao` INT(11) NOT NULL AUTO_INCREMENT,
  `descricaoQuestao` VARCHAR(45) NOT NULL,
  `alternativaA` VARCHAR(45) NULL DEFAULT NULL,
  `alternativaB` VARCHAR(45) NULL DEFAULT NULL,
  `alternativaC` VARCHAR(45) NULL DEFAULT NULL,
  `alternativaD` VARCHAR(45) NULL DEFAULT NULL,
  `alternativaE` VARCHAR(45) NULL DEFAULT NULL,
  `questaocorreta` VARCHAR(45) NULL DEFAULT NULL,
  `tbTipoQuestao_idTipoQuestao` INT(11) NOT NULL,
  `estadoQuestao` TINYINT(4) NOT NULL,
  PRIMARY KEY (`idQuestao`),
  INDEX `fk_tbQuestao_tbTipoQuestao1_idx` (`tbTipoQuestao_idTipoQuestao` ASC) ,
  CONSTRAINT `fk_tbQuestao_tbTipoQuestao1`
    FOREIGN KEY (`tbTipoQuestao_idTipoQuestao`)
    REFERENCES `enade`.`tbTipoQuestao` (`idTipoQuestao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `enade`.`tbProva` (
  `idProva` INT(11) NOT NULL AUTO_INCREMENT,
  `dataProva` DATETIME NOT NULL,
  PRIMARY KEY (`idProva`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `enade`.`tbProva_has_tbQuestao` (
  `tbProva_idProva` INT(11) NOT NULL,
  `tbQuestao_idQuestao` INT(11) NOT NULL,
  PRIMARY KEY (`tbProva_idProva`, `tbQuestao_idQuestao`),
  INDEX `fk_tbProva_has_tbQuestao_tbQuestao1_idx` (`tbQuestao_idQuestao` ASC) ,
  INDEX `fk_tbProva_has_tbQuestao_tbProva1_idx` (`tbProva_idProva` ASC) ,
  CONSTRAINT `fk_tbProva_has_tbQuestao_tbProva1`
    FOREIGN KEY (`tbProva_idProva`)
    REFERENCES `enade`.`tbProva` (`idProva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbProva_has_tbQuestao_tbQuestao1`
    FOREIGN KEY (`tbQuestao_idQuestao`)
    REFERENCES `enade`.`tbQuestao` (`idQuestao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `enade`.`tbResultado` (
  `idResultado` INT(11) NOT NULL AUTO_INCREMENT,
  `valorObtido` VARCHAR(45) NOT NULL,
  `tbUsuario_idUsuario` INT(11) NOT NULL,
  `tbProva_idProva` INT(11) NOT NULL,
  PRIMARY KEY (`idResultado`),
  INDEX `fk_tbResultado_tbUsuario1_idx` (`tbUsuario_idUsuario` ASC) ,
  INDEX `fk_tbResultado_tbProva1_idx` (`tbProva_idProva` ASC) ,
  CONSTRAINT `fk_tbResultado_tbUsuario1`
    FOREIGN KEY (`tbUsuario_idUsuario`)
    REFERENCES `enade`.`tbUsuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbResultado_tbProva1`
    FOREIGN KEY (`tbProva_idProva`)
    REFERENCES `enade`.`tbProva` (`idProva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
