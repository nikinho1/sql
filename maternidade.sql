-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/05/2024 às 01:45
-- Versão do servidor: 10.4.24-MariaDB
-- Versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `maternidade`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `bebes`
--

CREATE TABLE `bebes` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `data_nasc` varchar(10) DEFAULT NULL,
  `codigo_equipe` int(11) NOT NULL,
  `cpf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe`
--

CREATE TABLE `equipe` (
  `codigo_equipe` int(11) NOT NULL,
  `nome_equipe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mae`
--

CREATE TABLE `mae` (
  `cpf` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `crm` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `especialidade` varchar(30) DEFAULT NULL,
  `codigo_equipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `bebes`
--
ALTER TABLE `bebes`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `codigo_equipe` (`codigo_equipe`),
  ADD KEY `cpf` (`cpf`);

--
-- Índices de tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`codigo_equipe`);

--
-- Índices de tabela `mae`
--
ALTER TABLE `mae`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`crm`),
  ADD KEY `codigo_equipe` (`codigo_equipe`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `bebes`
--
ALTER TABLE `bebes`
  ADD CONSTRAINT `bebes_ibfk_1` FOREIGN KEY (`codigo_equipe`) REFERENCES `equipe` (`codigo_equipe`),
  ADD CONSTRAINT `bebes_ibfk_2` FOREIGN KEY (`cpf`) REFERENCES `mae` (`cpf`);

--
-- Restrições para tabelas `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`codigo_equipe`) REFERENCES `equipe` (`codigo_equipe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
