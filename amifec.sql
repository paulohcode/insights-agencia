-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 12-Jul-2019 às 15:39
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amifec`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingredients`
--

CREATE TABLE `ingredients` (
  `id_ingredients` int(11) NOT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ingredients`
--

INSERT INTO `ingredients` (`id_ingredients`, `recipe_id`, `name`) VALUES
(1, 1, '4 ovos'),
(2, 1, '1 copo de leite temperatura ambiente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prepare_mode`
--

CREATE TABLE `prepare_mode` (
  `id_prepare` int(11) NOT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `prepare_mode` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prepare_mode`
--

INSERT INTO `prepare_mode` (`id_prepare`, `recipe_id`, `prepare_mode`) VALUES
(1, 1, 'Em um recipiente, misture bem os ovos, o sal, a água, o leite, o óleo e o parmesão.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `recipe`
--

CREATE TABLE `recipe` (
  `id_recipe` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `date_register` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `recipe`
--

INSERT INTO `recipe` (`id_recipe`, `name`, `date_register`) VALUES
(1, 'pao de queijo', '2019-07-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` text,
  `password` text,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id_ingredients`),
  ADD KEY `prepare_mode` (`recipe_id`);

--
-- Indexes for table `prepare_mode`
--
ALTER TABLE `prepare_mode`
  ADD PRIMARY KEY (`id_prepare`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id_recipe`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id_ingredients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prepare_mode`
--
ALTER TABLE `prepare_mode`
  MODIFY `id_prepare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id_recipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id_recipe`),
  ADD CONSTRAINT `prepare_mode` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id_recipe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
