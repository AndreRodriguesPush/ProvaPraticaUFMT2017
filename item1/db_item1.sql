-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 05-Dez-2017 às 11:00
-- Versão do servidor: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_item1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `cpf` varchar(14) COLLATE utf8_bin NOT NULL,
  `nome` varchar(500) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`cpf`, `nome`) VALUES
('008.958.261-60', 'Mara Lucia'),
('012.636.121-56', 'André Thiago');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursa`
--

DROP TABLE IF EXISTS `cursa`;
CREATE TABLE IF NOT EXISTS `cursa` (
  `cpfaluno` varchar(14) COLLATE utf8_bin NOT NULL,
  `codigodisciplina` int(11) NOT NULL,
  KEY `aluno_cursa` (`cpfaluno`),
  KEY `cursa_disciplina` (`codigodisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `cursa`
--

INSERT INTO `cursa` (`cpfaluno`, `codigodisciplina`) VALUES
('012.636.121-56', 1),
('008.958.261-60', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE IF NOT EXISTS `disciplina` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) COLLATE utf8_bin NOT NULL,
  `cpfprofessor` varchar(14) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `prof_disciplina` (`cpfprofessor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`codigo`, `nome`, `cpfprofessor`) VALUES
(1, 'Algoritmos', '000.111.222-33'),
(2, 'PHP', '000.111.222-33');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `cpf` varchar(14) COLLATE utf8_bin NOT NULL,
  `nome` varchar(500) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`cpf`, `nome`) VALUES
('000.111.222-33', 'Joao da Silva');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cursa`
--
ALTER TABLE `cursa`
  ADD CONSTRAINT `aluno_cursa` FOREIGN KEY (`cpfaluno`) REFERENCES `aluno` (`cpf`),
  ADD CONSTRAINT `cursa_disciplina` FOREIGN KEY (`codigodisciplina`) REFERENCES `disciplina` (`codigo`);

--
-- Limitadores para a tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `prof_disciplina` FOREIGN KEY (`cpfprofessor`) REFERENCES `professor` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
