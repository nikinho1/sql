-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/05/2024 às 02:15
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
-- Banco de dados: `clinica_medica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `exame`
--

CREATE TABLE `exame` (
  `numero` int(11) NOT NULL,
  `crm` int(11) NOT NULL,
  `cpf` int(11) NOT NULL,
  `tipo_exame` varchar(0) DEFAULT NULL,
  `convenio` varchar(30) DEFAULT NULL,
  `requisitos` varchar(30) DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `exame`
--

INSERT INTO `exame` (`numero`, `crm`, `cpf`, `tipo_exame`, `convenio`, `requisitos`, `valor`) VALUES
(1101, 111, 22, '', 'Sulamerica', 'Jejum 8 horas', 120);

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `crm` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `especialidade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`crm`, `nome`, `especialidade`) VALUES
(111, 'João da Silva', 'Cardiologista'),
(121, 'Aline Maria', 'Pediatra');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `cpf` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`cpf`, `nome`, `endereco`) VALUES
(22, 'Antonia pedro', 'Rua xyz, Campo Grande'),
(24, 'joão prado', 'Rua sem limites, Realengo'),
(26, 'Marcia Lima', 'Rua das Flores, Padre Miquel'),
(32, 'pedro', 'Rua dos Fundos, 123, Santa Cruz');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `exame`
--
ALTER TABLE `exame`
  ADD PRIMARY KEY (`numero`,`crm`,`cpf`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`crm`),
  ADD UNIQUE KEY `crm` (`crm`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `exame`
--
ALTER TABLE `exame`
  ADD CONSTRAINT `exame_ibfk_1` FOREIGN KEY (`crm`) REFERENCES `medico` (`crm`),
  ADD CONSTRAINT `exame_ibfk_2` FOREIGN KEY (`cpf`) REFERENCES `paciente` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
