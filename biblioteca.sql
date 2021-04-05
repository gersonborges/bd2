-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`secao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`secao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`livro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `autores` TEXT NOT NULL,
  `secao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_SECAO` (`secao_id` ASC) ,
  CONSTRAINT `FK_SECAO`
    FOREIGN KEY (`secao_id`)
    REFERENCES `biblioteca`.`secao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UQ_EMAIL` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`emprestimo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_emprestimo` DATETIME NOT NULL,
  `data_devolucao` DATETIME NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_USUARIO` (`usuario_id` ASC) ,
  CONSTRAINT `fk_emprestimo_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `biblioteca`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`tem` (emprestimo_has_livros)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`tem` (
  `emprestimo_id` INT NOT NULL,
  `livro_id` INT NOT NULL,
  PRIMARY KEY (`emprestimo_id`, `livro_id`),
  INDEX `fk_emprestimo_has_livro_livro1_idx` (`livro_id` ASC) ,
  INDEX `fk_emprestimo_has_livro_emprestimo1_idx` (`emprestimo_id` ASC) ,
  CONSTRAINT `fk_emprestimo_has_livro_emprestimo1`
    FOREIGN KEY (`emprestimo_id`)
    REFERENCES `biblioteca`.`emprestimo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_has_livro_livro1`
    FOREIGN KEY (`livro_id`)
    REFERENCES `biblioteca`.`livro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- View `biblioteca`.`ver_livros_secoes`
-- -----------------------------------------------------
CREATE  OR REPLACE VIEW ver_livros_secoes AS
SELECT
	livro.titulo,
    livro.autores,
    secao.nome AS secao
FROM livro 
JOIN secao ON secao.id = livro.secao_id;

-- -----------------------------------------------------
-- View `biblioteca`.`ver_usuarios_emprestimos`
-- -----------------------------------------------------
CREATE  OR REPLACE VIEW ver_usuarios_emprestimos AS
SELECT  
	usuario.nome,
    usuario.email,
    emprestimo.data_emprestimo
FROM usuario 
JOIN emprestimo ON usuario.id = emprestimo.usuario_id;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
