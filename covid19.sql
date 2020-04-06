-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 06-Abr-2020 às 01:51
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid19`
--
CREATE DATABASE IF NOT EXISTS `covid19` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `covid19`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_fiscal` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `produto` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nota_fiscal`, `dia`, `cliente`, `quantidade`, `preco_unitario`, `produto`) VALUES
(1, 1001, 1, 'C10', 8, '16.00', 'Máscara tipo N95'),
(2, 1001, 1, 'C10', 2, '2.30', 'Luvas'),
(3, 1001, 1, 'C10', 1, '23.00', 'Protetor facial'),
(4, 1002, 1, 'C30', 20, '12.90', 'Avental'),
(5, 1002, 1, 'C30', 12, '2.00', 'Luvas'),
(6, 1003, 2, 'C50', 5, '20.00', 'Alcool em gel'),
(7, 1003, 2, 'C50', 12, '16.00', 'Máscara tipo N95'),
(8, 1004, 3, 'C70', 2, '23.00', 'Termômetro'),
(9, 1004, 3, 'C70', 4, '21.50', 'Alcool em gel'),
(10, 1005, 3, 'C80', 12, '28.00', 'Protetor facial');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
