-- MySQL Script generated by MySQL Workbench
-- Sat Jul 20 16:55:42 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema integra
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema integra
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `integra` DEFAULT CHARACTER SET utf8mb3 ;
USE `integra` ;

-- -----------------------------------------------------
-- Table `integra`.`evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `integra`.`evento` ;

CREATE TABLE IF NOT EXISTS `integra`.`evento` (
  `idEvento` INT NOT NULL AUTO_INCREMENT,
  `Descripción` VARCHAR(100) NULL DEFAULT NULL,
  `Estado` CHAR(1) NULL DEFAULT NULL,
  `Imagen_de_Entrada` BLOB NULL DEFAULT NULL,
  `Fecha_de_Evento` DATETIME NULL DEFAULT NULL,
  `usuCreacion` VARCHAR(45) NULL DEFAULT NULL,
  `fecCreacion` DATETIME NULL DEFAULT NULL,
  `usuModifica` VARCHAR(45) NULL DEFAULT NULL,
  `fecModifica` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idEvento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `integra`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `integra`.`persona` ;

CREATE TABLE IF NOT EXISTS `integra`.`persona` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `dni` char(8) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `rol` varchar(45) DEFAULT 'Usuario',
  `usu_creacion` varchar(45) DEFAULT NULL,
  `fec_creacion` datetime DEFAULT NULL,
  `usu_modifica` varchar(45) DEFAULT NULL,
  `fec_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB 
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `integra`.`comentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `integra`.`comentario` ;

CREATE TABLE IF NOT EXISTS `integra`.`comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `Comentario_Txt` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha_Comentario` DATETIME NULL DEFAULT NULL,
  `Evento_idEvento` INT NULL DEFAULT NULL,
  `Usuario_idUsuario1` INT NOT NULL,
  `usuCreacion` VARCHAR(45) NULL DEFAULT NULL,
  `fecCreacion` DATETIME NULL DEFAULT NULL,
  `usuModifica` VARCHAR(45) NULL DEFAULT NULL,
  `fecModifica` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Evento1_idx` (`Evento_idEvento` ASC) VISIBLE,
  INDEX `fk_Comentario_Usuario1_idx` (`Usuario_idUsuario1` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `integra`.`evento` (`idEvento`),
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario1`)
    REFERENCES `integra`.`persona` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `integra`.`entrada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `integra`.`entrada` ;

CREATE TABLE IF NOT EXISTS `integra`.`entrada` (
  `idEntrada` INT NOT NULL AUTO_INCREMENT,
  `Estado` CHAR(1) NULL DEFAULT NULL,
  `Precio` DECIMAL(14,2) NULL DEFAULT NULL,
  `idEvento` INT NOT NULL,
  `Fecha` DATETIME NULL DEFAULT NULL,
  `Codigo_de_Entrada` VARCHAR(45) NULL DEFAULT NULL,
  `usuCreacion` VARCHAR(45) NULL DEFAULT NULL,
  `fecCreacion` DATETIME NULL DEFAULT NULL,
  `usuModifica` VARCHAR(45) NULL DEFAULT NULL,
  `fecModifica` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idEntrada`),
  INDEX `fk_Entrada_Evento1_idx` (`idEvento` ASC) VISIBLE,
  CONSTRAINT `fk_Entrada_Evento1`
    FOREIGN KEY (`idEvento`)
    REFERENCES `integra`.`evento` (`idEvento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `integra`.`venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `integra`.`venta` ;

CREATE TABLE IF NOT EXISTS `integra`.`venta` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `idEvento` INT NOT NULL,
  `idEntrada` INT NOT NULL,
  `Fecha` DATETIME NULL DEFAULT NULL,
  `Monto_Total` DECIMAL(14,2) NULL DEFAULT NULL,
  `Tipo_de_Venta` CHAR(1) NULL DEFAULT NULL,
  `idUsuario` INT NOT NULL,
  `usuCreacion` VARCHAR(45) NULL DEFAULT NULL,
  `fecCreacion` DATETIME NULL DEFAULT NULL,
  `usuModifica` VARCHAR(45) NULL DEFAULT NULL,
  `fecModifica` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `fk_Venta_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Venta_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `integra`.`persona` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `integra`.`detalle_venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `integra`.`detalle_venta` ;

CREATE TABLE IF NOT EXISTS `integra`.`detalle_venta` (
  `idDetalle_Venta` INT NOT NULL AUTO_INCREMENT,
  `Cantidad` INT NULL DEFAULT NULL,
  `idEntrada` INT NOT NULL,
  `idEvento` INT NOT NULL,
  `idVenta` INT NOT NULL,
  `usuCreacion` VARCHAR(45) NULL DEFAULT NULL,
  `fecCreacion` DATETIME NULL DEFAULT NULL,
  `usuModifica` VARCHAR(45) NULL DEFAULT NULL,
  `fecModifica` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idDetalle_Venta`),
  INDEX `fk_Detalle_Venta_Entrada1_idx` (`idEntrada` ASC) VISIBLE,
  INDEX `fk_Detalle_Venta_Evento1_idx` (`idEvento` ASC) VISIBLE,
  INDEX `fk_Detalle_Venta_Venta1_idx` (`idVenta` ASC) VISIBLE,
  CONSTRAINT `fk_Detalle_Venta_Entrada1`
    FOREIGN KEY (`idEntrada`)
    REFERENCES `integra`.`entrada` (`idEntrada`),
  CONSTRAINT `fk_Detalle_Venta_Evento1`
    FOREIGN KEY (`idEvento`)
    REFERENCES `integra`.`evento` (`idEvento`),
  CONSTRAINT `fk_Detalle_Venta_Venta1`
    FOREIGN KEY (`idVenta`)
    REFERENCES `integra`.`venta` (`idVenta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `integra`;

DELIMITER $$

USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T01I_Evento` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T01I_Evento`
BEFORE INSERT ON `integra`.`evento`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = USER();
  SET NEW.fecCreacion = NOW();
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T02U_Evento` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T02U_Evento`
BEFORE UPDATE ON `integra`.`evento`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = OLD.usuCreacion;
  SET NEW.fecCreacion = OLD.fecCreacion;
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T01I_Persona` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T01I_Persona`
BEFORE INSERT ON `integra`.`persona`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = USER();
  SET NEW.fecCreacion = NOW();
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T02U_Persona` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T02U_Persona`
BEFORE UPDATE ON `integra`.`persona`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = OLD.usuCreacion;
  SET NEW.fecCreacion = OLD.fecCreacion;
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T01I_Comentario` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T01I_Comentario`
BEFORE INSERT ON `integra`.`comentario`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = USER();
  SET NEW.fecCreacion = NOW();
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T02U_Comentario` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T02U_Comentario`
BEFORE UPDATE ON `integra`.`comentario`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = OLD.usuCreacion;
  SET NEW.fecCreacion = OLD.fecCreacion;
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T01I_Entrada` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T01I_Entrada`
BEFORE INSERT ON `integra`.`entrada`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = USER();
  SET NEW.fecCreacion = NOW();
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T02U_Entrada` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T02U_Entrada`
BEFORE UPDATE ON `integra`.`entrada`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = OLD.usuCreacion;
  SET NEW.fecCreacion = OLD.fecCreacion;
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T01I_Venta` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T01I_Venta`
BEFORE INSERT ON `integra`.`venta`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = USER();
  SET NEW.fecCreacion = NOW();
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T02U_Venta` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T02U_Venta`
BEFORE UPDATE ON `integra`.`venta`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = OLD.usuCreacion;
  SET NEW.fecCreacion = OLD.fecCreacion;
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T01I_Detalle_Venta` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T01I_Detalle_Venta`
BEFORE INSERT ON `integra`.`detalle_venta`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = USER();
  SET NEW.fecCreacion = NOW();
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


USE `integra`$$
DROP TRIGGER IF EXISTS `integra`.`T02U_Detalle_Venta` $$
USE `integra`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `integra`.`T02U_Detalle_Venta`
BEFORE UPDATE ON `integra`.`detalle_venta`
FOR EACH ROW
BEGIN
  SET NEW.usuCreacion = OLD.usuCreacion;
  SET NEW.fecCreacion = OLD.fecCreacion;
  SET NEW.usuModifica = USER();
  SET NEW.fecModifica = NOW();
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
