-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/05/2024 às 02:34
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
-- Banco de dados: `marinha`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `barcos`
--

CREATE TABLE `barcos` (
  `id_barco` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `origem` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `barcos`
--

INSERT INTO `barcos` (`id_barco`, `nome`, `origem`, `tipo`) VALUES
(2, 'Pará', 'estados unidos', 'contratorpedeiro'),
(3, 'Pará', 'niterói', 'fragata'),
(6, 'inhaúma', 'brasil', 'corveta'),
(8, 'tupi', 'alemanha', 'submarino');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marinheiros`
--

CREATE TABLE `marinheiros` (
  `id_marin` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `avaliação` float DEFAULT NULL,
  `idade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `marinheiros`
--

INSERT INTO `marinheiros` (`id_marin`, `nome`, `avaliação`, `idade`) VALUES
(22, 'Denis', 7, 45),
(31, 'Lúcio', 8, 33),
(36, 'Sílvio', 10, 31),
(38, 'João', 5, 50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `reservas`
--

CREATE TABLE `reservas` (
  `id_marin` int(11) NOT NULL,
  `id_barco` int(11) NOT NULL,
  `dia` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `reservas`
--

INSERT INTO `reservas` (`id_marin`, `id_barco`, `dia`) VALUES
(22, 2, '10/08/16'),
(22, 6, '03/09/16'),
(31, 3, '12/;08/1'),
(31, 8, '17/09/16'),
(36, 6, '30/08/16'),
(38, 3, '10/09/16'),
(38, 8, '28/09/16');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `barcos`
--
ALTER TABLE `barcos`
  ADD PRIMARY KEY (`id_barco`),
  ADD UNIQUE KEY `id_barco` (`id_barco`);

--
-- Índices de tabela `marinheiros`
--
ALTER TABLE `marinheiros`
  ADD PRIMARY KEY (`id_marin`),
  ADD UNIQUE KEY `id_marin` (`id_marin`);

--
-- Índices de tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_marin`,`id_barco`),
  ADD KEY `id_barco` (`id_barco`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_marin`) REFERENCES `marinheiros` (`id_marin`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_barco`) REFERENCES `barcos` (`id_barco`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
