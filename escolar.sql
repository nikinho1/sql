-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/05/2024 às 01:59
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
-- Banco de dados: `escolar`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `num_turma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`matricula`, `nome`, `sexo`, `idade`, `num_turma`) VALUES
(1100, 'João da Silva', 'M', 14, 1001),
(1200, 'Maria', 'F', 14, 1002),
(1300, 'Antônio', 'M', 16, 2001),
(1400, 'Julio', 'M', 16, 2001),
(1500, 'Andreia', 'F', 15, 1001),
(1600, 'Eduardo', 'M', 15, 3001);

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `disciplina`
--

INSERT INTO `disciplina` (`codigo`, `descricao`) VALUES
(11, 'matematica'),
(12, 'portugues'),
(13, 'fisica'),
(14, 'quimica'),
(15, 'ingles'),
(16, 'literatura');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estuda`
--

CREATE TABLE `estuda` (
  `Id_estuda` int(11) NOT NULL,
  `matricula` int(11) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `estuda`
--

INSERT INTO `estuda` (`Id_estuda`, `matricula`, `codigo`) VALUES
(1, 1100, 11),
(2, 1100, 12),
(3, 1100, 15),
(4, 1500, 13),
(5, 1500, 14),
(6, 1500, 11),
(7, 1400, 11),
(8, 1500, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `numero` int(11) NOT NULL,
  `sala` int(11) DEFAULT NULL,
  `andar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `turma`
--

INSERT INTO `turma` (`numero`, `sala`, `andar`) VALUES
(1001, 101, 1),
(1002, 102, 1),
(2001, 201, 2),
(2004, 202, 2),
(3001, 302, 3),
(3005, 301, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `num_turma` (`num_turma`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `estuda`
--
ALTER TABLE `estuda`
  ADD PRIMARY KEY (`Id_estuda`),
  ADD KEY `matricula` (`matricula`),
  ADD KEY `codigo` (`codigo`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`numero`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estuda`
--
ALTER TABLE `estuda`
  MODIFY `Id_estuda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`num_turma`) REFERENCES `turma` (`numero`);

--
-- Restrições para tabelas `estuda`
--
ALTER TABLE `estuda`
  ADD CONSTRAINT `estuda_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `aluno` (`matricula`),
  ADD CONSTRAINT `estuda_ibfk_2` FOREIGN KEY (`codigo`) REFERENCES `disciplina` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
